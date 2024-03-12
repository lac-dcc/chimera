//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

///** Reset logic for HIP + 
//*/
module pcie_hip_s4gx_gen2_x4_128_rs_hip (
                                          // inputs:
                                           dlup_exit,
                                           hotrst_exit,
                                           l2_exit,
                                           ltssm,
                                           npor,
                                           pld_clk,
                                           test_sim,

                                          // outputs:
                                           app_rstn,
                                           crst,
                                           srst
                                        )
;

  output           app_rstn;
  output           crst;
  output           srst;
  input            dlup_exit;
  input            hotrst_exit;
  input            l2_exit;
  input   [  4: 0] ltssm;
  input            npor;
  input            pld_clk;
  input            test_sim;

  reg              any_rstn_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              any_rstn_rr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              app_rstn;
  reg              app_rstn0;
  reg              crst;
  reg              crst0;
  reg     [  4: 0] dl_ltssm_r;
  reg              dlup_exit_r;
  reg              exits_r;
  reg              hotrst_exit_r;
  reg              l2_exit_r;
  wire             otb0;
  wire             otb1;
  reg     [ 10: 0] rsnt_cntn;
  reg              srst;
  reg              srst0;
  assign otb0 = 1'b0;
  assign otb1 = 1'b1;
  //pipe line exit conditions
  always @(posedge pld_clk or negedge any_rstn_rr)
    begin
      if (any_rstn_rr == 0)
        begin
          dlup_exit_r <= otb1;
          hotrst_exit_r <= otb1;
          l2_exit_r <= otb1;
          exits_r <= otb0;
        end
      else 
        begin
          dlup_exit_r <= dlup_exit;
          hotrst_exit_r <= hotrst_exit;
          l2_exit_r <= l2_exit;
          exits_r <= (l2_exit_r == 1'b0) | (hotrst_exit_r == 1'b0) | (dlup_exit_r == 1'b0) | (dl_ltssm_r == 5'h10);
        end
    end


  //LTSSM pipeline
  always @(posedge pld_clk or negedge any_rstn_rr)
    begin
      if (any_rstn_rr == 0)
          dl_ltssm_r <= 0;
      else 
        dl_ltssm_r <= ltssm;
    end


  //reset Synchronizer
  always @(posedge pld_clk or negedge npor)
    begin
      if (npor == 0)
        begin
          any_rstn_r <= 0;
          any_rstn_rr <= 0;
        end
      else 
        begin
          any_rstn_r <= 1;
          any_rstn_rr <= any_rstn_r;
        end
    end


  //reset counter
  always @(posedge pld_clk or negedge any_rstn_rr)
    begin
      if (any_rstn_rr == 0)
          rsnt_cntn <= 0;
      else if (exits_r == 1'b1)
          rsnt_cntn <= 11'h3f0;
      else if (rsnt_cntn != 11'd1024)
          rsnt_cntn <= rsnt_cntn + 1;
    end


  //sync and config reset
  always @(posedge pld_clk or negedge any_rstn_rr)
    begin
      if (any_rstn_rr == 0)
        begin
          app_rstn0 <= 0;
          srst0 <= 1;
          crst0 <= 1;
        end
      else if (exits_r == 1'b1)
        begin
          srst0 <= 1;
          crst0 <= 1;
          app_rstn0 <= 0;
        end
      else // synthesis translate_off
      if ((test_sim == 1'b1) & (rsnt_cntn >= 11'd32))
        begin
          srst0 <= 0;
          crst0 <= 0;
          app_rstn0 <= 1;
        end
      else // synthesis translate_on
      if (rsnt_cntn == 11'd1024)
        begin
          srst0 <= 0;
          crst0 <= 0;
          app_rstn0 <= 1;
        end
    end


  //sync and config reset pipeline
  always @(posedge pld_clk or negedge any_rstn_rr)
    begin
      if (any_rstn_rr == 0)
        begin
          app_rstn <= 0;
          srst <= 1;
          crst <= 1;
        end
      else 
        begin
          app_rstn <= app_rstn0;
          srst <= srst0;
          crst <= crst0;
        end
    end



endmodule

