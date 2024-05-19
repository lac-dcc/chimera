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

module test_pigasus # (
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

  output wire [15:0]             sme_output [16],
  output wire                    sme_output_v
);

  reg [$clog2(BYTE_COUNT)-1:0] s_axis_tempty;
  integer l;
  always @ (*) begin
    s_axis_tempty = 0;
    for (l=BYTE_COUNT-1; l>=0; l=l-1)
      if (!s_axis_tkeep[l])
        s_axis_tempty = s_axis_tempty+1;
  end

  reg valid_r;
  always @ (posedge clk)
    if(rst)
      valid_r <= 1'b0;
    else
      valid_r <= s_axis_tvalid;

  wire sop = s_axis_tvalid & !valid_r;

  reg  [55:0]   last_7_bytes;

  reg [BYTE_COUNT*8-1:0] s_axis_tdata_rev;
  integer k;
  always @ (*)
    for (k=1;k<=BYTE_COUNT;k=k+1)
      s_axis_tdata_rev[(k-1)*8+:8] = s_axis_tdata[(BYTE_COUNT-k)*8+:8] | {8{~s_axis_tkeep[BYTE_COUNT-k]}};

  wire [127:0] pigasus_data;
  wire         pigasus_valid;
  wire         pigasus_ready;
  wire         pigasus_sop;
  wire         pigasus_eop;
  wire [3:0]   pigasus_empty;

  wire [71:0]  wr_data;
  wire [18:0]  wr_addr;
  wire         wr_en;

  assign wr_en = 1'b0;

  string_matcher pigasus (
    .clk(clk),
    .rst(rst),

    .in_pkt_data(s_axis_tdata_rev),
    .in_pkt_empty(s_axis_tempty),
    .in_pkt_valid(s_axis_tvalid),
    .in_pkt_sop(sop),
    .in_pkt_eop(s_axis_tlast),
    .in_pkt_ready(s_axis_tready),

    .wr_data(wr_data[63:0]),
    .wr_addr(wr_addr),
    .wr_en(wr_en),

    .out_usr_data(pigasus_data),
    .out_usr_valid(pigasus_valid),
    .out_usr_ready(pigasus_ready),
    .out_usr_sop(pigasus_sop),
    .out_usr_eop(pigasus_eop),
    .out_usr_empty(pigasus_empty)
  );

  wire [127:0] concat_sme_output;

  port_group pg_inst (
    .clk(clk),
    .rst(rst),

    .in_usr_sop(pigasus_sop),
    .in_usr_eop(pigasus_eop),
    .in_usr_data(pigasus_data),
    .in_usr_empty(pigasus_empty),
    .in_usr_valid(pigasus_valid),
    .in_usr_ready(pigasus_ready),

    .in_meta_valid(1'b1),
    .src_port(16'd1025),
    .dst_port(16'd1024),
    .is_tcp(1'b1),
    .in_meta_ready(),
    
    .wr_data(wr_data[71:0]),
    .wr_addr(wr_addr[12:0]),
    .wr_en(wr_en && (wr_addr[18:17]==2'b11)),

    .out_usr_data(concat_sme_output),
    .out_usr_valid(sme_output_v),
    .out_usr_ready(1'b1),
    .out_usr_sop(),
    .out_usr_eop(),
    .out_usr_empty(),

    .no_pg_rule_cnt(),
    .pg_rule_cnt()
  );

  ///////////////////////////////////////////////
  ////////// Keeping last bytes logic ///////////
  ///////////////////////////////////////////////
  reg [BYTE_COUNT*8-1:0]       last_word;
  reg [63:0]                   one_to_last_word;
  reg [$clog2(BYTE_COUNT)-1:0] last_word_shift;
  reg                          last_word_valid;

  always @ (posedge clk) begin
    last_word_valid <= 1'b0; //1 hot
    if (s_axis_tvalid && s_axis_tready) begin
      if (!s_axis_tlast) begin
        one_to_last_word <= s_axis_tdata[BYTE_COUNT*8-1:BYTE_COUNT*8-64];
      end else begin
        last_word <= s_axis_tdata;
        last_word_shift <= s_axis_tempty;
        last_word_valid <= 1'b1;
      end
    end

    if (sop | rst) begin
      one_to_last_word <= {64{1'b1}}; //not correct
      last_word_valid <= 1'b0;
    end
  end

  wire [(BYTE_COUNT+8)*8-1:0] shifted_word = {last_word,one_to_last_word} << last_word_shift;

  always @ (posedge clk) begin
    if (last_word_valid)
      last_7_bytes <= shifted_word[(BYTE_COUNT+8)*8-1:(BYTE_COUNT+1)*8];
    if (rst)
      last_7_bytes <= {56{1'b1}};
  end

  ///////////////////////////////////////////////
  ////////////// Generating Waveform ////////////
  ///////////////////////////////////////////////
  genvar i;
  generate
    for (i=0; i<8; i=i+1)
      assign sme_output[i] = concat_sme_output[i*16 +: 16];
  endgenerate

  integer j;
  initial begin
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_0.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_1.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_2.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_3.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_4.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_5.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_6.mem);
    $readmemh("./memory_init/match_table.mif", 
              pigasus.front.filter_inst.match_table_7.mem);

    $readmemh("./memory_init/rule_2_pg_packed.mif",
              pg_inst.rule2pg_table_0_1.mem);
    $readmemh("./memory_init/rule_2_pg_packed.mif",
              pg_inst.rule2pg_table_2_3.mem);
    $readmemh("./memory_init/rule_2_pg_packed.mif",
              pg_inst.rule2pg_table_4_5.mem);
    $readmemh("./memory_init/rule_2_pg_packed.mif",
              pg_inst.rule2pg_table_6_7.mem);

    $readmemh("./memory_init/hashtable0_packed.mif", 
              pigasus.back.hashtable_inst_0_0.mem);
    $readmemh("./memory_init/hashtable1_packed.mif", 
              pigasus.back.hashtable_inst_1_0.mem);

    $dumpfile ("sim_build/sim_results.fst");
    $dumpvars (0,test_pigasus);
    for (j=0; j<8; j=j+1)
      $dumpvars (0,sme_output[j]);
    #1;
  end

  integer m;
  always @ (posedge clk)
    for (m=0; m<8; m=m+1)
      if ((sme_output[m]!=0) && (sme_output_v))
        $display("Match on ouput %0d, value %h", m, sme_output[m]);

endmodule

`resetall
