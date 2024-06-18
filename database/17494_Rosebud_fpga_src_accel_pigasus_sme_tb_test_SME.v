// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module test_SME # (
  parameter BYTE_COUNT = 16
) (
  input  wire                    clk,
  input  wire                    rst,

  // AXI Stream input
  input  wire [BYTE_COUNT*8-1:0] s_axis_tdata,
  input  wire [BYTE_COUNT-1:0]   s_axis_tkeep,
  input  wire                    s_axis_tvalid,
  input  wire                    s_axis_tlast,
  output wire                    s_axis_tready,

  input  wire                    meta_valid,
  input  wire                    has_preamble,
  input  wire                    is_tcp,
  input  wire [15:0]             src_port,
  input  wire [15:0]             dst_port,
  input  wire [55:0]             preamble,

  output wire [31:0]             sme_output,
  output wire                    sme_output_v,
  output wire [63:0]             state_out
);
  // Generate empty signal, accel_dma_rd_sp provides it in accel wrap
  reg [$clog2(BYTE_COUNT)-1:0] s_axis_tempty;
  integer l;
  always @ (*) begin
    s_axis_tempty = 0;
    for (l=BYTE_COUNT-1; l>=0; l=l-1)
      if (!s_axis_tkeep[l])
        s_axis_tempty = s_axis_tempty+1;
  end

  reg s_axis_tfirst;

  always @ (posedge clk) begin
    s_axis_tfirst <= (s_axis_tfirst || !s_axis_tvalid || (s_axis_tvalid && s_axis_tready && s_axis_tlast))
                    && ! (s_axis_tvalid && s_axis_tready && !s_axis_tlast);

    if (rst) s_axis_tfirst <= 1'b0;
  end

  wire [71:0]  wr_data = 72'd0;
  wire [16:0]  wr_addr = 17'd0;
  wire         wr_en   = 1'b0;

  wire [63:0] preamble_state;
  wire [15:0] src_port_f, dst_port_f;
  wire        meta_data_valid, meta_data_ready;

  basic_fifo # (
    .ADDR_WIDTH(10),
    .DATA_WIDTH(64+32)
  ) meta_data_fifo (
    .clk(clk),
    .rst(rst),
    .clear(1'b0),

    .din_valid(meta_valid),
    .din({3'd0, has_preamble, 3'd0, is_tcp, preamble,
          src_port, dst_port}),
    .din_ready(),

    .dout_valid(meta_data_valid),
    .dout({preamble_state, src_port_f, dst_port_f}),
    .dout_ready(meta_data_ready)
  );

  pigasus_sme_wrapper # (
    .BYTE_COUNT(BYTE_COUNT),
    .STRB_COUNT($clog2(BYTE_COUNT))
  ) dut (
    .clk(clk),
    .rst(rst),

    // AXI Stream input
    .s_axis_tdata (s_axis_tdata),
    .s_axis_tempty(s_axis_tempty),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tfirst(s_axis_tfirst),
    .s_axis_tlast (s_axis_tlast),
    .s_axis_tready(s_axis_tready),

    .wr_data(wr_data),
    .wr_addr(wr_addr),
    .wr_en(wr_en),

    // Metadata
    .preamble_state_in(preamble_state),
    .src_port({src_port_f[7:0], src_port_f[15:8]}),
    .dst_port({dst_port_f[7:0], dst_port_f[15:8]}),
    .meta_valid(meta_data_valid),
    .meta_ready(meta_data_ready),

    // Match output
    .match_release(1'b1),
    .match_rules_ID(sme_output),
    .match_valid(sme_output_v),
    .match_last(),
    .preamble_state_out(state_out)
  );

  ///////////////////////////////////////////////
  ////////////// Generating Waveform ////////////
  ///////////////////////////////////////////////
  initial begin
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_0.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_1.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_2.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_3.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_4.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_5.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_6.mem);
    $readmemh("./memory_init/match_table.mif",
              dut.pigasus.front.filter_inst.match_table_7.mem);

    $readmemh("./memory_init/rule_2_pg_packed.mif",
              dut.pg_inst.rule2pg_table_0_1.mem);
    $readmemh("./memory_init/rule_2_pg_packed.mif",
              dut.pg_inst.rule2pg_table_2_3.mem);

    $readmemh("./memory_init/hashtable0_packed.mif",
              dut.pigasus.back.hashtable_inst_0_0.mem);
    $readmemh("./memory_init/hashtable1_packed.mif",
              dut.pigasus.back.hashtable_inst_1_0.mem);

    $dumpfile ("sim_build/sim_results.fst");
    $dumpvars (0, test_SME);
    #1;
  end

  integer m;
  reg [31:0] pkt_counter = 1;

  always @ (posedge clk)
    if (sme_output_v)
      if (sme_output==0)
        pkt_counter <= pkt_counter + 1;
      else
        for (m=0; m<2; m=m+1)
          if (sme_output[m*16 +: 16]!=0)
            $display("Match on ouput %0d, value %h, in packet %0d", m, sme_output[m*16+:16], pkt_counter);

endmodule

`resetall
