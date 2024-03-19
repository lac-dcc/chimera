`define L2_TAG_BITS 5

module sramL2_256K
(
  input clk,
  input reset,

  input                        mem_req_val,
  output                       mem_req_rdy,
  input  [1:0]                 mem_req_rw,
  input  [13:0]                mem_req_addr,
  input  [127:0]               mem_req_data,
  input  [`L2_TAG_BITS-1:0]    mem_req_tag,

  output                       mem_resp_val,
  output                       mem_resp_nack,
  output [127:0]               mem_resp_data,
  output [`L2_TAG_BITS-1:0]    mem_resp_tag
);

  localparam L2_Idle = 1'd0;
  localparam L2_Busy = 1'd1;

  reg [127:0] mem_req_data_reg, mem_resp_data_reg;
  reg [13:0]  mem_req_addr_reg, mem_req_addr_next;
  reg         mem_req_val_reg, mem_req_val_next;
  reg         mem_req_rdy_reg, mem_req_rdy_next;
  reg [`L2_TAG_BITS-1:0] mem_req_tag_reg, mem_req_tag_next;
  reg [1:0]   mem_req_rw_reg;

  reg [2:0]   mem_resp_val_reg;
  reg [`L2_TAG_BITS*3-1:0] mem_resp_tag_reg;

  reg [1:0]   addr_cnt_reg, addr_cnt_next;
  reg         state, nstate;

  wire [127:0] sram_dout;
  wire         mem_req_store;

  assign mem_req_rdy = mem_req_rdy_reg;
  assign mem_resp_val = mem_resp_val_reg[2];
  assign mem_resp_nack = 1'b0;
  assign mem_resp_tag = mem_resp_tag_reg[`L2_TAG_BITS*3-1:`L2_TAG_BITS*2];
  assign mem_resp_data = mem_resp_data_reg;

  always @(posedge clk)
  begin
    if (reset)
    begin
      state <= L2_Idle;
      mem_req_addr_reg <= 128'd0;
      mem_req_data_reg <= 128'd0;
      mem_req_val_reg <= 1'b0;
      mem_req_rdy_reg <= 1'b0;
      mem_req_tag_reg <= 0;
      mem_req_rw_reg <= 2'd0;
      mem_resp_val_reg <= 4'd0;
      mem_resp_data_reg <= 128'd0;
      mem_resp_tag_reg <= 0;
      addr_cnt_reg <= 2'd0;
    end
    else
    begin
      state <= nstate;
      mem_req_addr_reg <= mem_req_addr_next;
      mem_req_data_reg <= mem_req_data;
      mem_req_val_reg <= mem_req_val_next;
      mem_req_rdy_reg <= mem_req_rdy_next;
      mem_req_tag_reg <= mem_req_tag_next;
      if (mem_req_val & mem_req_rdy_reg)
        mem_req_rw_reg <= mem_req_rw;
      mem_resp_val_reg <= {mem_resp_val_reg[1], mem_resp_val_reg[0], mem_req_val_reg & ~mem_req_rw_reg[0]};
      mem_resp_tag_reg <= {mem_resp_tag_reg[`L2_TAG_BITS*2-1:`L2_TAG_BITS],mem_resp_tag_reg[`L2_TAG_BITS-1:0], mem_req_tag_reg}; 
      addr_cnt_reg <= addr_cnt_next;
      mem_resp_data_reg <= sram_dout;
    end
  end

  assign mem_req_store = (state == L2_Idle) & mem_req_rw_reg[0] & mem_req_val_reg;

`ifdef ASIC
  SRAM6T_128x16384 data_array
  (
    .clk        (clk),
    .en         (mem_req_val_reg),
    .write      (mem_req_store),
    .din        (mem_req_data_reg),
    .addr       (mem_req_addr_reg),
    .dout       (sram_dout)
  );
`else
  wire [127:0] sram_dout_prev;
  reg [127:0] sram_dout_reg;

  always @(posedge clk)
  begin
    sram_dout_reg <= sram_dout_prev;
  end

  assign sram_dout = sram_dout_reg;

  sram #(.WIDTH(128), .LG_DEPTH(14)) data_array
  (
    .A1(mem_req_addr_reg),
    .BM1(1'b1),
    .CE1(clk),
    .WEB1(~mem_req_store),
    .OEB1(1'b0),
    .CSB1(~mem_req_val_reg),
    .I1(mem_req_data_reg),
    .O1(sram_dout_prev)
  );
`endif
  
  always @(*)
  begin
    mem_req_addr_next = mem_req_addr;
    mem_req_val_next = mem_req_val;
    mem_req_rdy_next = 1'b1;
    mem_req_tag_next = mem_req_tag;
    addr_cnt_next = addr_cnt_reg;
    
    nstate = state;
    case (state)
      L2_Idle:
      begin
        if (mem_req_val & (mem_req_rw == 2'b00)) // 4 loads
        begin
          nstate = L2_Busy;
          addr_cnt_next = 2'd0;
          mem_req_rdy_next = 1'b0;
        end
      end
      L2_Busy:
      begin
        mem_req_rdy_next = 1'b0;
        mem_req_val_next = 1'b1;
        mem_req_tag_next = mem_req_tag_reg;
        mem_req_addr_next = mem_req_addr_reg + 1'b1;
        addr_cnt_next = addr_cnt_reg + 1'b1;
        if (addr_cnt_reg == 2'd2)
        begin
          mem_req_rdy_next = 1'b1;
          nstate = L2_Idle;
        end
      end
      default:;
    endcase
  end

endmodule
