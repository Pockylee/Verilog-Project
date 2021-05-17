module MUX_S_2_1( input_a, input_b, output_c, sel);
    output wire output_c;
    
    input wire input_a;
    input wire input_b;
    input wire sel;

    not (invert_sel, sel);
    and (and_a, input_a, invert_sel);
    and (and_b, input_b, sel);

    or (output_c, and_a, and_b);
endmodule

module Shifter( result, leftRight, shamt, sftSrc  );
    
  output wire[31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire[31:0] sftSrc ;
  
  /*your code here*/ 
  reg [31:0] shift_right, shift_left;

  always @(sftSrc) begin
  	shift_left = sftSrc << shamt;
  	shift_right = sftSrc >> shamt;

  end
	
  MUX_S_2_1 Shift_0(shift_right[0], shift_left[0], result[0], leftRight);
  MUX_S_2_1 Shift_1(shift_right[1], shift_left[1], result[1], leftRight);
  MUX_S_2_1 Shift_2(shift_right[2], shift_left[2], result[2], leftRight);
  MUX_S_2_1 Shift_3(shift_right[3], shift_left[3], result[3], leftRight);
  MUX_S_2_1 Shift_4(shift_right[4], shift_left[4], result[4], leftRight);
  MUX_S_2_1 Shift_5(shift_right[5], shift_left[5], result[5], leftRight);
  MUX_S_2_1 Shift_6(shift_right[6], shift_left[6], result[6], leftRight);
  MUX_S_2_1 Shift_7(shift_right[7], shift_left[7], result[7], leftRight);	
  MUX_S_2_1 Shift_8(shift_right[8], shift_left[8], result[8], leftRight);
  MUX_S_2_1 Shift_9(shift_right[9], shift_left[9], result[9], leftRight);
  MUX_S_2_1 Shift_10(shift_right[10], shift_left[10], result[10], leftRight);
  MUX_S_2_1 Shift_11(shift_right[11], shift_left[11], result[11], leftRight);
  MUX_S_2_1 Shift_12(shift_right[12], shift_left[12], result[12], leftRight);
  MUX_S_2_1 Shift_13(shift_right[13], shift_left[13], result[13], leftRight);
  MUX_S_2_1 Shift_14(shift_right[14], shift_left[14], result[14], leftRight);
  MUX_S_2_1 Shift_15(shift_right[15], shift_left[15], result[15], leftRight);
  MUX_S_2_1 Shift_16(shift_right[16], shift_left[16], result[16], leftRight);
  MUX_S_2_1 Shift_17(shift_right[17], shift_left[17], result[17], leftRight);
  MUX_S_2_1 Shift_18(shift_right[18], shift_left[18], result[18], leftRight);
  MUX_S_2_1 Shift_19(shift_right[19], shift_left[19], result[19], leftRight);
  MUX_S_2_1 Shift_20(shift_right[20], shift_left[20], result[20], leftRight);
  MUX_S_2_1 Shift_21(shift_right[21], shift_left[21], result[21], leftRight);
  MUX_S_2_1 Shift_22(shift_right[22], shift_left[22], result[22], leftRight);
  MUX_S_2_1 Shift_23(shift_right[23], shift_left[23], result[23], leftRight);
  MUX_S_2_1 Shift_24(shift_right[24], shift_left[24], result[24], leftRight);
  MUX_S_2_1 Shift_25(shift_right[25], shift_left[25], result[25], leftRight);
  MUX_S_2_1 Shift_26(shift_right[26], shift_left[26], result[26], leftRight);
  MUX_S_2_1 Shift_27(shift_right[27], shift_left[27], result[27], leftRight);
  MUX_S_2_1 Shift_28(shift_right[28], shift_left[28], result[28], leftRight);
  MUX_S_2_1 Shift_29(shift_right[29], shift_left[29], result[29], leftRight);
  MUX_S_2_1 Shift_30(shift_right[30], shift_left[30], result[30], leftRight);
  MUX_S_2_1 Shift_31(shift_right[31], shift_left[31], result[31], leftRight);

endmodule