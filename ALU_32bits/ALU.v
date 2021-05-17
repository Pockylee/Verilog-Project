
module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
    output wire[31:0] result;
    output wire zero;
    output wire overflow;

    input wire[31:0] aluSrc1;
    input wire[31:0] aluSrc2;
    input wire invertA;
    input wire invertB;
    input wire[1:0] operation;
  
  /*your code here*/
    ALU_1bit ALU_0 (result[0],  carryOut0,  aluSrc1[0],  aluSrc2[0],  invertA, invertB, operation, invertB, set);
    ALU_1bit ALU_1 (result[1],  carryOut1,  aluSrc1[1],  aluSrc2[1],  invertA, invertB, operation, carryOut0,  1'b0);
    ALU_1bit ALU_2 (result[2],  carryOut2,  aluSrc1[2],  aluSrc2[2],  invertA, invertB, operation, carryOut1,  1'b0);
    ALU_1bit ALU_3 (result[3],  carryOut3,  aluSrc1[3],  aluSrc2[3],  invertA, invertB, operation, carryOut2,  1'b0);
    ALU_1bit ALU_4 (result[4],  carryOut4,  aluSrc1[4],  aluSrc2[4],  invertA, invertB, operation, carryOut3,  1'b0);
    ALU_1bit ALU_5 (result[5],  carryOut5,  aluSrc1[5],  aluSrc2[5],  invertA, invertB, operation, carryOut4,  1'b0);
    ALU_1bit ALU_6 (result[6],  carryOut6,  aluSrc1[6],  aluSrc2[6],  invertA, invertB, operation, carryOut5,  1'b0);
    ALU_1bit ALU_7 (result[7],  carryOut7,  aluSrc1[7],  aluSrc2[7],  invertA, invertB, operation, carryOut6,  1'b0);
    ALU_1bit ALU_8 (result[8],  carryOut8,  aluSrc1[8],  aluSrc2[8],  invertA, invertB, operation, carryOut7,  1'b0);
    ALU_1bit ALU_9 (result[9],  carryOut9,  aluSrc1[9],  aluSrc2[9],  invertA, invertB, operation, carryOut8,  1'b0);
    ALU_1bit ALU_10(result[10], carryOut10, aluSrc1[10], aluSrc2[10], invertA, invertB, operation, carryOut9,  1'b0);
    ALU_1bit ALU_11(result[11], carryOut11, aluSrc1[11], aluSrc2[11], invertA, invertB, operation, carryOut10, 1'b0);
    ALU_1bit ALU_12(result[12], carryOut12, aluSrc1[12], aluSrc2[12], invertA, invertB, operation, carryOut11, 1'b0);
    ALU_1bit ALU_13(result[13], carryOut13, aluSrc1[13], aluSrc2[13], invertA, invertB, operation, carryOut12, 1'b0);
    ALU_1bit ALU_14(result[14], carryOut14, aluSrc1[14], aluSrc2[14], invertA, invertB, operation, carryOut13, 1'b0);
    ALU_1bit ALU_15(result[15], carryOut15, aluSrc1[15], aluSrc2[15], invertA, invertB, operation, carryOut14, 1'b0);
    ALU_1bit ALU_16(result[16], carryOut16, aluSrc1[16], aluSrc2[16], invertA, invertB, operation, carryOut15, 1'b0);
    ALU_1bit ALU_17(result[17], carryOut17, aluSrc1[17], aluSrc2[17], invertA, invertB, operation, carryOut16, 1'b0);
    ALU_1bit ALU_18(result[18], carryOut18, aluSrc1[18], aluSrc2[18], invertA, invertB, operation, carryOut17, 1'b0);
    ALU_1bit ALU_19(result[19], carryOut19, aluSrc1[19], aluSrc2[19], invertA, invertB, operation, carryOut18, 1'b0);
    ALU_1bit ALU_20(result[20], carryOut20, aluSrc1[20], aluSrc2[20], invertA, invertB, operation, carryOut19, 1'b0);
    ALU_1bit ALU_21(result[21], carryOut21, aluSrc1[21], aluSrc2[21], invertA, invertB, operation, carryOut20, 1'b0);
    ALU_1bit ALU_22(result[22], carryOut22, aluSrc1[22], aluSrc2[22], invertA, invertB, operation, carryOut21, 1'b0);
    ALU_1bit ALU_23(result[23], carryOut23, aluSrc1[23], aluSrc2[23], invertA, invertB, operation, carryOut22, 1'b0);
    ALU_1bit ALU_24(result[24], carryOut24, aluSrc1[24], aluSrc2[24], invertA, invertB, operation, carryOut23, 1'b0);
    ALU_1bit ALU_25(result[25], carryOut25, aluSrc1[25], aluSrc2[25], invertA, invertB, operation, carryOut24, 1'b0);
    ALU_1bit ALU_26(result[26], carryOut26, aluSrc1[26], aluSrc2[26], invertA, invertB, operation, carryOut25, 1'b0);
    ALU_1bit ALU_27(result[27], carryOut27, aluSrc1[27], aluSrc2[27], invertA, invertB, operation, carryOut26, 1'b0);
    ALU_1bit ALU_28(result[28], carryOut28, aluSrc1[28], aluSrc2[28], invertA, invertB, operation, carryOut27, 1'b0);
    ALU_1bit ALU_29(result[29], carryOut29, aluSrc1[29], aluSrc2[29], invertA, invertB, operation, carryOut28, 1'b0);
    ALU_1bit ALU_30(result[30], carryOut30, aluSrc1[30], aluSrc2[30], invertA, invertB, operation, carryOut29, 1'b0);

    ALU_1bit_31 ALU_31(result[31], carryOut31, aluSrc1[31], aluSrc2[31], invertA, invertB, operation, carryOut30, 1'b0, overflow, set);

    or(final, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19], result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29], result[30], result[31]);
    not (zero, final);

endmodule