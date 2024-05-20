// This program was cloned from: https://github.com/johnathan-convertino-afrl/ad_hdl_fusesoc
// License: MIT License

//******************************************************************************
/// @file    tb_axis.v
/// @author  JAY CONVERTINO
/// @date    2022.10.24
/// @brief   Generic AXIS test bench top with verification.
/// @details This generic top and mod axis test bench is created for a FIFO.
///          It will have to be altered for other devices that alter the input
///          for some sort of output.
///
/// @LICENSE MIT
///  Copyright 2022 Jay Convertino
///
///  Permission is hereby granted, free of charge, to any person obtaining a copy
///  of this software and associated documentation files (the "Software"), to 
///  deal in the Software without restriction, including without limitation the
///  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
///  sell copies of the Software, and to permit persons to whom the Software is 
///  furnished to do so, subject to the following conditions:
///
///  The above copyright notice and this permission notice shall be included in 
///  all copies or substantial portions of the Software.
///
///  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
///  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
///  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
///  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
///  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
///  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
///  IN THE SOFTWARE.
//******************************************************************************

`timescale 1 ns/10 ps

module tb_axis #(
  parameter IN_FILE_NAME = "in.bin",
  parameter OUT_FILE_NAME = "out.bin",
  parameter RAND_READY = 0
  );
  
  //parameter or local param bus, user and dest width? and files as well?
  
  localparam BUS_WIDTH      = 8;
  localparam USER_WIDTH     = 1;
  localparam DEST_WIDTH     = 1;
  
  localparam CLK_PERIOD = 500;
  localparam RST_PERIOD = 1000;

  integer                   bytes_read = 0;

  // axis data register for read in data
  reg [(BUS_WIDTH*8)-1:0] r_fifo_wr_data;
  // axis data register for output data
  reg [(BUS_WIDTH*8)-1:0] rr_fifo_wr_data;
  reg                     r_fifo_wr_en;
  reg                     r_eof;
  reg                     rr_eof;
  reg                     r_toggle;
  
  wire                      tb_fifo_wr_en;
  wire                      tb_dut_clk;
  wire                      tb_dut_rstn;
  wire                      tb_dut_rstn_delay;
  wire                      tb_dut_rst;
  wire                      tb_dut_rst_delay;
  wire                      tb_dut_valid;
  wire                      tb_dut_ready;
  wire [(BUS_WIDTH*8)-1:0]  tb_dut_data;
  wire [BUS_WIDTH-1:0]      tb_dut_keep;
  wire                      tb_dut_last;
  wire [USER_WIDTH-1:0]     tb_dut_user;
  wire [DEST_WIDTH-1:0]     tb_dut_dest;
  wire                      tb_fifo_overflow;
  
  assign tb_fifo_wr_en = ~tb_fifo_overflow & r_fifo_wr_en;

  // fst dump command
  initial begin
    $dumpfile ("tb_axis.fst");
    $dumpvars (0, tb_axis);
    #1;
  end

  always @(posedge tb_dut_clk)
  begin
    if(tb_dut_rstn_delay == 1'b0)
    begin
      r_fifo_wr_en <= 1'b0;
      r_eof <= 1'b0;
      rr_eof <= 1'b0;
      rr_fifo_wr_data <= 0;
      r_fifo_wr_data <= 0;
      bytes_read = 1;
      r_toggle = 0;
    end else begin
      rr_eof <= r_eof & ~tb_fifo_overflow & tb_dut_valid;

      rr_fifo_wr_data <= r_fifo_wr_data;

      r_toggle <= ~r_toggle;

      if(~tb_fifo_overflow & r_toggle)
      begin
        bytes_read = $read_binary_file(IN_FILE_NAME, r_fifo_wr_data);

        r_fifo_wr_en <= 1'b1;
      end

      if(~tb_fifo_overflow & ~r_toggle)
      begin
        r_fifo_wr_data <= 0;
        r_fifo_wr_en <= 1'b0;
      end

      r_eof <= 1'b0;

      if(bytes_read < 0) begin
        r_eof <= 1'b1;
      end

      if(bytes_read == 0) begin
        r_eof <= 1'b1;
        rr_fifo_wr_data <= 0;
        r_fifo_wr_en <= 1'b0;
      end
    end
  end

  clk_stimulus #(
    .CLOCKS(1), // # of clocks
    .CLOCK_BASE(1000000), // clock time base mhz
    .CLOCK_INC(10), // clock time diff mhz
    .RESETS(2), // # of resets
    .RESET_BASE(20000), // time to stay in reset
    .RESET_INC(10000) // time diff for other resets
  ) clk_stim (
    //clk out ... maybe a vector of clks with diff speeds.
    .clkv(tb_dut_clk),
    //rstn out ... maybe a vector of rsts with different off times
    .rstnv({tb_dut_rstn, tb_dut_rstn_delay}),
    .rstv({tb_dut_rst, tb_dut_rst_delay})
  );
  
  util_cpack2_axis #(
    .NUM_OF_CHANNELS(4),
    .SAMPLES_PER_CHANNEL(1),
    .SAMPLE_DATA_WIDTH(16)
  ) dut (
    .clk(tb_dut_clk),
    .reset(tb_dut_rst),

    .enable_0(1'b1),
    .enable_1(1'b1),
    .enable_2(1'b1),
    .enable_3(1'b1),
    .enable_4(),
    .enable_5(),
    .enable_6(),
    .enable_7(),
    .enable_8(),
    .enable_9(),
    .enable_10(),
    .enable_11(),
    .enable_12(),
    .enable_13(),
    .enable_14(),
    .enable_15(),
    .enable_16(),
    .enable_17(),
    .enable_18(),
    .enable_19(),
    .enable_20(),
    .enable_21(),
    .enable_22(),
    .enable_23(),
    .enable_24(),
    .enable_25(),
    .enable_26(),
    .enable_27(),
    .enable_28(),
    .enable_29(),
    .enable_30(),
    .enable_31(),
    .enable_32(),
    .enable_33(),
    .enable_34(),
    .enable_35(),
    .enable_36(),
    .enable_37(),
    .enable_38(),
    .enable_39(),
    .enable_40(),
    .enable_41(),
    .enable_42(),
    .enable_43(),
    .enable_44(),
    .enable_45(),
    .enable_46(),
    .enable_47(),
    .enable_48(),
    .enable_49(),
    .enable_50(),
    .enable_51(),
    .enable_52(),
    .enable_53(),
    .enable_54(),
    .enable_55(),
    .enable_56(),
    .enable_57(),
    .enable_58(),
    .enable_59(),
    .enable_60(),
    .enable_61(),
    .enable_62(),
    .enable_63(),

    .fifo_wr_en(tb_fifo_wr_en),
    .fifo_wr_overflow(tb_fifo_overflow),

    .fifo_wr_data_0(r_fifo_wr_data[15:0]),
    .fifo_wr_data_1(r_fifo_wr_data[31:16]),
    .fifo_wr_data_2(r_fifo_wr_data[47:32]),
    .fifo_wr_data_3(r_fifo_wr_data[63:48]),
    .fifo_wr_data_4(),
    .fifo_wr_data_5(),
    .fifo_wr_data_6(),
    .fifo_wr_data_7(),
    .fifo_wr_data_8(),
    .fifo_wr_data_9(),
    .fifo_wr_data_10(),
    .fifo_wr_data_11(),
    .fifo_wr_data_12(),
    .fifo_wr_data_13(),
    .fifo_wr_data_14(),
    .fifo_wr_data_15(),
    .fifo_wr_data_16(),
    .fifo_wr_data_17(),
    .fifo_wr_data_18(),
    .fifo_wr_data_19(),
    .fifo_wr_data_20(),
    .fifo_wr_data_21(),
    .fifo_wr_data_22(),
    .fifo_wr_data_23(),
    .fifo_wr_data_24(),
    .fifo_wr_data_25(),
    .fifo_wr_data_26(),
    .fifo_wr_data_27(),
    .fifo_wr_data_28(),
    .fifo_wr_data_29(),
    .fifo_wr_data_30(),
    .fifo_wr_data_31(),
    .fifo_wr_data_32(),
    .fifo_wr_data_33(),
    .fifo_wr_data_34(),
    .fifo_wr_data_35(),
    .fifo_wr_data_36(),
    .fifo_wr_data_37(),
    .fifo_wr_data_38(),
    .fifo_wr_data_39(),
    .fifo_wr_data_40(),
    .fifo_wr_data_41(),
    .fifo_wr_data_42(),
    .fifo_wr_data_43(),
    .fifo_wr_data_44(),
    .fifo_wr_data_45(),
    .fifo_wr_data_46(),
    .fifo_wr_data_47(),
    .fifo_wr_data_48(),
    .fifo_wr_data_49(),
    .fifo_wr_data_50(),
    .fifo_wr_data_51(),
    .fifo_wr_data_52(),
    .fifo_wr_data_53(),
    .fifo_wr_data_54(),
    .fifo_wr_data_55(),
    .fifo_wr_data_56(),
    .fifo_wr_data_57(),
    .fifo_wr_data_58(),
    .fifo_wr_data_59(),
    .fifo_wr_data_60(),
    .fifo_wr_data_61(),
    .fifo_wr_data_62(),
    .fifo_wr_data_63(),

    .m_axis_tdata(tb_dut_data),
    .m_axis_tvalid(tb_dut_valid),
    .m_axis_tready(tb_dut_ready),
    .m_axis_tuser(tb_dut_user)
  );
  
  master_axis_stimulus #(
    .BUS_WIDTH(BUS_WIDTH),
    .USER_WIDTH(USER_WIDTH),
    .DEST_WIDTH(DEST_WIDTH),
    .RAND_READY(RAND_READY),
    .FILE(OUT_FILE_NAME)
  ) master_axis_stim (
    // write
    .s_axis_aclk(tb_dut_clk),
    .s_axis_arstn(tb_dut_rstn_delay),
    .s_axis_tvalid(tb_dut_valid),
    .s_axis_tready(tb_dut_ready),
    .s_axis_tdata(tb_dut_data),
    .s_axis_tkeep(tb_dut_keep),
    .s_axis_tlast(tb_dut_last),
    .s_axis_tuser(tb_dut_user),
    .s_axis_tdest(tb_dut_dest),
    .eof(rr_eof)
  );
  
endmodule

