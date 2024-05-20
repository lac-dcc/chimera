// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef arbiter_router_ROUTER
`define arbiter_router_ROUTER
`include "../cmn/muxes.v"
`include "../cmn/demuxes.v"
`include "../cmn/queues.v"

/*
  * Module: Router
  *
  * Functionality: The router takes in an n-bit long message, and uses the first log2(number of outputs) of the input
  * to determine which receiving port receives a high valid bit. All receiving ports receive the input but not a 
  * corresponding high valid bit. The block itself outputs a low ready bit if its internal queue is full;
  * otherwise the ready bit is high.
  * 
  * NOTE: Address bits are not truncated from the input message.
  *
  * Dependencies: muxes.v, demuxes.v, queues.v
  * @param nbits: number of total bits in the message (includes address bits)
  * @param noutputs: number of output ports
*/
module arbiter_router_Router #(
  parameter int nbits = 32,
  parameter int noutputs = 8
) (
  input logic clk,
  input logic reset,

  // In stream
  input  logic             istream_val,
  input  logic [nbits-1:0] istream_msg,
  output logic             istream_rdy,

  // Out stream
  output logic             ostream_val[noutputs],
  output logic [nbits-1:0] ostream_msg[noutputs],
  input  logic             ostream_rdy[noutputs]
);
  // Number of address bits
  localparam int n_addr_bits = $clog2(noutputs);

  logic [n_addr_bits-1:0] select;
  logic [      nbits-1:0] payload_msg;
  logic                   payload_val;
  logic                   payload_rdy;

  assign select = payload_msg[nbits-1 : nbits-n_addr_bits];

  // not used, assigned to the unused net below
  logic [$clog2(3):0] num_free_entries;

  cmn_Queue #(
    .p_msg_nbits(nbits),
    .p_num_msgs (3)
  ) queue_inst (
    .clk             (clk),
    .reset           (reset),
    .enq_val         (istream_val),
    .enq_rdy         (istream_rdy),
    .enq_msg         (istream_msg),
    .deq_val         (payload_val),
    .deq_rdy         (payload_rdy),
    .deq_msg         (payload_msg),
    .num_free_entries(num_free_entries)
  );

  // Ready bit
  cmn_MuxN #(
    .nbits  (1),
    .ninputs(noutputs)
  ) mux_inst (
    .in (ostream_rdy),
    .sel(select),
    .out(payload_rdy)
  );

  // Valid bit
  cmn_DemuxN #(
    .nbits   (1),
    .noutputs(noutputs)
  ) demux_inst (
    .in (payload_val),
    .sel(select),
    .out(ostream_val)
  );

  generate
    for (genvar i = 0; i < noutputs; i = i + 1) begin : output_gen
      assign ostream_msg[i] = payload_msg;
    end
  endgenerate

  /* verilator lint_off UNUSED */
  logic unused = &{1'b0, num_free_entries, 1'b0};
  /* verilator lint_on UNUSED */
endmodule
`endif
