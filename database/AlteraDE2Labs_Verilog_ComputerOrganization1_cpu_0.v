//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
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

module cpu_0_rf_module (
                         // inputs:
                          address_a,
                          address_b,
                          clock0,
                          clock1,
                          clocken0,
                          clocken1,
                          data_a,
                          data_b,
                          wren_a,
                          wren_b,

                         // outputs:
                          q_a,
                          q_b
                       )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q_a;
  output  [ 31: 0] q_b;
  input   [  4: 0] address_a;
  input   [  4: 0] address_b;
  input            clock0;
  input            clock1;
  input            clocken0;
  input            clocken1;
  input   [ 31: 0] data_a;
  input   [ 31: 0] data_b;
  input            wren_a;
  input            wren_b;

  wire    [ 31: 0] q_a;
  wire    [ 31: 0] q_b;
  altsyncram the_altsyncram
    (
      .address_a (address_a),
      .address_b (address_b),
      .clock0 (clock0),
      .clock1 (clock1),
      .clocken0 (clocken0),
      .clocken1 (clocken1),
      .data_a (data_a),
      .data_b (data_b),
      .q_a (q_a),
      .q_b (q_b),
      .wren_a (wren_a),
      .wren_b (wren_b)
    );

  defparam the_altsyncram.address_aclr_a = "NONE",
           the_altsyncram.address_aclr_b = "NONE",
           the_altsyncram.address_reg_b = "CLOCK1",
           the_altsyncram.indata_aclr_a = "NONE",
           the_altsyncram.indata_aclr_b = "NONE",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.intended_device_family = "CYCLONEII",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.numwords_a = 32,
           the_altsyncram.numwords_b = 32,
           the_altsyncram.operation_mode = "BIDIR_DUAL_PORT",
           the_altsyncram.outdata_aclr_a = "NONE",
           the_altsyncram.outdata_aclr_b = "NONE",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.widthad_a = 5,
           the_altsyncram.widthad_b = 5,
           the_altsyncram.wrcontrol_aclr_a = "NONE",
           the_altsyncram.wrcontrol_aclr_b = "NONE";


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_debug (
                               // inputs:
                                clk,
                                dbrk_break,
                                debugreq,
                                hbreak_enabled,
                                jdo,
                                jrst_n,
                                ocireg_ers,
                                ocireg_mrs,
                                reset,
                                st_ready_test_idle,
                                take_action_ocimem_a,
                                take_action_ocireg,
                                xbrk_break,

                               // outputs:
                                debugack,
                                monitor_error,
                                monitor_go,
                                monitor_ready,
                                oci_hbreak_req,
                                resetlatch,
                                resetrequest
                             )
;

  output           debugack;
  output           monitor_error;
  output           monitor_go;
  output           monitor_ready;
  output           oci_hbreak_req;
  output           resetlatch;
  output           resetrequest;
  input            clk;
  input            dbrk_break;
  input            debugreq;
  input            hbreak_enabled;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            ocireg_ers;
  input            ocireg_mrs;
  input            reset;
  input            st_ready_test_idle;
  input            take_action_ocimem_a;
  input            take_action_ocireg;
  input            xbrk_break;

  wire             debugack;
  reg              jtag_break /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              monitor_error /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  reg              monitor_go /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  reg              monitor_ready /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire             oci_hbreak_req;
  reg              probepresent /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              resetlatch /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              resetrequest /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          probepresent <= 1'b0;
          resetrequest <= 1'b0;
          jtag_break <= 1'b0;
        end
      else if (take_action_ocimem_a)
        begin
          resetrequest <= jdo[22];
          jtag_break <= jdo[21]     ? 1 
                    : jdo[20]  ? 0 
                    : jtag_break;

          probepresent <= jdo[19]     ? 1
                    : jdo[18]  ? 0
                    :  probepresent;

          resetlatch <= jdo[24] ? 0 : resetlatch;
        end
      else if (reset)
        begin
          jtag_break <= probepresent;
          resetlatch <= 1;
        end
      else if (~debugack & debugreq & probepresent)
          jtag_break <= 1'b1;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          monitor_ready <= 1'b0;
          monitor_error <= 1'b0;
          monitor_go <= 1'b0;
        end
      else 
        begin
          if (take_action_ocimem_a && jdo[25])
              monitor_ready <= 1'b0;
          else if (take_action_ocireg && ocireg_mrs)
              monitor_ready <= 1'b1;
          if (take_action_ocimem_a && jdo[25])
              monitor_error <= 1'b0;
          else if (take_action_ocireg && ocireg_ers)
              monitor_error <= 1'b1;
          if (take_action_ocimem_a && jdo[23])
              monitor_go <= 1'b1;
          else if (st_ready_test_idle)
              monitor_go <= 1'b0;
        end
    end


  assign oci_hbreak_req = jtag_break | dbrk_break | xbrk_break | debugreq;
  assign debugack = ~hbreak_enabled;

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_ociram_lpm_dram_bdp_component_module (
                                                    // inputs:
                                                     address_a,
                                                     address_b,
                                                     byteena_a,
                                                     clock0,
                                                     clock1,
                                                     clocken0,
                                                     clocken1,
                                                     data_a,
                                                     data_b,
                                                     wren_a,
                                                     wren_b,

                                                    // outputs:
                                                     q_a,
                                                     q_b
                                                  )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q_a;
  output  [ 31: 0] q_b;
  input   [  7: 0] address_a;
  input   [  7: 0] address_b;
  input   [  3: 0] byteena_a;
  input            clock0;
  input            clock1;
  input            clocken0;
  input            clocken1;
  input   [ 31: 0] data_a;
  input   [ 31: 0] data_b;
  input            wren_a;
  input            wren_b;

  wire    [ 31: 0] q_a;
  wire    [ 31: 0] q_b;
  altsyncram the_altsyncram
    (
      .address_a (address_a),
      .address_b (address_b),
      .byteena_a (byteena_a),
      .clock0 (clock0),
      .clock1 (clock1),
      .clocken0 (clocken0),
      .clocken1 (clocken1),
      .data_a (data_a),
      .data_b (data_b),
      .q_a (q_a),
      .q_b (q_b),
      .wren_a (wren_a),
      .wren_b (wren_b)
    );

  defparam the_altsyncram.address_aclr_a = "NONE",
           the_altsyncram.address_aclr_b = "NONE",
           the_altsyncram.address_reg_b = "CLOCK1",
           the_altsyncram.indata_aclr_a = "NONE",
           the_altsyncram.indata_aclr_b = "NONE",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.intended_device_family = "CYCLONEII",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.numwords_a = 256,
           the_altsyncram.numwords_b = 256,
           the_altsyncram.operation_mode = "BIDIR_DUAL_PORT",
           the_altsyncram.outdata_aclr_a = "NONE",
           the_altsyncram.outdata_aclr_b = "NONE",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 8,
           the_altsyncram.widthad_b = 8,
           the_altsyncram.wrcontrol_aclr_a = "NONE",
           the_altsyncram.wrcontrol_aclr_b = "NONE";


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_ocimem (
                            // inputs:
                             address,
                             begintransfer,
                             byteenable,
                             chipselect,
                             clk,
                             debugaccess,
                             jdo,
                             jrst_n,
                             resetrequest,
                             take_action_ocimem_a,
                             take_action_ocimem_b,
                             take_no_action_ocimem_a,
                             write,
                             writedata,

                            // outputs:
                             MonDReg,
                             oci_ram_readdata
                          )
