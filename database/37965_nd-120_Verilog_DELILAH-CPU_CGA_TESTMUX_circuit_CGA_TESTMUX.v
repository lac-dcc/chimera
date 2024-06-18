// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_TESTMUX                                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_TESTMUX( CBRKN,
                    CFETCH,
                    COND,
                    CRY,
                    CSMREQ,
                    DEEP,
                    DSTOPN,
                    DZD,
                    F15,
                    INDN,
                    LCZN,
                    LDIRV,
                    MI,
                    OOD,
                    OVF,
                    PN,
                    PTM,
                    PTREEOUT,
                    PTSTN,
                    RESTR,
                    SC_6_3,
                    SGR,
                    TEST_4_0,
                    TN,
                    TSEL_2_0,
                    TVEC_3_0,
                    UPN,
                    VACCN,
                    VEX,
                    WPN,
                    WRITEN,
                    XFETCHN,
                    ZF );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       CBRKN;
   input       CFETCH;
   input       COND;
   input       CRY;
   input       CSMREQ;
   input       DEEP;
   input       DSTOPN;
   input       DZD;
   input       F15;
   input       INDN;
   input       LCZN;
   input       LDIRV;
   input       MI;
   input       OOD;
   input       OVF;
   input       PN;
   input       PTM;
   input       PTREEOUT;
   input       PTSTN;
   input       RESTR;
   input [3:0] SC_6_3;
   input       SGR;
   input       TN;
   input [2:0] TSEL_2_0;
   input [3:0] TVEC_3_0;
   input       UPN;
   input       VACCN;
   input       VEX;
   input       WPN;
   input       WRITEN;
   input       XFETCHN;
   input       ZF;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [4:0] TEST_4_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus28;
   wire [2:0] s_logisimBus35;
   wire [4:0] s_logisimBus46;
   wire [3:0] s_logisimBus54;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet5;
   wire       s_logisimNet50;
   wire       s_logisimNet51;
   wire       s_logisimNet52;
   wire       s_logisimNet53;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus28[3:0] = TVEC_3_0;
   assign s_logisimBus35[2:0] = TSEL_2_0;
   assign s_logisimBus54[3:0] = SC_6_3;
   assign s_logisimNet12      = WRITEN;
   assign s_logisimNet13      = COND;
   assign s_logisimNet14      = SGR;
   assign s_logisimNet15      = CFETCH;
   assign s_logisimNet16      = CSMREQ;
   assign s_logisimNet17      = PTM;
   assign s_logisimNet18      = DEEP;
   assign s_logisimNet22      = LDIRV;
   assign s_logisimNet23      = LCZN;
   assign s_logisimNet24      = WPN;
   assign s_logisimNet25      = PN;
   assign s_logisimNet26      = VACCN;
   assign s_logisimNet27      = OVF;
   assign s_logisimNet37      = ZF;
   assign s_logisimNet38      = TN;
   assign s_logisimNet39      = INDN;
   assign s_logisimNet40      = VEX;
   assign s_logisimNet41      = DZD;
   assign s_logisimNet42      = XFETCHN;
   assign s_logisimNet43      = DSTOPN;
   assign s_logisimNet44      = CRY;
   assign s_logisimNet45      = RESTR;
   assign s_logisimNet48      = CBRKN;
   assign s_logisimNet49      = F15;
   assign s_logisimNet50      = OOD;
   assign s_logisimNet51      = MI;
   assign s_logisimNet52      = UPN;
   assign s_logisimNet53      = PTREEOUT;
   assign s_logisimNet6       = PTSTN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign TEST_4_0 = s_logisimBus46[4:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet32  =  1'b1;


   // Ground
   assign  s_logisimNet8  =  1'b0;


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet6),
               .input2(s_logisimNet53),
               .result(s_logisimNet21));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus35[0]),
               .input2(s_logisimNet6),
               .result(s_logisimNet9));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus35[1]),
               .input2(s_logisimNet6),
               .result(s_logisimNet0));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimBus35[2]),
               .input2(s_logisimNet6),
               .result(s_logisimNet3));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX81   TM2 (.A(s_logisimNet9),
                .B(s_logisimNet0),
                .C(s_logisimNet3),
                .D0(s_logisimNet22),
                .D1(s_logisimNet48),
                .D2(s_logisimNet24),
                .D3(s_logisimNet49),
                .D4(s_logisimNet25),
                .D5(s_logisimNet50),
                .D6(s_logisimBus54[2]),
                .D7(s_logisimBus28[2]),
                .Z(s_logisimBus46[2]));

   MUX81   TM3 (.A(s_logisimNet9),
                .B(s_logisimNet0),
                .C(s_logisimNet3),
                .D0(s_logisimNet40),
                .D1(s_logisimNet12),
                .D2(s_logisimNet42),
                .D3(s_logisimNet14),
                .D4(s_logisimNet38),
                .D5(s_logisimNet15),
                .D6(s_logisimBus54[3]),
                .D7(s_logisimBus28[3]),
                .Z(s_logisimBus46[3]));

   MUX81   TM4 (.A(s_logisimNet9),
                .B(s_logisimNet0),
                .C(s_logisimNet3),
                .D0(s_logisimNet32),
                .D1(s_logisimNet43),
                .D2(s_logisimNet32),
                .D3(s_logisimNet44),
                .D4(s_logisimNet32),
                .D5(s_logisimNet45),
                .D6(s_logisimNet18),
                .D7(s_logisimNet8),
                .Z(s_logisimBus46[4]));

   MUX81   TM0 (.A(s_logisimNet9),
                .B(s_logisimNet0),
                .C(s_logisimNet3),
                .D0(s_logisimNet21),
                .D1(s_logisimNet26),
                .D2(s_logisimNet51),
                .D3(s_logisimNet27),
                .D4(s_logisimNet52),
                .D5(s_logisimNet23),
                .D6(s_logisimBus54[0]),
                .D7(s_logisimBus28[0]),
                .Z(s_logisimBus46[0]));

   MUX81   TM1 (.A(s_logisimNet9),
                .B(s_logisimNet0),
                .C(s_logisimNet3),
                .D0(s_logisimNet16),
                .D1(s_logisimNet39),
                .D2(s_logisimNet17),
                .D3(s_logisimNet37),
                .D4(s_logisimNet13),
                .D5(s_logisimNet41),
                .D6(s_logisimBus54[1]),
                .D7(s_logisimBus28[1]),
                .Z(s_logisimBus46[1]));

endmodule
