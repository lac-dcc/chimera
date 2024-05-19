// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

//Legal Notice: (C)2018 Altera Corporation. All rights reserved.  Your
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

module soc_system_h2f_ram (
                            // inputs:
                             address,
                             byteenable,
                             chipselect,
                             clk,
                             clken,
                             reset,
                             reset_req,
                             write,
                             writedata,

                            // outputs:
                             readdata
                          )
;

  parameter INIT_FILE = "soc_system_h2f_ram.hex";


  output  [127: 0] readdata;
  input   [  3: 0] address;
  input   [ 15: 0] byteenable;
  input            chipselect;
  input            clk;
  input            clken;
  input            reset;
  input            reset_req;
  input            write;
  input   [127: 0] writedata;

  wire             clocken0;
  wire    [127: 0] readdata;
  wire             wren;
  assign wren = chipselect & write;
  assign clocken0 = clken & ~reset_req;
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clk),
      .clocken0 (clocken0),
      .data_a (writedata),
      .q_a (readdata),
      .wren_a (wren)
    );

  defparam the_altsyncram.byte_size = 8,
           the_altsyncram.init_file = INIT_FILE,
           the_altsyncram.lpm_hint = "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=h2fr",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.maximum_depth = 16,
           the_altsyncram.numwords_a = 16,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 128,
           the_altsyncram.width_byteena_a = 16,
           the_altsyncram.widthad_a = 4;

  //s1, which is an e_avalon_slave
  //s2, which is an e_avalon_slave

endmodule

