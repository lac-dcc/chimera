// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 DGA                                                             **
** DECODE/DGA/POW                                                        **
**                                                                       **
**  Page 8 DECODE - DECODE_DGA_POW- Sheet 1 of 3                         **
**  Page 9 DECODE - DECODE_DGA_POW- Sheet 2 of 3                         **
**  Page 10 DECODE - DECODE_DGA_POW- Sheet 3 of 3                        **
**                                                                       **
** Last reviewed: 12-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/
module DECODE_DGA_POW( 
   input BDRY50N,
   input CLOSC,
   input CLRTIN,
   input CONTINUEN,
   input EMCLN,
   input LOADN,
   input POWSENSE,
   input PRQN,
   input PWCL,
   input REFN,
   input RESET,
   input RTOSC,
   input SEL5MSN,
   input SSTOPN,
   input STARTN,
   input STOPN,
   input TESTE,

   //*************
   output CLEAR,
   output IDB0,
   output IDB1,
   output IDB2,
   output MCL,
   output PANN,
   output PANOSC,
   output POWFAILN,
   output REFRQN,
   output STPN,
   output TESTO,
   output TOUT
);

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_panosc;
   wire s_logisimNet1;
   wire s_a633_qb;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_powsense;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_powfail_n;
   wire s_logisimNet19;
   wire s_logisimNet2;
   wire s_logisimNet20;
   wire s_ref_n;
   wire s_rtosc;
   wire s_closc;
   wire s_logisimNet24;
   wire s_idb1;
   wire s_logisimNet26;
   wire s_logisimNet27;
   wire s_logisimNet28;
   wire s_emcl_n;
   wire s_logisimNet3;
   wire s_logisimNet30;
   wire s_mcl;
   wire s_logisimNet32;
   wire s_bdry50_n;
   wire s_logisimNet34;
   wire s_logisimNet35;
   wire s_logisimNet36;
   wire s_sel5ms_n;
   wire s_logisimNet38;
   wire s_logisimNet39;
   wire s_logisimNet4;
   wire s_logisimNet40;
   wire s_logisimNet41;
   wire s_logisimNet42;
   wire s_refrq_n;
   wire s_logisimNet44;
   wire s_logisimNet45;
   wire s_logisimNet46;
   wire s_logisimNet47;
   wire s_testo;
   wire s_logisimNet49;
   wire s_logisimNet5;
   wire s_prq_n;
   wire s_logisimNet51;
   wire s_logisimNet52;
   wire s_logisimNet53;
   wire s_logisimNet54;
   wire s_logisimNet55;
   wire s_logisimNet56;
   wire s_a631_q;
   wire s_stp_n;
   wire s_logisimNet59;
   wire s_logisimNet6;
   wire s_continue_n;
   wire s_load_n;
   wire s_logisimNet62;
   wire s_logisimNet63;
   wire s_logisimNet64;
   wire s_logisimNet65;
   wire s_clear;
   wire s_logisimNet67;
   wire s_logisimNet68;
   wire s_logisimNet69;
   wire s_logisimNet7;
   wire s_logisimNet70;
   wire s_logisimNet71;
   wire s_logisimNet72;
   wire s_pwcl;
   wire s_test_enable;
   wire s_logisimNet75;
   wire s_logisimNet76;
   wire s_logisimNet77;
   wire s_logisimNet78;
   wire s_sstop_n;
   wire s_logisimNet8;
   wire s_logisimNet80;
   wire s_logisimNet81;
   wire s_logisimNet82;
   wire s_idb0;
   wire s_reset;
   wire s_stop_n;
   wire s_start_n;
   wire s_idb2;
   wire s_pan_n;
   wire s_logisimNet89;
   wire s_clrti_n;
   wire s_logisimNet90;
   wire s_logisimNet91;
   wire s_logisimNet92;
   wire s_logisimNet93;
   wire s_logisimNet94;
   wire s_logisimNet95;
   wire s_logisimNet96;
   wire s_powfail;
   wire s_logisimNet98;
   wire s_tout;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_powsense    = POWSENSE;
   assign s_ref_n       = REFN;
   assign s_rtosc       = RTOSC;
   assign s_closc       = CLOSC;
   assign s_emcl_n      = EMCLN;
   assign s_bdry50_n    = BDRY50N;
   assign s_sel5ms_n    = SEL5MSN;
   assign s_prq_n       = PRQN;
   assign s_continue_n  = CONTINUEN;
   assign s_load_n      = LOADN;
   assign s_pwcl        = PWCL;
   assign s_test_enable = TESTE;
   assign s_sstop_n     = SSTOPN;
   assign s_reset       = RESET;
   assign s_stop_n      = STOPN;
   assign s_start_n     = STARTN;
   assign s_clrti_n     = CLRTIN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CLEAR    = s_clear;
   assign IDB0     = s_idb0;
   assign IDB1     = s_idb1;
   assign IDB2     = s_idb2;
   assign MCL      = s_mcl;
   assign PANN     = s_pan_n;
   assign PANOSC   = s_panosc;
   assign POWFAILN = s_powfail_n;
   assign REFRQN   = s_refrq_n;
   assign STPN     = s_stp_n;   
   assign TESTO    = s_testo;
   assign TOUT     = s_tout;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet19  =  1'b0;


   // Power
   assign  s_logisimNet17  =  1'b1;


   // Ground
   assign  s_logisimNet12  =  1'b0;


   // Ground
   assign  s_logisimNet49  =  1'b0;


   // Ground
   assign  s_logisimNet2  =  1'b0;


   // Ground
   assign  s_logisimNet38  =  1'b0;


   // Ground
   assign  s_logisimNet3  =  1'b0;


   // Ground
   assign  s_logisimNet15  =  1'b0;


   // Power
   assign  s_logisimNet6  =  1'b1;


   // NOT Gate
   assign s_clear = ~s_logisimNet30;

   // NOT Gate
   assign s_logisimNet5 = ~s_start_n;

   // NOT Gate
   assign s_logisimNet42 = ~s_clrti_n;

   // NOT Gate
   assign s_logisimNet44 = ~s_logisimNet95;

   // NOT Gate
   assign s_logisimNet80 = ~s_clrti_n;

   // NOT Gate
   assign s_logisimNet82 = ~s_logisimNet95;

   // NOT Gate
   assign s_logisimNet76 = ~s_mcl;

   // NOT Gate
   assign s_logisimNet71 = ~s_logisimNet68;

   // NOT Gate
   assign s_logisimNet55 = ~s_powfail;

   // NOT Gate
   assign s_logisimNet41 = ~s_pwcl;

   // NOT Gate
   assign s_powfail_n = ~s_powfail;

   // NOT Gate
   assign s_logisimNet92 = ~s_continue_n;

   // NOT Gate: A504
   assign s_logisimNet90 = ~s_load_n;

   // NOT Gate
   assign s_logisimNet78 = ~s_logisimNet27;

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet64 = ~s_prq_n;

   // NOT Gate
   assign s_logisimNet46 = ~s_logisimNet53;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A597 (.input1(s_logisimNet27),
            .input2(s_logisimNet72),
            .input3(s_logisimNet64),
            .result(s_logisimNet59));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A609 (.input1(s_logisimNet27),
            .input2(s_logisimNet72),
            .input3(s_logisimNet16),
            .result(s_logisimNet65));

   NAND_GATE #(.BubblesMask(2'b00))
      A598 (.input1(s_logisimNet98),
            .input2(s_logisimNet78),
            .result(s_logisimNet52));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A599 (.input1(s_logisimNet46),
            .input2(s_prq_n),
            .input3(s_logisimNet72),
            .input4(s_logisimNet98),
            .result(s_logisimNet67));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A590 (.input1(s_logisimNet16),
            .input2(s_logisimNet72),
            .input3(s_logisimNet98),
            .result(s_logisimNet11));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A580 (.input1(s_sstop_n),
            .input2(s_logisimNet30),
            .input3(s_stop_n),
            .result(s_logisimNet34));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A606 (.input1(s_logisimNet72),
            .input2(s_logisimNet27),
            .input3(s_logisimNet98),
            .input4(s_logisimNet76),
            .result(s_idb2));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A592 (.input1(s_logisimNet76),
            .input2(s_logisimNet98),
            .input3(s_logisimNet27),
            .input4(s_logisimNet72),
            .input5(s_logisimNet1),
            .input6(s_prq_n),
            .input7(s_logisimNet53),
            .input8(s_stp_n),
            .result(s_logisimNet91));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A603 (.input1(s_logisimNet59),
            .input2(s_logisimNet98),
            .input3(s_logisimNet76),
            .input4(s_logisimNet65),
            .result(s_idb1));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A604 (.input1(s_logisimNet76),
            .input2(s_logisimNet52),
            .input3(s_logisimNet67),
            .input4(s_logisimNet11),
            .result(s_idb0));

   NAND_GATE #(.BubblesMask(2'b00))
      A595 (.input1(s_sstop_n),
            .input2(s_logisimNet91),
            .result(s_pan_n));

   NAND_GATE #(.BubblesMask(2'b00))
      A573 (.input1(s_emcl_n),
            .input2(s_logisimNet30),
            .result(s_mcl));

   NOR_GATE #(.BubblesMask(2'b00))
      A611 (.input1(s_powsense),
            .input2(s_pwcl),
            .result(s_logisimNet68));

   assign s_tout = ~(s_a631_q | s_a633_qb);

   NOR_GATE #(.BubblesMask(2'b00))
      A635 (.input1(s_closc),
            .input2(s_reset),
            .result(s_logisimNet20));

