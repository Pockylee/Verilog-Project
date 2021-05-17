module MUX_2_1( input_a, input_b, output_c, sel);
    output wire output_c;
    
    input wire input_a;
    input wire input_b;
    input wire sel;

    not (invert_sel, sel);
    and (and_a, input_a, invert_sel);
    and (and_b, input_b, sel);

    or (output_c, and_a, and_b);
endmodule

module MUX_4_1( input_a, input_b, input_c, input_d, output_e, sel_0, sel_1);
    output wire output_e;

    input wire input_a;
    input wire input_b;
    input wire input_c;
    input wire input_d;
    input wire sel_0;
    input wire sel_1;

    not (sel_0_invert, sel_0);
    not (sel_1_invert, sel_1);

    and (and_a, input_a, sel_0_invert, sel_1_invert);
    and (and_b, input_b, sel_0, sel_1_invert);
    and (and_c, input_c, sel_0_invert, sel_1);
    and (and_d, input_d, sel_0, sel_1);

    or (output_e, and_a, and_b, and_c, and_d);

endmodule


module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
    output wire result;
    output wire carryOut;
  
    input wire a;
    input wire b;
    input wire invertA;
    input wire invertB;
    input wire[1:0] operation;
    input wire carryIn;
    input wire less;
  
    /*your code here*/
    wire invert_a, invert_b, and_ab, or_ab, sum_ans, select_a, select_b;

    not (invert_a, a);
    not (invert_b, b);

    MUX_2_1 select_A(a, invert_a, select_a, invertA);
    MUX_2_1 select_B(b, invert_b, select_b, invertB);

    and (and_ab, select_a, select_b);
    //or (or_ab, a_0, b_0);
    or (or_ab, select_a, select_b);
    Full_adder adder(sum_ans, carryOut, carryIn, select_a, select_b);
    MUX_4_1 select_F(and_ab, or_ab, sum_ans, less, result, operation[0], operation[1]);
  
endmodule


module ALU_1bit_31( result, carryOut, a, b, invertA, invertB, operation, carryIn, less, overflow, set);
    
    output wire result;
    output wire carryOut;
    output wire set;
    output wire overflow;
  
    input wire a;
    input wire b;
    input wire invertA;
    input wire invertB;
    input wire[1:0] operation;
    input wire carryIn;
    input wire less;

    wire invert_a, invert_b, and_ab, or_ab, sum_ans;

    not (invert_a, a);
    not (invert_b, b);

    MUX_2_1 select_A(a, invert_a, select_a, invertA);
    MUX_2_1 select_B(b, invert_b, select_b, invertB);

    and (and_ab, select_a, select_b);
    or (or_ab, select_a, select_b);
    //or (or_ab, a_0, b_0);
    Full_adder adder(set, carryOut, carryIn, select_a, select_b);
    MUX_4_1 select_F(and_ab, or_ab, set, less, result, operation[0], operation[1]);
    xor (overflow, carryIn, carryOut);

    
endmodule