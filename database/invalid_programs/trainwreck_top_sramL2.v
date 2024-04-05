extern "A" void memory_tick
(
  input  bit                       mem_req_val,
  output bit                       mem_req_rdy,
  input  bit [1:0]                 mem_req_rw,
  input  bit [`MEM_ADDR_BITS-1:0]  mem_req_addr,
  input  bit [`MEM_L2TAG_BITS-1:0] mem_req_tag,
  input  bit [`MEM_DATA_BITS-1:0]  mem_req_data,
  
  output bit                       mem_resp_val,
  output bit                       mem_resp_nack,
  output bit [`MEM_L2TAG_BITS-1:0] mem_resp_tag,
  output bit [`MEM_DATA_BITS-1:0]  mem_resp_data
);
  
module sramL2
(
  input clk,
  input reset,

  input                        mem_req_val,
  output                       mem_req_rdy,
  input  [1:0]                 mem_req_rw,
  input  [`MEM_ADDR_BITS-1:0]  mem_req_addr,
  input  [`MEM_DATA_BITS-1:0]  mem_req_data,
  input  [`MEM_L2TAG_BITS-1:0] mem_req_tag,

  output                       mem_resp_val,
  output                       mem_resp_nack,
  output [`MEM_DATA_BITS-1:0]  mem_resp_data,
  output [`MEM_L2TAG_BITS-1:0] mem_resp_tag
);

  bit                       mem_req_rdy_r;
  bit                       mem_resp_val_r;
  bit                       mem_resp_nack_r;
  bit [`MEM_DATA_BITS-1:0]  mem_resp_data_r;
  bit [`MEM_L2TAG_BITS-1:0] mem_resp_tag_r;

  assign #0.6 mem_req_rdy = mem_req_rdy_r;
  assign #0.6 mem_resp_val = mem_resp_val_r;
  assign #0.6 mem_resp_nack = mem_resp_nack_r;
  assign #0.6 mem_resp_data = mem_resp_data_r;
  assign #0.6 mem_resp_tag = mem_resp_tag_r;

  always @(posedge clk)
  begin
    if (!reset)
    begin
      memory_tick
      (
        mem_req_val,
        mem_req_rdy_r,
        mem_req_rw,
        mem_req_addr,
        mem_req_tag,
        mem_req_data,
        
        mem_resp_val_r,
        mem_resp_nack_r,
        mem_resp_tag_r,
        mem_resp_data_r
      );
    end
    else
    begin
      mem_req_rdy_r   <= 0;
      mem_resp_val_r  <= 0;
      mem_resp_nack_r  <= 0;
      mem_resp_tag_r  <= 0;
      mem_resp_data_r <= 0;
    end
  end

endmodule
