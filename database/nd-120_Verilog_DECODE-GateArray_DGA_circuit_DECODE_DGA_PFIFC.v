// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 DGA                                                             **
** DECODE/DGA/PFIFC (FIFO CONTROLLER)                                    **
**                                                                       **
**  Page 12 DECODE - DECODE_DGA_PFIFC- Sheet 1 of 1                      **
**                                                                       **
** Last reviewed: 12-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/


/******************************************************************************
 ** Controller for the DECODE-DGA-PFIFD 13 byte FIFO. 
 ** Generates the WEU and WEL signals, which is latch-gate signals for the FIFO in DECODE-DGA-PFIFD.
 **
 ** Input signals:
 ** CLEAR    - Active HIGH signal to reset the clock signals.
 ** 
 ** LDPANC_n - Active LOW signal to load data into the FIFO queue for the Panel Controller. 
 **            Comes from the microcode command "COMM,LDPANC"
 **
 ** RMM_n    - Active LOW signal to read data from the FIFO queue for the Panel Controller. 
 **            Comes from the 68705 CPU.
 **
 ** Output signals:
 ** EMP_n   - Active LOW signal to indicate that the FIFO queue is empty
 ** FUL_n   - Active LOW signal to indicate that the FIFO queue is full
 ** WEL[12:0] - Active HIGH signal to clock data into the FIFO queue
 **
 ** WEU[12:0] - Active HIGH signal to clock data into the FIFO queue 
 ** (identical to WEL, I assume added to make the signalstrength better)   
 *****************************************************************************/

