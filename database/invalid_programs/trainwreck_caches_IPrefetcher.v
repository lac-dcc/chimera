`include "riscvConst.vh"
`include "macros.vh"

module IPrefetcher #
(
  parameter CPU_WIDTH = 64,
  parameter WORD_ADDR_BITS = 30,
  parameter MEM_REQ_LSB = `ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)
)
(
  input clk,
  input reset,
  
  input  ic_mem_req_val,
  output ic_mem_req_rdy,
  input [WORD_ADDR_BITS-1:MEM_REQ_LSB] ic_mem_req_addr,

  output ic_mem_resp_val,
  output reg ic_mem_resp_nack,
  output [`MEM_DATA_BITS-1:0] ic_mem_resp_data,

  output mem_req_val,
  input  mem_req_rdy,
  output [WORD_ADDR_BITS-1:MEM_REQ_LSB] mem_req_addr,
  output mem_req_tag,

  input mem_resp_val,
  input mem_resp_nack,
  input [`MEM_DATA_BITS-1:0] mem_resp_data,
  input mem_resp_tag
);

  reg [2:0] state, next_state;
  localparam STATE_INVALID = 3'b000;
  localparam STATE_VALID = 3'b001;
  localparam STATE_REFILLING = 3'b010;
  localparam STATE_REQ_WAIT = 3'b011;
  localparam STATE_RESP_WAIT = 3'b100;
  localparam STATE_BAD_RESP_WAIT = 3'b101;

  reg forward;
  reg [WORD_ADDR_BITS-1:MEM_REQ_LSB] prefetch_addr;
  wire match = prefetch_addr == ic_mem_req_addr;
  wire hit = (state != STATE_INVALID) & (state != STATE_REQ_WAIT) & match;
  wire demand_miss = ic_mem_req_val & ic_mem_req_rdy;

  assign ic_mem_req_rdy = mem_req_rdy;
  wire ip_mem_req_rdy = ic_mem_req_rdy & ~(ic_mem_req_val & ~hit);
  assign mem_req_val = ic_mem_req_val & ~hit | (state == STATE_REQ_WAIT);
  assign mem_req_tag = ~(ic_mem_req_val & ~hit);
  assign mem_req_addr = mem_req_tag ? prefetch_addr : ic_mem_req_addr;

  reg pdq_reset;
  wire pdq_deq_val;
  wire [`MEM_DATA_BITS-1:0] pdq_deq_bits;
  reg [`ceilLog2(`MEM_DATA_CYCLES)-1:0] fill_cnt;
  reg [`ceilLog2(`MEM_DATA_CYCLES)-1:0] forward_cnt;
  wire forward_done
    = forward_cnt == {`ceilLog2(`MEM_DATA_CYCLES){1'b1}} & pdq_deq_val;

  assign ic_mem_resp_val = mem_resp_val & ~mem_resp_tag |
                           forward & pdq_deq_val;
  assign ic_mem_resp_data = forward ? pdq_deq_bits : mem_resp_data;

  wire ip_mem_resp_val = mem_resp_val & mem_resp_tag;
  wire ip_mem_resp_nack = mem_resp_nack & mem_resp_tag;

  wire fill_done
    = fill_cnt == {`ceilLog2(`MEM_DATA_CYCLES){1'b1}} & ip_mem_resp_val;

  always @(*)
  begin
    case(state)
      STATE_INVALID: next_state
        = demand_miss ? STATE_REQ_WAIT
        : STATE_INVALID;
      STATE_VALID: next_state
        = demand_miss | forward & forward_done ? STATE_REQ_WAIT
        : STATE_VALID;
      STATE_REFILLING: next_state
        = demand_miss & ~match & fill_done ? STATE_REQ_WAIT
        : demand_miss & ~match ? STATE_BAD_RESP_WAIT
        : fill_done ? STATE_VALID
        : STATE_REFILLING;
      STATE_REQ_WAIT: next_state
        = ip_mem_req_rdy ? STATE_RESP_WAIT
        : STATE_REQ_WAIT;
      STATE_RESP_WAIT: next_state
        = ip_mem_resp_nack ? STATE_INVALID
        : demand_miss & ~match ? STATE_BAD_RESP_WAIT
        : ip_mem_resp_val ? STATE_REFILLING
        : STATE_RESP_WAIT;
      STATE_BAD_RESP_WAIT: next_state
        = ip_mem_resp_nack ? STATE_INVALID
        : fill_done & ip_mem_resp_val ? STATE_REQ_WAIT
        : STATE_BAD_RESP_WAIT;
    endcase
  end

  `VC_SIMPLE_QUEUE(`MEM_DATA_BITS, `MEM_DATA_CYCLES) pdq
  (
    .clk(clk),
    .reset(pdq_reset),

    .enq_bits(mem_resp_data),
    .enq_val(ip_mem_resp_val),
    .enq_rdy(),

    .deq_bits(pdq_deq_bits),
    .deq_val(pdq_deq_val),
    .deq_rdy(forward)
  );

  always @(posedge clk)
  begin
    if(reset)
    begin
      ic_mem_resp_nack <= 1'b0;
      forward <= 1'b0;
      state <= STATE_INVALID;
      pdq_reset <= 1'b1;
      fill_cnt <= {`ceilLog2(`MEM_DATA_CYCLES){1'b0}};
      forward_cnt <= {`ceilLog2(`MEM_DATA_CYCLES){1'b0}};
    end
    else
    begin
      ic_mem_resp_nack <= mem_resp_nack & ~mem_resp_tag |
                          (demand_miss & hit | forward) & ip_mem_resp_nack;
                       
      pdq_reset <= demand_miss & ~hit | state == STATE_BAD_RESP_WAIT;
      forward <= (demand_miss & hit | forward & ~forward_done) & ~ip_mem_resp_nack;
      state <= next_state;

      if(ip_mem_resp_val)
        fill_cnt <= fill_cnt+1'b1;
      if(forward & pdq_deq_val)
        forward_cnt <= forward_cnt+1'b1;
    end

    if(demand_miss)
      prefetch_addr <= ic_mem_req_addr + 1'b1*`MEM_DATA_CYCLES;
  end
  
endmodule
