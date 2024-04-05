`include "riscvConst.vh"
`include "macros.vh"

module ICache #
(
  parameter LINES = 256,
  parameter CPU_WIDTH = 32,
  parameter WORD_ADDR_BITS = 30
)
(
  input clk,
  input reset,
  
  input                       cpu_req_val,
  output                      cpu_req_rdy,
  input [WORD_ADDR_BITS-1:0]  cpu_req_addr,
  
  output                      cpu_resp_val,
  output [CPU_WIDTH-1:0]      cpu_resp_data,
  
  output                      mem_req_val,
  input                       mem_req_rdy,
  output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)] mem_req_addr,
  
  input                       mem_resp_val,
  input                       mem_resp_nack,
  input [`MEM_DATA_BITS-1:0]  mem_resp_data
);

  localparam CL_SIZE = `MEM_DATA_BITS*`MEM_DATA_CYCLES/8;
  localparam LG_LINES = `ceilLog2(LINES);
  localparam LG_REFILL_CYCLES = `ceilLog2(`MEM_DATA_CYCLES);

  localparam STATE_READY = 0;
  localparam STATE_REQUEST_WAIT = 1;
  localparam STATE_REFILL_WAIT = 2;
  localparam STATE_REFILL = 3;
  localparam STATE_RESET = 4;
  localparam STATE_RESOLVE_MISS = 5;
  localparam STATE_NACKED = 6;

  localparam OFFLSB = 0;
  localparam OFFMSB = OFFLSB-1+`ceilLog2(CL_SIZE*8/CPU_WIDTH);
  localparam IDXLSB = OFFMSB+1;
  localparam IDXMSB = IDXLSB-1+`ceilLog2(LINES);
  localparam TAGLSB = IDXMSB+1;
  localparam TAGMSB = `CPU_ADDR_BITS-1-`ceilLog2(CPU_WIDTH/8);
  localparam TAGBITS = TAGMSB-TAGLSB+1;
  localparam DATAIDXLSB = `ceilLog2(`MEM_DATA_BITS/CPU_WIDTH);
  localparam MEM_REQ_LSB = `ceilLog2(CL_SIZE*8/CPU_WIDTH);

  reg [TAGMSB:0] r_cpu_req_addr;
  reg r_cpu_req_val;

  reg [2:0] state, next_state;
  reg [LG_REFILL_CYCLES-1:0] refill_count;
  reg [LG_LINES-1:0] reset_count;

  always @(*) begin
    case(state)
      STATE_READY: next_state = ~mem_req_val ? STATE_READY : mem_req_rdy ? STATE_REFILL_WAIT : STATE_REQUEST_WAIT;
      STATE_REQUEST_WAIT: next_state = ~mem_req_rdy ? STATE_REQUEST_WAIT : STATE_REFILL_WAIT;
      STATE_RESOLVE_MISS: next_state = STATE_READY;
      STATE_REFILL_WAIT: next_state = mem_resp_val ? STATE_REFILL : mem_resp_nack ? STATE_NACKED : STATE_REFILL_WAIT;
      STATE_NACKED: next_state = mem_req_rdy ? STATE_REFILL_WAIT : STATE_NACKED;
      STATE_REFILL: next_state = refill_count == {LG_REFILL_CYCLES{1'b1}} ? STATE_RESOLVE_MISS : STATE_REFILL;
      STATE_RESET: next_state = reset_count == {LG_LINES{1'b1}} ? STATE_READY : STATE_RESET;
      default: next_state = 3'bx;
    endcase
  end

  always @(posedge clk) begin
    if(reset)
      state <= STATE_RESET;
    else
      state <= next_state;

    if(reset)
      reset_count <= {LG_LINES{1'b0}};
    else if(state == STATE_RESET)
      reset_count <= reset_count + 1'b1;

    if(reset)
      refill_count <= {LG_REFILL_CYCLES{1'b0}};
    else if(mem_resp_val)
      refill_count <= refill_count + 1'b1;

    if(cpu_req_val && (next_state == STATE_READY))
      r_cpu_req_addr <= cpu_req_addr;

    if(reset)
      r_cpu_req_val <= 1'b0;
    else if(cpu_req_rdy)
      r_cpu_req_val <= cpu_req_val;

  end

  wire tag_we = state == STATE_RESET || state == STATE_REFILL_WAIT && mem_resp_val;
  wire [TAGBITS:0] tag_wdata = state == STATE_RESET ? {TAGBITS+1{1'b0}} : {1'b1,r_cpu_req_addr[TAGMSB:TAGLSB]};
  wire [TAGBITS:0] tag_out;
  wire tag_match = tag_out[TAGBITS-1:0] == r_cpu_req_addr[TAGMSB:TAGLSB] && tag_out[TAGBITS];
  wire [IDXMSB:IDXLSB] tag_idx = state == STATE_RESET ? reset_count :
                                 next_state == STATE_READY ? cpu_req_addr[IDXMSB:IDXLSB] :
                                 r_cpu_req_addr[IDXMSB:IDXLSB];

/*
`ifdef ASIC

  wire [64 - $bits(tag_out) - 1:0] dummy;
  SRAM6T_64x1024 tags
  (
    .clk(clk),
    .write(tag_we),
    .din({{64 - $bits(tag_wdata){1'b0}},tag_wdata}),
    .writeMask(8'hff),
    .readMask(2'b11),
    .saenTune(2'b00),
    .addr({2'b0, tag_idx}),
    .dout({dummy,tag_out})
  );

`else */

  sram_readafter #(TAGBITS+1,LG_LINES) tags
  (
    .A1(tag_idx),
    .BM1(1'b1),
    .CE1(clk),
    .WEB1(~tag_we),
    .OEB1(1'b0),
    .CSB1(1'b0),
    .I1(tag_wdata),
    .O1(tag_out)
  );

// `endif

  wire [IDXMSB:DATAIDXLSB] data_idx =
          next_state == STATE_READY ? cpu_req_addr[IDXMSB:DATAIDXLSB] :
          {r_cpu_req_addr[IDXMSB:IDXLSB],refill_count};
  wire [`MEM_DATA_BITS-1:0] data_out;

`ifdef ASIC
  generate
    if (LINES == 256)
    begin
      SRAM6T_64x1024 data1
      (
        .clk(clk),
        .write(mem_resp_val),
        .din(mem_resp_data[63:0]),
        .writeMask(8'hFF),
        .readMask(2'b11),
        .saenTune(2'b00),
        .addr(data_idx),
        .dout(data_out[63:0])
      );

      SRAM6T_64x1024 data2
      (
        .clk(clk),
        .write(mem_resp_val),
        .din(mem_resp_data[127:64]),
        .writeMask(8'hFF),
        .readMask(2'b11),
        .saenTune(2'b00),
        .addr(data_idx),
        .dout(data_out[127:64])
      );
    end
    else
    begin
      sram #(`MEM_DATA_BITS,LG_LINES+LG_REFILL_CYCLES) data
      (
        .A1(data_idx),
        .BM1(1'b1),
        .CE1(clk),
        .WEB1(~mem_resp_val),
        .OEB1(1'b0),
        .CSB1(1'b0),
        .I1(mem_resp_data),
        .O1(data_out)
      );
    end
  endgenerate
`else
  sram #(`MEM_DATA_BITS,LG_LINES+LG_REFILL_CYCLES) data
  (
    .A1(data_idx),
    .BM1(1'b1),
    .CE1(clk),
    .WEB1(~mem_resp_val),
    .OEB1(1'b0),
    .CSB1(1'b0),
    .I1(mem_resp_data),
    .O1(data_out)
  );
`endif

  assign cpu_resp_val = r_cpu_req_val & tag_match & (state == STATE_READY);
  assign mem_req_val = r_cpu_req_val & ~tag_match & (state == STATE_READY | state == STATE_REQUEST_WAIT) |
                       (state == STATE_NACKED);
  assign mem_req_addr = {r_cpu_req_addr[TAGMSB:MEM_REQ_LSB], {MEM_REQ_LSB-DATAIDXLSB{1'b0}}};
  assign cpu_req_rdy = state == STATE_READY && next_state == STATE_READY;

  generate
    genvar i;
    for(i = 0; i < CPU_WIDTH; i=i+1) begin : foo
      assign cpu_resp_data[i] = data_out[r_cpu_req_addr[DATAIDXLSB-1:0]*CPU_WIDTH+i];
    end
  endgenerate
  
endmodule
