// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`ifndef arbiter_router_ARBITER
`define arbiter_router_ARBITER
/*
  ==========================================================================
  Arbitrator module
  ==========================================================================
  This module is used to pick which component gets to output to the val/rdy
  SPI wrapper if multiple components can send a valid message.
  The arbitrator puts an address header on the outgoing packet so that
  downstream components can tell which component sent the response
  The nbits parameter is the length of the message.
  
  The num_inputs parameter is the number of input components that the
  Arbitrator is selecting from.
  NOTE: MUST be >= 2

  Original Author  : Dilan Lakhani
  Date             : Dec 19, 2021
*/

module arbiter_router_Arbiter #(
  parameter int nbits = 32,
  parameter int ninputs = 3,
  parameter int addr_nbits = $clog2(ninputs)
) (
  input logic clk,
  input logic reset,

  // Receive Interface - need recv signals for each component connected to arbitrator
  input  logic             istream_val[ninputs],
  output logic             istream_rdy[ninputs],
  input  logic [nbits-1:0] istream_msg[ninputs],

  // Send Interface
  output logic                        ostream_val,
  input  logic                        ostream_rdy,
  output logic [addr_nbits+nbits-1:0] ostream_msg
);
  logic [addr_nbits-1:0] grants_index;  // which input is granted access to send to SPI
  logic [addr_nbits-1:0] old_grants_index;
  logic [addr_nbits-1:0] encoder_out;
  logic [     nbits-1:0] ostream_msg_data;
  logic [addr_nbits-1:0] ostream_msg_addr;

  assign ostream_msg_data = istream_msg[grants_index];
  assign ostream_msg_addr = grants_index;
  assign ostream_val = istream_val[grants_index] & istream_rdy[grants_index];
  assign ostream_msg = {
    ostream_msg_addr, ostream_msg_data
  };  // append component address to the beginning of the message  


  always_comb begin
    // change grants_index if the last cycle's grant index is 0
    // (that component has finished sending its message)
    if (!istream_val[old_grants_index]) begin
      grants_index = encoder_out;
    end else begin
      grants_index = old_grants_index;
    end
  end

  generate
    for (genvar i = 0; i < ninputs; i++) begin : input_assign
      // Only tell one input that the arbitrator is ready for it
      assign istream_rdy[i] = (grants_index == i[addr_nbits-1:0]) ? ostream_rdy : 1'b0;
    end
  endgenerate

  generate
    // hooks up a chain of muxes to create a
    // priority encoder that gives highest priority to the LSB and lowest to MSB
    // Disable unoptflat because there isn't actually circular logic as different
    // indices are accessed each time
    /* verilator lint_off UNOPTFLAT */
    logic [addr_nbits-1:0] encoder_outs[ninputs+1];
    /* verilator lint_on UNOPTFLAT */
    assign encoder_outs[ninputs] = 0;
    for (genvar i = 0; i < ninputs; i++) begin
      // if this input is valid, then it is the highest priority. Otherwise, use the result of the next index
      assign encoder_outs[i] = istream_val[i] ? i : encoder_outs[i+1];
    end
    assign encoder_out = encoder_outs[0];
  endgenerate

  /*
    One issue arises with having multiple Disassemblers.
    Since the SPI width is normally less than the size of a response,
    a PacketDisassembler component needs multiple cycles to fully send a message to the arbitrator.
    Thus, we do not want to change which Disassembler is allowed to send to the Arbitrator
    in the middle of a message. Fix this by holding a trailing value of the grants_index.
    We need to be able to check the req_val of the old grants_index to make sure that it
    is not 1, then we can allow a different Disassembler to send a message.
  */

  always_ff @(posedge clk) begin
    if (reset) begin
      old_grants_index <= 0;
    end else begin
      old_grants_index <= grants_index;
    end
  end

endmodule
`endif