/*            
   NAND_GATE #(.BubblesMask(2'b00))
      A578 (.input1(s_stp_n),
            .input2(s_logisimNet41),
            .result(s_logisimNet54));
*/
   assign s_logisimNet54 = ~(s_stp_n & s_logisimNet41);
   

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A579 (.input1(s_logisimNet76),
            .input2(s_clrti_n),
            .input3(s_logisimNet40),
            .result(s_logisimNet36));

   J_K_FLIPFLOP #(.invertClockEnable(0))
      A616 (.clock(s_logisimNet39),
            .j(s_logisimNet28),
            .k(s_logisimNet6),
            .preset(s_logisimNet2),
            .q(s_logisimNet35),
            .qBar(),
            .reset(s_logisimNet8),
            .tick(1'b1));

   J_K_FLIPFLOP #(.invertClockEnable(0))
      A618 (.clock(s_logisimNet39),
            .j(s_logisimNet35),
            .k(s_logisimNet6),
            .preset(s_logisimNet2),
            .q(s_logisimNet32),
            .qBar(s_logisimNet28),
            .reset(s_logisimNet8),
            .tick(1'b1));

   J_K_FLIPFLOP #(.invertClockEnable(0))
      A617 (.clock(s_logisimNet39),
            .j(s_logisimNet32),
            .k(s_logisimNet32),
            .preset(s_logisimNet2),
            .q(),
            .qBar(s_logisimNet24),
            .reset(s_logisimNet8),
            .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A572 (.clock(s_logisimNet30),
            .d(s_logisimNet75),
            .preset(s_logisimNet42),
            .q(),
            .qBar(s_logisimNet4),
            .reset(s_logisimNet44),
            .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A577 (.clock(s_logisimNet62),
            .d(s_logisimNet19),
            .preset(s_logisimNet80),
            .q(s_logisimNet53),
            .qBar(),
            .reset(s_logisimNet82),
            .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A600 (.clock(s_logisimNet70),
            .d(s_logisimNet49),
            .preset(s_logisimNet71),
            .q(s_powfail),
            .qBar(),
            .reset(s_logisimNet55),
            .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   F714   A623 (.H01_T(s_rtosc),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_logisimNet69));

   F714   A633 (.H01_T(s_rtosc),
                .H02_R(s_closc),
                .H03_S(s_logisimNet15),
                .N01_Q(),
                .N02_QB(s_a633_qb));

   F091   A613B (.N01(s_logisimNet95),
                 .N02());

   F714   A596 (.H01_T(s_logisimNet26),
                .H02_R(s_powsense),
                .H03_S(s_logisimNet12),
                .N01_Q(),
                .N02_QB(s_logisimNet63));

   F714   A632 (.H01_T(s_logisimNet69),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_logisimNet93));

   F714   A629 (.H01_T(s_a633_qb),
                .H02_R(s_closc),
                .H03_S(s_logisimNet15),
                .N01_Q(),
                .N02_QB(s_panosc));

   F714   A602 (.H01_T(s_logisimNet63),
                .H02_R(s_powsense),
                .H03_S(s_logisimNet12),
                .N01_Q(),
                .N02_QB(s_logisimNet94));

   F714   A634 (.H01_T(s_logisimNet93),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_logisimNet47));

   F595   A570 (.H01_S(s_stp_n),
                .H02_R(s_pwcl),
                .H03_G(s_logisimNet95),
                .N01_Q(),
                .N02_QB(s_logisimNet75));

   F595   A571 (.H01_S(s_logisimNet34),
                .H02_R(s_logisimNet5),
                .H03_G(s_logisimNet95),
                .N01_Q(s_logisimNet40),
                .N02_QB(s_stp_n));

   F714   A593 (.H01_T(s_logisimNet94),
                .H02_R(s_powsense),
                .H03_S(s_logisimNet12),
                .N01_Q(),
                .N02_QB(s_logisimNet56));

   F714   A621 (.H01_T(s_logisimNet47),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_logisimNet81));

   F091   A637 (.N01(),
                .N02(s_logisimNet96));

   F714   A594 (.H01_T(s_logisimNet56),
                .H02_R(s_powsense),
                .H03_S(s_logisimNet12),
                .N01_Q(),
                .N02_QB(s_logisimNet51));

   F714   A622 (.H01_T(s_logisimNet81),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_logisimNet7));

   F617   A630 (.H01_D(s_logisimNet96),
                .H02_C(s_a633_qb),
                .H03_RB(s_logisimNet17),
                .H04_SB(s_ref_n),
                .N01_Q(s_refrq_n),
                .N02_QB());

   F714   A619 (.H01_T(s_logisimNet7),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_testo));

   F714   A591 (.H01_T(s_logisimNet51),
                .H02_R(s_powsense),
                .H03_S(s_logisimNet12),
                .N01_Q(),
                .N02_QB(s_logisimNet89));

   F714   A627 (.H01_T(s_logisimNet24),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet2),
                .N01_Q(),
                .N02_QB(s_logisimNet14));

   F714   A605 (.H01_T(s_logisimNet89),
                .H02_R(s_powsense),
                .H03_S(s_logisimNet12),
                .N01_Q(),
                .N02_QB(s_logisimNet70));

   F617   A631 (.H01_D(s_refrq_n),
                .H02_C(s_a633_qb),
                .H03_RB(s_logisimNet17),
                .H04_SB(s_bdry50_n),
                .N01_Q(s_a631_q),
                .N02_QB());

   F571   A620 (.A(s_test_enable),
                .D0(s_testo),
                .D1(s_rtosc),
                .ENB_N(s_logisimNet3),
                .Y(s_logisimNet77));

   F714   A626 (.H01_T(s_logisimNet14),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet2),
                .N01_Q(),
                .N02_QB(s_logisimNet45));

   F714   A624 (.H01_T(s_logisimNet77),
                .H02_R(s_logisimNet8),
                .H03_S(s_logisimNet3),
                .N01_Q(),
                .N02_QB(s_logisimNet39));

   F571   A625 (.A(s_sel5ms_n),
                .D0(s_logisimNet24),
                .D1(s_logisimNet45),
                .ENB_N(s_logisimNet38),
                .Y(s_logisimNet62));

   F091   A613 (.N01(s_logisimNet1),
                .N02());

   F103   A628 (.F_IN(s_logisimNet20),
                .F_OUT(s_logisimNet8));

   F571   A601 (.A(s_test_enable),
                .D0(s_logisimNet62),
                .D1(s_rtosc),
                .ENB_N(s_logisimNet12),
                .Y(s_logisimNet26));

   F595   A576 (.H01_S(s_logisimNet90),
                .H02_R(s_logisimNet36),
                .H03_G(s_logisimNet95),
                .N01_Q(),
                .N02_QB(s_logisimNet72));

   F595   A574 (.H01_S(s_logisimNet4),
                .H02_R(s_logisimNet36),
                .H03_G(s_logisimNet95),
                .N01_Q(),
                .N02_QB(s_logisimNet98));

   /*  H01_S signal loops back vis STPN from A571. Verilator doesnt like it, Vivado does not complain */
   /* verilator lint_off UNOPTFLAT */  // <=== This didnt fix verilator lint error, so I added it into the F595 module for everyone..
   F595   A569 (.H01_S(s_logisimNet54),                
                .H02_R(s_powfail_n),                
                .H03_G(s_logisimNet95),
                .N01_Q(),
                .N02_QB(s_logisimNet30));
  /* verilator lint_on UNOPTFLAT */

   F595   A575 (.H01_S(s_logisimNet92),
                .H02_R(s_logisimNet36),
                .H03_G(s_logisimNet95),
                .N01_Q(),
                .N02_QB(s_logisimNet27));

endmodule
