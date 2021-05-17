module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero, overflow );

//I/O ports 
input	wire [32-1:0] aluSrc1;
input	wire [32-1:0] aluSrc2;
input   wire   [4-1:0] ALU_operation_i;

output	[32-1:0] result;
output			 zero;
output			 overflow;

//Internal Signals
wire			 zero;
wire			 overflow;
reg 	[32-1:0] result;

//Main function
/*your code here*/
assign zero = (result == 0);

always @(aluSrc1, aluSrc2, ALU_operation_i)
begin
    case(ALU_operation_i)
        4'b0010: result <= aluSrc1 + aluSrc2;   //add instruction
        4'b0110: result <= aluSrc1 - aluSrc2;   //sub isntruction
        4'b0000: result <= aluSrc1 & aluSrc2;   //and instruction
        4'b0001: result <= aluSrc1 | aluSrc2;   //or instruction

        4'b0111: begin                          //slt instruction
            if (aluSrc1[31] != aluSrc2[31]) 
            begin
                result <= aluSrc1[31] > aluSrc2[31] ? 1 : 0;
            end
            else 
            begin
                result <= aluSrc1 < aluSrc2 ? 1 : 0;
            end
        end
        4'b1100:result <= ~(aluSrc1 | aluSrc2); // nor instruction
        default:result <= 0;
    endcase
end


endmodule
