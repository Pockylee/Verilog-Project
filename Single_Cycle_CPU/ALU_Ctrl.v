module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o, leftRight );

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;
output leftRight;
     
//Internal Signals
reg		[4-1:0] ALU_operation_o;
reg		[2-1:0] FURslt_o;

//Main function
/*your code here*/
reg leftRight;
always@(*) begin
    case (ALUOp_i)
        3'b010:  //R-type
            case (funct_i)
                6'b010011: begin// ADD
                    ALU_operation_o <= 4'b0010;    
                    FURslt_o <= 2'b00;
                    leftRight <= 1'bx;
                end
                6'b010001: begin // SUB
                    ALU_operation_o <= 4'b0110;
                    FURslt_o <= 2'b00;
                    leftRight <= 1'bx;
                end
                6'b010100: begin // AND 
                    ALU_operation_o <= 4'b0000; //and
                    FURslt_o <= 2'b00;
                    leftRight <= 1'bx; //don't care
                end
                6'b010110: begin // OR
                    ALU_operation_o <= 4'b0001; //or
                    FURslt_o <= 2'b00;
                    leftRight <= 1'bx; //don't care
                end
                6'b010101: begin // NOR 
                    ALU_operation_o <= 4'b1100; //nor
                    FURslt_o <= 2'b00;
                    leftRight <= 1'bx; //don't care
                end
                6'b110000: begin // SLT 
                    ALU_operation_o <= 4'b0111; //slt 
                    FURslt_o <= 2'b00;
                    leftRight <= 1'bx; //don't care
                end
                6'b000000: begin // SLL for testing
                    ALU_operation_o <= 4'bxxxx; //don't care
                    FURslt_o <= 2'b01;
                    leftRight <= 1'b1;
                end
                6'b000010: begin // SRL for testing
                    ALU_operation_o <= 4'bxxxx; //don't care
                    FURslt_o <= 2'b01;
                    leftRight <= 1'b0;
                end
                default: begin
                    ALU_operation_o <= 4'bxxxx; //don't care
                    FURslt_o <= 2'bxx; //don't care
                    leftRight <= 1'bx; //don't care
                end
            endcase
        3'b100: begin // ADDI
            ALU_operation_o <= 4'b0010;
            FURslt_o <= 1'b0;
            leftRight <= 1'bx;
        end
        default: begin // if non of the instruction right
            ALU_operation_o <= 4'bxxxx; //don't care
            FURslt_o <= 1'bx; //don't care
            leftRight <= 1'bx; //don't care
        end
    endcase
end



endmodule     
