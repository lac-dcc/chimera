//Legal Notice: (C)2017 Altera Corporation. All rights reserved.  Your
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

module gpio_altr_rising_to_level (
                              // inputs:
                               address,
                               chipselect,
                               clk,
                               in_port,
                               reset_n,
                               write_n,
                               writedata,

                              // outputs:
                               irq,
                               readdata
                            )
;

  output           irq;
  output  [ 31: 0] readdata;
  input   [  1: 0] address;
  input            chipselect;
  input            clk;
  input   [ 31: 0] in_port;
  input            reset_n;
  input            write_n;
  input   [ 31: 0] writedata;


wire             clk_en;
reg     [ 31: 0] d1_data_in;
reg     [ 31: 0] d2_data_in;
wire    [ 31: 0] data_in;
reg     [ 31: 0] edge_capture;
wire             edge_capture_wr_strobe;
wire    [ 31: 0] edge_detect;
wire             irq;
reg     [ 31: 0] irq_mask;
wire    [ 31: 0] read_mux_out;
reg     [ 31: 0] readdata;
  assign clk_en = 1;
  //s1, which is an e_avalon_slave
  assign read_mux_out = ({32 {(address == 0)}} & data_in) |
    ({32 {(address == 2)}} & irq_mask) |
    ({32 {(address == 3)}} & edge_capture);

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          readdata <= 0;
      else if (clk_en)
          readdata <= {32'b0 | read_mux_out};
    end


  assign data_in = in_port;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          irq_mask <= 0;
      else if (chipselect && ~write_n && (address == 2))
          irq_mask <= writedata[31 : 0];
    end


  assign irq = |(data_in      & irq_mask);
  assign edge_capture_wr_strobe = chipselect && ~write_n && (address == 3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[0] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[0])
              edge_capture[0] <= 0;
          else if (edge_detect[0])
              edge_capture[0] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[1] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[1])
              edge_capture[1] <= 0;
          else if (edge_detect[1])
              edge_capture[1] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[2] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[2])
              edge_capture[2] <= 0;
          else if (edge_detect[2])
              edge_capture[2] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[3] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[3])
              edge_capture[3] <= 0;
          else if (edge_detect[3])
              edge_capture[3] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[4] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[4])
              edge_capture[4] <= 0;
          else if (edge_detect[4])
              edge_capture[4] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[5] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[5])
              edge_capture[5] <= 0;
          else if (edge_detect[5])
              edge_capture[5] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[6] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[6])
              edge_capture[6] <= 0;
          else if (edge_detect[6])
              edge_capture[6] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[7] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[7])
              edge_capture[7] <= 0;
          else if (edge_detect[7])
              edge_capture[7] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[8] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[8])
              edge_capture[8] <= 0;
          else if (edge_detect[8])
              edge_capture[8] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[9] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[9])
              edge_capture[9] <= 0;
          else if (edge_detect[9])
              edge_capture[9] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[10] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[10])
              edge_capture[10] <= 0;
          else if (edge_detect[10])
              edge_capture[10] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[11] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[11])
              edge_capture[11] <= 0;
          else if (edge_detect[11])
              edge_capture[11] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[12] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[12])
              edge_capture[12] <= 0;
          else if (edge_detect[12])
              edge_capture[12] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[13] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[13])
              edge_capture[13] <= 0;
          else if (edge_detect[13])
              edge_capture[13] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[14] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[14])
              edge_capture[14] <= 0;
          else if (edge_detect[14])
              edge_capture[14] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[15] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[15])
              edge_capture[15] <= 0;
          else if (edge_detect[15])
              edge_capture[15] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[16] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[16])
              edge_capture[16] <= 0;
          else if (edge_detect[16])
              edge_capture[16] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[17] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[17])
              edge_capture[17] <= 0;
          else if (edge_detect[17])
              edge_capture[17] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[18] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[18])
              edge_capture[18] <= 0;
          else if (edge_detect[18])
              edge_capture[18] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[19] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[19])
              edge_capture[19] <= 0;
          else if (edge_detect[19])
              edge_capture[19] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[20] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[20])
              edge_capture[20] <= 0;
          else if (edge_detect[20])
              edge_capture[20] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[21] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[21])
              edge_capture[21] <= 0;
          else if (edge_detect[21])
              edge_capture[21] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[22] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[22])
              edge_capture[22] <= 0;
          else if (edge_detect[22])
              edge_capture[22] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[23] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[23])
              edge_capture[23] <= 0;
          else if (edge_detect[23])
              edge_capture[23] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[24] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[24])
              edge_capture[24] <= 0;
          else if (edge_detect[24])
              edge_capture[24] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[25] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[25])
              edge_capture[25] <= 0;
          else if (edge_detect[25])
              edge_capture[25] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[26] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[26])
              edge_capture[26] <= 0;
          else if (edge_detect[26])
              edge_capture[26] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[27] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[27])
              edge_capture[27] <= 0;
          else if (edge_detect[27])
              edge_capture[27] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[28] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[28])
              edge_capture[28] <= 0;
          else if (edge_detect[28])
              edge_capture[28] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[29] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[29])
              edge_capture[29] <= 0;
          else if (edge_detect[29])
              edge_capture[29] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[30] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[30])
              edge_capture[30] <= 0;
          else if (edge_detect[30])
              edge_capture[30] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[31] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[31])
              edge_capture[31] <= 0;
          else if (edge_detect[31])
              edge_capture[31] <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_data_in <= 0;
          d2_data_in <= 0;
        end
      else if (clk_en)
        begin
          d1_data_in <= data_in;
          d2_data_in <= d1_data_in;
        end
    end


  assign edge_detect = d1_data_in & ~d2_data_in;

endmodule