/* NOT IN USE ANYMORE - REPLACED BY FIFO_8BIT.v

module DECODE_DGA_PFIFC( 
   input CLEAR,
   input LDPANCN,
   input RMMN,

   output        EMPN,
   output        FULN,
   output [12:0] WEL_12_0,
   output [12:0] WEU_12_0
);

   
   // The wires are defined here                                                 **   
   wire [12:0] s_weu_12_0;
   wire [12:0] s_wel_12_0;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet100;
   wire        s_we_bit1;
   wire        s_we_bit5;
   wire        s_we_bit9;
   wire        s_we_bit2;
   wire        s_we_bit6;
   wire        s_we_bit10;
   wire        s_we_bit6_n;
   wire        s_logisimNet11;
   wire        s_a322_q;
   wire        s_a312_out;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_clear_n;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_we_bit2_n;
   wire        s_logisimNet22;
   wire        s_a321_q;
   wire        s_a296_out;
   wire        s_a301_qb;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_a305_q;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_emp_n;
   wire        s_we_bit5_n;
   wire        s_a334_q;
   wire        s_logisimNet33;
   wire        s_a331_out;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_a365_out;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_we_bit0_n;
   wire        s_a315_q;
   wire        s_logisimNet41;
   wire        s_we_bit10_n;
   wire        s_a310_out;
   wire        s_rmmn;
   wire        s_a323_out;
   wire        s_a308_qb;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_we_bit11_n;
   wire        s_we_bit1_n;
   wire        s_a366_out;
   wire        s_a339_q;
   wire        s_a316_q;
   wire        s_a347_out;
   wire        s_a304_qb;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_a301_q;
   wire        s_a364_out;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_a343_qb;
   wire        s_a302_q;
   wire        s_a304_q;
   wire        s_we_bit9_n;
   wire        s_a309_out;
   wire        s_a316_qb;
   wire        s_logisimNet67;
   wire        s_we_bit7;
   wire        s_we_bit3;
   wire        s_logisimNet7;
   wire        s_we_bit11;
   wire        s_logisimNet71;
   wire        s_zz1;
   wire        s_a302_qb;
   wire        s_logisimNet75;
   wire        s_a314_q;
   wire        s_a363_out;
   wire        s_a334_qb;   
   wire        s_logisimNet8;
   wire        s_we_bit8_n;
   wire        s_a321_qb;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_a322_qb;
   wire        s_we_bit4;
   wire        s_we_bit0;
   wire        s_we_bit8;
   wire        s_we_bit12;
   wire        s_we_bit4_n;
   wire        s_a362_out;
   wire        s_a339_qb;
   wire        s_ful_n;
   wire        s_logisimNet92;
   wire        s_we_bit7_n;
   wire        s_a314_qb;
   wire        s_logisimNet95;
   wire        s_we_bit12_n;
   wire        s_logisimNet97;
   wire        s_we_bit3_n;
   wire        s_a315_qb;

   
   // Here all wiring is defined                                                 **
   
   assign s_wel_12_0[0]  = s_we_bit0;
   assign s_wel_12_0[1]  = s_we_bit1;
   assign s_wel_12_0[2]  = s_we_bit2;
   assign s_wel_12_0[3]  = s_we_bit3;
   assign s_wel_12_0[4]  = s_we_bit4;
   assign s_wel_12_0[5]  = s_we_bit5;
   assign s_wel_12_0[6]  = s_we_bit6;
   assign s_wel_12_0[7]  = s_we_bit7;
   assign s_wel_12_0[8]  = s_we_bit8;
   assign s_wel_12_0[9]  = s_we_bit9;
   assign s_wel_12_0[10] = s_we_bit10;
   assign s_wel_12_0[11] = s_we_bit11;
   assign s_wel_12_0[12] = s_we_bit12;
   
   assign s_weu_12_0[0]  = s_we_bit0;
   assign s_weu_12_0[1]  = s_we_bit1;
   assign s_weu_12_0[2]  = s_we_bit2;
   assign s_weu_12_0[3]  = s_we_bit3;
   assign s_weu_12_0[4]  = s_we_bit4;
   assign s_weu_12_0[5]  = s_we_bit5;
   assign s_weu_12_0[6]  = s_we_bit6;
   assign s_weu_12_0[7]  = s_we_bit7;
   assign s_weu_12_0[8]  = s_we_bit8;
   assign s_weu_12_0[9]  = s_we_bit9;
   assign s_weu_12_0[10] = s_we_bit10;
   assign s_weu_12_0[11] = s_we_bit11;
   assign s_weu_12_0[12] = s_we_bit12;

   
   // Here all input connections are defined                                     **
   
   assign s_we_bit0_n    = LDPANCN;
   assign s_rmmn           = RMMN;
   assign s_clear_n        = ~CLEAR;

   
   // Here all output connections are defined                                    **
   
   assign EMPN     = s_emp_n;
   assign FULN     = s_ful_n;
   assign WEL_12_0 = s_wel_12_0[12:0];
   assign WEU_12_0 = s_weu_12_0[12:0];

   
   // Here all in-lined components are defined                                   **
   

   // Signal WE BIT 0-12
   assign s_we_bit0 = ~s_we_bit0_n;

   // NOT Gate
   assign s_we_bit1 = ~s_we_bit1_n;

   // NOT Gate
   assign s_we_bit2 = ~s_we_bit2_n;

   // NOT Gate
   assign s_we_bit3 = ~s_we_bit3_n;

   // NOT Gate
   assign s_we_bit4 = ~s_we_bit4_n;

   // NOT Gate
   assign s_we_bit5 = ~s_we_bit5_n;

   // NOT Gate
   assign s_we_bit6 = ~s_we_bit6_n;

   // NOT Gate
   assign s_we_bit7 = ~s_we_bit7_n;

   // NOT Gate
   assign s_we_bit8 = ~s_we_bit8_n;

   // NOT Gate
   assign s_we_bit9 = ~s_we_bit9_n;

   // NOT Gate
   assign s_we_bit10 = ~s_we_bit10_n;

   // NOT Gate
   assign s_we_bit11 = ~s_we_bit11_n;

   // NOT Gate
   assign s_we_bit12 = ~s_we_bit12_n;



   // NOT Gate
   assign s_logisimNet36 = ~s_we_bit2;

   // NOT Gate
   assign s_logisimNet0 = ~s_we_bit3;

   // NOT Gate
   assign s_logisimNet3 = ~s_we_bit4;

   // NOT Gate
   assign s_logisimNet15 = ~s_we_bit5;

   // NOT Gate
   assign s_logisimNet14 = ~s_we_bit6;

   // NOT Gate
   assign s_logisimNet11 = ~s_we_bit7;

   // NOT Gate
   assign s_logisimNet33 = ~s_we_bit8;

   // NOT Gate
   assign s_logisimNet1 = ~s_we_bit9;

   // NOT Gate
   assign s_logisimNet6 = ~s_we_bit10;

   // NOT Gate
   assign s_logisimNet27 = ~s_we_bit11;

   // NOT Gate
   assign s_logisimNet22 = ~s_we_bit12;

   // NOT Gate
   assign s_logisimNet7 = ~s_we_bit1;

   
   
   // Here all normal components are defined                                     
   
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A292 (.input1(s_logisimNet7),
            .input2(s_a314_q),
            .input3(s_a321_qb),
            .input4(s_logisimNet0),
            .result(s_we_bit2_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_2 (.input1(s_logisimNet36),
               .input2(s_a321_q),
               .input3(s_a316_qb),
               .input4(s_logisimNet3),
               .result(s_we_bit3_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_3 (.input1(s_logisimNet0),
               .input2(s_a316_q),
               .input3(s_a308_qb),
               .input4(s_logisimNet15),
               .result(s_we_bit4_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_4 (.input1(s_logisimNet3),
               .input2(s_logisimNet8),
               .input3(s_a322_qb),
               .input4(s_logisimNet14),
               .result(s_we_bit5_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_5 (.input1(s_logisimNet15),
               .input2(s_a322_q),
               .input3(s_a302_qb),
               .input4(s_logisimNet11),
               .result(s_we_bit6_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_6 (.input1(s_logisimNet14),
               .input2(s_a302_q),
               .input3(s_a304_qb),
               .input4(s_logisimNet33),
               .result(s_we_bit7_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_7 (.input1(s_logisimNet11),
               .input2(s_a304_q),
               .input3(s_a301_qb),
               .input4(s_logisimNet1),
               .result(s_we_bit8_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_8 (.input1(s_logisimNet33),
               .input2(s_a301_q),
               .input3(s_a315_qb),
               .input4(s_logisimNet6),
               .result(s_we_bit9_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_9 (.input1(s_logisimNet1),
               .input2(s_a315_q),
               .input3(s_a339_qb),
               .input4(s_logisimNet27),
               .result(s_we_bit10_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_10 (.input1(s_logisimNet6),
                .input2(s_a339_q),
                .input3(s_a334_qb),
                .input4(s_logisimNet22),
                .result(s_we_bit11_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_11 (.input1(s_logisimNet27),
                .input2(s_a334_q),
                .input3(s_a343_qb),
                .input4(s_rmmn),
                .result(s_we_bit12_n));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A300 (.input1(s_we_bit0_n),
            .input2(s_a305_q),
            .input3(s_a314_qb),
            .input4(s_logisimNet36),
            .result(s_we_bit1_n));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_13 (.input1(s_a323_out),
                .input2(s_a323_out),
                .input3(s_clear_n),
                .result(s_logisimNet29));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_14 (.input1(s_a312_out),
                .input2(s_a312_out),
                .input3(s_clear_n),
                .result(s_logisimNet100));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_15 (.input1(s_a331_out),
                .input2(s_a331_out),
                .input3(s_clear_n),
                .result(s_logisimNet92));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_16 (.input1(s_a347_out),
                .input2(s_a347_out),
                .input3(s_clear_n),
                .result(s_logisimNet41));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_17 (.input1(s_a296_out),
                .input2(s_a296_out),
                .input3(s_clear_n),
                .result(s_logisimNet2));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_18 (.input1(s_a310_out),
                .input2(s_a310_out),
                .input3(s_clear_n),
                .result(s_logisimNet95));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_19 (.input1(s_a362_out),
                .input2(s_a362_out),
                .input3(s_clear_n),
                .result(s_logisimNet83));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_20 (.input1(s_a363_out),
                .input2(s_a363_out),
                .input3(s_clear_n),
                .result(s_logisimNet71));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_21 (.input1(s_a364_out),
                .input2(s_a364_out),
                .input3(s_clear_n),
                .result(s_logisimNet49));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_22 (.input1(s_a365_out),
                .input2(s_a365_out),
                .input3(s_clear_n),
                .result(s_logisimNet20));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_23 (.input1(s_a366_out),
                .input2(s_a366_out),
                .input3(s_clear_n),
                .result(s_logisimNet97));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_24 (.input1(s_we_bit0),
                .input2(s_we_bit0),
                .input3(s_clear_n),
                .result(s_logisimNet82));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_25 (.input1(s_a309_out),
                .input2(s_a309_out),
                .input3(s_clear_n),
                .result(s_logisimNet57));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_26 (.input1(s_clear_n),
                .input2(s_logisimNet0),
                .result(s_logisimNet60));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_27 (.input1(s_clear_n),
                .input2(s_logisimNet3),
                .result(s_logisimNet38));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_clear_n),
                .input2(s_logisimNet15),
                .result(s_logisimNet39));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_29 (.input1(s_clear_n),
                .input2(s_logisimNet14),
                .result(s_logisimNet67));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_30 (.input1(s_clear_n),
                .input2(s_logisimNet11),
                .result(s_logisimNet48));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_clear_n),
                .input2(s_logisimNet33),
                .result(s_logisimNet17));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_32 (.input1(s_clear_n),
                .input2(s_logisimNet1),
                .result(s_logisimNet19));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_33 (.input1(s_clear_n),
                .input2(s_logisimNet6),
                .result(s_logisimNet35));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_34 (.input1(s_clear_n),
                .input2(s_logisimNet27),
                .result(s_logisimNet75));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_35 (.input1(s_clear_n),
                .input2(s_logisimNet22),
                .result(s_logisimNet56));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_36 (.input1(s_clear_n),
                .input2(s_rmmn),
                .result(s_logisimNet26));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_37 (.input1(s_clear_n),
                .input2(s_logisimNet7),
                .result(s_logisimNet18));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_38 (.input1(s_clear_n),
                .input2(s_logisimNet36),
                .result(s_logisimNet10));


   
   // Here all sub-circuits are defined                                        
   

   F595   A321 (.H01_S(s_logisimNet29),
                .H02_R(s_logisimNet60),
                .H03_G(s_zz1),
                .N01_Q(s_a321_q),
                .N02_QB(s_a321_qb));

   F595   A316 (.H01_S(s_logisimNet100),
                .H02_R(s_logisimNet38),
                .H03_G(s_zz1),
                .N01_Q(s_a316_q),
                .N02_QB(s_a316_qb));

   F595   A308 (.H01_S(s_logisimNet92),
                .H02_R(s_logisimNet39),
                .H03_G(s_zz1),
                .N01_Q(s_logisimNet8),
                .N02_QB(s_a308_qb));

   F595   A322 (.H01_S(s_logisimNet41),
                .H02_R(s_logisimNet67),
                .H03_G(s_zz1),
                .N01_Q(s_a322_q),
                .N02_QB(s_a322_qb));

   F595   A302 (.H01_S(s_logisimNet2),
                .H02_R(s_logisimNet48),
                .H03_G(s_zz1),
                .N01_Q(s_a302_q),
                .N02_QB(s_a302_qb));

   F595   A304 (.H01_S(s_logisimNet95),
                .H02_R(s_logisimNet17),
                .H03_G(s_zz1),
                .N01_Q(s_a304_q),
                .N02_QB(s_a304_qb));

   F595   A301 (.H01_S(s_logisimNet83),
                .H02_R(s_logisimNet19),
                .H03_G(s_zz1),
                .N01_Q(s_a301_q),
                .N02_QB(s_a301_qb));

   F595   A315 (.H01_S(s_logisimNet71),
                .H02_R(s_logisimNet35),
                .H03_G(s_zz1),
                .N01_Q(s_a315_q),
                .N02_QB(s_a315_qb));

   F595   A339 (.H01_S(s_logisimNet49),
                .H02_R(s_logisimNet75),
                .H03_G(s_zz1),
                .N01_Q(s_a339_q),
                .N02_QB(s_a339_qb));

   F595   A334 (.H01_S(s_logisimNet20),
                .H02_R(s_logisimNet56),
                .H03_G(s_zz1),
                .N01_Q(s_a334_q),
                .N02_QB(s_a334_qb));

   F595   A343 (.H01_S(s_logisimNet97),
                .H02_R(s_logisimNet26),
                .H03_G(s_zz1),
                .N01_Q(s_emp_n),
                .N02_QB(s_a343_qb));

   F595   A305 (.H01_S(s_logisimNet82),
                .H02_R(s_logisimNet18),
                .H03_G(s_zz1),
                .N01_Q(s_a305_q),
                .N02_QB(s_ful_n));

   F595   A314 (.H01_S(s_logisimNet57),
                .H02_R(s_logisimNet10),
                .H03_G(s_zz1),
                .N01_Q(s_a314_q),
                .N02_QB(s_a314_qb));

   F091   A351 (.N01(s_zz1),
                .N02());

   DECODE_DGA_PFIFC_DELAY   A323 (.PIN_IN(s_we_bit2),
                                  .PIN_OUT(s_a323_out));

   DECODE_DGA_PFIFC_DELAY   A312 (.PIN_IN(s_we_bit3),
                                  .PIN_OUT(s_a312_out));

   DECODE_DGA_PFIFC_DELAY   A331 (.PIN_IN(s_we_bit4),
                                  .PIN_OUT(s_a331_out));

   DECODE_DGA_PFIFC_DELAY   A347 (.PIN_IN(s_we_bit5),
                                  .PIN_OUT(s_a347_out));

   DECODE_DGA_PFIFC_DELAY   A296 (.PIN_IN(s_we_bit6),
                                  .PIN_OUT(s_a296_out));

   DECODE_DGA_PFIFC_DELAY   A310 (.PIN_IN(s_we_bit7),
                                  .PIN_OUT(s_a310_out));

   DECODE_DGA_PFIFC_DELAY   A362 (.PIN_IN(s_we_bit8),
                                  .PIN_OUT(s_a362_out));

   DECODE_DGA_PFIFC_DELAY   A363 (.PIN_IN(s_we_bit9),
                                  .PIN_OUT(s_a363_out));

   DECODE_DGA_PFIFC_DELAY   A364 (.PIN_IN(s_we_bit10),
                                  .PIN_OUT(s_a364_out));

   DECODE_DGA_PFIFC_DELAY   A365 (.PIN_IN(s_we_bit11),
                                  .PIN_OUT(s_a365_out));

   DECODE_DGA_PFIFC_DELAY   A366 (.PIN_IN(s_we_bit12),
                                  .PIN_OUT(s_a366_out));

   DECODE_DGA_PFIFC_DELAY   A309 (.PIN_IN(s_we_bit1),
                                  .PIN_OUT(s_a309_out));

endmodule
*/