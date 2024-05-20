// This program was cloned from: https://github.com/johnathan-convertino-afrl/ad_hdl_fusesoc
// License: MIT License

// ***************************************************************************
// ***************************************************************************
// @FILE    util_cpack2_axis.v
// @AUTHOR  JAY CONVERTINO
// @DATE    2024.04.01
// @BRIEF   Convert Analog Devices cpack2 from fifo to axis interface.
//
// @LICENSE MIT
//  Copyright 2024 Jay Convertino
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module util_cpack2_axis #(
  parameter NUM_OF_CHANNELS = 4,
  parameter SAMPLES_PER_CHANNEL = 1,
  parameter SAMPLE_DATA_WIDTH = 16
) (
  input clk,
  input reset,

  input enable_0,
  input enable_1,
  input enable_2,
  input enable_3,
  input enable_4,
  input enable_5,
  input enable_6,
  input enable_7,
  input enable_8,
  input enable_9,
  input enable_10,
  input enable_11,
  input enable_12,
  input enable_13,
  input enable_14,
  input enable_15,
  input enable_16,
  input enable_17,
  input enable_18,
  input enable_19,
  input enable_20,
  input enable_21,
  input enable_22,
  input enable_23,
  input enable_24,
  input enable_25,
  input enable_26,
  input enable_27,
  input enable_28,
  input enable_29,
  input enable_30,
  input enable_31,
  input enable_32,
  input enable_33,
  input enable_34,
  input enable_35,
  input enable_36,
  input enable_37,
  input enable_38,
  input enable_39,
  input enable_40,
  input enable_41,
  input enable_42,
  input enable_43,
  input enable_44,
  input enable_45,
  input enable_46,
  input enable_47,
  input enable_48,
  input enable_49,
  input enable_50,
  input enable_51,
  input enable_52,
  input enable_53,
  input enable_54,
  input enable_55,
  input enable_56,
  input enable_57,
  input enable_58,
  input enable_59,
  input enable_60,
  input enable_61,
  input enable_62,
  input enable_63,

  input fifo_wr_en,
  output fifo_wr_overflow,

  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_0,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_1,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_2,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_3,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_4,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_5,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_6,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_7,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_8,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_9,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_10,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_11,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_12,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_13,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_14,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_15,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_16,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_17,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_18,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_19,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_20,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_21,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_22,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_23,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_24,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_25,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_26,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_27,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_28,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_29,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_30,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_31,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_32,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_33,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_34,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_35,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_36,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_37,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_38,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_39,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_40,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_41,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_42,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_43,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_44,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_45,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_46,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_47,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_48,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_49,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_50,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_51,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_52,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_53,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_54,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_55,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_56,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_57,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_58,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_59,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_60,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_61,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_62,
  input [SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] fifo_wr_data_63,

  output [2**$clog2(NUM_OF_CHANNELS)*SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] m_axis_tdata,
  output m_axis_tvalid,
  input  m_axis_tready,
  output m_axis_tuser
);
  localparam st_run   = 2'h1;
  localparam st_hold  = 2'h3;
  localparam st_err   = 2'h0;

  reg [1:0] r_state = st_err;

  reg r_sync;
  reg r_wr_en;
  reg r_axis_tready;

  reg [2**$clog2(NUM_OF_CHANNELS)*SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] r_axis_tdata;
  reg r_axis_tvalid;
  reg r_axis_tuser;

  reg [2**$clog2(NUM_OF_CHANNELS)*SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] rr_axis_tdata;
  reg rr_axis_tvalid;
  reg rr_axis_tuser;


  wire packed_fifo_wr_overflow;
  wire packed_fifo_wr_sync;
  wire [2**$clog2(NUM_OF_CHANNELS)*SAMPLE_DATA_WIDTH*SAMPLES_PER_CHANNEL-1:0] packed_fifo_wr_data;
  wire packed_fifo_wr_en;

  // convert fifo to axis
  assign m_axis_tuser = r_axis_tvalid;
  assign m_axis_tdata = r_axis_tdata;
  assign m_axis_tvalid = r_axis_tuser;
  assign packed_fifo_wr_overflow = ~m_axis_tready;

  always @(posedge clk)
  begin
    if(reset)
    begin
      r_axis_tdata  <= 0;
      r_axis_tvalid <= 1'b0;
      r_axis_tuser  <= 1'b0;
      rr_axis_tdata  <= 0;
      rr_axis_tvalid <= 1'b0;
      rr_axis_tuser  <= 1'b0;
      r_state <= st_err;
    end else begin
      case(r_state)
        st_run: begin
          r_state <= st_run;

          if(m_axis_tready)
          begin
            r_axis_tdata    <= 0;
            r_axis_tvalid   <= 1'b0;
            r_axis_tuser    <= 1'b0;
          end

          if(packed_fifo_wr_en)
          begin
            r_axis_tdata    <= packed_fifo_wr_data;
            r_axis_tvalid   <= packed_fifo_wr_en;
            r_axis_tuser    <= packed_fifo_wr_sync;
          end

          if(~m_axis_tready & packed_fifo_wr_en)
          begin
            r_state <= st_hold;

            r_axis_tdata  <= r_axis_tdata;
            r_axis_tvalid <= r_axis_tvalid;
            r_axis_tuser  <= r_axis_tuser;

            rr_axis_tdata   <= packed_fifo_wr_data;
            rr_axis_tvalid  <= packed_fifo_wr_en;
            rr_axis_tuser   <= packed_fifo_wr_sync;
          end
        end
        st_hold: begin
          r_state <= st_hold;

          r_axis_tdata  <= r_axis_tdata;
          r_axis_tvalid <= r_axis_tvalid;
          r_axis_tuser  <= r_axis_tuser;

          if(m_axis_tready)
          begin
            r_state <= st_run;

            r_axis_tdata  <= rr_axis_tdata;
            r_axis_tvalid <= rr_axis_tvalid;
            r_axis_tuser  <= rr_axis_tuser;
          end
        end
        default:
          r_state <= st_run;
      endcase
    end
  end

   util_cpack2 #(
    .NUM_OF_CHANNELS(NUM_OF_CHANNELS),
    .SAMPLES_PER_CHANNEL(SAMPLES_PER_CHANNEL),
    .SAMPLE_DATA_WIDTH(SAMPLE_DATA_WIDTH)
  ) inst_cpack2 (

    .clk(clk),
    .reset(reset),

    .enable_0(enable_0),
    .enable_1(enable_1),
    .enable_2(enable_2),
    .enable_3(enable_3),
    .enable_4(enable_4),
    .enable_5(enable_5),
    .enable_6(enable_6),
    .enable_7(enable_7),
    .enable_8(enable_8),
    .enable_9(enable_9),
    .enable_10(enable_10),
    .enable_11(enable_11),
    .enable_12(enable_12),
    .enable_13(enable_13),
    .enable_14(enable_14),
    .enable_15(enable_15),
    .enable_16(enable_16),
    .enable_17(enable_17),
    .enable_18(enable_18),
    .enable_19(enable_19),
    .enable_20(enable_20),
    .enable_21(enable_21),
    .enable_22(enable_22),
    .enable_23(enable_23),
    .enable_24(enable_24),
    .enable_25(enable_25),
    .enable_26(enable_26),
    .enable_27(enable_27),
    .enable_28(enable_28),
    .enable_29(enable_29),
    .enable_30(enable_30),
    .enable_31(enable_31),
    .enable_32(enable_32),
    .enable_33(enable_33),
    .enable_34(enable_34),
    .enable_35(enable_35),
    .enable_36(enable_36),
    .enable_37(enable_37),
    .enable_38(enable_38),
    .enable_39(enable_39),
    .enable_40(enable_40),
    .enable_41(enable_41),
    .enable_42(enable_42),
    .enable_43(enable_43),
    .enable_44(enable_44),
    .enable_45(enable_45),
    .enable_46(enable_46),
    .enable_47(enable_47),
    .enable_48(enable_48),
    .enable_49(enable_49),
    .enable_50(enable_50),
    .enable_51(enable_51),
    .enable_52(enable_52),
    .enable_53(enable_53),
    .enable_54(enable_54),
    .enable_55(enable_55),
    .enable_56(enable_56),
    .enable_57(enable_57),
    .enable_58(enable_58),
    .enable_59(enable_59),
    .enable_60(enable_60),
    .enable_61(enable_61),
    .enable_62(enable_62),
    .enable_63(enable_63),

    .fifo_wr_en(fifo_wr_en),
    .fifo_wr_overflow(fifo_wr_overflow),

    .fifo_wr_data_0(fifo_wr_data_0),
    .fifo_wr_data_1(fifo_wr_data_1),
    .fifo_wr_data_2(fifo_wr_data_2),
    .fifo_wr_data_3(fifo_wr_data_3),
    .fifo_wr_data_4(fifo_wr_data_4),
    .fifo_wr_data_5(fifo_wr_data_5),
    .fifo_wr_data_6(fifo_wr_data_6),
    .fifo_wr_data_7(fifo_wr_data_7),
    .fifo_wr_data_8(fifo_wr_data_8),
    .fifo_wr_data_9(fifo_wr_data_9),
    .fifo_wr_data_10(fifo_wr_data_10),
    .fifo_wr_data_11(fifo_wr_data_11),
    .fifo_wr_data_12(fifo_wr_data_12),
    .fifo_wr_data_13(fifo_wr_data_13),
    .fifo_wr_data_14(fifo_wr_data_14),
    .fifo_wr_data_15(fifo_wr_data_15),
    .fifo_wr_data_16(fifo_wr_data_16),
    .fifo_wr_data_17(fifo_wr_data_17),
    .fifo_wr_data_18(fifo_wr_data_18),
    .fifo_wr_data_19(fifo_wr_data_19),
    .fifo_wr_data_20(fifo_wr_data_20),
    .fifo_wr_data_21(fifo_wr_data_21),
    .fifo_wr_data_22(fifo_wr_data_22),
    .fifo_wr_data_23(fifo_wr_data_23),
    .fifo_wr_data_24(fifo_wr_data_24),
    .fifo_wr_data_25(fifo_wr_data_25),
    .fifo_wr_data_26(fifo_wr_data_26),
    .fifo_wr_data_27(fifo_wr_data_27),
    .fifo_wr_data_28(fifo_wr_data_28),
    .fifo_wr_data_29(fifo_wr_data_29),
    .fifo_wr_data_30(fifo_wr_data_30),
    .fifo_wr_data_31(fifo_wr_data_31),
    .fifo_wr_data_32(fifo_wr_data_32),
    .fifo_wr_data_33(fifo_wr_data_33),
    .fifo_wr_data_34(fifo_wr_data_34),
    .fifo_wr_data_35(fifo_wr_data_35),
    .fifo_wr_data_36(fifo_wr_data_36),
    .fifo_wr_data_37(fifo_wr_data_37),
    .fifo_wr_data_38(fifo_wr_data_38),
    .fifo_wr_data_39(fifo_wr_data_39),
    .fifo_wr_data_40(fifo_wr_data_40),
    .fifo_wr_data_41(fifo_wr_data_41),
    .fifo_wr_data_42(fifo_wr_data_42),
    .fifo_wr_data_43(fifo_wr_data_43),
    .fifo_wr_data_44(fifo_wr_data_44),
    .fifo_wr_data_45(fifo_wr_data_45),
    .fifo_wr_data_46(fifo_wr_data_46),
    .fifo_wr_data_47(fifo_wr_data_47),
    .fifo_wr_data_48(fifo_wr_data_48),
    .fifo_wr_data_49(fifo_wr_data_49),
    .fifo_wr_data_50(fifo_wr_data_50),
    .fifo_wr_data_51(fifo_wr_data_51),
    .fifo_wr_data_52(fifo_wr_data_52),
    .fifo_wr_data_53(fifo_wr_data_53),
    .fifo_wr_data_54(fifo_wr_data_54),
    .fifo_wr_data_55(fifo_wr_data_55),
    .fifo_wr_data_56(fifo_wr_data_56),
    .fifo_wr_data_57(fifo_wr_data_57),
    .fifo_wr_data_58(fifo_wr_data_58),
    .fifo_wr_data_59(fifo_wr_data_59),
    .fifo_wr_data_60(fifo_wr_data_60),
    .fifo_wr_data_61(fifo_wr_data_61),
    .fifo_wr_data_62(fifo_wr_data_62),
    .fifo_wr_data_63(fifo_wr_data_63),

    .packed_fifo_wr_en(packed_fifo_wr_en),
    .packed_fifo_wr_overflow(packed_fifo_wr_overflow),
    .packed_fifo_wr_sync(packed_fifo_wr_sync),
    .packed_fifo_wr_data(packed_fifo_wr_data)
  );

endmodule