;

  output  [ 31: 0] MonDReg;
  output  [ 31: 0] oci_ram_readdata;
  input   [  8: 0] address;
  input            begintransfer;
  input   [  3: 0] byteenable;
  input            chipselect;
  input            clk;
  input            debugaccess;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            resetrequest;
  input            take_action_ocimem_a;
  input            take_action_ocimem_b;
  input            take_no_action_ocimem_a;
  input            write;
  input   [ 31: 0] writedata;

  reg     [ 10: 0] MonAReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg     [ 31: 0] MonDReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              MonRd /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              MonRd1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              MonWr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             avalon;
  wire    [ 31: 0] cfgdout;
  wire    [ 31: 0] oci_ram_readdata;
  wire    [ 31: 0] sramdout;
  assign avalon = begintransfer & ~resetrequest;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          MonWr <= 1'b0;
          MonRd <= 1'b0;
          MonRd1 <= 1'b0;
          MonAReg <= 0;
          MonDReg <= 0;
        end
      else 
        begin
          if (take_no_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= MonAReg[10 : 2]+1;
              MonRd <= 1'b1;
            end
          else if (take_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= { jdo[17],
                            jdo[33 : 26] };

              MonRd <= 1'b1;
            end
          else if (take_action_ocimem_b)
            begin
              MonAReg[10 : 2] <= MonAReg[10 : 2]+1;
              MonDReg <= jdo[34 : 3];
              MonWr <= 1'b1;
            end
          else 
            begin
              if (~avalon)
                begin
                  MonWr <= 0;
                  MonRd <= 0;
                end
              if (MonRd1)
                  MonDReg <= MonAReg[10] ? cfgdout : sramdout;
            end
          MonRd1 <= MonRd;
        end
    end


//cpu_0_ociram_lpm_dram_bdp_component, which is an nios_tdp_ram
cpu_0_ociram_lpm_dram_bdp_component_module cpu_0_ociram_lpm_dram_bdp_component
  (
    .address_a (address[7 : 0]),
    .address_b (MonAReg[9 : 2]),
    .byteena_a (byteenable),
    .clock0    (clk),
    .clock1    (clk),
    .clocken0  (1'b1),
    .clocken1  (1'b1),
    .data_a    (writedata),
    .data_b    (MonDReg[31 : 0]),
    .q_a       (oci_ram_readdata),
    .q_b       (sramdout),
    .wren_a    (chipselect & write & debugaccess & 
                         ~address[8] 
                         ),
    .wren_b    (MonWr)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam cpu_0_ociram_lpm_dram_bdp_component.lpm_file = "cpu_0_ociram_default_contents.dat";
`else
defparam cpu_0_ociram_lpm_dram_bdp_component.lpm_file = "cpu_0_ociram_default_contents.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam cpu_0_ociram_lpm_dram_bdp_component.lpm_file = "cpu_0_ociram_default_contents.mif";
//synthesis read_comments_as_HDL off
  assign cfgdout = (MonAReg[4 : 2] == 3'd0)? 32'h00008020 :
    (MonAReg[4 : 2] == 3'd1)? 32'h00001111 :
    (MonAReg[4 : 2] == 3'd2)? 32'h00040000 :
    (MonAReg[4 : 2] == 3'd3)? 32'h00000000 :
    (MonAReg[4 : 2] == 3'd4)? 32'h20000000 :
    (MonAReg[4 : 2] == 3'd5)? 32'h00008000 :
    (MonAReg[4 : 2] == 3'd6)? 32'h00000000 :
    32'h00000000;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_avalon_reg (
                                // inputs:
                                 address,
                                 chipselect,
                                 clk,
                                 debugaccess,
                                 monitor_error,
                                 monitor_go,
                                 monitor_ready,
                                 reset_n,
                                 write,
                                 writedata,

                                // outputs:
                                 oci_ienable,
                                 oci_reg_readdata,
                                 oci_single_step_mode,
                                 ocireg_ers,
                                 ocireg_mrs,
                                 take_action_ocireg
                              )
;

  output  [ 31: 0] oci_ienable;
  output  [ 31: 0] oci_reg_readdata;
  output           oci_single_step_mode;
  output           ocireg_ers;
  output           ocireg_mrs;
  output           take_action_ocireg;
  input   [  8: 0] address;
  input            chipselect;
  input            clk;
  input            debugaccess;
  input            monitor_error;
  input            monitor_go;
  input            monitor_ready;
  input            reset_n;
  input            write;
  input   [ 31: 0] writedata;

  reg     [ 31: 0] oci_ienable;
  wire             oci_reg_00_addressed;
  wire             oci_reg_01_addressed;
  wire    [ 31: 0] oci_reg_readdata;
  reg              oci_single_step_mode;
  wire             ocireg_ers;
  wire             ocireg_mrs;
  wire             ocireg_sstep;
  wire             take_action_oci_intr_mask_reg;
  wire             take_action_ocireg;
  wire             write_strobe;
  assign oci_reg_00_addressed = address == 9'h100;
  assign oci_reg_01_addressed = address == 9'h101;
  assign write_strobe = chipselect & write & debugaccess;
  assign take_action_ocireg = write_strobe & oci_reg_00_addressed;
  assign take_action_oci_intr_mask_reg = write_strobe & oci_reg_01_addressed;
  assign ocireg_ers = writedata[1];
  assign ocireg_mrs = writedata[0];
  assign ocireg_sstep = writedata[3];
  assign oci_reg_readdata = oci_reg_00_addressed ? {28'b0, oci_single_step_mode, monitor_go,
    monitor_ready, monitor_error} : 
    oci_reg_01_addressed ?  oci_ienable :   
    32'b0;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          oci_single_step_mode <= 1'b0;
      else if (take_action_ocireg)
          oci_single_step_mode <= ocireg_sstep;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          oci_ienable <= 32'b00000000000000000000000000000000;
      else if (take_action_oci_intr_mask_reg)
          oci_ienable <= writedata | ~(32'b00000000000000000000000000000000);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_break (
                               // inputs:
                                clk,
                                dbrk_break,
                                dbrk_goto0,
                                dbrk_goto1,
                                jdo,
                                jrst_n,
                                reset_n,
                                take_action_break_a,
                                take_action_break_b,
                                take_action_break_c,
                                take_no_action_break_a,
                                take_no_action_break_b,
                                take_no_action_break_c,
                                xbrk_goto0,
                                xbrk_goto1,

                               // outputs:
                                break_readreg,
                                dbrk_hit0_latch,
                                dbrk_hit1_latch,
                                dbrk_hit2_latch,
                                dbrk_hit3_latch,
                                trigbrktype,
                                trigger_state_0,
                                trigger_state_1,
                                xbrk_ctrl0,
                                xbrk_ctrl1,
                                xbrk_ctrl2,
                                xbrk_ctrl3
                             )
;

  output  [ 31: 0] break_readreg;
  output           dbrk_hit0_latch;
  output           dbrk_hit1_latch;
  output           dbrk_hit2_latch;
  output           dbrk_hit3_latch;
  output           trigbrktype;
  output           trigger_state_0;
  output           trigger_state_1;
  output  [  7: 0] xbrk_ctrl0;
  output  [  7: 0] xbrk_ctrl1;
  output  [  7: 0] xbrk_ctrl2;
  output  [  7: 0] xbrk_ctrl3;
  input            clk;
  input            dbrk_break;
  input            dbrk_goto0;
  input            dbrk_goto1;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            reset_n;
  input            take_action_break_a;
  input            take_action_break_b;
  input            take_action_break_c;
  input            take_no_action_break_a;
  input            take_no_action_break_b;
  input            take_no_action_break_c;
  input            xbrk_goto0;
  input            xbrk_goto1;

  wire    [  3: 0] break_a_wpr;
  wire    [  1: 0] break_a_wpr_high_bits;
  wire    [  1: 0] break_a_wpr_low_bits;
  wire    [  1: 0] break_b_rr;
  wire    [  1: 0] break_c_rr;
  reg     [ 31: 0] break_readreg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire             dbrk0_high_value;
  wire             dbrk0_low_value;
  wire             dbrk1_high_value;
  wire             dbrk1_low_value;
  wire             dbrk2_high_value;
  wire             dbrk2_low_value;
  wire             dbrk3_high_value;
  wire             dbrk3_low_value;
  wire             dbrk_hit0_latch;
  wire             dbrk_hit1_latch;
  wire             dbrk_hit2_latch;
  wire             dbrk_hit3_latch;
  wire             take_action_any_break;
  reg              trigbrktype /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              trigger_state;
  wire             trigger_state_0;
  wire             trigger_state_1;
  wire    [ 31: 0] xbrk0_value;
  wire    [ 31: 0] xbrk1_value;
  wire    [ 31: 0] xbrk2_value;
  wire    [ 31: 0] xbrk3_value;
  reg     [  7: 0] xbrk_ctrl0 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [  7: 0] xbrk_ctrl1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [  7: 0] xbrk_ctrl2 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [  7: 0] xbrk_ctrl3 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  assign break_a_wpr = jdo[35 : 32];
  assign break_a_wpr_high_bits = break_a_wpr[3 : 2];
  assign break_a_wpr_low_bits = break_a_wpr[1 : 0];
  assign break_b_rr = jdo[33 : 32];
  assign break_c_rr = jdo[33 : 32];
  assign take_action_any_break = take_action_break_a | take_action_break_b | take_action_break_c;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          xbrk_ctrl0 <= 0;
          xbrk_ctrl1 <= 0;
          xbrk_ctrl2 <= 0;
          xbrk_ctrl3 <= 0;
          trigbrktype <= 0;
        end
      else 
        begin
          if (take_action_any_break)
              trigbrktype <= 0;
          else if (dbrk_break)
              trigbrktype <= 1;
          if (take_action_break_b)
            begin
              if ((break_b_rr == 2'b00) && (0 >= 1))
                begin
                  xbrk_ctrl0[0] <= jdo[27];
                  xbrk_ctrl0[1] <= jdo[28];
                  xbrk_ctrl0[2] <= jdo[29];
                  xbrk_ctrl0[3] <= jdo[30];
                  xbrk_ctrl0[4] <= jdo[21];
                  xbrk_ctrl0[5] <= jdo[20];
                  xbrk_ctrl0[6] <= jdo[19];
                  xbrk_ctrl0[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b01) && (0 >= 2))
                begin
                  xbrk_ctrl1[0] <= jdo[27];
                  xbrk_ctrl1[1] <= jdo[28];
                  xbrk_ctrl1[2] <= jdo[29];
                  xbrk_ctrl1[3] <= jdo[30];
                  xbrk_ctrl1[4] <= jdo[21];
                  xbrk_ctrl1[5] <= jdo[20];
                  xbrk_ctrl1[6] <= jdo[19];
                  xbrk_ctrl1[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b10) && (0 >= 3))
                begin
                  xbrk_ctrl2[0] <= jdo[27];
                  xbrk_ctrl2[1] <= jdo[28];
                  xbrk_ctrl2[2] <= jdo[29];
                  xbrk_ctrl2[3] <= jdo[30];
                  xbrk_ctrl2[4] <= jdo[21];
                  xbrk_ctrl2[5] <= jdo[20];
                  xbrk_ctrl2[6] <= jdo[19];
                  xbrk_ctrl2[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b11) && (0 >= 4))
                begin
                  xbrk_ctrl3[0] <= jdo[27];
                  xbrk_ctrl3[1] <= jdo[28];
                  xbrk_ctrl3[2] <= jdo[29];
                  xbrk_ctrl3[3] <= jdo[30];
                  xbrk_ctrl3[4] <= jdo[21];
                  xbrk_ctrl3[5] <= jdo[20];
                  xbrk_ctrl3[6] <= jdo[19];
                  xbrk_ctrl3[7] <= jdo[18];
                end
            end
        end
    end


  assign dbrk_hit0_latch = 1'b0;
  assign dbrk0_low_value = 0;
  assign dbrk0_high_value = 0;
  assign dbrk_hit1_latch = 1'b0;
  assign dbrk1_low_value = 0;
  assign dbrk1_high_value = 0;
  assign dbrk_hit2_latch = 1'b0;
  assign dbrk2_low_value = 0;
  assign dbrk2_high_value = 0;
  assign dbrk_hit3_latch = 1'b0;
  assign dbrk3_low_value = 0;
  assign dbrk3_high_value = 0;
  assign xbrk0_value = 32'b0;
  assign xbrk1_value = 32'b0;
  assign xbrk2_value = 32'b0;
  assign xbrk3_value = 32'b0;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          break_readreg <= 32'b0;
      else if (take_action_any_break)
          break_readreg <= jdo[31 : 0];
      else if (take_no_action_break_a)
          case (break_a_wpr_high_bits)
          
              2'd0: begin
                  case (break_a_wpr_low_bits) // synthesis full_case
                  
                      2'd0: begin
                          break_readreg <= xbrk0_value;
                      end // 2'd0 
                  
                      2'd1: begin
                          break_readreg <= xbrk1_value;
                      end // 2'd1 
                  
                      2'd2: begin
                          break_readreg <= xbrk2_value;
                      end // 2'd2 
                  
                      2'd3: begin
                          break_readreg <= xbrk3_value;
                      end // 2'd3 
                  
                  endcase // break_a_wpr_low_bits
              end // 2'd0 
          
              2'd1: begin
                  break_readreg <= 32'b0;
              end // 2'd1 
          
              2'd2: begin
                  case (break_a_wpr_low_bits) // synthesis full_case
                  
                      2'd0: begin
                          break_readreg <= dbrk0_low_value;
                      end // 2'd0 
                  
                      2'd1: begin
                          break_readreg <= dbrk1_low_value;
                      end // 2'd1 
                  
                      2'd2: begin
                          break_readreg <= dbrk2_low_value;
                      end // 2'd2 
                  
                      2'd3: begin
                          break_readreg <= dbrk3_low_value;
                      end // 2'd3 
                  
                  endcase // break_a_wpr_low_bits
              end // 2'd2 
          
              2'd3: begin
                  case (break_a_wpr_low_bits) // synthesis full_case
                  
                      2'd0: begin
                          break_readreg <= dbrk0_high_value;
                      end // 2'd0 
                  
                      2'd1: begin
                          break_readreg <= dbrk1_high_value;
                      end // 2'd1 
                  
                      2'd2: begin
                          break_readreg <= dbrk2_high_value;
                      end // 2'd2 
                  
                      2'd3: begin
                          break_readreg <= dbrk3_high_value;
                      end // 2'd3 
                  
                  endcase // break_a_wpr_low_bits
              end // 2'd3 
          
          endcase // break_a_wpr_high_bits
      else if (take_no_action_break_b)
          break_readreg <= jdo[31 : 0];
      else if (take_no_action_break_c)
          break_readreg <= jdo[31 : 0];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          trigger_state <= 0;
      else if (trigger_state_1 & (xbrk_goto0 | dbrk_goto0))
          trigger_state <= 0;
      else if (trigger_state_0 & (xbrk_goto1 | dbrk_goto1))
          trigger_state <= -1;
    end


  assign trigger_state_0 = ~trigger_state;
  assign trigger_state_1 = trigger_state;

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_xbrk (
                              // inputs:
                               D_valid,
                               E_valid,
                               F_pc,
                               clk,
                               reset_n,
                               trigger_state_0,
                               trigger_state_1,
                               xbrk_ctrl0,
                               xbrk_ctrl1,
                               xbrk_ctrl2,
                               xbrk_ctrl3,

                              // outputs:
                               xbrk_break,
                               xbrk_goto0,
                               xbrk_goto1,
                               xbrk_traceoff,
                               xbrk_traceon,
                               xbrk_trigout
                            )
;

  output           xbrk_break;
  output           xbrk_goto0;
  output           xbrk_goto1;
  output           xbrk_traceoff;
  output           xbrk_traceon;
  output           xbrk_trigout;
  input            D_valid;
  input            E_valid;
  input   [ 14: 0] F_pc;
  input            clk;
  input            reset_n;
  input            trigger_state_0;
  input            trigger_state_1;
  input   [  7: 0] xbrk_ctrl0;
  input   [  7: 0] xbrk_ctrl1;
  input   [  7: 0] xbrk_ctrl2;
  input   [  7: 0] xbrk_ctrl3;

  wire             D_cpu_addr_en;
  wire             E_cpu_addr_en;
  reg              E_xbrk_goto0;
  reg              E_xbrk_goto1;
  reg              E_xbrk_traceoff;
  reg              E_xbrk_traceon;
  reg              E_xbrk_trigout;
  wire    [ 16: 0] cpu_i_address;
  wire             xbrk0_armed;
  wire             xbrk0_break_hit;
  wire             xbrk0_goto0_hit;
  wire             xbrk0_goto1_hit;
  wire             xbrk0_toff_hit;
  wire             xbrk0_ton_hit;
  wire             xbrk0_tout_hit;
  wire             xbrk1_armed;
  wire             xbrk1_break_hit;
  wire             xbrk1_goto0_hit;
  wire             xbrk1_goto1_hit;
  wire             xbrk1_toff_hit;
  wire             xbrk1_ton_hit;
  wire             xbrk1_tout_hit;
  wire             xbrk2_armed;
  wire             xbrk2_break_hit;
  wire             xbrk2_goto0_hit;
  wire             xbrk2_goto1_hit;
  wire             xbrk2_toff_hit;
  wire             xbrk2_ton_hit;
  wire             xbrk2_tout_hit;
  wire             xbrk3_armed;
  wire             xbrk3_break_hit;
  wire             xbrk3_goto0_hit;
  wire             xbrk3_goto1_hit;
  wire             xbrk3_toff_hit;
  wire             xbrk3_ton_hit;
  wire             xbrk3_tout_hit;
  reg              xbrk_break;
  wire             xbrk_break_hit;
  wire             xbrk_goto0;
  wire             xbrk_goto0_hit;
  wire             xbrk_goto1;
  wire             xbrk_goto1_hit;
  wire             xbrk_toff_hit;
  wire             xbrk_ton_hit;
  wire             xbrk_tout_hit;
  wire             xbrk_traceoff;
  wire             xbrk_traceon;
  wire             xbrk_trigout;
  assign cpu_i_address = {F_pc, 2'b00};
  assign D_cpu_addr_en = D_valid;
  assign E_cpu_addr_en = E_valid;
  assign xbrk0_break_hit = 0;
  assign xbrk0_ton_hit = 0;
  assign xbrk0_toff_hit = 0;
  assign xbrk0_tout_hit = 0;
  assign xbrk0_goto0_hit = 0;
  assign xbrk0_goto1_hit = 0;
  assign xbrk1_break_hit = 0;
  assign xbrk1_ton_hit = 0;
  assign xbrk1_toff_hit = 0;
  assign xbrk1_tout_hit = 0;
  assign xbrk1_goto0_hit = 0;
  assign xbrk1_goto1_hit = 0;
  assign xbrk2_break_hit = 0;
  assign xbrk2_ton_hit = 0;
  assign xbrk2_toff_hit = 0;
  assign xbrk2_tout_hit = 0;
  assign xbrk2_goto0_hit = 0;
  assign xbrk2_goto1_hit = 0;
  assign xbrk3_break_hit = 0;
  assign xbrk3_ton_hit = 0;
  assign xbrk3_toff_hit = 0;
  assign xbrk3_tout_hit = 0;
  assign xbrk3_goto0_hit = 0;
  assign xbrk3_goto1_hit = 0;
  assign xbrk_break_hit = (xbrk0_break_hit) | (xbrk1_break_hit) | (xbrk2_break_hit) | (xbrk3_break_hit);
  assign xbrk_ton_hit = (xbrk0_ton_hit) | (xbrk1_ton_hit) | (xbrk2_ton_hit) | (xbrk3_ton_hit);
  assign xbrk_toff_hit = (xbrk0_toff_hit) | (xbrk1_toff_hit) | (xbrk2_toff_hit) | (xbrk3_toff_hit);
  assign xbrk_tout_hit = (xbrk0_tout_hit) | (xbrk1_tout_hit) | (xbrk2_tout_hit) | (xbrk3_tout_hit);
  assign xbrk_goto0_hit = (xbrk0_goto0_hit) | (xbrk1_goto0_hit) | (xbrk2_goto0_hit) | (xbrk3_goto0_hit);
  assign xbrk_goto1_hit = (xbrk0_goto1_hit) | (xbrk1_goto1_hit) | (xbrk2_goto1_hit) | (xbrk3_goto1_hit);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          xbrk_break <= 0;
      else if (E_cpu_addr_en)
          xbrk_break <= xbrk_break_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_traceon <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_traceon <= xbrk_ton_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_traceoff <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_traceoff <= xbrk_toff_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_trigout <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_trigout <= xbrk_tout_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_goto0 <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_goto0 <= xbrk_goto0_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_goto1 <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_goto1 <= xbrk_goto1_hit;
    end


  assign xbrk_traceon = 1'b0;
  assign xbrk_traceoff = 1'b0;
  assign xbrk_trigout = 1'b0;
  assign xbrk_goto0 = 1'b0;
  assign xbrk_goto1 = 1'b0;
  assign xbrk0_armed = (xbrk_ctrl0[4] & trigger_state_0) ||
    (xbrk_ctrl0[5] & trigger_state_1);

  assign xbrk1_armed = (xbrk_ctrl1[4] & trigger_state_0) ||
    (xbrk_ctrl1[5] & trigger_state_1);

  assign xbrk2_armed = (xbrk_ctrl2[4] & trigger_state_0) ||
    (xbrk_ctrl2[5] & trigger_state_1);

  assign xbrk3_armed = (xbrk_ctrl3[4] & trigger_state_0) ||
    (xbrk_ctrl3[5] & trigger_state_1);


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_dbrk (
                              // inputs:
                               E_st_data,
                               av_ld_data_aligned_filtered,
                               clk,
                               d_address,
                               d_read,
                               d_waitrequest,
                               d_write,
                               debugack,
                               reset_n,

                              // outputs:
                               cpu_d_address,
                               cpu_d_read,
                               cpu_d_readdata,
                               cpu_d_wait,
                               cpu_d_write,
                               cpu_d_writedata,
                               dbrk_break,
                               dbrk_goto0,
                               dbrk_goto1,
                               dbrk_traceme,
                               dbrk_traceoff,
                               dbrk_traceon,
                               dbrk_trigout
                            )
;

  output  [ 16: 0] cpu_d_address;
  output           cpu_d_read;
  output  [ 31: 0] cpu_d_readdata;
  output           cpu_d_wait;
  output           cpu_d_write;
  output  [ 31: 0] cpu_d_writedata;
  output           dbrk_break;
  output           dbrk_goto0;
  output           dbrk_goto1;
  output           dbrk_traceme;
  output           dbrk_traceoff;
  output           dbrk_traceon;
  output           dbrk_trigout;
  input   [ 31: 0] E_st_data;
  input   [ 31: 0] av_ld_data_aligned_filtered;
  input            clk;
  input   [ 16: 0] d_address;
  input            d_read;
  input            d_waitrequest;
  input            d_write;
  input            debugack;
  input            reset_n;

  wire    [ 16: 0] cpu_d_address;
  wire             cpu_d_read;
  wire    [ 31: 0] cpu_d_readdata;
  wire             cpu_d_wait;
  wire             cpu_d_write;
  wire    [ 31: 0] cpu_d_writedata;
  wire             dbrk0_armed;
  wire             dbrk0_break_pulse;
  wire             dbrk0_goto0;
  wire             dbrk0_goto1;
  wire             dbrk0_traceme;
  wire             dbrk0_traceoff;
  wire             dbrk0_traceon;
  wire             dbrk0_trigout;
  wire             dbrk1_armed;
  wire             dbrk1_break_pulse;
  wire             dbrk1_goto0;
  wire             dbrk1_goto1;
  wire             dbrk1_traceme;
  wire             dbrk1_traceoff;
  wire             dbrk1_traceon;
  wire             dbrk1_trigout;
  wire             dbrk2_armed;
  wire             dbrk2_break_pulse;
  wire             dbrk2_goto0;
  wire             dbrk2_goto1;
  wire             dbrk2_traceme;
  wire             dbrk2_traceoff;
  wire             dbrk2_traceon;
  wire             dbrk2_trigout;
  wire             dbrk3_armed;
  wire             dbrk3_break_pulse;
  wire             dbrk3_goto0;
  wire             dbrk3_goto1;
  wire             dbrk3_traceme;
  wire             dbrk3_traceoff;
  wire             dbrk3_traceon;
  wire             dbrk3_trigout;
  reg              dbrk_break;
  reg              dbrk_break_pulse;
  wire    [ 31: 0] dbrk_data;
  reg              dbrk_goto0;
  reg              dbrk_goto1;
  reg              dbrk_traceme;
  reg              dbrk_traceoff;
  reg              dbrk_traceon;
  reg              dbrk_trigout;
  assign cpu_d_address = d_address;
  assign cpu_d_readdata = av_ld_data_aligned_filtered;
  assign cpu_d_read = d_read;
  assign cpu_d_writedata = E_st_data;
  assign cpu_d_write = d_write;
  assign cpu_d_wait = d_waitrequest;
  assign dbrk_data = cpu_d_write ? cpu_d_writedata : cpu_d_readdata;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbrk_break <= 0;
      else 
        dbrk_break <= dbrk_break   ? ~debugack   
                : dbrk_break_pulse;

    end


  assign dbrk0_armed = 1'b0;
  assign dbrk0_trigout = 1'b0;
  assign dbrk0_break_pulse = 1'b0;
  assign dbrk0_traceoff = 1'b0;
  assign dbrk0_traceon = 1'b0;
  assign dbrk0_traceme = 1'b0;
  assign dbrk0_goto0 = 1'b0;
  assign dbrk0_goto1 = 1'b0;
  assign dbrk1_armed = 1'b0;
  assign dbrk1_trigout = 1'b0;
  assign dbrk1_break_pulse = 1'b0;
  assign dbrk1_traceoff = 1'b0;
  assign dbrk1_traceon = 1'b0;
  assign dbrk1_traceme = 1'b0;
  assign dbrk1_goto0 = 1'b0;
  assign dbrk1_goto1 = 1'b0;
  assign dbrk2_armed = 1'b0;
  assign dbrk2_trigout = 1'b0;
  assign dbrk2_break_pulse = 1'b0;
  assign dbrk2_traceoff = 1'b0;
  assign dbrk2_traceon = 1'b0;
  assign dbrk2_traceme = 1'b0;
  assign dbrk2_goto0 = 1'b0;
  assign dbrk2_goto1 = 1'b0;
  assign dbrk3_armed = 1'b0;
  assign dbrk3_trigout = 1'b0;
  assign dbrk3_break_pulse = 1'b0;
  assign dbrk3_traceoff = 1'b0;
  assign dbrk3_traceon = 1'b0;
  assign dbrk3_traceme = 1'b0;
  assign dbrk3_goto0 = 1'b0;
  assign dbrk3_goto1 = 1'b0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          dbrk_trigout <= 0;
          dbrk_break_pulse <= 0;
          dbrk_traceoff <= 0;
          dbrk_traceon <= 0;
          dbrk_traceme <= 0;
          dbrk_goto0 <= 0;
          dbrk_goto1 <= 0;
        end
      else 
        begin
          dbrk_trigout <= dbrk0_trigout | dbrk1_trigout | dbrk2_trigout | dbrk3_trigout;
          dbrk_break_pulse <= dbrk0_break_pulse | dbrk1_break_pulse | dbrk2_break_pulse | dbrk3_break_pulse;
          dbrk_traceoff <= dbrk0_traceoff | dbrk1_traceoff | dbrk2_traceoff | dbrk3_traceoff;
          dbrk_traceon <= dbrk0_traceon | dbrk1_traceon | dbrk2_traceon | dbrk3_traceon;
          dbrk_traceme <= dbrk0_traceme | dbrk1_traceme | dbrk2_traceme | dbrk3_traceme;
          dbrk_goto0 <= dbrk0_goto0 | dbrk1_goto0 | dbrk2_goto0 | dbrk3_goto0;
          dbrk_goto1 <= dbrk0_goto1 | dbrk1_goto1 | dbrk2_goto1 | dbrk3_goto1;
        end
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_itrace (
                                // inputs:
                                 clk,
                                 dbrk_traceoff,
                                 dbrk_traceon,
                                 jdo,
                                 jrst_n,
                                 take_action_tracectrl,
                                 trc_enb,
                                 xbrk_traceoff,
                                 xbrk_traceon,
                                 xbrk_wrap_traceoff,

                                // outputs:
                                 dct_buffer,
                                 dct_count,
                                 itm,
                                 trc_ctrl,
                                 trc_on
                              )
;

  output  [ 29: 0] dct_buffer;
  output  [  3: 0] dct_count;
  output  [ 35: 0] itm;
  output  [ 15: 0] trc_ctrl;
  output           trc_on;
  input            clk;
  input            dbrk_traceoff;
  input            dbrk_traceon;
  input   [ 15: 0] jdo;
  input            jrst_n;
  input            take_action_tracectrl;
  input            trc_enb;
  input            xbrk_traceoff;
  input            xbrk_traceon;
  input            xbrk_wrap_traceoff;

  wire             advanced_exception;
  reg     [ 29: 0] dct_buffer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  1: 0] dct_code;
  reg     [  3: 0] dct_count /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             dct_is_taken;
  wire    [ 31: 0] excaddr;
  wire             instr_retired;
  wire             is_cond_dct;
  wire             is_dct;
  wire             is_exception;
  wire             is_fast_tlb_miss_exception;
  wire             is_idct;
  reg     [ 35: 0] itm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             not_in_debug_mode;
  reg     [ 31: 0] pending_excaddr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              pending_exctype /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg     [  3: 0] pending_frametype /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             record_dct_outcome_in_sync;
  wire             record_itrace;
  wire    [ 31: 0] retired_pcb;
  wire    [  1: 0] sync_code;
  wire    [  6: 0] sync_interval;
  wire             sync_pending;
  reg     [  6: 0] sync_timer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  6: 0] sync_timer_next;
  wire             synced;
  reg              trc_clear /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire    [ 15: 0] trc_ctrl;
  reg     [ 10: 0] trc_ctrl_reg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             trc_on;
  assign is_cond_dct = 1'b0;
  assign is_dct = 1'b0;
  assign dct_is_taken = 1'b0;
  assign is_idct = 1'b0;
  assign retired_pcb = 32'b0;
  assign not_in_debug_mode = 1'b0;
  assign instr_retired = 1'b0;
  assign advanced_exception = 1'b0;
  assign is_exception = 1'b0;
  assign is_fast_tlb_miss_exception = 1'b0;
  assign excaddr = 32'b0;
  assign sync_code = trc_ctrl[3 : 2];
  assign sync_interval = { sync_code[1] & sync_code[0], 1'b0, sync_code[1] & ~sync_code[0], 1'b0, ~sync_code[1] & sync_code[0], 2'b00 };
  assign sync_pending = sync_timer == 0;
  assign record_dct_outcome_in_sync = dct_is_taken & sync_pending;
  assign sync_timer_next = sync_pending ? sync_timer : (sync_timer - 1);
  assign record_itrace = trc_on & trc_ctrl[4];
  assign synced = pending_frametype != 4'b1010;
  assign dct_code = {is_cond_dct, dct_is_taken};
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          trc_clear <= 0;
      else 
        trc_clear <= ~trc_enb & 
                take_action_tracectrl & jdo[4];

    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          itm <= 0;
          dct_buffer <= 0;
          dct_count <= 0;
          sync_timer <= 0;
          pending_frametype <= 4'b0000;
          pending_exctype <= 1'b0;
          pending_excaddr <= 0;
        end
      else if (trc_clear || (!0 && !0))
        begin
          itm <= 0;
          dct_buffer <= 0;
          dct_count <= 0;
          sync_timer <= 0;
          pending_frametype <= 4'b0000;
          pending_exctype <= 1'b0;
          pending_excaddr <= 0;
        end
      else if (instr_retired | advanced_exception)
        begin
          if (~record_itrace)
              pending_frametype <= 4'b1010;
          else if (is_exception)
            begin
              pending_frametype <= 4'b0010;
              pending_excaddr <= excaddr;
              if (is_fast_tlb_miss_exception)
                  pending_exctype <= 1'b1;
              else 
                pending_exctype <= 1'b0;
            end
          else if (is_idct)
              pending_frametype <= 4'b1001;
          else if (record_dct_outcome_in_sync)
              pending_frametype <= 4'b1000;
          else 
            pending_frametype <= 4'b0000;
          if ((dct_count != 0) & (
                     ~record_itrace | 
                     is_idct | 
                     is_exception | 
                     record_dct_outcome_in_sync
                   ))
            begin
              itm <= {4'b0001, dct_buffer, 2'b00};
              dct_buffer <= 0;
              dct_count <= 0;
              sync_timer <= sync_timer_next;
            end
          else 
            begin
              if (record_itrace & (is_dct & (dct_count != 4'd15)) & ~record_dct_outcome_in_sync & ~advanced_exception)
                begin
                  dct_buffer <= {dct_code, dct_buffer[29 : 2]};
                  dct_count <= dct_count + 1;
                end
              if (record_itrace & synced & (pending_frametype == 4'b0010))
                  itm <= {4'b0010, pending_excaddr[31 : 1], pending_exctype};
              else if (record_itrace & (pending_frametype != 4'b0000))
                begin
                  itm <= {pending_frametype, retired_pcb};
                  sync_timer <= sync_interval;
                end
              else if (record_itrace & synced & is_dct)
                begin
                  if (dct_count == 4'd15)
                    begin
                      itm <= {4'b0001, dct_code, dct_buffer};
                      dct_buffer <= 0;
                      dct_count <= 0;
                      sync_timer <= sync_timer_next;
                    end
                  else 
                    itm <= 4'b0000;
                end
              else 
                itm <= 4'b0000;
            end
        end
      else 
        itm <= 4'b0000;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_ctrl_reg[0] <= 1'b0;
          trc_ctrl_reg[1] <= 1'b0;
          trc_ctrl_reg[3 : 2] <= 2'b00;
          trc_ctrl_reg[4] <= 1'b0;
          trc_ctrl_reg[7 : 5] <= 3'b000;
          trc_ctrl_reg[8] <= 0;
          trc_ctrl_reg[9] <= 1'b0;
          trc_ctrl_reg[10] <= 1'b0;
        end
      else if (take_action_tracectrl)
        begin
          trc_ctrl_reg[0] <= jdo[5];
          trc_ctrl_reg[1] <= jdo[6];
          trc_ctrl_reg[3 : 2] <= jdo[8 : 7];
          trc_ctrl_reg[4] <= jdo[9];
          trc_ctrl_reg[9] <= jdo[14];
          trc_ctrl_reg[10] <= jdo[2];
          if (0)
              trc_ctrl_reg[7 : 5] <= jdo[12 : 10];
          if (0 & 0)
              trc_ctrl_reg[8] <= jdo[13];
        end
      else if (xbrk_wrap_traceoff)
        begin
          trc_ctrl_reg[1] <= 0;
          trc_ctrl_reg[0] <= 0;
        end
      else if (dbrk_traceoff | xbrk_traceoff)
          trc_ctrl_reg[1] <= 0;
      else if (trc_ctrl_reg[0] & 
                                  (dbrk_traceon | xbrk_traceon))
          trc_ctrl_reg[1] <= 1;
    end


  assign trc_ctrl = (0 || 0) ? {6'b000000, trc_ctrl_reg} : 0;
  assign trc_on = trc_ctrl[1] & (trc_ctrl[9] | not_in_debug_mode);

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_td_mode (
                                 // inputs:
                                  ctrl,

                                 // outputs:
                                  td_mode
                               )
;

  output  [  3: 0] td_mode;
  input   [  8: 0] ctrl;

  wire    [  2: 0] ctrl_bits_for_mux;
  reg     [  3: 0] td_mode;
  assign ctrl_bits_for_mux = ctrl[7 : 5];
  always @(ctrl_bits_for_mux)
    begin
      case (ctrl_bits_for_mux)
      
          3'b000: begin
              td_mode = 4'b0000;
          end // 3'b000 
      
          3'b001: begin
              td_mode = 4'b1000;
          end // 3'b001 
      
          3'b010: begin
              td_mode = 4'b0100;
          end // 3'b010 
      
          3'b011: begin
              td_mode = 4'b1100;
          end // 3'b011 
      
          3'b100: begin
              td_mode = 4'b0010;
          end // 3'b100 
      
          3'b101: begin
              td_mode = 4'b1010;
          end // 3'b101 
      
          3'b110: begin
              td_mode = 4'b0101;
          end // 3'b110 
      
          3'b111: begin
              td_mode = 4'b1111;
          end // 3'b111 
      
      endcase // ctrl_bits_for_mux
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_dtrace (
                                // inputs:
                                 clk,
                                 cpu_d_address,
                                 cpu_d_read,
                                 cpu_d_readdata,
                                 cpu_d_wait,
                                 cpu_d_write,
                                 cpu_d_writedata,
                                 jrst_n,
                                 trc_ctrl,

                                // outputs:
                                 atm,
                                 dtm
                              )
;

  output  [ 35: 0] atm;
  output  [ 35: 0] dtm;
  input            clk;
  input   [ 16: 0] cpu_d_address;
  input            cpu_d_read;
  input   [ 31: 0] cpu_d_readdata;
  input            cpu_d_wait;
  input            cpu_d_write;
  input   [ 31: 0] cpu_d_writedata;
  input            jrst_n;
  input   [ 15: 0] trc_ctrl;

  reg     [ 35: 0] atm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [ 31: 0] cpu_d_address_0_padded;
  wire    [ 31: 0] cpu_d_readdata_0_padded;
  wire    [ 31: 0] cpu_d_writedata_0_padded;
  reg     [ 35: 0] dtm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             record_load_addr;
  wire             record_load_data;
  wire             record_store_addr;
  wire             record_store_data;
  wire    [  3: 0] td_mode_trc_ctrl;
  assign cpu_d_writedata_0_padded = cpu_d_writedata | 32'b0;
  assign cpu_d_readdata_0_padded = cpu_d_readdata | 32'b0;
  assign cpu_d_address_0_padded = cpu_d_address | 32'b0;
  //cpu_0_nios2_oci_trc_ctrl_td_mode, which is an e_instance
  cpu_0_nios2_oci_td_mode cpu_0_nios2_oci_trc_ctrl_td_mode
    (
      .ctrl    (trc_ctrl[8 : 0]),
      .td_mode (td_mode_trc_ctrl)
    );

  assign {record_load_addr, record_store_addr,
         record_load_data, record_store_data} = td_mode_trc_ctrl;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          atm <= 0;
          dtm <= 0;
        end
      else if (0)
        begin
          if (cpu_d_write & ~cpu_d_wait & record_store_addr)
              atm <= {4'b0101, cpu_d_address_0_padded};
          else if (cpu_d_read & ~cpu_d_wait & record_load_addr)
              atm <= {4'b0100, cpu_d_address_0_padded};
          else 
            atm <= {4'b0000, cpu_d_address_0_padded};
          if (cpu_d_write & ~cpu_d_wait & record_store_data)
              dtm <= {4'b0111, cpu_d_writedata_0_padded};
          else if (cpu_d_read & ~cpu_d_wait & record_load_data)
              dtm <= {4'b0110, cpu_d_readdata_0_padded};
          else 
            dtm <= {4'b0000, cpu_d_readdata_0_padded};
        end
      else 
        begin
          atm <= 0;
          dtm <= 0;
        end
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_compute_tm_count (
                                          // inputs:
                                           atm_valid,
                                           dtm_valid,
                                           itm_valid,

                                          // outputs:
                                           compute_tm_count
                                        )
;

  output  [  1: 0] compute_tm_count;
  input            atm_valid;
  input            dtm_valid;
  input            itm_valid;

  reg     [  1: 0] compute_tm_count;
  wire    [  2: 0] switch_for_mux;
  assign switch_for_mux = {itm_valid, atm_valid, dtm_valid};
  always @(switch_for_mux)
    begin
      case (switch_for_mux)
      
          3'b000: begin
              compute_tm_count = 0;
          end // 3'b000 
      
          3'b001: begin
              compute_tm_count = 1;
          end // 3'b001 
      
          3'b010: begin
              compute_tm_count = 1;
          end // 3'b010 
      
          3'b011: begin
              compute_tm_count = 2;
          end // 3'b011 
      
          3'b100: begin
              compute_tm_count = 1;
          end // 3'b100 
      
          3'b101: begin
              compute_tm_count = 2;
          end // 3'b101 
      
          3'b110: begin
              compute_tm_count = 2;
          end // 3'b110 
      
          3'b111: begin
              compute_tm_count = 3;
          end // 3'b111 
      
      endcase // switch_for_mux
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_fifowp_inc (
                                    // inputs:
                                     free2,
                                     free3,
                                     tm_count,

                                    // outputs:
                                     fifowp_inc
                                  )
;

  output  [  3: 0] fifowp_inc;
  input            free2;
  input            free3;
  input   [  1: 0] tm_count;

  reg     [  3: 0] fifowp_inc;
  always @(free2 or free3 or tm_count)
    begin
      if (free3 & (tm_count == 3))
          fifowp_inc = 3;
      else if (free2 & (tm_count >= 2))
          fifowp_inc = 2;
      else if (tm_count >= 1)
          fifowp_inc = 1;
      else 
        fifowp_inc = 0;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_fifocount_inc (
                                       // inputs:
                                        empty,
                                        free2,
                                        free3,
                                        tm_count,

                                       // outputs:
                                        fifocount_inc
                                     )
;

  output  [  4: 0] fifocount_inc;
  input            empty;
  input            free2;
  input            free3;
  input   [  1: 0] tm_count;

  reg     [  4: 0] fifocount_inc;
  always @(empty or free2 or free3 or tm_count)
    begin
      if (empty)
          fifocount_inc = tm_count[1 : 0];
      else if (free3 & (tm_count == 3))
          fifocount_inc = 2;
      else if (free2 & (tm_count >= 2))
          fifocount_inc = 1;
      else if (tm_count >= 1)
          fifocount_inc = 0;
      else 
        fifocount_inc = {5{1'b1}};
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_fifo (
                              // inputs:
                               atm,
                               clk,
                               dbrk_traceme,
                               dbrk_traceoff,
                               dbrk_traceon,
                               dct_buffer,
                               dct_count,
                               dtm,
                               itm,
                               jrst_n,
                               reset_n,
                               test_ending,
                               test_has_ended,
                               trc_on,

                              // outputs:
                               tw
                            )
;

  output  [ 35: 0] tw;
  input   [ 35: 0] atm;
  input            clk;
  input            dbrk_traceme;
  input            dbrk_traceoff;
  input            dbrk_traceon;
  input   [ 29: 0] dct_buffer;
  input   [  3: 0] dct_count;
  input   [ 35: 0] dtm;
  input   [ 35: 0] itm;
  input            jrst_n;
  input            reset_n;
  input            test_ending;
  input            test_has_ended;
  input            trc_on;

  wire             atm_valid;
  wire    [  1: 0] compute_tm_count_tm_count;
  wire             dtm_valid;
  wire             empty;
  reg     [ 35: 0] fifo_0;
  wire             fifo_0_enable;
  wire    [ 35: 0] fifo_0_mux;
  reg     [ 35: 0] fifo_1;
  reg     [ 35: 0] fifo_10;
  wire             fifo_10_enable;
  wire    [ 35: 0] fifo_10_mux;
  reg     [ 35: 0] fifo_11;
  wire             fifo_11_enable;
  wire    [ 35: 0] fifo_11_mux;
  reg     [ 35: 0] fifo_12;
  wire             fifo_12_enable;
  wire    [ 35: 0] fifo_12_mux;
  reg     [ 35: 0] fifo_13;
  wire             fifo_13_enable;
  wire    [ 35: 0] fifo_13_mux;
  reg     [ 35: 0] fifo_14;
  wire             fifo_14_enable;
  wire    [ 35: 0] fifo_14_mux;
  reg     [ 35: 0] fifo_15;
  wire             fifo_15_enable;
  wire    [ 35: 0] fifo_15_mux;
  wire             fifo_1_enable;
  wire    [ 35: 0] fifo_1_mux;
  reg     [ 35: 0] fifo_2;
  wire             fifo_2_enable;
  wire    [ 35: 0] fifo_2_mux;
  reg     [ 35: 0] fifo_3;
  wire             fifo_3_enable;
  wire    [ 35: 0] fifo_3_mux;
  reg     [ 35: 0] fifo_4;
  wire             fifo_4_enable;
  wire    [ 35: 0] fifo_4_mux;
  reg     [ 35: 0] fifo_5;
  wire             fifo_5_enable;
  wire    [ 35: 0] fifo_5_mux;
  reg     [ 35: 0] fifo_6;
  wire             fifo_6_enable;
  wire    [ 35: 0] fifo_6_mux;
  reg     [ 35: 0] fifo_7;
  wire             fifo_7_enable;
  wire    [ 35: 0] fifo_7_mux;
  reg     [ 35: 0] fifo_8;
  wire             fifo_8_enable;
  wire    [ 35: 0] fifo_8_mux;
  reg     [ 35: 0] fifo_9;
  wire             fifo_9_enable;
  wire    [ 35: 0] fifo_9_mux;
  wire    [ 35: 0] fifo_read_mux;
  reg     [  4: 0] fifocount /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  4: 0] fifocount_inc_fifocount;
  wire    [ 35: 0] fifohead;
  reg     [  3: 0] fiforp /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg     [  3: 0] fifowp /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  3: 0] fifowp1;
  wire    [  3: 0] fifowp2;
  wire    [  3: 0] fifowp_inc_fifowp;
  wire             free2;
  wire             free3;
  wire             itm_valid;
  reg              ovf_pending /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [ 35: 0] ovr_pending_atm;
  wire    [ 35: 0] ovr_pending_dtm;
  wire    [  1: 0] tm_count;
  wire             tm_count_ge1;
  wire             tm_count_ge2;
  wire             tm_count_ge3;
  wire             trc_this;
  wire    [ 35: 0] tw;
  assign trc_this = trc_on | (dbrk_traceon & ~dbrk_traceoff) | dbrk_traceme;
  assign itm_valid = |itm[35 : 32];
  assign atm_valid = |atm[35 : 32] & trc_this;
  assign dtm_valid = |dtm[35 : 32] & trc_this;
  assign free2 = ~fifocount[4];
  assign free3 = ~fifocount[4] & ~&fifocount[3 : 0];
  assign empty = ~|fifocount;
  assign fifowp1 = fifowp + 1;
  assign fifowp2 = fifowp + 2;
  //cpu_0_nios2_oci_compute_tm_count_tm_count, which is an e_instance
  cpu_0_nios2_oci_compute_tm_count cpu_0_nios2_oci_compute_tm_count_tm_count
    (
      .atm_valid        (atm_valid),
      .compute_tm_count (compute_tm_count_tm_count),
      .dtm_valid        (dtm_valid),
      .itm_valid        (itm_valid)
    );

  assign tm_count = compute_tm_count_tm_count;
  //cpu_0_nios2_oci_fifowp_inc_fifowp, which is an e_instance
  cpu_0_nios2_oci_fifowp_inc cpu_0_nios2_oci_fifowp_inc_fifowp
    (
      .fifowp_inc (fifowp_inc_fifowp),
      .free2      (free2),
      .free3      (free3),
      .tm_count   (tm_count)
    );

  //cpu_0_nios2_oci_fifocount_inc_fifocount, which is an e_instance
  cpu_0_nios2_oci_fifocount_inc cpu_0_nios2_oci_fifocount_inc_fifocount
    (
      .empty         (empty),
      .fifocount_inc (fifocount_inc_fifocount),
      .free2         (free2),
      .free3         (free3),
      .tm_count      (tm_count)
    );

  //the_cpu_0_oci_test_bench, which is an e_instance
  cpu_0_oci_test_bench the_cpu_0_oci_test_bench
    (
      .dct_buffer     (dct_buffer),
      .dct_count      (dct_count),
      .test_ending    (test_ending),
      .test_has_ended (test_has_ended)
    );

  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          fiforp <= 0;
          fifowp <= 0;
          fifocount <= 0;
          ovf_pending <= 1;
        end
      else 
        begin
          fifowp <= fifowp + fifowp_inc_fifowp;
          fifocount <= fifocount + fifocount_inc_fifocount;
          if (~empty)
              fiforp <= fiforp + 1;
          if (~trc_this || (~free2 & tm_count[1])   || (~free3 & (&tm_count)))
              ovf_pending <= 1;
          else if (atm_valid | dtm_valid)
              ovf_pending <= 0;
        end
    end


  assign fifohead = fifo_read_mux;
  assign tw = 0 ?  { (empty ?       4'h0       : fifohead[35 : 32]),   fifohead[31 : 0]}  : itm;
  assign fifo_0_enable = ((fifowp == 4'd0) && tm_count_ge1)  || (free2 && (fifowp1== 4'd0) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd0) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_0 <= 0;
      else if (fifo_0_enable)
          fifo_0 <= fifo_0_mux;
    end


  assign fifo_0_mux = (((fifowp == 4'd0) && itm_valid))? itm :
    (((fifowp == 4'd0) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd0) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd0) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd0) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd0) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_1_enable = ((fifowp == 4'd1) && tm_count_ge1)  || (free2 && (fifowp1== 4'd1) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd1) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_1 <= 0;
      else if (fifo_1_enable)
          fifo_1 <= fifo_1_mux;
    end


  assign fifo_1_mux = (((fifowp == 4'd1) && itm_valid))? itm :
    (((fifowp == 4'd1) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd1) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd1) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd1) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd1) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_2_enable = ((fifowp == 4'd2) && tm_count_ge1)  || (free2 && (fifowp1== 4'd2) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd2) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_2 <= 0;
      else if (fifo_2_enable)
          fifo_2 <= fifo_2_mux;
    end


  assign fifo_2_mux = (((fifowp == 4'd2) && itm_valid))? itm :
    (((fifowp == 4'd2) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd2) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd2) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd2) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd2) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_3_enable = ((fifowp == 4'd3) && tm_count_ge1)  || (free2 && (fifowp1== 4'd3) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd3) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_3 <= 0;
      else if (fifo_3_enable)
          fifo_3 <= fifo_3_mux;
    end


  assign fifo_3_mux = (((fifowp == 4'd3) && itm_valid))? itm :
    (((fifowp == 4'd3) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd3) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd3) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd3) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd3) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_4_enable = ((fifowp == 4'd4) && tm_count_ge1)  || (free2 && (fifowp1== 4'd4) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd4) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_4 <= 0;
      else if (fifo_4_enable)
          fifo_4 <= fifo_4_mux;
    end


  assign fifo_4_mux = (((fifowp == 4'd4) && itm_valid))? itm :
    (((fifowp == 4'd4) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd4) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd4) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd4) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd4) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_5_enable = ((fifowp == 4'd5) && tm_count_ge1)  || (free2 && (fifowp1== 4'd5) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd5) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_5 <= 0;
      else if (fifo_5_enable)
          fifo_5 <= fifo_5_mux;
    end


  assign fifo_5_mux = (((fifowp == 4'd5) && itm_valid))? itm :
    (((fifowp == 4'd5) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd5) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd5) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd5) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd5) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_6_enable = ((fifowp == 4'd6) && tm_count_ge1)  || (free2 && (fifowp1== 4'd6) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd6) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_6 <= 0;
      else if (fifo_6_enable)
          fifo_6 <= fifo_6_mux;
    end


  assign fifo_6_mux = (((fifowp == 4'd6) && itm_valid))? itm :
    (((fifowp == 4'd6) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd6) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd6) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd6) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd6) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_7_enable = ((fifowp == 4'd7) && tm_count_ge1)  || (free2 && (fifowp1== 4'd7) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd7) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_7 <= 0;
      else if (fifo_7_enable)
          fifo_7 <= fifo_7_mux;
    end


  assign fifo_7_mux = (((fifowp == 4'd7) && itm_valid))? itm :
    (((fifowp == 4'd7) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd7) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd7) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd7) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd7) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_8_enable = ((fifowp == 4'd8) && tm_count_ge1)  || (free2 && (fifowp1== 4'd8) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd8) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_8 <= 0;
      else if (fifo_8_enable)
          fifo_8 <= fifo_8_mux;
    end


  assign fifo_8_mux = (((fifowp == 4'd8) && itm_valid))? itm :
    (((fifowp == 4'd8) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd8) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd8) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd8) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd8) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_9_enable = ((fifowp == 4'd9) && tm_count_ge1)  || (free2 && (fifowp1== 4'd9) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd9) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_9 <= 0;
      else if (fifo_9_enable)
          fifo_9 <= fifo_9_mux;
    end


  assign fifo_9_mux = (((fifowp == 4'd9) && itm_valid))? itm :
    (((fifowp == 4'd9) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd9) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd9) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd9) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd9) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_10_enable = ((fifowp == 4'd10) && tm_count_ge1)  || (free2 && (fifowp1== 4'd10) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd10) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_10 <= 0;
      else if (fifo_10_enable)
          fifo_10 <= fifo_10_mux;
    end


  assign fifo_10_mux = (((fifowp == 4'd10) && itm_valid))? itm :
    (((fifowp == 4'd10) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd10) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd10) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd10) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd10) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_11_enable = ((fifowp == 4'd11) && tm_count_ge1)  || (free2 && (fifowp1== 4'd11) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd11) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_11 <= 0;
      else if (fifo_11_enable)
          fifo_11 <= fifo_11_mux;
    end


  assign fifo_11_mux = (((fifowp == 4'd11) && itm_valid))? itm :
    (((fifowp == 4'd11) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd11) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd11) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd11) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd11) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_12_enable = ((fifowp == 4'd12) && tm_count_ge1)  || (free2 && (fifowp1== 4'd12) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd12) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_12 <= 0;
      else if (fifo_12_enable)
          fifo_12 <= fifo_12_mux;
    end


  assign fifo_12_mux = (((fifowp == 4'd12) && itm_valid))? itm :
    (((fifowp == 4'd12) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd12) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd12) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd12) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd12) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_13_enable = ((fifowp == 4'd13) && tm_count_ge1)  || (free2 && (fifowp1== 4'd13) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd13) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_13 <= 0;
      else if (fifo_13_enable)
          fifo_13 <= fifo_13_mux;
    end


  assign fifo_13_mux = (((fifowp == 4'd13) && itm_valid))? itm :
    (((fifowp == 4'd13) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd13) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd13) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd13) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd13) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_14_enable = ((fifowp == 4'd14) && tm_count_ge1)  || (free2 && (fifowp1== 4'd14) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd14) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_14 <= 0;
      else if (fifo_14_enable)
          fifo_14 <= fifo_14_mux;
    end


  assign fifo_14_mux = (((fifowp == 4'd14) && itm_valid))? itm :
    (((fifowp == 4'd14) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd14) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd14) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd14) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd14) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_15_enable = ((fifowp == 4'd15) && tm_count_ge1)  || (free2 && (fifowp1== 4'd15) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd15) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_15 <= 0;
      else if (fifo_15_enable)
          fifo_15 <= fifo_15_mux;
    end


  assign fifo_15_mux = (((fifowp == 4'd15) && itm_valid))? itm :
    (((fifowp == 4'd15) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd15) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd15) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd15) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd15) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign tm_count_ge1 = |tm_count;
  assign tm_count_ge2 = tm_count[1];
  assign tm_count_ge3 = &tm_count;
  assign ovr_pending_atm = {ovf_pending, atm[34 : 0]};
  assign ovr_pending_dtm = {ovf_pending, dtm[34 : 0]};
  assign fifo_read_mux = (fiforp == 4'd0)? fifo_0 :
    (fiforp == 4'd1)? fifo_1 :
    (fiforp == 4'd2)? fifo_2 :
    (fiforp == 4'd3)? fifo_3 :
    (fiforp == 4'd4)? fifo_4 :
    (fiforp == 4'd5)? fifo_5 :
    (fiforp == 4'd6)? fifo_6 :
    (fiforp == 4'd7)? fifo_7 :
    (fiforp == 4'd8)? fifo_8 :
    (fiforp == 4'd9)? fifo_9 :
    (fiforp == 4'd10)? fifo_10 :
    (fiforp == 4'd11)? fifo_11 :
    (fiforp == 4'd12)? fifo_12 :
    (fiforp == 4'd13)? fifo_13 :
    (fiforp == 4'd14)? fifo_14 :
    fifo_15;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_pib (
                             // inputs:
                              clk,
                              clkx2,
                              jrst_n,
                              tw,

                             // outputs:
                              tr_clk,
                              tr_data
                           )
;

  output           tr_clk;
  output  [ 17: 0] tr_data;
  input            clk;
  input            clkx2;
  input            jrst_n;
  input   [ 35: 0] tw;

  wire             phase;
  wire             tr_clk;
  reg              tr_clk_reg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [ 17: 0] tr_data;
  reg     [ 17: 0] tr_data_reg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              x1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              x2 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  assign phase = x1^x2;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          x1 <= 0;
      else 
        x1 <= ~x1;
    end


  always @(posedge clkx2 or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          x2 <= 0;
          tr_clk_reg <= 0;
          tr_data_reg <= 0;
        end
      else 
        begin
          x2 <= x1;
          tr_clk_reg <= ~phase;
          tr_data_reg <= phase ?   tw[17 : 0] :   tw[35 : 18];
        end
    end


  assign tr_clk = 0 ? tr_clk_reg : 0;
  assign tr_data = 0 ? tr_data_reg : 0;

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_traceram_lpm_dram_bdp_component_module (
                                                      // inputs:
                                                       address_a,
                                                       address_b,
                                                       clock0,
                                                       clock1,
                                                       clocken0,
                                                       clocken1,
                                                       data_a,
                                                       data_b,
                                                       wren_a,
                                                       wren_b,

                                                      // outputs:
                                                       q_a,
                                                       q_b
                                                    )
;

  parameter lpm_file = "UNUSED";


  output  [ 35: 0] q_a;
  output  [ 35: 0] q_b;
  input   [  6: 0] address_a;
  input   [  6: 0] address_b;
  input            clock0;
  input            clock1;
  input            clocken0;
  input            clocken1;
  input   [ 35: 0] data_a;
  input   [ 35: 0] data_b;
  input            wren_a;
  input            wren_b;

  wire    [ 35: 0] q_a;
  wire    [ 35: 0] q_b;
  altsyncram the_altsyncram
    (
      .address_a (address_a),
      .address_b (address_b),
      .clock0 (clock0),
      .clock1 (clock1),
      .clocken0 (clocken0),
      .clocken1 (clocken1),
      .data_a (data_a),
      .data_b (data_b),
      .q_a (q_a),
      .q_b (q_b),
      .wren_a (wren_a),
      .wren_b (wren_b)
    );

  defparam the_altsyncram.address_aclr_a = "NONE",
           the_altsyncram.address_aclr_b = "NONE",
           the_altsyncram.address_reg_b = "CLOCK1",
           the_altsyncram.indata_aclr_a = "NONE",
           the_altsyncram.indata_aclr_b = "NONE",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.intended_device_family = "CYCLONEII",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.numwords_a = 128,
           the_altsyncram.numwords_b = 128,
           the_altsyncram.operation_mode = "BIDIR_DUAL_PORT",
           the_altsyncram.outdata_aclr_a = "NONE",
           the_altsyncram.outdata_aclr_b = "NONE",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 36,
           the_altsyncram.width_b = 36,
           the_altsyncram.widthad_a = 7,
           the_altsyncram.widthad_b = 7,
           the_altsyncram.wrcontrol_aclr_a = "NONE",
           the_altsyncram.wrcontrol_aclr_b = "NONE";


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci_im (
                            // inputs:
                             clk,
                             jdo,
                             jrst_n,
                             reset_n,
                             take_action_tracectrl,
                             take_action_tracemem_a,
                             take_action_tracemem_b,
                             take_no_action_tracemem_a,
                             trc_ctrl,
                             tw,

                            // outputs:
                             tracemem_on,
                             tracemem_trcdata,
                             tracemem_tw,
                             trc_enb,
                             trc_im_addr,
                             trc_wrap,
                             xbrk_wrap_traceoff
                          )
;

  output           tracemem_on;
  output  [ 35: 0] tracemem_trcdata;
  output           tracemem_tw;
  output           trc_enb;
  output  [  6: 0] trc_im_addr;
  output           trc_wrap;
  output           xbrk_wrap_traceoff;
  input            clk;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            reset_n;
  input            take_action_tracectrl;
  input            take_action_tracemem_a;
  input            take_action_tracemem_b;
  input            take_no_action_tracemem_a;
  input   [ 15: 0] trc_ctrl;
  input   [ 35: 0] tw;

  wire             tracemem_on;
  wire    [ 35: 0] tracemem_trcdata;
  wire             tracemem_tw;
  wire             trc_enb;
  reg     [  6: 0] trc_im_addr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire    [ 35: 0] trc_im_data;
  reg     [ 16: 0] trc_jtag_addr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire    [ 35: 0] trc_jtag_data;
  wire             trc_on_chip;
  reg              trc_wrap /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             tw_valid;
  wire    [ 35: 0] unused_bdpram_port_q_a;
  wire             xbrk_wrap_traceoff;
  assign trc_im_data = tw;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else if (!0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else if (take_action_tracectrl && 
                      (jdo[4] | jdo[3]))
        begin
          if (jdo[4])
              trc_im_addr <= 0;
          if (jdo[3])
              trc_wrap <= 0;
        end
      else if (trc_enb & trc_on_chip & tw_valid)
        begin
          trc_im_addr <= trc_im_addr+1;
          if (&trc_im_addr)
              trc_wrap <= 1;
        end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          trc_jtag_addr <= 0;
      else if (take_action_tracemem_a ||
                take_no_action_tracemem_a || 
                take_action_tracemem_b)
          trc_jtag_addr <= take_action_tracemem_a ? 
                    jdo[35 : 19] : 
                    trc_jtag_addr + 1;

    end


  assign trc_enb = trc_ctrl[0];
  assign trc_on_chip = ~trc_ctrl[8];
  assign tw_valid = |trc_im_data[35 : 32];
  assign xbrk_wrap_traceoff = trc_ctrl[10] & trc_wrap;
  assign tracemem_trcdata = (0) ? 
    trc_jtag_data : 0;

  assign tracemem_tw = trc_wrap;
  assign tracemem_on = trc_enb;
//cpu_0_traceram_lpm_dram_bdp_component, which is an nios_tdp_ram
cpu_0_traceram_lpm_dram_bdp_component_module cpu_0_traceram_lpm_dram_bdp_component
  (
    .address_a (trc_im_addr),
    .address_b (trc_jtag_addr),
    .clock0    (clk),
    .clock1    (clk),
    .clocken0  (1'b1),
    .clocken1  (1'b1),
    .data_a    (trc_im_data),
    .data_b    (jdo[36 : 1]),
    .q_a       (unused_bdpram_port_q_a),
    .q_b       (trc_jtag_data),
    .wren_a    (tw_valid & trc_enb),
    .wren_b    (take_action_tracemem_b)
  );


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_performance_monitors 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_nios2_oci (
                         // inputs:
                          D_valid,
                          E_st_data,
                          E_valid,
                          F_pc,
                          address,
                          av_ld_data_aligned_filtered,
                          begintransfer,
                          byteenable,
                          chipselect,
                          clk,
                          d_address,
                          d_read,
                          d_waitrequest,
                          d_write,
                          debugaccess,
                          hbreak_enabled,
                          reset,
                          reset_n,
                          test_ending,
                          test_has_ended,
                          write,
                          writedata,

                         // outputs:
                          jtag_debug_module_debugaccess_to_roms,
                          oci_hbreak_req,
                          oci_ienable,
                          oci_single_step_mode,
                          readdata,
                          resetrequest
                       )
;

  output           jtag_debug_module_debugaccess_to_roms;
  output           oci_hbreak_req;
  output  [ 31: 0] oci_ienable;
  output           oci_single_step_mode;
  output  [ 31: 0] readdata;
  output           resetrequest;
  input            D_valid;
  input   [ 31: 0] E_st_data;
  input            E_valid;
  input   [ 14: 0] F_pc;
  input   [  8: 0] address;
  input   [ 31: 0] av_ld_data_aligned_filtered;
  input            begintransfer;
  input   [  3: 0] byteenable;
  input            chipselect;
  input            clk;
  input   [ 16: 0] d_address;
  input            d_read;
  input            d_waitrequest;
  input            d_write;
  input            debugaccess;
  input            hbreak_enabled;
  input            reset;
  input            reset_n;
  input            test_ending;
  input            test_has_ended;
  input            write;
  input   [ 31: 0] writedata;

  wire    [ 31: 0] MonDReg;
  wire    [ 35: 0] atm;
  wire    [ 31: 0] break_readreg;
  wire             clkx2;
  wire    [ 16: 0] cpu_d_address;
  wire             cpu_d_read;
  wire    [ 31: 0] cpu_d_readdata;
  wire             cpu_d_wait;
  wire             cpu_d_write;
  wire    [ 31: 0] cpu_d_writedata;
  wire             dbrk_break;
  wire             dbrk_goto0;
  wire             dbrk_goto1;
  wire             dbrk_hit0_latch;
  wire             dbrk_hit1_latch;
  wire             dbrk_hit2_latch;
  wire             dbrk_hit3_latch;
  wire             dbrk_traceme;
  wire             dbrk_traceoff;
  wire             dbrk_traceon;
  wire             dbrk_trigout;
  wire    [ 29: 0] dct_buffer;
  wire    [  3: 0] dct_count;
  wire             debugack;
  wire             debugreq;
  wire    [ 35: 0] dtm;
  wire             dummy_sink;
  wire    [ 35: 0] itm;
  wire    [ 37: 0] jdo;
  wire             jrst_n;
  wire             jtag_debug_module_debugaccess_to_roms;
  wire             monitor_error;
  wire             monitor_go;
  wire             monitor_ready;
  wire             oci_hbreak_req;
  wire    [ 31: 0] oci_ienable;
  wire    [ 31: 0] oci_ram_readdata;
  wire    [ 31: 0] oci_reg_readdata;
  wire             oci_single_step_mode;
  wire             ocireg_ers;
  wire             ocireg_mrs;
  wire    [ 31: 0] readdata;
  wire             resetlatch;
  wire             resetrequest;
  wire             st_ready_test_idle;
  wire             take_action_break_a;
  wire             take_action_break_b;
  wire             take_action_break_c;
  wire             take_action_ocimem_a;
  wire             take_action_ocimem_b;
  wire             take_action_ocireg;
  wire             take_action_tracectrl;
  wire             take_action_tracemem_a;
  wire             take_action_tracemem_b;
  wire             take_no_action_break_a;
  wire             take_no_action_break_b;
  wire             take_no_action_break_c;
  wire             take_no_action_ocimem_a;
  wire             take_no_action_tracemem_a;
  wire             tr_clk;
  wire    [ 17: 0] tr_data;
  wire             tracemem_on;
  wire    [ 35: 0] tracemem_trcdata;
  wire             tracemem_tw;
  wire    [ 15: 0] trc_ctrl;
  wire             trc_enb;
  wire    [  6: 0] trc_im_addr;
  wire             trc_on;
  wire             trc_wrap;
  wire             trigbrktype;
  wire             trigger_state_0;
  wire             trigger_state_1;
  wire             trigout;
  wire    [ 35: 0] tw;
  wire             xbrk_break;
  wire    [  7: 0] xbrk_ctrl0;
  wire    [  7: 0] xbrk_ctrl1;
  wire    [  7: 0] xbrk_ctrl2;
  wire    [  7: 0] xbrk_ctrl3;
  wire             xbrk_goto0;
  wire             xbrk_goto1;
  wire             xbrk_traceoff;
  wire             xbrk_traceon;
  wire             xbrk_trigout;
  wire             xbrk_wrap_traceoff;
  cpu_0_nios2_oci_debug the_cpu_0_nios2_oci_debug
    (
      .clk                  (clk),
      .dbrk_break           (dbrk_break),
      .debugack             (debugack),
      .debugreq             (debugreq),
      .hbreak_enabled       (hbreak_enabled),
      .jdo                  (jdo),
      .jrst_n               (jrst_n),
      .monitor_error        (monitor_error),
      .monitor_go           (monitor_go),
      .monitor_ready        (monitor_ready),
      .oci_hbreak_req       (oci_hbreak_req),
      .ocireg_ers           (ocireg_ers),
      .ocireg_mrs           (ocireg_mrs),
      .reset                (reset),
      .resetlatch           (resetlatch),
      .resetrequest         (resetrequest),
      .st_ready_test_idle   (st_ready_test_idle),
      .take_action_ocimem_a (take_action_ocimem_a),
      .take_action_ocireg   (take_action_ocireg),
      .xbrk_break           (xbrk_break)
    );

  cpu_0_nios2_ocimem the_cpu_0_nios2_ocimem
    (
      .MonDReg                 (MonDReg),
      .address                 (address),
      .begintransfer           (begintransfer),
      .byteenable              (byteenable),
      .chipselect              (chipselect),
      .clk                     (clk),
      .debugaccess             (debugaccess),
      .jdo                     (jdo),
      .jrst_n                  (jrst_n),
      .oci_ram_readdata        (oci_ram_readdata),
      .resetrequest            (resetrequest),
      .take_action_ocimem_a    (take_action_ocimem_a),
      .take_action_ocimem_b    (take_action_ocimem_b),
      .take_no_action_ocimem_a (take_no_action_ocimem_a),
      .write                   (write),
      .writedata               (writedata)
    );

  cpu_0_nios2_avalon_reg the_cpu_0_nios2_avalon_reg
    (
      .address              (address),
      .chipselect           (chipselect),
      .clk                  (clk),
      .debugaccess          (debugaccess),
      .monitor_error        (monitor_error),
      .monitor_go           (monitor_go),
      .monitor_ready        (monitor_ready),
      .oci_ienable          (oci_ienable),
      .oci_reg_readdata     (oci_reg_readdata),
      .oci_single_step_mode (oci_single_step_mode),
      .ocireg_ers           (ocireg_ers),
      .ocireg_mrs           (ocireg_mrs),
      .reset_n              (reset_n),
      .take_action_ocireg   (take_action_ocireg),
      .write                (write),
      .writedata            (writedata)
    );

  cpu_0_nios2_oci_break the_cpu_0_nios2_oci_break
    (
      .break_readreg          (break_readreg),
      .clk                    (clk),
      .dbrk_break             (dbrk_break),
      .dbrk_goto0             (dbrk_goto0),
      .dbrk_goto1             (dbrk_goto1),
      .dbrk_hit0_latch        (dbrk_hit0_latch),
      .dbrk_hit1_latch        (dbrk_hit1_latch),
      .dbrk_hit2_latch        (dbrk_hit2_latch),
      .dbrk_hit3_latch        (dbrk_hit3_latch),
      .jdo                    (jdo),
      .jrst_n                 (jrst_n),
      .reset_n                (reset_n),
      .take_action_break_a    (take_action_break_a),
      .take_action_break_b    (take_action_break_b),
      .take_action_break_c    (take_action_break_c),
      .take_no_action_break_a (take_no_action_break_a),
      .take_no_action_break_b (take_no_action_break_b),
      .take_no_action_break_c (take_no_action_break_c),
      .trigbrktype            (trigbrktype),
      .trigger_state_0        (trigger_state_0),
      .trigger_state_1        (trigger_state_1),
      .xbrk_ctrl0             (xbrk_ctrl0),
      .xbrk_ctrl1             (xbrk_ctrl1),
      .xbrk_ctrl2             (xbrk_ctrl2),
      .xbrk_ctrl3             (xbrk_ctrl3),
      .xbrk_goto0             (xbrk_goto0),
      .xbrk_goto1             (xbrk_goto1)
    );

  cpu_0_nios2_oci_xbrk the_cpu_0_nios2_oci_xbrk
    (
      .D_valid         (D_valid),
      .E_valid         (E_valid),
      .F_pc            (F_pc),
      .clk             (clk),
      .reset_n         (reset_n),
      .trigger_state_0 (trigger_state_0),
      .trigger_state_1 (trigger_state_1),
      .xbrk_break      (xbrk_break),
      .xbrk_ctrl0      (xbrk_ctrl0),
      .xbrk_ctrl1      (xbrk_ctrl1),
      .xbrk_ctrl2      (xbrk_ctrl2),
      .xbrk_ctrl3      (xbrk_ctrl3),
      .xbrk_goto0      (xbrk_goto0),
      .xbrk_goto1      (xbrk_goto1),
      .xbrk_traceoff   (xbrk_traceoff),
      .xbrk_traceon    (xbrk_traceon),
      .xbrk_trigout    (xbrk_trigout)
    );

  cpu_0_nios2_oci_dbrk the_cpu_0_nios2_oci_dbrk
    (
      .E_st_data                   (E_st_data),
      .av_ld_data_aligned_filtered (av_ld_data_aligned_filtered),
      .clk                         (clk),
      .cpu_d_address               (cpu_d_address),
      .cpu_d_read                  (cpu_d_read),
      .cpu_d_readdata              (cpu_d_readdata),
      .cpu_d_wait                  (cpu_d_wait),
      .cpu_d_write                 (cpu_d_write),
      .cpu_d_writedata             (cpu_d_writedata),
      .d_address                   (d_address),
      .d_read                      (d_read),
      .d_waitrequest               (d_waitrequest),
      .d_write                     (d_write),
      .dbrk_break                  (dbrk_break),
      .dbrk_goto0                  (dbrk_goto0),
      .dbrk_goto1                  (dbrk_goto1),
      .dbrk_traceme                (dbrk_traceme),
      .dbrk_traceoff               (dbrk_traceoff),
      .dbrk_traceon                (dbrk_traceon),
      .dbrk_trigout                (dbrk_trigout),
      .debugack                    (debugack),
      .reset_n                     (reset_n)
    );

  cpu_0_nios2_oci_itrace the_cpu_0_nios2_oci_itrace
    (
      .clk                   (clk),
      .dbrk_traceoff         (dbrk_traceoff),
      .dbrk_traceon          (dbrk_traceon),
      .dct_buffer            (dct_buffer),
      .dct_count             (dct_count),
      .itm                   (itm),
      .jdo                   (jdo),
      .jrst_n                (jrst_n),
      .take_action_tracectrl (take_action_tracectrl),
      .trc_ctrl              (trc_ctrl),
      .trc_enb               (trc_enb),
      .trc_on                (trc_on),
      .xbrk_traceoff         (xbrk_traceoff),
      .xbrk_traceon          (xbrk_traceon),
      .xbrk_wrap_traceoff    (xbrk_wrap_traceoff)
    );

  cpu_0_nios2_oci_dtrace the_cpu_0_nios2_oci_dtrace
    (
      .atm             (atm),
      .clk             (clk),
      .cpu_d_address   (cpu_d_address),
      .cpu_d_read      (cpu_d_read),
      .cpu_d_readdata  (cpu_d_readdata),
      .cpu_d_wait      (cpu_d_wait),
      .cpu_d_write     (cpu_d_write),
      .cpu_d_writedata (cpu_d_writedata),
      .dtm             (dtm),
      .jrst_n          (jrst_n),
      .trc_ctrl        (trc_ctrl)
    );

  cpu_0_nios2_oci_fifo the_cpu_0_nios2_oci_fifo
    (
      .atm            (atm),
      .clk            (clk),
      .dbrk_traceme   (dbrk_traceme),
      .dbrk_traceoff  (dbrk_traceoff),
      .dbrk_traceon   (dbrk_traceon),
      .dct_buffer     (dct_buffer),
      .dct_count      (dct_count),
      .dtm            (dtm),
      .itm            (itm),
      .jrst_n         (jrst_n),
      .reset_n        (reset_n),
      .test_ending    (test_ending),
      .test_has_ended (test_has_ended),
      .trc_on         (trc_on),
      .tw             (tw)
    );

  cpu_0_nios2_oci_pib the_cpu_0_nios2_oci_pib
    (
      .clk     (clk),
      .clkx2   (clkx2),
      .jrst_n  (jrst_n),
      .tr_clk  (tr_clk),
      .tr_data (tr_data),
      .tw      (tw)
    );

  cpu_0_nios2_oci_im the_cpu_0_nios2_oci_im
    (
      .clk                       (clk),
      .jdo                       (jdo),
      .jrst_n                    (jrst_n),
      .reset_n                   (reset_n),
      .take_action_tracectrl     (take_action_tracectrl),
      .take_action_tracemem_a    (take_action_tracemem_a),
      .take_action_tracemem_b    (take_action_tracemem_b),
      .take_no_action_tracemem_a (take_no_action_tracemem_a),
      .tracemem_on               (tracemem_on),
      .tracemem_trcdata          (tracemem_trcdata),
      .tracemem_tw               (tracemem_tw),
      .trc_ctrl                  (trc_ctrl),
      .trc_enb                   (trc_enb),
      .trc_im_addr               (trc_im_addr),
      .trc_wrap                  (trc_wrap),
      .tw                        (tw),
      .xbrk_wrap_traceoff        (xbrk_wrap_traceoff)
    );

  assign trigout = dbrk_trigout | xbrk_trigout;
  assign readdata = address[8] ? oci_reg_readdata : oci_ram_readdata;
  assign jtag_debug_module_debugaccess_to_roms = debugack;
  cpu_0_jtag_debug_module_wrapper the_cpu_0_jtag_debug_module_wrapper
    (
      .MonDReg                   (MonDReg),
      .break_readreg             (break_readreg),
      .clk                       (clk),
      .dbrk_hit0_latch           (dbrk_hit0_latch),
      .dbrk_hit1_latch           (dbrk_hit1_latch),
      .dbrk_hit2_latch           (dbrk_hit2_latch),
      .dbrk_hit3_latch           (dbrk_hit3_latch),
      .debugack                  (debugack),
      .jdo                       (jdo),
      .jrst_n                    (jrst_n),
      .monitor_error             (monitor_error),
      .monitor_ready             (monitor_ready),
      .reset_n                   (reset_n),
      .resetlatch                (resetlatch),
      .st_ready_test_idle        (st_ready_test_idle),
      .take_action_break_a       (take_action_break_a),
      .take_action_break_b       (take_action_break_b),
      .take_action_break_c       (take_action_break_c),
      .take_action_ocimem_a      (take_action_ocimem_a),
      .take_action_ocimem_b      (take_action_ocimem_b),
      .take_action_tracectrl     (take_action_tracectrl),
      .take_action_tracemem_a    (take_action_tracemem_a),
      .take_action_tracemem_b    (take_action_tracemem_b),
      .take_no_action_break_a    (take_no_action_break_a),
      .take_no_action_break_b    (take_no_action_break_b),
      .take_no_action_break_c    (take_no_action_break_c),
      .take_no_action_ocimem_a   (take_no_action_ocimem_a),
      .take_no_action_tracemem_a (take_no_action_tracemem_a),
      .tracemem_on               (tracemem_on),
      .tracemem_trcdata          (tracemem_trcdata),
      .tracemem_tw               (tracemem_tw),
      .trc_im_addr               (trc_im_addr),
      .trc_on                    (trc_on),
      .trc_wrap                  (trc_wrap),
      .trigbrktype               (trigbrktype),
      .trigger_state_1           (trigger_state_1)
    );

  //dummy sink, which is an e_mux
  assign dummy_sink = tr_clk |
    tr_data |
    trigout |
    debugack;

  assign debugreq = 0;
  assign clkx2 = 0;

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0 (
               // inputs:
                clk,
                d_irq,
                d_readdata,
                d_waitrequest,
                i_readdata,
                i_waitrequest,
                jtag_debug_module_address,
                jtag_debug_module_begintransfer,
                jtag_debug_module_byteenable,
                jtag_debug_module_debugaccess,
                jtag_debug_module_select,
                jtag_debug_module_write,
                jtag_debug_module_writedata,
                reset_n,

               // outputs:
                d_address,
                d_byteenable,
                d_read,
                d_write,
                d_writedata,
                i_address,
                i_read,
                jtag_debug_module_debugaccess_to_roms,
                jtag_debug_module_readdata,
                jtag_debug_module_resetrequest
             )
;

  output  [ 16: 0] d_address;
  output  [  3: 0] d_byteenable;
  output           d_read;
  output           d_write;
  output  [ 31: 0] d_writedata;
  output  [ 16: 0] i_address;
  output           i_read;
  output           jtag_debug_module_debugaccess_to_roms;
  output  [ 31: 0] jtag_debug_module_readdata;
  output           jtag_debug_module_resetrequest;
  input            clk;
  input   [ 31: 0] d_irq;
  input   [ 31: 0] d_readdata;
  input            d_waitrequest;
  input   [ 31: 0] i_readdata;
  input            i_waitrequest;
  input   [  8: 0] jtag_debug_module_address;
  input            jtag_debug_module_begintransfer;
  input   [  3: 0] jtag_debug_module_byteenable;
  input            jtag_debug_module_debugaccess;
  input            jtag_debug_module_select;
  input            jtag_debug_module_write;
  input   [ 31: 0] jtag_debug_module_writedata;
  input            reset_n;

  wire    [  1: 0] D_compare_op;
  wire             D_ctrl_alu_force_xor;
  wire             D_ctrl_alu_signed_comparison;
  wire             D_ctrl_alu_subtract;
  wire             D_ctrl_b_is_dst;
  wire             D_ctrl_br;
  wire             D_ctrl_br_cmp;
  wire             D_ctrl_br_uncond;
  wire             D_ctrl_break;
  wire             D_ctrl_crst;
  wire             D_ctrl_custom;
  wire             D_ctrl_custom_multi;
  wire             D_ctrl_exception;
  wire             D_ctrl_force_src2_zero;
  wire             D_ctrl_hi_imm16;
  wire             D_ctrl_ignore_dst_or_ld;
  wire             D_ctrl_implicit_dst_eretaddr;
  wire             D_ctrl_implicit_dst_retaddr;
  wire             D_ctrl_jmp_direct;
  wire             D_ctrl_jmp_indirect;
  wire             D_ctrl_ld;
  wire             D_ctrl_ld_io;
  wire             D_ctrl_ld_non_io;
  wire             D_ctrl_ld_signed;
  wire             D_ctrl_logic;
  wire             D_ctrl_rdctl_inst;
  wire             D_ctrl_retaddr;
  wire             D_ctrl_rot_right;
  wire             D_ctrl_shift_logical;
  wire             D_ctrl_shift_right_arith;
  wire             D_ctrl_shift_rot;
  wire             D_ctrl_shift_rot_right;
  wire             D_ctrl_src2_choose_imm;
  wire             D_ctrl_st;
  wire             D_ctrl_uncond_cti_non_br;
  wire             D_ctrl_unsigned_lo_imm16;
  wire             D_ctrl_wrctl_inst;
  wire    [  4: 0] D_dst_regnum;
  wire    [ 55: 0] D_inst;
  reg     [ 31: 0] D_iw /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire    [  4: 0] D_iw_a;
  wire    [  4: 0] D_iw_b;
  wire    [  4: 0] D_iw_c;
  wire    [  2: 0] D_iw_control_regnum;
  wire    [  7: 0] D_iw_custom_n;
  wire             D_iw_custom_readra;
  wire             D_iw_custom_readrb;
  wire             D_iw_custom_writerc;
  wire    [ 15: 0] D_iw_imm16;
  wire    [ 25: 0] D_iw_imm26;
  wire    [  4: 0] D_iw_imm5;
  wire    [  1: 0] D_iw_memsz;
  wire    [  5: 0] D_iw_op;
  wire    [  5: 0] D_iw_opx;
  wire    [  4: 0] D_iw_shift_imm5;
  wire    [  4: 0] D_iw_trap_break_imm5;
  wire    [ 14: 0] D_jmp_direct_target_waddr;
  wire    [  1: 0] D_logic_op;
  wire    [  1: 0] D_logic_op_raw;
  wire             D_mem16;
  wire             D_mem32;
  wire             D_mem8;
  wire             D_op_add;
  wire             D_op_addi;
  wire             D_op_and;
  wire             D_op_andhi;
  wire             D_op_andi;
  wire             D_op_beq;
  wire             D_op_bge;
  wire             D_op_bgeu;
  wire             D_op_blt;
  wire             D_op_bltu;
  wire             D_op_bne;
  wire             D_op_br;
  wire             D_op_break;
  wire             D_op_bret;
  wire             D_op_call;
  wire             D_op_callr;
  wire             D_op_cmpeq;
  wire             D_op_cmpeqi;
  wire             D_op_cmpge;
  wire             D_op_cmpgei;
  wire             D_op_cmpgeu;
  wire             D_op_cmpgeui;
  wire             D_op_cmplt;
  wire             D_op_cmplti;
  wire             D_op_cmpltu;
  wire             D_op_cmpltui;
  wire             D_op_cmpne;
  wire             D_op_cmpnei;
  wire             D_op_crst;
  wire             D_op_custom;
  wire             D_op_div;
  wire             D_op_divu;
  wire             D_op_eret;
  wire             D_op_flushd;
  wire             D_op_flushda;
  wire             D_op_flushi;
  wire             D_op_flushp;
  wire             D_op_hbreak;
  wire             D_op_initd;
  wire             D_op_initda;
  wire             D_op_initi;
  wire             D_op_intr;
  wire             D_op_jmp;
  wire             D_op_jmpi;
  wire             D_op_ldb;
  wire             D_op_ldbio;
  wire             D_op_ldbu;
  wire             D_op_ldbuio;
  wire             D_op_ldh;
  wire             D_op_ldhio;
  wire             D_op_ldhu;
  wire             D_op_ldhuio;
  wire             D_op_ldl;
  wire             D_op_ldw;
  wire             D_op_ldwio;
  wire             D_op_mul;
  wire             D_op_muli;
  wire             D_op_mulxss;
  wire             D_op_mulxsu;
  wire             D_op_mulxuu;
  wire             D_op_nextpc;
  wire             D_op_nor;
  wire             D_op_opx;
  wire             D_op_or;
  wire             D_op_orhi;
  wire             D_op_ori;
  wire             D_op_rdctl;
  wire             D_op_rdprs;
  wire             D_op_ret;
  wire             D_op_rol;
  wire             D_op_roli;
  wire             D_op_ror;
  wire             D_op_rsv02;
  wire             D_op_rsv09;
  wire             D_op_rsv10;
  wire             D_op_rsv17;
  wire             D_op_rsv18;
  wire             D_op_rsv25;
  wire             D_op_rsv26;
  wire             D_op_rsv33;
  wire             D_op_rsv34;
  wire             D_op_rsv41;
  wire             D_op_rsv42;
  wire             D_op_rsv49;
  wire             D_op_rsv57;
  wire             D_op_rsv61;
  wire             D_op_rsv62;
  wire             D_op_rsv63;
  wire             D_op_rsvx00;
  wire             D_op_rsvx10;
  wire             D_op_rsvx15;
  wire             D_op_rsvx17;
  wire             D_op_rsvx21;
  wire             D_op_rsvx25;
  wire             D_op_rsvx33;
  wire             D_op_rsvx34;
  wire             D_op_rsvx35;
  wire             D_op_rsvx42;
  wire             D_op_rsvx43;
  wire             D_op_rsvx44;
  wire             D_op_rsvx47;
  wire             D_op_rsvx50;
  wire             D_op_rsvx51;
  wire             D_op_rsvx55;
  wire             D_op_rsvx56;
  wire             D_op_rsvx60;
  wire             D_op_rsvx63;
  wire             D_op_sll;
  wire             D_op_slli;
  wire             D_op_sra;
  wire             D_op_srai;
  wire             D_op_srl;
  wire             D_op_srli;
  wire             D_op_stb;
  wire             D_op_stbio;
  wire             D_op_stc;
  wire             D_op_sth;
  wire             D_op_sthio;
  wire             D_op_stw;
  wire             D_op_stwio;
  wire             D_op_sub;
  wire             D_op_sync;
  wire             D_op_trap;
  wire             D_op_wrctl;
  wire             D_op_wrprs;
  wire             D_op_xor;
  wire             D_op_xorhi;
  wire             D_op_xori;
  reg              D_valid;
  wire    [ 55: 0] D_vinst;
  wire             D_wr_dst_reg;
  wire    [ 31: 0] E_alu_result;
  reg              E_alu_sub;
  wire    [ 32: 0] E_arith_result;
  wire    [ 31: 0] E_arith_src1;
  wire    [ 31: 0] E_arith_src2;
  wire             E_ci_multi_stall;
  wire    [ 31: 0] E_ci_result;
  wire             E_cmp_result;
  wire    [ 31: 0] E_control_rd_data;
  wire             E_eq;
  reg              E_invert_arith_src_msb;
  wire             E_ld_stall;
  wire    [ 31: 0] E_logic_result;
  wire             E_logic_result_is_0;
  wire             E_lt;
  wire    [ 16: 0] E_mem_baddr;
  wire    [  3: 0] E_mem_byte_en;
  reg              E_new_inst;
  reg     [  4: 0] E_shift_rot_cnt;
  wire    [  4: 0] E_shift_rot_cnt_nxt;
  wire             E_shift_rot_done;
  wire             E_shift_rot_fill_bit;
  reg     [ 31: 0] E_shift_rot_result;
  wire    [ 31: 0] E_shift_rot_result_nxt;
  wire             E_shift_rot_stall;
  reg     [ 31: 0] E_src1;
  reg     [ 31: 0] E_src2;
  wire    [ 31: 0] E_st_data;
  wire             E_st_stall;
  wire             E_stall;
  reg              E_valid;
  wire    [ 55: 0] E_vinst;
  wire             E_wrctl_bstatus;
  wire             E_wrctl_estatus;
  wire             E_wrctl_ienable;
  wire             E_wrctl_status;
  wire    [ 31: 0] F_av_iw;
  wire    [  4: 0] F_av_iw_a;
  wire    [  4: 0] F_av_iw_b;
  wire    [  4: 0] F_av_iw_c;
  wire    [  2: 0] F_av_iw_control_regnum;
  wire    [  7: 0] F_av_iw_custom_n;
  wire             F_av_iw_custom_readra;
  wire             F_av_iw_custom_readrb;
  wire             F_av_iw_custom_writerc;
  wire    [ 15: 0] F_av_iw_imm16;
  wire    [ 25: 0] F_av_iw_imm26;
  wire    [  4: 0] F_av_iw_imm5;
  wire    [  1: 0] F_av_iw_memsz;
  wire    [  5: 0] F_av_iw_op;
  wire    [  5: 0] F_av_iw_opx;
  wire    [  4: 0] F_av_iw_shift_imm5;
  wire    [  4: 0] F_av_iw_trap_break_imm5;
  wire             F_av_mem16;
  wire             F_av_mem32;
  wire             F_av_mem8;
  wire    [ 55: 0] F_inst;
  wire    [ 31: 0] F_iw;
  wire    [  4: 0] F_iw_a;
  wire    [  4: 0] F_iw_b;
  wire    [  4: 0] F_iw_c;
  wire    [  2: 0] F_iw_control_regnum;
  wire    [  7: 0] F_iw_custom_n;
  wire             F_iw_custom_readra;
  wire             F_iw_custom_readrb;
  wire             F_iw_custom_writerc;
  wire    [ 15: 0] F_iw_imm16;
  wire    [ 25: 0] F_iw_imm26;
  wire    [  4: 0] F_iw_imm5;
  wire    [  1: 0] F_iw_memsz;
  wire    [  5: 0] F_iw_op;
  wire    [  5: 0] F_iw_opx;
  wire    [  4: 0] F_iw_shift_imm5;
  wire    [  4: 0] F_iw_trap_break_imm5;
  wire             F_mem16;
  wire             F_mem32;
  wire             F_mem8;
  wire             F_op_add;
  wire             F_op_addi;
  wire             F_op_and;
  wire             F_op_andhi;
  wire             F_op_andi;
  wire             F_op_beq;
  wire             F_op_bge;
  wire             F_op_bgeu;
  wire             F_op_blt;
  wire             F_op_bltu;
  wire             F_op_bne;
  wire             F_op_br;
  wire             F_op_break;
  wire             F_op_bret;
  wire             F_op_call;
  wire             F_op_callr;
  wire             F_op_cmpeq;
  wire             F_op_cmpeqi;
  wire             F_op_cmpge;
  wire             F_op_cmpgei;
  wire             F_op_cmpgeu;
  wire             F_op_cmpgeui;
  wire             F_op_cmplt;
  wire             F_op_cmplti;
  wire             F_op_cmpltu;
  wire             F_op_cmpltui;
  wire             F_op_cmpne;
  wire             F_op_cmpnei;
  wire             F_op_crst;
  wire             F_op_custom;
  wire             F_op_div;
  wire             F_op_divu;
  wire             F_op_eret;
  wire             F_op_flushd;
  wire             F_op_flushda;
  wire             F_op_flushi;
  wire             F_op_flushp;
  wire             F_op_hbreak;
  wire             F_op_initd;
  wire             F_op_initda;
  wire             F_op_initi;
  wire             F_op_intr;
  wire             F_op_jmp;
  wire             F_op_jmpi;
  wire             F_op_ldb;
  wire             F_op_ldbio;
  wire             F_op_ldbu;
  wire             F_op_ldbuio;
  wire             F_op_ldh;
  wire             F_op_ldhio;
  wire             F_op_ldhu;
  wire             F_op_ldhuio;
  wire             F_op_ldl;
  wire             F_op_ldw;
  wire             F_op_ldwio;
  wire             F_op_mul;
  wire             F_op_muli;
  wire             F_op_mulxss;
  wire             F_op_mulxsu;
  wire             F_op_mulxuu;
  wire             F_op_nextpc;
  wire             F_op_nor;
  wire             F_op_opx;
  wire             F_op_or;
  wire             F_op_orhi;
  wire             F_op_ori;
  wire             F_op_rdctl;
  wire             F_op_rdprs;
  wire             F_op_ret;
  wire             F_op_rol;
  wire             F_op_roli;
  wire             F_op_ror;
  wire             F_op_rsv02;
  wire             F_op_rsv09;
  wire             F_op_rsv10;
  wire             F_op_rsv17;
  wire             F_op_rsv18;
  wire             F_op_rsv25;
  wire             F_op_rsv26;
  wire             F_op_rsv33;
  wire             F_op_rsv34;
  wire             F_op_rsv41;
  wire             F_op_rsv42;
  wire             F_op_rsv49;
  wire             F_op_rsv57;
  wire             F_op_rsv61;
  wire             F_op_rsv62;
  wire             F_op_rsv63;
  wire             F_op_rsvx00;
  wire             F_op_rsvx10;
  wire             F_op_rsvx15;
  wire             F_op_rsvx17;
  wire             F_op_rsvx21;
  wire             F_op_rsvx25;
  wire             F_op_rsvx33;
  wire             F_op_rsvx34;
  wire             F_op_rsvx35;
  wire             F_op_rsvx42;
  wire             F_op_rsvx43;
  wire             F_op_rsvx44;
  wire             F_op_rsvx47;
  wire             F_op_rsvx50;
  wire             F_op_rsvx51;
  wire             F_op_rsvx55;
  wire             F_op_rsvx56;
  wire             F_op_rsvx60;
  wire             F_op_rsvx63;
  wire             F_op_sll;
  wire             F_op_slli;
  wire             F_op_sra;
  wire             F_op_srai;
  wire             F_op_srl;
  wire             F_op_srli;
  wire             F_op_stb;
  wire             F_op_stbio;
  wire             F_op_stc;
  wire             F_op_sth;
  wire             F_op_sthio;
  wire             F_op_stw;
  wire             F_op_stwio;
  wire             F_op_sub;
  wire             F_op_sync;
  wire             F_op_trap;
  wire             F_op_wrctl;
  wire             F_op_wrprs;
  wire             F_op_xor;
  wire             F_op_xorhi;
  wire             F_op_xori;
  reg     [ 14: 0] F_pc /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire             F_pc_en;
  wire    [ 14: 0] F_pc_no_crst_nxt;
  wire    [ 14: 0] F_pc_nxt;
  wire    [ 14: 0] F_pc_plus_one;
  wire    [  1: 0] F_pc_sel_nxt;
  wire    [ 16: 0] F_pcb;
  wire    [ 16: 0] F_pcb_nxt;
  wire    [ 16: 0] F_pcb_plus_four;
  wire             F_valid;
  wire    [ 55: 0] F_vinst;
  reg     [  1: 0] R_compare_op;
  reg              R_ctrl_alu_force_xor;
  wire             R_ctrl_alu_force_xor_nxt;
  reg              R_ctrl_alu_signed_comparison;
  wire             R_ctrl_alu_signed_comparison_nxt;
  reg              R_ctrl_alu_subtract;
  wire             R_ctrl_alu_subtract_nxt;
  reg              R_ctrl_b_is_dst;
  wire             R_ctrl_b_is_dst_nxt;
  reg              R_ctrl_br;
  reg              R_ctrl_br_cmp;
  wire             R_ctrl_br_cmp_nxt;
  wire             R_ctrl_br_nxt;
  reg              R_ctrl_br_uncond;
  wire             R_ctrl_br_uncond_nxt;
  reg              R_ctrl_break;
  wire             R_ctrl_break_nxt;
  reg              R_ctrl_crst;
  wire             R_ctrl_crst_nxt;
  reg              R_ctrl_custom;
  reg              R_ctrl_custom_multi;
  wire             R_ctrl_custom_multi_nxt;
  wire             R_ctrl_custom_nxt;
  reg              R_ctrl_exception;
  wire             R_ctrl_exception_nxt;
  reg              R_ctrl_force_src2_zero;
  wire             R_ctrl_force_src2_zero_nxt;
  reg              R_ctrl_hi_imm16;
  wire             R_ctrl_hi_imm16_nxt;
  reg              R_ctrl_ignore_dst_or_ld;
  wire             R_ctrl_ignore_dst_or_ld_nxt;
  reg              R_ctrl_implicit_dst_eretaddr;
  wire             R_ctrl_implicit_dst_eretaddr_nxt;
  reg              R_ctrl_implicit_dst_retaddr;
  wire             R_ctrl_implicit_dst_retaddr_nxt;
  reg              R_ctrl_jmp_direct;
  wire             R_ctrl_jmp_direct_nxt;
  reg              R_ctrl_jmp_indirect;
  wire             R_ctrl_jmp_indirect_nxt;
  reg              R_ctrl_ld;
  reg              R_ctrl_ld_io;
  wire             R_ctrl_ld_io_nxt;
  reg              R_ctrl_ld_non_io;
  wire             R_ctrl_ld_non_io_nxt;
  wire             R_ctrl_ld_nxt;
  reg              R_ctrl_ld_signed;
  wire             R_ctrl_ld_signed_nxt;
  reg              R_ctrl_logic;
  wire             R_ctrl_logic_nxt;
  reg              R_ctrl_rdctl_inst;
  wire             R_ctrl_rdctl_inst_nxt;
  reg              R_ctrl_retaddr;
  wire             R_ctrl_retaddr_nxt;
  reg              R_ctrl_rot_right;
  wire             R_ctrl_rot_right_nxt;
  reg              R_ctrl_shift_logical;
  wire             R_ctrl_shift_logical_nxt;
  reg              R_ctrl_shift_right_arith;
  wire             R_ctrl_shift_right_arith_nxt;
  reg              R_ctrl_shift_rot;
  wire             R_ctrl_shift_rot_nxt;
  reg              R_ctrl_shift_rot_right;
  wire             R_ctrl_shift_rot_right_nxt;
  reg              R_ctrl_src2_choose_imm;
  wire             R_ctrl_src2_choose_imm_nxt;
  reg              R_ctrl_st;
  wire             R_ctrl_st_nxt;
  reg              R_ctrl_uncond_cti_non_br;
  wire             R_ctrl_uncond_cti_non_br_nxt;
  reg              R_ctrl_unsigned_lo_imm16;
  wire             R_ctrl_unsigned_lo_imm16_nxt;
  reg              R_ctrl_wrctl_inst;
  wire             R_ctrl_wrctl_inst_nxt;
  reg     [  4: 0] R_dst_regnum /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire             R_en;
  reg     [  1: 0] R_logic_op;
  wire    [ 31: 0] R_rf_a;
  wire    [ 31: 0] R_rf_b;
  wire    [ 31: 0] R_src1;
  wire    [ 31: 0] R_src2;
  wire    [ 15: 0] R_src2_hi;
  wire    [ 15: 0] R_src2_lo;
  reg              R_src2_use_imm;
  wire    [  7: 0] R_stb_data;
  wire    [ 15: 0] R_sth_data;
  reg              R_valid;
  wire    [ 55: 0] R_vinst;
  reg              R_wr_dst_reg;
  reg     [ 31: 0] W_alu_result;
  wire             W_br_taken;
  reg              W_bstatus_reg;
  wire             W_bstatus_reg_inst_nxt;
  wire             W_bstatus_reg_nxt;
  reg              W_cmp_result;
  reg     [ 31: 0] W_control_rd_data;
  reg              W_estatus_reg;
  wire             W_estatus_reg_inst_nxt;
  wire             W_estatus_reg_nxt;
  reg     [ 31: 0] W_ienable_reg;
  wire    [ 31: 0] W_ienable_reg_nxt;
  reg     [ 31: 0] W_ipending_reg;
  wire    [ 31: 0] W_ipending_reg_nxt;
  wire    [ 16: 0] W_mem_baddr;
  wire             W_rf_wren_a;
  wire             W_status_reg;
  reg              W_status_reg_pie;
  wire             W_status_reg_pie_inst_nxt;
  wire             W_status_reg_pie_nxt;
  reg              W_valid /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire    [ 55: 0] W_vinst;
  wire    [ 31: 0] W_wr_data;
  wire    [ 31: 0] W_wr_data_non_zero;
  wire             av_fill_bit;
  reg     [  1: 0] av_ld_align_cycle;
  wire    [  1: 0] av_ld_align_cycle_nxt;
  wire             av_ld_align_one_more_cycle;
  reg              av_ld_aligning_data;
  wire             av_ld_aligning_data_nxt;
  reg     [  7: 0] av_ld_byte0_data;
  wire    [  7: 0] av_ld_byte0_data_nxt;
  reg     [  7: 0] av_ld_byte1_data;
  wire             av_ld_byte1_data_en;
  wire    [  7: 0] av_ld_byte1_data_nxt;
  reg     [  7: 0] av_ld_byte2_data;
  wire    [  7: 0] av_ld_byte2_data_nxt;
  reg     [  7: 0] av_ld_byte3_data;
  wire    [  7: 0] av_ld_byte3_data_nxt;
  wire    [ 31: 0] av_ld_data_aligned_filtered;
  wire    [ 31: 0] av_ld_data_aligned_unfiltered;
  wire             av_ld_done;
  wire             av_ld_extend;
  wire             av_ld_getting_data;
  wire             av_ld_rshift8;
  reg              av_ld_waiting_for_data;
  wire             av_ld_waiting_for_data_nxt;
  wire             av_sign_bit;
  wire    [ 16: 0] d_address;
  reg     [  3: 0] d_byteenable;
  reg              d_read;
  wire             d_read_nxt;
  wire             d_write;
  wire             d_write_nxt;
  reg     [ 31: 0] d_writedata;
  reg              hbreak_enabled;
  reg              hbreak_pending;
  wire             hbreak_pending_nxt;
  wire             hbreak_req;
  wire    [ 16: 0] i_address;
  reg              i_read;
  wire             i_read_nxt;
  wire    [ 31: 0] iactive;
  wire             intr_req;
  wire             jtag_debug_module_clk;
  wire             jtag_debug_module_debugaccess_to_roms;
  wire    [ 31: 0] jtag_debug_module_readdata;
  wire             jtag_debug_module_reset;
  wire             jtag_debug_module_resetrequest;
  wire             oci_hbreak_req;
  wire    [ 31: 0] oci_ienable;
  wire             oci_single_step_mode;
  wire             oci_tb_hbreak_req;
  wire             test_ending;
  wire             test_has_ended;
  reg              wait_for_one_post_bret_inst;
  //the_cpu_0_test_bench, which is an e_instance
  cpu_0_test_bench the_cpu_0_test_bench
    (
      .D_iw                          (D_iw),
      .D_iw_op                       (D_iw_op),
      .D_iw_opx                      (D_iw_opx),
      .D_valid                       (D_valid),
      .E_alu_result                  (E_alu_result),
      .E_mem_byte_en                 (E_mem_byte_en),
      .E_st_data                     (E_st_data),
      .E_valid                       (E_valid),
      .F_pcb                         (F_pcb),
      .F_valid                       (F_valid),
      .R_ctrl_exception              (R_ctrl_exception),
      .R_ctrl_ld                     (R_ctrl_ld),
      .R_ctrl_ld_non_io              (R_ctrl_ld_non_io),
      .R_dst_regnum                  (R_dst_regnum),
      .R_wr_dst_reg                  (R_wr_dst_reg),
      .W_bstatus_reg                 (W_bstatus_reg),
      .W_cmp_result                  (W_cmp_result),
      .W_estatus_reg                 (W_estatus_reg),
      .W_ienable_reg                 (W_ienable_reg),
      .W_ipending_reg                (W_ipending_reg),
      .W_mem_baddr                   (W_mem_baddr),
      .W_status_reg                  (W_status_reg),
      .W_valid                       (W_valid),
      .W_vinst                       (W_vinst),
      .W_wr_data                     (W_wr_data),
      .av_ld_data_aligned_filtered   (av_ld_data_aligned_filtered),
      .av_ld_data_aligned_unfiltered (av_ld_data_aligned_unfiltered),
      .clk                           (clk),
      .d_address                     (d_address),
      .d_byteenable                  (d_byteenable),
      .d_read                        (d_read),
      .d_write                       (d_write),
      .d_write_nxt                   (d_write_nxt),
      .i_address                     (i_address),
      .i_read                        (i_read),
      .i_readdata                    (i_readdata),
      .i_waitrequest                 (i_waitrequest),
      .reset_n                       (reset_n),
      .test_has_ended                (test_has_ended)
    );

  assign F_av_iw_a = F_av_iw[31 : 27];
  assign F_av_iw_b = F_av_iw[26 : 22];
  assign F_av_iw_c = F_av_iw[21 : 17];
  assign F_av_iw_custom_n = F_av_iw[13 : 6];
  assign F_av_iw_custom_readra = F_av_iw[16];
  assign F_av_iw_custom_readrb = F_av_iw[15];
  assign F_av_iw_custom_writerc = F_av_iw[14];
  assign F_av_iw_opx = F_av_iw[16 : 11];
  assign F_av_iw_op = F_av_iw[5 : 0];
  assign F_av_iw_shift_imm5 = F_av_iw[10 : 6];
  assign F_av_iw_trap_break_imm5 = F_av_iw[10 : 6];
  assign F_av_iw_imm5 = F_av_iw[10 : 6];
  assign F_av_iw_imm16 = F_av_iw[21 : 6];
  assign F_av_iw_imm26 = F_av_iw[31 : 6];
  assign F_av_iw_memsz = F_av_iw[4 : 3];
  assign F_av_iw_control_regnum = F_av_iw[8 : 6];
  assign F_av_mem8 = F_av_iw_memsz == 2'b00;
  assign F_av_mem16 = F_av_iw_memsz == 2'b01;
  assign F_av_mem32 = F_av_iw_memsz[1] == 1'b1;
  assign F_iw_a = F_iw[31 : 27];
  assign F_iw_b = F_iw[26 : 22];
  assign F_iw_c = F_iw[21 : 17];
  assign F_iw_custom_n = F_iw[13 : 6];
  assign F_iw_custom_readra = F_iw[16];
  assign F_iw_custom_readrb = F_iw[15];
  assign F_iw_custom_writerc = F_iw[14];
  assign F_iw_opx = F_iw[16 : 11];
  assign F_iw_op = F_iw[5 : 0];
  assign F_iw_shift_imm5 = F_iw[10 : 6];
  assign F_iw_trap_break_imm5 = F_iw[10 : 6];
  assign F_iw_imm5 = F_iw[10 : 6];
  assign F_iw_imm16 = F_iw[21 : 6];
  assign F_iw_imm26 = F_iw[31 : 6];
  assign F_iw_memsz = F_iw[4 : 3];
  assign F_iw_control_regnum = F_iw[8 : 6];
  assign F_mem8 = F_iw_memsz == 2'b00;
  assign F_mem16 = F_iw_memsz == 2'b01;
  assign F_mem32 = F_iw_memsz[1] == 1'b1;
  assign D_iw_a = D_iw[31 : 27];
  assign D_iw_b = D_iw[26 : 22];
  assign D_iw_c = D_iw[21 : 17];
  assign D_iw_custom_n = D_iw[13 : 6];
  assign D_iw_custom_readra = D_iw[16];
  assign D_iw_custom_readrb = D_iw[15];
  assign D_iw_custom_writerc = D_iw[14];
  assign D_iw_opx = D_iw[16 : 11];
  assign D_iw_op = D_iw[5 : 0];
  assign D_iw_shift_imm5 = D_iw[10 : 6];
  assign D_iw_trap_break_imm5 = D_iw[10 : 6];
  assign D_iw_imm5 = D_iw[10 : 6];
  assign D_iw_imm16 = D_iw[21 : 6];
  assign D_iw_imm26 = D_iw[31 : 6];
  assign D_iw_memsz = D_iw[4 : 3];
  assign D_iw_control_regnum = D_iw[8 : 6];
  assign D_mem8 = D_iw_memsz == 2'b00;
  assign D_mem16 = D_iw_memsz == 2'b01;
  assign D_mem32 = D_iw_memsz[1] == 1'b1;
  assign F_op_call = F_iw_op == 0;
  assign F_op_jmpi = F_iw_op == 1;
  assign F_op_ldbu = F_iw_op == 3;
  assign F_op_addi = F_iw_op == 4;
  assign F_op_stb = F_iw_op == 5;
  assign F_op_br = F_iw_op == 6;
  assign F_op_ldb = F_iw_op == 7;
  assign F_op_cmpgei = F_iw_op == 8;
  assign F_op_ldhu = F_iw_op == 11;
  assign F_op_andi = F_iw_op == 12;
  assign F_op_sth = F_iw_op == 13;
  assign F_op_bge = F_iw_op == 14;
  assign F_op_ldh = F_iw_op == 15;
  assign F_op_cmplti = F_iw_op == 16;
  assign F_op_initda = F_iw_op == 19;
  assign F_op_ori = F_iw_op == 20;
  assign F_op_stw = F_iw_op == 21;
  assign F_op_blt = F_iw_op == 22;
  assign F_op_ldw = F_iw_op == 23;
  assign F_op_cmpnei = F_iw_op == 24;
  assign F_op_flushda = F_iw_op == 27;
  assign F_op_xori = F_iw_op == 28;
  assign F_op_stc = F_iw_op == 29;
  assign F_op_bne = F_iw_op == 30;
  assign F_op_ldl = F_iw_op == 31;
  assign F_op_cmpeqi = F_iw_op == 32;
  assign F_op_ldbuio = F_iw_op == 35;
  assign F_op_muli = F_iw_op == 36;
  assign F_op_stbio = F_iw_op == 37;
  assign F_op_beq = F_iw_op == 38;
  assign F_op_ldbio = F_iw_op == 39;
  assign F_op_cmpgeui = F_iw_op == 40;
  assign F_op_ldhuio = F_iw_op == 43;
  assign F_op_andhi = F_iw_op == 44;
  assign F_op_sthio = F_iw_op == 45;
  assign F_op_bgeu = F_iw_op == 46;
  assign F_op_ldhio = F_iw_op == 47;
  assign F_op_cmpltui = F_iw_op == 48;
  assign F_op_initd = F_iw_op == 51;
  assign F_op_orhi = F_iw_op == 52;
  assign F_op_stwio = F_iw_op == 53;
  assign F_op_bltu = F_iw_op == 54;
  assign F_op_ldwio = F_iw_op == 55;
  assign F_op_rdprs = F_iw_op == 56;
  assign F_op_flushd = F_iw_op == 59;
  assign F_op_xorhi = F_iw_op == 60;
  assign F_op_rsv02 = F_iw_op == 2;
  assign F_op_rsv09 = F_iw_op == 9;
  assign F_op_rsv10 = F_iw_op == 10;
  assign F_op_rsv17 = F_iw_op == 17;
  assign F_op_rsv18 = F_iw_op == 18;
  assign F_op_rsv25 = F_iw_op == 25;
  assign F_op_rsv26 = F_iw_op == 26;
  assign F_op_rsv33 = F_iw_op == 33;
  assign F_op_rsv34 = F_iw_op == 34;
  assign F_op_rsv41 = F_iw_op == 41;
  assign F_op_rsv42 = F_iw_op == 42;
  assign F_op_rsv49 = F_iw_op == 49;
  assign F_op_rsv57 = F_iw_op == 57;
  assign F_op_rsv61 = F_iw_op == 61;
  assign F_op_rsv62 = F_iw_op == 62;
  assign F_op_rsv63 = F_iw_op == 63;
  assign F_op_eret = F_op_opx & (F_iw_opx == 1);
  assign F_op_roli = F_op_opx & (F_iw_opx == 2);
  assign F_op_rol = F_op_opx & (F_iw_opx == 3);
  assign F_op_flushp = F_op_opx & (F_iw_opx == 4);
  assign F_op_ret = F_op_opx & (F_iw_opx == 5);
  assign F_op_nor = F_op_opx & (F_iw_opx == 6);
  assign F_op_mulxuu = F_op_opx & (F_iw_opx == 7);
  assign F_op_cmpge = F_op_opx & (F_iw_opx == 8);
  assign F_op_bret = F_op_opx & (F_iw_opx == 9);
  assign F_op_ror = F_op_opx & (F_iw_opx == 11);
  assign F_op_flushi = F_op_opx & (F_iw_opx == 12);
  assign F_op_jmp = F_op_opx & (F_iw_opx == 13);
  assign F_op_and = F_op_opx & (F_iw_opx == 14);
  assign F_op_cmplt = F_op_opx & (F_iw_opx == 16);
  assign F_op_slli = F_op_opx & (F_iw_opx == 18);
  assign F_op_sll = F_op_opx & (F_iw_opx == 19);
  assign F_op_wrprs = F_op_opx & (F_iw_opx == 20);
  assign F_op_or = F_op_opx & (F_iw_opx == 22);
  assign F_op_mulxsu = F_op_opx & (F_iw_opx == 23);
  assign F_op_cmpne = F_op_opx & (F_iw_opx == 24);
  assign F_op_srli = F_op_opx & (F_iw_opx == 26);
  assign F_op_srl = F_op_opx & (F_iw_opx == 27);
  assign F_op_nextpc = F_op_opx & (F_iw_opx == 28);
  assign F_op_callr = F_op_opx & (F_iw_opx == 29);
  assign F_op_xor = F_op_opx & (F_iw_opx == 30);
  assign F_op_mulxss = F_op_opx & (F_iw_opx == 31);
  assign F_op_cmpeq = F_op_opx & (F_iw_opx == 32);
  assign F_op_divu = F_op_opx & (F_iw_opx == 36);
  assign F_op_div = F_op_opx & (F_iw_opx == 37);
  assign F_op_rdctl = F_op_opx & (F_iw_opx == 38);
  assign F_op_mul = F_op_opx & (F_iw_opx == 39);
  assign F_op_cmpgeu = F_op_opx & (F_iw_opx == 40);
  assign F_op_initi = F_op_opx & (F_iw_opx == 41);
  assign F_op_trap = F_op_opx & (F_iw_opx == 45);
  assign F_op_wrctl = F_op_opx & (F_iw_opx == 46);
  assign F_op_cmpltu = F_op_opx & (F_iw_opx == 48);
  assign F_op_add = F_op_opx & (F_iw_opx == 49);
  assign F_op_break = F_op_opx & (F_iw_opx == 52);
  assign F_op_hbreak = F_op_opx & (F_iw_opx == 53);
  assign F_op_sync = F_op_opx & (F_iw_opx == 54);
  assign F_op_sub = F_op_opx & (F_iw_opx == 57);
  assign F_op_srai = F_op_opx & (F_iw_opx == 58);
  assign F_op_sra = F_op_opx & (F_iw_opx == 59);
  assign F_op_intr = F_op_opx & (F_iw_opx == 61);
  assign F_op_crst = F_op_opx & (F_iw_opx == 62);
  assign F_op_rsvx00 = F_op_opx & (F_iw_opx == 0);
  assign F_op_rsvx10 = F_op_opx & (F_iw_opx == 10);
  assign F_op_rsvx15 = F_op_opx & (F_iw_opx == 15);
  assign F_op_rsvx17 = F_op_opx & (F_iw_opx == 17);
  assign F_op_rsvx21 = F_op_opx & (F_iw_opx == 21);
  assign F_op_rsvx25 = F_op_opx & (F_iw_opx == 25);
  assign F_op_rsvx33 = F_op_opx & (F_iw_opx == 33);
  assign F_op_rsvx34 = F_op_opx & (F_iw_opx == 34);
  assign F_op_rsvx35 = F_op_opx & (F_iw_opx == 35);
  assign F_op_rsvx42 = F_op_opx & (F_iw_opx == 42);
  assign F_op_rsvx43 = F_op_opx & (F_iw_opx == 43);
  assign F_op_rsvx44 = F_op_opx & (F_iw_opx == 44);
  assign F_op_rsvx47 = F_op_opx & (F_iw_opx == 47);
  assign F_op_rsvx50 = F_op_opx & (F_iw_opx == 50);
  assign F_op_rsvx51 = F_op_opx & (F_iw_opx == 51);
  assign F_op_rsvx55 = F_op_opx & (F_iw_opx == 55);
  assign F_op_rsvx56 = F_op_opx & (F_iw_opx == 56);
  assign F_op_rsvx60 = F_op_opx & (F_iw_opx == 60);
  assign F_op_rsvx63 = F_op_opx & (F_iw_opx == 63);
  assign F_op_opx = F_iw_op == 58;
  assign F_op_custom = F_iw_op == 50;
  assign D_op_call = D_iw_op == 0;
  assign D_op_jmpi = D_iw_op == 1;
  assign D_op_ldbu = D_iw_op == 3;
  assign D_op_addi = D_iw_op == 4;
  assign D_op_stb = D_iw_op == 5;
  assign D_op_br = D_iw_op == 6;
  assign D_op_ldb = D_iw_op == 7;
  assign D_op_cmpgei = D_iw_op == 8;
  assign D_op_ldhu = D_iw_op == 11;
  assign D_op_andi = D_iw_op == 12;
  assign D_op_sth = D_iw_op == 13;
  assign D_op_bge = D_iw_op == 14;
  assign D_op_ldh = D_iw_op == 15;
  assign D_op_cmplti = D_iw_op == 16;
  assign D_op_initda = D_iw_op == 19;
  assign D_op_ori = D_iw_op == 20;
  assign D_op_stw = D_iw_op == 21;
  assign D_op_blt = D_iw_op == 22;
  assign D_op_ldw = D_iw_op == 23;
  assign D_op_cmpnei = D_iw_op == 24;
  assign D_op_flushda = D_iw_op == 27;
  assign D_op_xori = D_iw_op == 28;
  assign D_op_stc = D_iw_op == 29;
  assign D_op_bne = D_iw_op == 30;
  assign D_op_ldl = D_iw_op == 31;
  assign D_op_cmpeqi = D_iw_op == 32;
  assign D_op_ldbuio = D_iw_op == 35;
  assign D_op_muli = D_iw_op == 36;
  assign D_op_stbio = D_iw_op == 37;
  assign D_op_beq = D_iw_op == 38;
  assign D_op_ldbio = D_iw_op == 39;
  assign D_op_cmpgeui = D_iw_op == 40;
  assign D_op_ldhuio = D_iw_op == 43;
  assign D_op_andhi = D_iw_op == 44;
  assign D_op_sthio = D_iw_op == 45;
  assign D_op_bgeu = D_iw_op == 46;
  assign D_op_ldhio = D_iw_op == 47;
  assign D_op_cmpltui = D_iw_op == 48;
  assign D_op_initd = D_iw_op == 51;
  assign D_op_orhi = D_iw_op == 52;
  assign D_op_stwio = D_iw_op == 53;
  assign D_op_bltu = D_iw_op == 54;
  assign D_op_ldwio = D_iw_op == 55;
  assign D_op_rdprs = D_iw_op == 56;
  assign D_op_flushd = D_iw_op == 59;
  assign D_op_xorhi = D_iw_op == 60;
  assign D_op_rsv02 = D_iw_op == 2;
  assign D_op_rsv09 = D_iw_op == 9;
  assign D_op_rsv10 = D_iw_op == 10;
  assign D_op_rsv17 = D_iw_op == 17;
  assign D_op_rsv18 = D_iw_op == 18;
  assign D_op_rsv25 = D_iw_op == 25;
  assign D_op_rsv26 = D_iw_op == 26;
  assign D_op_rsv33 = D_iw_op == 33;
  assign D_op_rsv34 = D_iw_op == 34;
  assign D_op_rsv41 = D_iw_op == 41;
  assign D_op_rsv42 = D_iw_op == 42;
  assign D_op_rsv49 = D_iw_op == 49;
  assign D_op_rsv57 = D_iw_op == 57;
  assign D_op_rsv61 = D_iw_op == 61;
  assign D_op_rsv62 = D_iw_op == 62;
  assign D_op_rsv63 = D_iw_op == 63;
  assign D_op_eret = D_op_opx & (D_iw_opx == 1);
  assign D_op_roli = D_op_opx & (D_iw_opx == 2);
  assign D_op_rol = D_op_opx & (D_iw_opx == 3);
  assign D_op_flushp = D_op_opx & (D_iw_opx == 4);
  assign D_op_ret = D_op_opx & (D_iw_opx == 5);
  assign D_op_nor = D_op_opx & (D_iw_opx == 6);
  assign D_op_mulxuu = D_op_opx & (D_iw_opx == 7);
  assign D_op_cmpge = D_op_opx & (D_iw_opx == 8);
  assign D_op_bret = D_op_opx & (D_iw_opx == 9);
  assign D_op_ror = D_op_opx & (D_iw_opx == 11);
  assign D_op_flushi = D_op_opx & (D_iw_opx == 12);
  assign D_op_jmp = D_op_opx & (D_iw_opx == 13);
  assign D_op_and = D_op_opx & (D_iw_opx == 14);
  assign D_op_cmplt = D_op_opx & (D_iw_opx == 16);
  assign D_op_slli = D_op_opx & (D_iw_opx == 18);
  assign D_op_sll = D_op_opx & (D_iw_opx == 19);
  assign D_op_wrprs = D_op_opx & (D_iw_opx == 20);
  assign D_op_or = D_op_opx & (D_iw_opx == 22);
  assign D_op_mulxsu = D_op_opx & (D_iw_opx == 23);
  assign D_op_cmpne = D_op_opx & (D_iw_opx == 24);
  assign D_op_srli = D_op_opx & (D_iw_opx == 26);
  assign D_op_srl = D_op_opx & (D_iw_opx == 27);
  assign D_op_nextpc = D_op_opx & (D_iw_opx == 28);
  assign D_op_callr = D_op_opx & (D_iw_opx == 29);
  assign D_op_xor = D_op_opx & (D_iw_opx == 30);
  assign D_op_mulxss = D_op_opx & (D_iw_opx == 31);
  assign D_op_cmpeq = D_op_opx & (D_iw_opx == 32);
  assign D_op_divu = D_op_opx & (D_iw_opx == 36);
  assign D_op_div = D_op_opx & (D_iw_opx == 37);
  assign D_op_rdctl = D_op_opx & (D_iw_opx == 38);
  assign D_op_mul = D_op_opx & (D_iw_opx == 39);
  assign D_op_cmpgeu = D_op_opx & (D_iw_opx == 40);
  assign D_op_initi = D_op_opx & (D_iw_opx == 41);
  assign D_op_trap = D_op_opx & (D_iw_opx == 45);
  assign D_op_wrctl = D_op_opx & (D_iw_opx == 46);
  assign D_op_cmpltu = D_op_opx & (D_iw_opx == 48);
  assign D_op_add = D_op_opx & (D_iw_opx == 49);
  assign D_op_break = D_op_opx & (D_iw_opx == 52);
  assign D_op_hbreak = D_op_opx & (D_iw_opx == 53);
  assign D_op_sync = D_op_opx & (D_iw_opx == 54);
  assign D_op_sub = D_op_opx & (D_iw_opx == 57);
  assign D_op_srai = D_op_opx & (D_iw_opx == 58);
  assign D_op_sra = D_op_opx & (D_iw_opx == 59);
  assign D_op_intr = D_op_opx & (D_iw_opx == 61);
  assign D_op_crst = D_op_opx & (D_iw_opx == 62);
  assign D_op_rsvx00 = D_op_opx & (D_iw_opx == 0);
  assign D_op_rsvx10 = D_op_opx & (D_iw_opx == 10);
  assign D_op_rsvx15 = D_op_opx & (D_iw_opx == 15);
  assign D_op_rsvx17 = D_op_opx & (D_iw_opx == 17);
  assign D_op_rsvx21 = D_op_opx & (D_iw_opx == 21);
  assign D_op_rsvx25 = D_op_opx & (D_iw_opx == 25);
  assign D_op_rsvx33 = D_op_opx & (D_iw_opx == 33);
  assign D_op_rsvx34 = D_op_opx & (D_iw_opx == 34);
  assign D_op_rsvx35 = D_op_opx & (D_iw_opx == 35);
  assign D_op_rsvx42 = D_op_opx & (D_iw_opx == 42);
  assign D_op_rsvx43 = D_op_opx & (D_iw_opx == 43);
  assign D_op_rsvx44 = D_op_opx & (D_iw_opx == 44);
  assign D_op_rsvx47 = D_op_opx & (D_iw_opx == 47);
  assign D_op_rsvx50 = D_op_opx & (D_iw_opx == 50);
  assign D_op_rsvx51 = D_op_opx & (D_iw_opx == 51);
  assign D_op_rsvx55 = D_op_opx & (D_iw_opx == 55);
  assign D_op_rsvx56 = D_op_opx & (D_iw_opx == 56);
  assign D_op_rsvx60 = D_op_opx & (D_iw_opx == 60);
  assign D_op_rsvx63 = D_op_opx & (D_iw_opx == 63);
  assign D_op_opx = D_iw_op == 58;
  assign D_op_custom = D_iw_op == 50;
  assign R_en = 1'b1;
  assign E_ci_result = 0;
  assign E_ci_multi_stall = 1'b0;
  assign iactive = d_irq[31 : 0] & 32'b00000000000000000000000000000000;
  assign F_pc_sel_nxt = R_ctrl_exception                          ? 2'b00 :
    R_ctrl_break                              ? 2'b01 :
    (W_br_taken | R_ctrl_uncond_cti_non_br)   ? 2'b10 :
    2'b11;

  assign F_pc_no_crst_nxt = (F_pc_sel_nxt == 2'b00)? 8200 :
    (F_pc_sel_nxt == 2'b01)? 16904 :
    (F_pc_sel_nxt == 2'b10)? E_arith_result[16 : 2] :
    F_pc_plus_one;

  assign F_pc_nxt = F_pc_no_crst_nxt;
  assign F_pcb_nxt = {F_pc_nxt, 2'b00};
  assign F_pc_en = W_valid;
  assign F_pc_plus_one = F_pc + 1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          F_pc <= 8192;
      else if (F_pc_en)
          F_pc <= F_pc_nxt;
    end


  assign F_pcb = {F_pc, 2'b00};
  assign F_pcb_plus_four = {F_pc_plus_one, 2'b00};
  assign F_valid = i_read & ~i_waitrequest;
  assign i_read_nxt = W_valid | (i_read & i_waitrequest);
  assign i_address = {F_pc, 2'b00};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i_read <= 1'b1;
      else 
        i_read <= i_read_nxt;
    end


  assign oci_tb_hbreak_req = oci_hbreak_req;
  assign hbreak_req = (oci_tb_hbreak_req | hbreak_pending) & hbreak_enabled &  ~(wait_for_one_post_bret_inst & ~W_valid);
  assign hbreak_pending_nxt = hbreak_pending ? hbreak_enabled 
    : hbreak_req;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          wait_for_one_post_bret_inst <= 1'b0;
      else 
        wait_for_one_post_bret_inst <= (~hbreak_enabled & oci_single_step_mode) ? 1'b1  : (F_valid | ~oci_single_step_mode) ? 1'b0  : wait_for_one_post_bret_inst;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          hbreak_pending <= 1'b0;
      else 
        hbreak_pending <= hbreak_pending_nxt;
    end


  assign intr_req = W_status_reg_pie & (W_ipending_reg != 0);
  assign F_av_iw = i_readdata;
  assign F_iw = hbreak_req     ? 4040762 :
    1'b0   ? 127034 :
    intr_req       ? 3926074 : 
    F_av_iw;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_iw <= 0;
      else if (F_valid)
          D_iw <= F_iw;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_valid <= 0;
      else 
        D_valid <= F_valid;
    end


  assign D_dst_regnum = D_ctrl_implicit_dst_retaddr    ? 5'd31 : 
    D_ctrl_implicit_dst_eretaddr   ? 5'd29 : 
    D_ctrl_b_is_dst                ? D_iw_b :
    D_iw_c;

  assign D_wr_dst_reg = (D_dst_regnum != 0) & ~D_ctrl_ignore_dst_or_ld;
  assign D_logic_op_raw = D_op_opx ? D_iw_opx[4 : 3] : 
    D_iw_op[4 : 3];

  assign D_logic_op = D_ctrl_alu_force_xor ? 2'b11 : D_logic_op_raw;
  assign D_compare_op = D_op_opx ? D_iw_opx[4 : 3] : 
    D_iw_op[4 : 3];

  assign D_jmp_direct_target_waddr = D_iw[31 : 6];
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_valid <= 0;
      else 
        R_valid <= D_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_wr_dst_reg <= 0;
      else 
        R_wr_dst_reg <= D_wr_dst_reg;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_dst_regnum <= 0;
      else 
        R_dst_regnum <= D_dst_regnum;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_logic_op <= 0;
      else 
        R_logic_op <= D_logic_op;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_compare_op <= 0;
      else 
        R_compare_op <= D_compare_op;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_src2_use_imm <= 0;
      else 
        R_src2_use_imm <= D_ctrl_src2_choose_imm | (D_ctrl_br & R_valid);
    end


  assign W_rf_wren_a = (R_wr_dst_reg & W_valid) | ~reset_n;
//cpu_0_rf, which is an nios_tdp_ram
cpu_0_rf_module cpu_0_rf
  (
    .address_a (W_rf_wren_a ? R_dst_regnum : D_iw_a),
    .address_b (D_iw_b),
    .clock0    (clk),
    .clock1    (clk),
    .clocken0  (1'b1),
    .clocken1  (1'b1),
    .data_a    (W_wr_data),
    .data_b    (av_ld_data_aligned_filtered),
    .q_a       (R_rf_a),
    .q_b       (R_rf_b),
    .wren_a    (W_rf_wren_a),
    .wren_b    (R_ctrl_ld & W_valid)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam cpu_0_rf.lpm_file = "cpu_0_rf_ram.dat";
`else
defparam cpu_0_rf.lpm_file = "cpu_0_rf_ram.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam cpu_0_rf.lpm_file = "cpu_0_rf_ram.mif";
//synthesis read_comments_as_HDL off
  assign R_src1 = (((R_ctrl_br & E_valid) | (R_ctrl_retaddr & R_valid)))? {F_pc_plus_one, 2'b00} :
    ((R_ctrl_jmp_direct & E_valid))? {D_jmp_direct_target_waddr, 2'b00} :
    R_rf_a;

  assign R_src2_lo = ((R_ctrl_force_src2_zero|R_ctrl_hi_imm16))? 16'b0 :
    (R_src2_use_imm)? D_iw_imm16 :
    R_rf_b[15 : 0];

  assign R_src2_hi = ((R_ctrl_force_src2_zero|R_ctrl_unsigned_lo_imm16))? 16'b0 :
    (R_ctrl_hi_imm16)? D_iw_imm16 :
    (R_src2_use_imm)? {16 {D_iw_imm16[15]}} :
    R_rf_b[31 : 16];

  assign R_src2 = {R_src2_hi, R_src2_lo};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_valid <= 0;
      else 
        E_valid <= R_valid | E_stall;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_new_inst <= 0;
      else 
        E_new_inst <= R_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src1 <= 0;
      else 
        E_src1 <= R_src1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src2 <= 0;
      else 
        E_src2 <= R_src2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_invert_arith_src_msb <= 0;
      else 
        E_invert_arith_src_msb <= D_ctrl_alu_signed_comparison & R_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_alu_sub <= 0;
      else 
        E_alu_sub <= D_ctrl_alu_subtract & R_valid;
    end


  assign E_stall = E_shift_rot_stall | E_ld_stall | E_st_stall | E_ci_multi_stall;
  assign E_arith_src1 = { E_src1[31] ^ E_invert_arith_src_msb, 
    E_src1[30 : 0]};

  assign E_arith_src2 = { E_src2[31] ^ E_invert_arith_src_msb, 
    E_src2[30 : 0]};

  assign E_arith_result = E_alu_sub ?
    E_arith_src1 - E_arith_src2 :
    E_arith_src1 + E_arith_src2;

  assign E_mem_baddr = E_arith_result[16 : 0];
  assign E_logic_result = (R_logic_op == 2'b00)? (~(E_src1 | E_src2)) :
    (R_logic_op == 2'b01)? (E_src1 & E_src2) :
    (R_logic_op == 2'b10)? (E_src1 | E_src2) :
    (E_src1 ^ E_src2);

  assign E_logic_result_is_0 = E_logic_result == 0;
  assign E_eq = E_logic_result_is_0;
  assign E_lt = E_arith_result[32];
  assign E_cmp_result = (R_compare_op == 2'b00)? E_eq :
    (R_compare_op == 2'b01)? ~E_lt :
    (R_compare_op == 2'b10)? E_lt :
    ~E_eq;

  assign E_shift_rot_cnt_nxt = E_new_inst ? E_src2[4 : 0] : E_shift_rot_cnt-1;
  assign E_shift_rot_done = (E_shift_rot_cnt == 0) & ~E_new_inst;
  assign E_shift_rot_stall = R_ctrl_shift_rot & E_valid & ~E_shift_rot_done;
  assign E_shift_rot_fill_bit = R_ctrl_shift_logical ? 1'b0 :
    (R_ctrl_rot_right ? E_shift_rot_result[0] : 
    E_shift_rot_result[31]);

  assign E_shift_rot_result_nxt = (E_new_inst)? E_src1 :
    (R_ctrl_shift_rot_right)? {E_shift_rot_fill_bit, E_shift_rot_result[31 : 1]} :
    {E_shift_rot_result[30 : 0], E_shift_rot_fill_bit};

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_shift_rot_result <= 0;
      else 
        E_shift_rot_result <= E_shift_rot_result_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_shift_rot_cnt <= 0;
      else 
        E_shift_rot_cnt <= E_shift_rot_cnt_nxt;
    end


  assign E_control_rd_data = (D_iw_control_regnum == 3'd0)? W_status_reg :
    (D_iw_control_regnum == 3'd1)? W_estatus_reg :
    (D_iw_control_regnum == 3'd2)? W_bstatus_reg :
    (D_iw_control_regnum == 3'd3)? W_ienable_reg :
    (D_iw_control_regnum == 3'd4)? W_ipending_reg :
    0;

  assign E_alu_result = ((R_ctrl_br_cmp | R_ctrl_rdctl_inst))? 0 :
    (R_ctrl_shift_rot)? E_shift_rot_result :
    (R_ctrl_logic)? E_logic_result :
    (R_ctrl_custom)? E_ci_result :
    E_arith_result;

  assign R_stb_data = R_rf_b[7 : 0];
  assign R_sth_data = R_rf_b[15 : 0];
  assign E_st_data = (D_mem8)? {R_stb_data, R_stb_data, R_stb_data, R_stb_data} :
    (D_mem16)? {R_sth_data, R_sth_data} :
    R_rf_b;

  assign E_mem_byte_en = ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b00})? 4'b0001 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b01})? 4'b0010 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b10})? 4'b0100 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b11})? 4'b1000 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b00})? 4'b0011 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b01})? 4'b0011 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b10})? 4'b1100 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b11})? 4'b1100 :
    4'b1111;

  assign d_read_nxt = (R_ctrl_ld & E_new_inst) | (d_read & d_waitrequest);
  assign E_ld_stall = R_ctrl_ld & ((E_valid & ~av_ld_done) | E_new_inst);
  assign d_write_nxt = (R_ctrl_st & E_new_inst) | (d_write & d_waitrequest);
  assign E_st_stall = d_write_nxt;
  assign d_address = W_mem_baddr;
  assign av_ld_getting_data = d_read & ~d_waitrequest;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_read <= 0;
      else 
        d_read <= d_read_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_writedata <= 0;
      else 
        d_writedata <= E_st_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_byteenable <= 0;
      else 
        d_byteenable <= E_mem_byte_en;
    end


  assign av_ld_align_cycle_nxt = av_ld_getting_data ? 0 : (av_ld_align_cycle+1);
  assign av_ld_align_one_more_cycle = av_ld_align_cycle == (D_mem16 ? 2 : 3);
  assign av_ld_aligning_data_nxt = av_ld_aligning_data ? 
    ~av_ld_align_one_more_cycle : 
    (~D_mem32 & av_ld_getting_data);

  assign av_ld_waiting_for_data_nxt = av_ld_waiting_for_data ? 
    ~av_ld_getting_data : 
    (R_ctrl_ld & E_new_inst);

  assign av_ld_done = ~av_ld_waiting_for_data_nxt & (D_mem32 | ~av_ld_aligning_data_nxt);
  assign av_ld_rshift8 = av_ld_aligning_data & 
    (av_ld_align_cycle < (W_mem_baddr[1 : 0]));

  assign av_ld_extend = av_ld_aligning_data;
  assign av_ld_byte0_data_nxt = av_ld_rshift8      ? av_ld_byte1_data :
    av_ld_extend       ? av_ld_byte0_data :
    d_readdata[7 : 0];

  assign av_ld_byte1_data_nxt = av_ld_rshift8      ? av_ld_byte2_data :
    av_ld_extend       ? {8 {av_fill_bit}} :
    d_readdata[15 : 8];

  assign av_ld_byte2_data_nxt = av_ld_rshift8      ? av_ld_byte3_data :
    av_ld_extend       ? {8 {av_fill_bit}} :
    d_readdata[23 : 16];

  assign av_ld_byte3_data_nxt = av_ld_rshift8      ? av_ld_byte3_data :
    av_ld_extend       ? {8 {av_fill_bit}} :
    d_readdata[31 : 24];

  assign av_ld_byte1_data_en = ~(av_ld_extend & D_mem16 & ~av_ld_rshift8);
  assign av_ld_data_aligned_unfiltered = {av_ld_byte3_data, av_ld_byte2_data, 
    av_ld_byte1_data, av_ld_byte0_data};

  assign av_sign_bit = D_mem16 ? av_ld_byte1_data[7] : av_ld_byte0_data[7];
  assign av_fill_bit = av_sign_bit & R_ctrl_ld_signed;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_align_cycle <= 0;
      else 
        av_ld_align_cycle <= av_ld_align_cycle_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_waiting_for_data <= 0;
      else 
        av_ld_waiting_for_data <= av_ld_waiting_for_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_aligning_data <= 0;
      else 
        av_ld_aligning_data <= av_ld_aligning_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_byte0_data <= 0;
      else 
        av_ld_byte0_data <= av_ld_byte0_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_byte1_data <= 0;
      else if (av_ld_byte1_data_en)
          av_ld_byte1_data <= av_ld_byte1_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_byte2_data <= 0;
      else 
        av_ld_byte2_data <= av_ld_byte2_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          av_ld_byte3_data <= 0;
      else 
        av_ld_byte3_data <= av_ld_byte3_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_valid <= 0;
      else 
        W_valid <= E_valid & ~E_stall;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_control_rd_data <= 0;
      else 
        W_control_rd_data <= E_control_rd_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_cmp_result <= 0;
      else 
        W_cmp_result <= E_cmp_result;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_alu_result <= 0;
      else 
        W_alu_result <= E_alu_result;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_status_reg_pie <= 0;
      else 
        W_status_reg_pie <= W_status_reg_pie_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_estatus_reg <= 0;
      else 
        W_estatus_reg <= W_estatus_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_bstatus_reg <= 0;
      else 
        W_bstatus_reg <= W_bstatus_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ienable_reg <= 0;
      else 
        W_ienable_reg <= W_ienable_reg_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ipending_reg <= 0;
      else 
        W_ipending_reg <= W_ipending_reg_nxt;
    end


  assign W_wr_data_non_zero = R_ctrl_br_cmp ? W_cmp_result :
    R_ctrl_rdctl_inst       ? W_control_rd_data :
    W_alu_result[31 : 0];

  assign W_wr_data = W_wr_data_non_zero;
  assign W_br_taken = R_ctrl_br & W_cmp_result;
  assign W_mem_baddr = W_alu_result[16 : 0];
  assign W_status_reg = W_status_reg_pie;
  assign E_wrctl_status = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 3'd0);

  assign E_wrctl_estatus = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 3'd1);

  assign E_wrctl_bstatus = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 3'd2);

  assign E_wrctl_ienable = R_ctrl_wrctl_inst & 
    (D_iw_control_regnum == 3'd3);

  assign W_status_reg_pie_inst_nxt = (R_ctrl_exception | R_ctrl_break | R_ctrl_crst) ? 1'b0 :
    (D_op_eret)                     ? W_estatus_reg :
    (D_op_bret)                     ? W_bstatus_reg :
    (E_wrctl_status)                ? E_src1[0] :
    W_status_reg_pie;

  assign W_status_reg_pie_nxt = E_valid ? W_status_reg_pie_inst_nxt : W_status_reg_pie;
  assign W_estatus_reg_inst_nxt = (R_ctrl_crst)        ? 0 :
    (R_ctrl_exception)   ? W_status_reg :
    (E_wrctl_estatus)    ? E_src1[0] :
    W_estatus_reg;

  assign W_estatus_reg_nxt = E_valid ? W_estatus_reg_inst_nxt : W_estatus_reg;
  assign W_bstatus_reg_inst_nxt = (R_ctrl_break)       ? W_status_reg :
    (E_wrctl_bstatus)    ? E_src1[0] :
    W_bstatus_reg;

  assign W_bstatus_reg_nxt = E_valid ? W_bstatus_reg_inst_nxt : W_bstatus_reg;
  assign W_ienable_reg_nxt = ((E_wrctl_ienable & E_valid) ? 
    E_src1[31 : 0] : W_ienable_reg) & 32'b00000000000000000000000000000000;

  assign W_ipending_reg_nxt = iactive & W_ienable_reg & oci_ienable & 32'b00000000000000000000000000000000;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          hbreak_enabled <= 1'b1;
      else if (E_valid)
          hbreak_enabled <= R_ctrl_break ? 1'b0 : D_op_bret ? 1'b1 : hbreak_enabled;
    end


  cpu_0_nios2_oci the_cpu_0_nios2_oci
    (
      .D_valid                               (D_valid),
      .E_st_data                             (E_st_data),
      .E_valid                               (E_valid),
      .F_pc                                  (F_pc),
      .address                               (jtag_debug_module_address),
      .av_ld_data_aligned_filtered           (av_ld_data_aligned_filtered),
      .begintransfer                         (jtag_debug_module_begintransfer),
      .byteenable                            (jtag_debug_module_byteenable),
      .chipselect                            (jtag_debug_module_select),
      .clk                                   (jtag_debug_module_clk),
      .d_address                             (d_address),
      .d_read                                (d_read),
      .d_waitrequest                         (d_waitrequest),
      .d_write                               (d_write),
      .debugaccess                           (jtag_debug_module_debugaccess),
      .hbreak_enabled                        (hbreak_enabled),
      .jtag_debug_module_debugaccess_to_roms (jtag_debug_module_debugaccess_to_roms),
      .oci_hbreak_req                        (oci_hbreak_req),
      .oci_ienable                           (oci_ienable),
      .oci_single_step_mode                  (oci_single_step_mode),
      .readdata                              (jtag_debug_module_readdata),
      .reset                                 (jtag_debug_module_reset),
      .reset_n                               (reset_n),
      .resetrequest                          (jtag_debug_module_resetrequest),
      .test_ending                           (test_ending),
      .test_has_ended                        (test_has_ended),
      .write                                 (jtag_debug_module_write),
      .writedata                             (jtag_debug_module_writedata)
    );

  //jtag_debug_module, which is an e_avalon_slave
  assign jtag_debug_module_clk = clk;
  assign jtag_debug_module_reset = ~reset_n;
  assign D_ctrl_custom = 1'b0;
  assign R_ctrl_custom_nxt = D_ctrl_custom;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_custom <= 0;
      else if (R_en)
          R_ctrl_custom <= R_ctrl_custom_nxt;
    end


  assign D_ctrl_custom_multi = 1'b0;
  assign R_ctrl_custom_multi_nxt = D_ctrl_custom_multi;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_custom_multi <= 0;
      else if (R_en)
          R_ctrl_custom_multi <= R_ctrl_custom_multi_nxt;
    end


  assign D_ctrl_jmp_indirect = D_op_eret|
    D_op_bret|
    D_op_rsvx17|
    D_op_rsvx25|
    D_op_ret|
    D_op_jmp|
    D_op_rsvx21|
    D_op_callr;

  assign R_ctrl_jmp_indirect_nxt = D_ctrl_jmp_indirect;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_jmp_indirect <= 0;
      else if (R_en)
          R_ctrl_jmp_indirect <= R_ctrl_jmp_indirect_nxt;
    end


  assign D_ctrl_jmp_direct = D_op_call|D_op_jmpi;
  assign R_ctrl_jmp_direct_nxt = D_ctrl_jmp_direct;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_jmp_direct <= 0;
      else if (R_en)
          R_ctrl_jmp_direct <= R_ctrl_jmp_direct_nxt;
    end


  assign D_ctrl_implicit_dst_retaddr = D_op_call|D_op_rsv02;
  assign R_ctrl_implicit_dst_retaddr_nxt = D_ctrl_implicit_dst_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_implicit_dst_retaddr <= 0;
      else if (R_en)
          R_ctrl_implicit_dst_retaddr <= R_ctrl_implicit_dst_retaddr_nxt;
    end


  assign D_ctrl_implicit_dst_eretaddr = D_op_div|D_op_divu|D_op_mul|D_op_muli|D_op_mulxss|D_op_mulxsu|D_op_mulxuu;
  assign R_ctrl_implicit_dst_eretaddr_nxt = D_ctrl_implicit_dst_eretaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_implicit_dst_eretaddr <= 0;
      else if (R_en)
          R_ctrl_implicit_dst_eretaddr <= R_ctrl_implicit_dst_eretaddr_nxt;
    end


  assign D_ctrl_exception = D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mul|
    D_op_muli|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60;

  assign R_ctrl_exception_nxt = D_ctrl_exception;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_exception <= 0;
      else if (R_en)
          R_ctrl_exception <= R_ctrl_exception_nxt;
    end


  assign D_ctrl_break = D_op_break|D_op_hbreak;
  assign R_ctrl_break_nxt = D_ctrl_break;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_break <= 0;
      else if (R_en)
          R_ctrl_break <= R_ctrl_break_nxt;
    end


  assign D_ctrl_crst = D_op_crst|D_op_rsvx63;
  assign R_ctrl_crst_nxt = D_ctrl_crst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_crst <= 0;
      else if (R_en)
          R_ctrl_crst <= R_ctrl_crst_nxt;
    end


  assign D_ctrl_uncond_cti_non_br = D_op_call|
    D_op_jmpi|
    D_op_eret|
    D_op_bret|
    D_op_rsvx17|
    D_op_rsvx25|
    D_op_ret|
    D_op_jmp|
    D_op_rsvx21|
    D_op_callr;

  assign R_ctrl_uncond_cti_non_br_nxt = D_ctrl_uncond_cti_non_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_uncond_cti_non_br <= 0;
      else if (R_en)
          R_ctrl_uncond_cti_non_br <= R_ctrl_uncond_cti_non_br_nxt;
    end


  assign D_ctrl_retaddr = D_op_call|
    D_op_rsv02|
    D_op_nextpc|
    D_op_callr|
    D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mul|
    D_op_muli|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60|
    D_op_break|
    D_op_hbreak;

  assign R_ctrl_retaddr_nxt = D_ctrl_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_retaddr <= 0;
      else if (R_en)
          R_ctrl_retaddr <= R_ctrl_retaddr_nxt;
    end


  assign D_ctrl_shift_logical = D_op_slli|D_op_sll|D_op_srli|D_op_srl;
  assign R_ctrl_shift_logical_nxt = D_ctrl_shift_logical;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_shift_logical <= 0;
      else if (R_en)
          R_ctrl_shift_logical <= R_ctrl_shift_logical_nxt;
    end


  assign D_ctrl_shift_right_arith = D_op_srai|D_op_sra;
  assign R_ctrl_shift_right_arith_nxt = D_ctrl_shift_right_arith;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_shift_right_arith <= 0;
      else if (R_en)
          R_ctrl_shift_right_arith <= R_ctrl_shift_right_arith_nxt;
    end


  assign D_ctrl_rot_right = D_op_rsvx10|D_op_ror|D_op_rsvx42|D_op_rsvx43;
  assign R_ctrl_rot_right_nxt = D_ctrl_rot_right;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_rot_right <= 0;
      else if (R_en)
          R_ctrl_rot_right <= R_ctrl_rot_right_nxt;
    end


  assign D_ctrl_shift_rot_right = D_op_srli|
    D_op_srl|
    D_op_srai|
    D_op_sra|
    D_op_rsvx10|
    D_op_ror|
    D_op_rsvx42|
    D_op_rsvx43;

  assign R_ctrl_shift_rot_right_nxt = D_ctrl_shift_rot_right;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_shift_rot_right <= 0;
      else if (R_en)
          R_ctrl_shift_rot_right <= R_ctrl_shift_rot_right_nxt;
    end


  assign D_ctrl_shift_rot = D_op_slli|
    D_op_rsvx50|
    D_op_sll|
    D_op_rsvx51|
    D_op_roli|
    D_op_rsvx34|
    D_op_rol|
    D_op_rsvx35|
    D_op_srli|
    D_op_srl|
    D_op_srai|
    D_op_sra|
    D_op_rsvx10|
    D_op_ror|
    D_op_rsvx42|
    D_op_rsvx43;

  assign R_ctrl_shift_rot_nxt = D_ctrl_shift_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_shift_rot <= 0;
      else if (R_en)
          R_ctrl_shift_rot <= R_ctrl_shift_rot_nxt;
    end


  assign D_ctrl_logic = D_op_and|
    D_op_or|
    D_op_xor|
    D_op_nor|
    D_op_andhi|
    D_op_orhi|
    D_op_xorhi|
    D_op_andi|
    D_op_ori|
    D_op_xori;

  assign R_ctrl_logic_nxt = D_ctrl_logic;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_logic <= 0;
      else if (R_en)
          R_ctrl_logic <= R_ctrl_logic_nxt;
    end


  assign D_ctrl_hi_imm16 = D_op_andhi|D_op_orhi|D_op_xorhi;
  assign R_ctrl_hi_imm16_nxt = D_ctrl_hi_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_hi_imm16 <= 0;
      else if (R_en)
          R_ctrl_hi_imm16 <= R_ctrl_hi_imm16_nxt;
    end


  assign D_ctrl_unsigned_lo_imm16 = D_op_cmpgeui|
    D_op_cmpltui|
    D_op_andi|
    D_op_ori|
    D_op_xori|
    D_op_roli|
    D_op_rsvx10|
    D_op_slli|
    D_op_srli|
    D_op_rsvx34|
    D_op_rsvx42|
    D_op_rsvx50|
    D_op_srai;

  assign R_ctrl_unsigned_lo_imm16_nxt = D_ctrl_unsigned_lo_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_unsigned_lo_imm16 <= 0;
      else if (R_en)
          R_ctrl_unsigned_lo_imm16 <= R_ctrl_unsigned_lo_imm16_nxt;
    end


  assign D_ctrl_br_uncond = D_op_br|D_op_rsv02;
  assign R_ctrl_br_uncond_nxt = D_ctrl_br_uncond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_br_uncond <= 0;
      else if (R_en)
          R_ctrl_br_uncond <= R_ctrl_br_uncond_nxt;
    end


  assign D_ctrl_br = D_op_br|
    D_op_bge|
    D_op_blt|
    D_op_bne|
    D_op_beq|
    D_op_bgeu|
    D_op_bltu|
    D_op_rsv62;

  assign R_ctrl_br_nxt = D_ctrl_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_br <= 0;
      else if (R_en)
          R_ctrl_br <= R_ctrl_br_nxt;
    end


  assign D_ctrl_alu_subtract = D_op_sub|
    D_op_rsvx25|
    D_op_cmplti|
    D_op_cmpltui|
    D_op_cmplt|
    D_op_cmpltu|
    D_op_blt|
    D_op_bltu|
    D_op_cmpgei|
    D_op_cmpgeui|
    D_op_cmpge|
    D_op_cmpgeu|
    D_op_bge|
    D_op_rsv10|
    D_op_bgeu|
    D_op_rsv42;

  assign R_ctrl_alu_subtract_nxt = D_ctrl_alu_subtract;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_subtract <= 0;
      else if (R_en)
          R_ctrl_alu_subtract <= R_ctrl_alu_subtract_nxt;
    end


  assign D_ctrl_alu_signed_comparison = D_op_cmpge|D_op_cmpgei|D_op_cmplt|D_op_cmplti|D_op_bge|D_op_blt;
  assign R_ctrl_alu_signed_comparison_nxt = D_ctrl_alu_signed_comparison;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_signed_comparison <= 0;
      else if (R_en)
          R_ctrl_alu_signed_comparison <= R_ctrl_alu_signed_comparison_nxt;
    end


  assign D_ctrl_br_cmp = D_op_br|
    D_op_bge|
    D_op_blt|
    D_op_bne|
    D_op_beq|
    D_op_bgeu|
    D_op_bltu|
    D_op_rsv62|
    D_op_cmpgei|
    D_op_cmplti|
    D_op_cmpnei|
    D_op_cmpgeui|
    D_op_cmpltui|
    D_op_cmpeqi|
    D_op_rsvx00|
    D_op_cmpge|
    D_op_cmplt|
    D_op_cmpne|
    D_op_cmpgeu|
    D_op_cmpltu|
    D_op_cmpeq|
    D_op_rsvx56;

  assign R_ctrl_br_cmp_nxt = D_ctrl_br_cmp;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_br_cmp <= 0;
      else if (R_en)
          R_ctrl_br_cmp <= R_ctrl_br_cmp_nxt;
    end


  assign D_ctrl_ld_signed = D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63;

  assign R_ctrl_ld_signed_nxt = D_ctrl_ld_signed;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld_signed <= 0;
      else if (R_en)
          R_ctrl_ld_signed <= R_ctrl_ld_signed_nxt;
    end


  assign D_ctrl_ld = D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio;

  assign R_ctrl_ld_nxt = D_ctrl_ld;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld <= 0;
      else if (R_en)
          R_ctrl_ld <= R_ctrl_ld_nxt;
    end


  assign D_ctrl_ld_non_io = D_op_ldbu|D_op_ldhu|D_op_ldb|D_op_ldh|D_op_ldw|D_op_ldl;
  assign R_ctrl_ld_non_io_nxt = D_ctrl_ld_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld_non_io <= 0;
      else if (R_en)
          R_ctrl_ld_non_io <= R_ctrl_ld_non_io_nxt;
    end


  assign D_ctrl_st = D_op_stb|
    D_op_sth|
    D_op_stw|
    D_op_stc|
    D_op_stbio|
    D_op_sthio|
    D_op_stwio|
    D_op_rsv61;

  assign R_ctrl_st_nxt = D_ctrl_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_st <= 0;
      else if (R_en)
          R_ctrl_st <= R_ctrl_st_nxt;
    end


  assign D_ctrl_ld_io = D_op_ldbuio|D_op_ldhuio|D_op_ldbio|D_op_ldhio|D_op_ldwio|D_op_rsv63;
  assign R_ctrl_ld_io_nxt = D_ctrl_ld_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld_io <= 0;
      else if (R_en)
          R_ctrl_ld_io <= R_ctrl_ld_io_nxt;
    end


  assign D_ctrl_b_is_dst = D_op_addi|
    D_op_andhi|
    D_op_orhi|
    D_op_xorhi|
    D_op_andi|
    D_op_ori|
    D_op_xori|
    D_op_call|
    D_op_rdprs|
    D_op_cmpgei|
    D_op_cmplti|
    D_op_cmpnei|
    D_op_cmpgeui|
    D_op_cmpltui|
    D_op_cmpeqi|
    D_op_jmpi|
    D_op_rsv09|
    D_op_rsv17|
    D_op_rsv25|
    D_op_rsv33|
    D_op_rsv41|
    D_op_rsv49|
    D_op_rsv57|
    D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio|
    D_op_initd|
    D_op_initda|
    D_op_flushd|
    D_op_flushda;

  assign R_ctrl_b_is_dst_nxt = D_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_b_is_dst <= 0;
      else if (R_en)
          R_ctrl_b_is_dst <= R_ctrl_b_is_dst_nxt;
    end


  assign D_ctrl_ignore_dst_or_ld = D_op_br|
    D_op_bge|
    D_op_blt|
    D_op_bne|
    D_op_beq|
    D_op_bgeu|
    D_op_bltu|
    D_op_rsv62|
    D_op_stb|
    D_op_sth|
    D_op_stw|
    D_op_stc|
    D_op_stbio|
    D_op_sthio|
    D_op_stwio|
    D_op_rsv61|
    D_op_jmpi|
    D_op_rsv09|
    D_op_rsv17|
    D_op_rsv25|
    D_op_rsv33|
    D_op_rsv41|
    D_op_rsv49|
    D_op_rsv57|
    D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio;

  assign R_ctrl_ignore_dst_or_ld_nxt = D_ctrl_ignore_dst_or_ld;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ignore_dst_or_ld <= 0;
      else if (R_en)
          R_ctrl_ignore_dst_or_ld <= R_ctrl_ignore_dst_or_ld_nxt;
    end


  assign D_ctrl_src2_choose_imm = D_op_addi|
    D_op_andhi|
    D_op_orhi|
    D_op_xorhi|
    D_op_andi|
    D_op_ori|
    D_op_xori|
    D_op_call|
    D_op_rdprs|
    D_op_cmpgei|
    D_op_cmplti|
    D_op_cmpnei|
    D_op_cmpgeui|
    D_op_cmpltui|
    D_op_cmpeqi|
    D_op_jmpi|
    D_op_rsv09|
    D_op_rsv17|
    D_op_rsv25|
    D_op_rsv33|
    D_op_rsv41|
    D_op_rsv49|
    D_op_rsv57|
    D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio|
    D_op_initd|
    D_op_initda|
    D_op_flushd|
    D_op_flushda|
    D_op_stb|
    D_op_sth|
    D_op_stw|
    D_op_stc|
    D_op_stbio|
    D_op_sthio|
    D_op_stwio|
    D_op_rsv61|
    D_op_roli|
    D_op_rsvx10|
    D_op_slli|
    D_op_srli|
    D_op_rsvx34|
    D_op_rsvx42|
    D_op_rsvx50|
    D_op_srai;

  assign R_ctrl_src2_choose_imm_nxt = D_ctrl_src2_choose_imm;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_src2_choose_imm <= 0;
      else if (R_en)
          R_ctrl_src2_choose_imm <= R_ctrl_src2_choose_imm_nxt;
    end


  assign D_ctrl_wrctl_inst = D_op_wrctl;
  assign R_ctrl_wrctl_inst_nxt = D_ctrl_wrctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_wrctl_inst <= 0;
      else if (R_en)
          R_ctrl_wrctl_inst <= R_ctrl_wrctl_inst_nxt;
    end


  assign D_ctrl_rdctl_inst = D_op_rdctl;
  assign R_ctrl_rdctl_inst_nxt = D_ctrl_rdctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_rdctl_inst <= 0;
      else if (R_en)
          R_ctrl_rdctl_inst <= R_ctrl_rdctl_inst_nxt;
    end


  assign D_ctrl_force_src2_zero = D_op_call|
    D_op_rsv02|
    D_op_nextpc|
    D_op_callr|
    D_op_trap|
    D_op_rsvx44|
    D_op_intr|
    D_op_rsvx60|
    D_op_break|
    D_op_hbreak|
    D_op_eret|
    D_op_bret|
    D_op_rsvx17|
    D_op_rsvx25|
    D_op_ret|
    D_op_jmp|
    D_op_rsvx21|
    D_op_jmpi;

  assign R_ctrl_force_src2_zero_nxt = D_ctrl_force_src2_zero;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_force_src2_zero <= 0;
      else if (R_en)
          R_ctrl_force_src2_zero <= R_ctrl_force_src2_zero_nxt;
    end


  assign D_ctrl_alu_force_xor = D_op_cmpgei|
    D_op_cmpgeui|
    D_op_cmpeqi|
    D_op_cmpge|
    D_op_cmpgeu|
    D_op_cmpeq|
    D_op_cmpnei|
    D_op_cmpne|
    D_op_bge|
    D_op_rsv10|
    D_op_bgeu|
    D_op_rsv42|
    D_op_beq|
    D_op_rsv34|
    D_op_bne|
    D_op_rsv62|
    D_op_br|
    D_op_rsv02;

  assign R_ctrl_alu_force_xor_nxt = D_ctrl_alu_force_xor;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_alu_force_xor <= 0;
      else if (R_en)
          R_ctrl_alu_force_xor <= R_ctrl_alu_force_xor_nxt;
    end


  //data_master, which is an e_avalon_master
  //instruction_master, which is an e_avalon_master

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign F_inst = (F_op_call)? 56'h20202063616c6c :
    (F_op_jmpi)? 56'h2020206a6d7069 :
    (F_op_ldbu)? 56'h2020206c646275 :
    (F_op_addi)? 56'h20202061646469 :
    (F_op_stb)? 56'h20202020737462 :
    (F_op_br)? 56'h20202020206272 :
    (F_op_ldb)? 56'h202020206c6462 :
    (F_op_cmpgei)? 56'h20636d70676569 :
    (F_op_ldhu)? 56'h2020206c646875 :
    (F_op_andi)? 56'h202020616e6469 :
    (F_op_sth)? 56'h20202020737468 :
    (F_op_bge)? 56'h20202020626765 :
    (F_op_ldh)? 56'h202020206c6468 :
    (F_op_cmplti)? 56'h20636d706c7469 :
    (F_op_initda)? 56'h20696e69746461 :
    (F_op_ori)? 56'h202020206f7269 :
    (F_op_stw)? 56'h20202020737477 :
    (F_op_blt)? 56'h20202020626c74 :
    (F_op_ldw)? 56'h202020206c6477 :
    (F_op_cmpnei)? 56'h20636d706e6569 :
    (F_op_flushda)? 56'h666c7573686461 :
    (F_op_xori)? 56'h202020786f7269 :
    (F_op_bne)? 56'h20202020626e65 :
    (F_op_cmpeqi)? 56'h20636d70657169 :
    (F_op_ldbuio)? 56'h206c646275696f :
    (F_op_muli)? 56'h2020206d756c69 :
    (F_op_stbio)? 56'h2020737462696f :
    (F_op_beq)? 56'h20202020626571 :
    (F_op_ldbio)? 56'h20206c6462696f :
    (F_op_cmpgeui)? 56'h636d7067657569 :
    (F_op_ldhuio)? 56'h206c646875696f :
    (F_op_andhi)? 56'h2020616e646869 :
    (F_op_sthio)? 56'h2020737468696f :
    (F_op_bgeu)? 56'h20202062676575 :
    (F_op_ldhio)? 56'h20206c6468696f :
    (F_op_cmpltui)? 56'h636d706c747569 :
    (F_op_initd)? 56'h2020696e697464 :
    (F_op_orhi)? 56'h2020206f726869 :
    (F_op_stwio)? 56'h2020737477696f :
    (F_op_bltu)? 56'h202020626c7475 :
    (F_op_ldwio)? 56'h20206c6477696f :
    (F_op_flushd)? 56'h20666c75736864 :
    (F_op_xorhi)? 56'h2020786f726869 :
    (F_op_eret)? 56'h20202065726574 :
    (F_op_roli)? 56'h202020726f6c69 :
    (F_op_rol)? 56'h20202020726f6c :
    (F_op_flushp)? 56'h20666c75736870 :
    (F_op_ret)? 56'h20202020726574 :
    (F_op_nor)? 56'h202020206e6f72 :
    (F_op_mulxuu)? 56'h206d756c787575 :
    (F_op_cmpge)? 56'h2020636d706765 :
    (F_op_bret)? 56'h20202062726574 :
    (F_op_ror)? 56'h20202020726f72 :
    (F_op_flushi)? 56'h20666c75736869 :
    (F_op_jmp)? 56'h202020206a6d70 :
    (F_op_and)? 56'h20202020616e64 :
    (F_op_cmplt)? 56'h2020636d706c74 :
    (F_op_slli)? 56'h202020736c6c69 :
    (F_op_sll)? 56'h20202020736c6c :
    (F_op_or)? 56'h20202020206f72 :
    (F_op_mulxsu)? 56'h206d756c787375 :
    (F_op_cmpne)? 56'h2020636d706e65 :
    (F_op_srli)? 56'h20202073726c69 :
    (F_op_srl)? 56'h2020202073726c :
    (F_op_nextpc)? 56'h206e6578747063 :
    (F_op_callr)? 56'h202063616c6c72 :
    (F_op_xor)? 56'h20202020786f72 :
    (F_op_mulxss)? 56'h206d756c787373 :
    (F_op_cmpeq)? 56'h2020636d706571 :
    (F_op_divu)? 56'h20202064697675 :
    (F_op_div)? 56'h20202020646976 :
    (F_op_rdctl)? 56'h2020726463746c :
    (F_op_mul)? 56'h202020206d756c :
    (F_op_cmpgeu)? 56'h20636d70676575 :
    (F_op_initi)? 56'h2020696e697469 :
    (F_op_trap)? 56'h20202074726170 :
    (F_op_wrctl)? 56'h2020777263746c :
    (F_op_cmpltu)? 56'h20636d706c7475 :
    (F_op_add)? 56'h20202020616464 :
    (F_op_break)? 56'h2020627265616b :
    (F_op_hbreak)? 56'h2068627265616b :
    (F_op_sync)? 56'h20202073796e63 :
    (F_op_sub)? 56'h20202020737562 :
    (F_op_srai)? 56'h20202073726169 :
    (F_op_sra)? 56'h20202020737261 :
    (F_op_intr)? 56'h202020696e7472 :
    56'h20202020424144;

  assign D_inst = (D_op_call)? 56'h20202063616c6c :
    (D_op_jmpi)? 56'h2020206a6d7069 :
    (D_op_ldbu)? 56'h2020206c646275 :
    (D_op_addi)? 56'h20202061646469 :
    (D_op_stb)? 56'h20202020737462 :
    (D_op_br)? 56'h20202020206272 :
    (D_op_ldb)? 56'h202020206c6462 :
    (D_op_cmpgei)? 56'h20636d70676569 :
    (D_op_ldhu)? 56'h2020206c646875 :
    (D_op_andi)? 56'h202020616e6469 :
    (D_op_sth)? 56'h20202020737468 :
    (D_op_bge)? 56'h20202020626765 :
    (D_op_ldh)? 56'h202020206c6468 :
    (D_op_cmplti)? 56'h20636d706c7469 :
    (D_op_initda)? 56'h20696e69746461 :
    (D_op_ori)? 56'h202020206f7269 :
    (D_op_stw)? 56'h20202020737477 :
    (D_op_blt)? 56'h20202020626c74 :
    (D_op_ldw)? 56'h202020206c6477 :
    (D_op_cmpnei)? 56'h20636d706e6569 :
    (D_op_flushda)? 56'h666c7573686461 :
    (D_op_xori)? 56'h202020786f7269 :
    (D_op_bne)? 56'h20202020626e65 :
    (D_op_cmpeqi)? 56'h20636d70657169 :
    (D_op_ldbuio)? 56'h206c646275696f :
    (D_op_muli)? 56'h2020206d756c69 :
    (D_op_stbio)? 56'h2020737462696f :
    (D_op_beq)? 56'h20202020626571 :
    (D_op_ldbio)? 56'h20206c6462696f :
    (D_op_cmpgeui)? 56'h636d7067657569 :
    (D_op_ldhuio)? 56'h206c646875696f :
    (D_op_andhi)? 56'h2020616e646869 :
    (D_op_sthio)? 56'h2020737468696f :
    (D_op_bgeu)? 56'h20202062676575 :
    (D_op_ldhio)? 56'h20206c6468696f :
    (D_op_cmpltui)? 56'h636d706c747569 :
    (D_op_initd)? 56'h2020696e697464 :
    (D_op_orhi)? 56'h2020206f726869 :
    (D_op_stwio)? 56'h2020737477696f :
    (D_op_bltu)? 56'h202020626c7475 :
    (D_op_ldwio)? 56'h20206c6477696f :
    (D_op_flushd)? 56'h20666c75736864 :
    (D_op_xorhi)? 56'h2020786f726869 :
    (D_op_eret)? 56'h20202065726574 :
    (D_op_roli)? 56'h202020726f6c69 :
    (D_op_rol)? 56'h20202020726f6c :
    (D_op_flushp)? 56'h20666c75736870 :
    (D_op_ret)? 56'h20202020726574 :
    (D_op_nor)? 56'h202020206e6f72 :
    (D_op_mulxuu)? 56'h206d756c787575 :
    (D_op_cmpge)? 56'h2020636d706765 :
    (D_op_bret)? 56'h20202062726574 :
    (D_op_ror)? 56'h20202020726f72 :
    (D_op_flushi)? 56'h20666c75736869 :
    (D_op_jmp)? 56'h202020206a6d70 :
    (D_op_and)? 56'h20202020616e64 :
    (D_op_cmplt)? 56'h2020636d706c74 :
    (D_op_slli)? 56'h202020736c6c69 :
    (D_op_sll)? 56'h20202020736c6c :
    (D_op_or)? 56'h20202020206f72 :
    (D_op_mulxsu)? 56'h206d756c787375 :
    (D_op_cmpne)? 56'h2020636d706e65 :
    (D_op_srli)? 56'h20202073726c69 :
    (D_op_srl)? 56'h2020202073726c :
    (D_op_nextpc)? 56'h206e6578747063 :
    (D_op_callr)? 56'h202063616c6c72 :
    (D_op_xor)? 56'h20202020786f72 :
    (D_op_mulxss)? 56'h206d756c787373 :
    (D_op_cmpeq)? 56'h2020636d706571 :
    (D_op_divu)? 56'h20202064697675 :
    (D_op_div)? 56'h20202020646976 :
    (D_op_rdctl)? 56'h2020726463746c :
    (D_op_mul)? 56'h202020206d756c :
    (D_op_cmpgeu)? 56'h20636d70676575 :
    (D_op_initi)? 56'h2020696e697469 :
    (D_op_trap)? 56'h20202074726170 :
    (D_op_wrctl)? 56'h2020777263746c :
    (D_op_cmpltu)? 56'h20636d706c7475 :
    (D_op_add)? 56'h20202020616464 :
    (D_op_break)? 56'h2020627265616b :
    (D_op_hbreak)? 56'h2068627265616b :
    (D_op_sync)? 56'h20202073796e63 :
    (D_op_sub)? 56'h20202020737562 :
    (D_op_srai)? 56'h20202073726169 :
    (D_op_sra)? 56'h20202020737261 :
    (D_op_intr)? 56'h202020696e7472 :
    56'h20202020424144;

  assign F_vinst = F_valid ? F_inst : {7{8'h2d}};
  assign D_vinst = D_valid ? D_inst : {7{8'h2d}};
  assign R_vinst = R_valid ? D_inst : {7{8'h2d}};
  assign E_vinst = E_valid ? D_inst : {7{8'h2d}};
  assign W_vinst = W_valid ? D_inst : {7{8'h2d}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule

