module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o );

//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output			RegDst_o;

//Internal Signals
reg	[3-1:0] ALUOp_o;
reg			ALUSrc_o;
reg			RegWrite_o;
reg			RegDst_o;

//Main function
/*your code here*/
always @(*)
begin

//reset signals
//RegWrite_o <= 1'b0;
//ALUOp_o <= 3'b000;
//ALUSrc_o <= 1'b0;
//RegDst_o <= 1'b0;
begin
//r-type instructions
if(instr_op_i == 6'b000000)
    begin
    RegWrite_o <= 1'b1;
    ALUOp_o <= 3'b010;
    ALUSrc_o <= 1'b0;
    RegDst_o <= 1'b1;

    end
    
//addi instruction
else if (instr_op_i == 6'b001000)
    begin
    RegWrite_o <= 1'b1;
    ALUOp_o <= 3'b100;
    ALUSrc_o <= 1'b1;
    RegDst_o <= 1'b0;
    end
end
end

endmodule
   