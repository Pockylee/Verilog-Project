`include "ALU.v"
`include "Adder.v"
`include "ALU_Ctrl.v"
`include "Decoder.v"
`include "Instr_Memory.v"
`include "Mux2to1.v"
`include "Mux3to1.v"
`include "Program_Counter.v"
`include "Reg_File.v"
`include "Shifter.v"
`include "Sign_Extend.v"
`include "Zero_Filled.v"
module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles
wire [32-1:0] pc_now;
wire [32-1:0] pc_next;
wire [32-1:0] instr;
wire [32-1:0] RsData;
wire [32-1:0] RtData;
wire [32-1:0] WriteData;
wire [32-1:0] aluSrc2;
wire [32-1:0] sign_ex;
wire [32-1:0] zero_fill;
wire [32-1:0] ALU_result;
wire [32-1:0] shift_result;
wire RegDst;
wire RegWrite;
wire ALUSrc;
wire leftRight;
wire [3-1:0] ALUOp;
wire [5-1:0] WriteReg;
wire [4-1:0] ALU_operation;
wire [2-1:0] FURslt;


//modules
Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n(rst_n),     
	    .pc_in_i(pc_next) ,   
	    .pc_out_o(pc_now) 
	    );
	
Adder Adder1(
        .src1_i(pc_now),     
	    .src2_i(32'd4),
	    .sum_o(pc_next)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_now),  
	    .instr_o(instr)    
	    );

Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),
        .data1_i(instr[15:11]),
        .select_i(RegDst),
        .data_o(WriteReg)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instr[25:21]) ,  
        .RTaddr_i(instr[20:16]) ,  
        .RDaddr_i(WriteReg) ,  
        .RDdata_i(WriteData)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(RsData) ,  
        .RTdata_o(RtData)   
        );
	
Decoder Decoder(
        .instr_op_i(instr[31:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALUOp_o(ALUOp),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst)   
		);

ALU_Ctrl AC(
        .funct_i(instr[5:0]),   
        .ALUOp_i(ALUOp),   
        .ALU_operation_o(ALU_operation),
		.FURslt_o(FURslt),
        .leftRight(leftRight)
        );
	
Sign_Extend SE(
        .data_i(instr[15:0]),
        .data_o(sign_ex)
        );

Zero_Filled ZF(
        .data_i(instr[15:0]),
        .data_o(zero_fill)
        );
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(RtData),
        .data1_i(sign_ex),
        .select_i(ALUSrc),
        .data_o(aluSrc2)
        );	
		
ALU ALU(
		.aluSrc1(RsData),
	    .aluSrc2(aluSrc2),
	    .ALU_operation_i(ALU_operation),
		.result(ALU_result),
		.zero(),
		.overflow()
	    );
		
Shifter shifter( 
		.result(shift_result), 
		.leftRight(leftRight),
		.shamt(instr[10:6]),
		.sftSrc(aluSrc2) 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(shift_result),
		.data2_i(zero_fill),
        .select_i(FURslt),
        .data_o(WriteData)
        );			

endmodule



