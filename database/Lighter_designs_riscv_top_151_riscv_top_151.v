// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

// emacs --batch riscv_top.v -f verilog-batch-auto

`include "const.vh"

module riscv_top_151
(
  input clk,
  input reset,

  output                      mem_req_valid,
  input                       mem_req_ready,
  output                      mem_req_rw,
  output [`MEM_ADDR_BITS-1:0] mem_req_addr,
  output [`MEM_TAG_BITS-1:0]  mem_req_tag,

  output                      mem_req_data_valid,
  input                       mem_req_data_ready,
  output [`MEM_DATA_BITS-1:0] mem_req_data_bits,
  output [(`MEM_DATA_BITS/8)-1:0] mem_req_data_mask,

  input                       mem_resp_valid,
  input [`MEM_TAG_BITS-1:0]   mem_resp_tag,
  input [`MEM_DATA_BITS-1:0]  mem_resp_data,
  output [31:0]               csr
);

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [31:0]   dcache_addr;    // From cpu of Riscv141.v
  wire [31:0]   dcache_din;   // From cpu of Riscv141.v
  wire [31:0]   dcache_dout;    // From mem of Memory141.v
  wire          dcache_val;
  wire      dcache_re;    // From cpu of Riscv141.v
  wire [3:0]    dcache_we;    // From cpu of Riscv141.v
  wire [31:0]   icache_addr;    // From cpu of Riscv141.v
  wire [31:0]   icache_dout;    // From mem of Memory141.v
  wire      icache_re;    // From cpu of Riscv141.v
  wire      stall;      // From mem of Memory141.v
  // End of automatics

  Memory141 mem(
  /*AUTOINST*/
    // Outputs
    .dcache_dout    (dcache_dout[31:0]),
    .dcache_val     (dcache_val),
    .icache_dout    (icache_dout[31:0]),
    .stall      (stall),
    .mem_req_valid    (mem_req_valid),
    .mem_req_rw   (mem_req_rw),
    .mem_req_addr   (mem_req_addr[`MEM_ADDR_BITS-1:0]),
    .mem_req_tag    (mem_req_tag[`MEM_TAG_BITS-1:0]),
    .mem_req_data_valid (mem_req_data_valid),
    .mem_req_data_bits  (mem_req_data_bits[`MEM_DATA_BITS-1:0]),
    .mem_req_data_mask  (mem_req_data_mask[(`MEM_DATA_BITS/8)-1:0]),
    // Inputs
    .clk      (clk),
    .reset      (reset),
    .dcache_addr    (dcache_addr[31:0]),
    .icache_addr    (icache_addr[31:0]),
    .dcache_we    (dcache_we[3:0]),
    .dcache_re    (dcache_re),
    .icache_re    (icache_re),
    .dcache_din   (dcache_din[31:0]),
    .mem_req_ready    (mem_req_ready),
    .mem_req_data_ready (mem_req_data_ready),
    .mem_resp_valid   (mem_resp_valid),
    .mem_resp_data    (mem_resp_data[`MEM_DATA_BITS-1:0]),
    .mem_resp_tag   (mem_resp_tag[`MEM_TAG_BITS-1:0]));
  
  // RISC-V 141 CPU
  Riscv141 cpu(
  /*AUTOINST*/
         // Outputs
         .dcache_addr   (dcache_addr[31:0]),
         .icache_addr   (icache_addr[31:0]),
         .dcache_we   (dcache_we[3:0]),
         .dcache_re   (dcache_re),
         .icache_re   (icache_re),
         .dcache_din    (dcache_din[31:0]),
         // Inputs
         .clk         (clk),
         .reset     (reset),
         .dcache_dout   (dcache_dout[31:0]),
         .dcache_val    (dcache_val),
         .icache_dout   (icache_dout[31:0]),
           .csr             (csr),
         .stall     (stall));

endmodule

// Local Variables:
// verilog-library-extensions:(".v" ".vh")
// verilog-library-directories:(".")
// End:
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

module Riscv141(
  input clk,
  input reset,

  // Memory system ports
  output [31:0] dcache_addr,
  output [31:0] icache_addr,
  output [3:0] dcache_we,
  output dcache_re,
  output icache_re,
  output [31:0] dcache_din,
  input dcache_val,
  input [31:0] dcache_dout,
  input [31:0] icache_dout,
  input stall,
  output [31:0] csr
);
  wire [1:0]    s1_pc_sel;
  wire          s3_csr_we;
  wire [4:0]    s1_rs1;
  wire [4:0]    s1_rs2;
  wire [4:0]    s1_rd;
  wire [6:0]    s1_opcode;
  wire [2:0]    s1_func;
  wire          s1_fwd_s3_rs1;
  wire          s1_fwd_s3_rs2;

  wire [1:0]    s2_alu_a_sel;
  wire [2:0]    s2_alu_b_sel;
  wire [1:0]    s2_adder_a_sel;
  wire          s2_adder_b_sel;
  wire          s2_pc_out_sel;
  wire [1:0]    s2_dmem_we;
  wire          s2_dmem_re;
  wire          s2_fwd_s3_rs1;
  wire          s2_fwd_s3_rs2;
  wire [4:0]    s2_rs1;
  wire [4:0]    s2_rs2;
  wire [4:0]    s2_rd;
  wire [6:0]    s2_opcode;
  wire [2:0]    s2_func;

  wire [2:0]    s3_rdata_sel;
  wire [1:0]    s3_reg_wdata_sel;
  wire          s3_reg_we;
  wire [4:0]    s3_rs1;
  wire [4:0]    s3_rs2;
  wire [4:0]    s3_rd;
  wire [6:0]    s3_opcode;
  wire [2:0]    s3_func;
  wire          s3_branch;
  wire          s3_csr_new_data_sel;

  controller ctrl(
    .clk(clk),
    .reset(reset),
    .hard_stall(stall),
    .dcache_val(dcache_val),
    .s1_opcode(s1_opcode),
    .s2_opcode(s2_opcode),
    .s3_opcode(s3_opcode),
    .s1_rs1(s1_rs1),
    .s2_rs1(s2_rs1),
    .s3_rs1(s3_rs1),
    .s1_rs2(s1_rs2),
    .s2_rs2(s2_rs2),
    .s3_rs2(s3_rs2),
    .s1_rd(s1_rd),
    .s2_rd(s2_rd),
    .s3_rd(s3_rd),
    .s1_func(s1_func),
    .s2_func(s2_func),
    .s3_func(s3_func),
    .s3_branch(s3_branch),
    .s1_pc_sel(s1_pc_sel),
    .s1_imem_re(icache_re),
    .s1_fwd_s3_rs1(s1_fwd_s3_rs1),
    .s1_fwd_s3_rs2(s1_fwd_s3_rs2),
    .s2_alu_a_sel(s2_alu_a_sel),
    .s2_alu_b_sel(s2_alu_b_sel),
    .s2_adder_a_sel(s2_adder_a_sel),
    .s2_adder_b_sel(s2_adder_b_sel),
    .s2_pc_out_sel(s2_pc_out_sel),
    .s2_dmem_we(s2_dmem_we),
    .s2_dmem_re(s2_dmem_re),
    .s2_fwd_s3_rs1(s2_fwd_s3_rs1),
    .s2_fwd_s3_rs2(s2_fwd_s3_rs2),
    .s3_rdata_sel(s3_rdata_sel),
    .s3_reg_wdata_sel(s3_reg_wdata_sel),
    .s3_reg_we(s3_reg_we),
    .s3_csr_we(s3_csr_we),
    .s3_csr_new_data_sel(s3_csr_new_data_sel)
  );


  datapath dpath(
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .s1_pc_sel(s1_pc_sel),
    .s3_csr_we(s3_csr_we),
    .s1_fwd_s3_rs1(s1_fwd_s3_rs1),
    .s1_fwd_s3_rs2(s1_fwd_s3_rs2),
    .s1_rs1(s1_rs1),
    .s1_rs2(s1_rs2),
    .s1_rd(s1_rd),
    .s1_opcode(s1_opcode),
    .s1_func(s1_func),
    .s2_alu_a_sel(s2_alu_a_sel),
    .s2_alu_b_sel(s2_alu_b_sel),
    .s2_adder_a_sel(s2_adder_a_sel),
    .s2_adder_b_sel(s2_adder_b_sel),
    .s2_pc_out_sel(s2_pc_out_sel),
    .s2_dmem_we(s2_dmem_we),
    .s2_dmem_re(s2_dmem_re),
    .s2_fwd_s3_rs1(s2_fwd_s3_rs1),
    .s2_fwd_s3_rs2(s2_fwd_s3_rs2),
    .s2_rs1(s2_rs1),
    .s2_rs2(s2_rs2),
    .s2_rd(s2_rd),
    .s2_opcode(s2_opcode),
    .s2_func(s2_func),
    .s3_rdata_sel(s3_rdata_sel),
    .s3_reg_wdata_sel(s3_reg_wdata_sel),
    .s3_reg_we(s3_reg_we),
    .s3_rs1(s3_rs1),
    .s3_rs2(s3_rs2),
    .s3_rd(s3_rd),
    .s3_opcode(s3_opcode),
    .s3_func(s3_func),
    .s3_branch(s3_branch),
    .s3_csr_new_data_sel(s3_csr_new_data_sel),

    .dcache_addr(dcache_addr),
    .icache_addr(icache_addr),
    .dcache_we(dcache_we),
    .dcache_re(dcache_re),
    .dcache_din(dcache_din),
    .dcache_dout(dcache_dout),
    .icache_dout(icache_dout),
    .csr_tohost(csr)
  );
endmodule



// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

//----------------------------------------------------------------------
//

`include "const.vh"

module Memory141( 
  input clk,
  input reset,

  // Cache <=> CPU interface
  input  [31:0] dcache_addr,
  input  [31:0] icache_addr,
  input  [3:0]  dcache_we,
  input         dcache_re,
  input         icache_re,
  input  [31:0] dcache_din,
  output        dcache_val,
  output [31:0] dcache_dout,
  output [31:0] icache_dout,
  output        stall,

  // Arbiter <=> Main memory interface
  output                       mem_req_valid,
  input                        mem_req_ready,
  output                       mem_req_rw,
  output [`MEM_ADDR_BITS-1:0]  mem_req_addr,
  output [`MEM_TAG_BITS-1:0]   mem_req_tag,

  output                       mem_req_data_valid,
  input                        mem_req_data_ready,
  output [`MEM_DATA_BITS-1:0]  mem_req_data_bits,
  output [(`MEM_DATA_BITS/8)-1:0]  mem_req_data_mask,

  input                        mem_resp_valid,
  input [`MEM_DATA_BITS-1:0]   mem_resp_data,
  input [`MEM_TAG_BITS-1:0]    mem_resp_tag

);

wire i_stall_n;
wire d_stall_n;

wire ic_mem_req_valid;
wire ic_mem_req_ready;
wire [`MEM_ADDR_BITS-1:0]  ic_mem_req_addr;
wire ic_mem_resp_valid;

wire dc_mem_req_valid;
wire dc_mem_req_ready;
wire dc_mem_req_rw;
wire [`MEM_ADDR_BITS-1:0]  dc_mem_req_addr;
wire dc_mem_resp_valid;

wire [(`MEM_DATA_BITS/8)-1:0]  dc_mem_req_mask;

`ifdef no_cache_mem
no_cache_mem icache (
  .clk(clk),
  .reset(reset),
  .cpu_req_val(icache_re),
  .cpu_req_rdy(i_stall_n),
  .cpu_req_addr(icache_addr[31:2]),
  .cpu_req_data(), // core does not write to icache
  .cpu_req_write(4'b0), // never write
  .cpu_resp_val(),
  .cpu_resp_data(icache_dout)
);

no_cache_mem dcache (
  .clk(clk),
  .reset(reset),
  .cpu_req_val((| dcache_we) || dcache_re),
  .cpu_req_rdy(d_stall_n),
  .cpu_req_addr(dcache_addr[31:2]),
  .cpu_req_data(dcache_din),
  .cpu_req_write(dcache_we),
  .cpu_resp_val(),
  .cpu_resp_data(dcache_dout)
);
assign stall =  ~i_stall_n || ~d_stall_n;
assign dcache_val = 1'b1;

`else
cache icache (
  .clk(clk),
  .reset(reset),
  .cpu_req_val(icache_re),
  .cpu_req_rdy(i_stall_n),
  .cpu_req_addr(icache_addr[31:2]),
  .cpu_req_data(), // core does not write to icache
  .cpu_req_write(4'b0), // never write
  .cpu_resp_val(),
  .cpu_resp_data(icache_dout),
  .mem_req_val(ic_mem_req_valid),
  .mem_req_rdy(ic_mem_req_ready),
  .mem_req_addr(ic_mem_req_addr),
  .mem_req_data_valid(),
  .mem_req_data_bits(),
  .mem_req_data_mask(),
  .mem_req_data_ready(),
  .mem_req_rw(),
  .mem_resp_val(ic_mem_resp_valid),
  .mem_resp_data(mem_resp_data)
);

//wire [1:0] dcache_dummy;
//cache #(
  //.LINES(64), 
  //.CPU_WIDTH(`CPU_INST_BITS), 
  //.WORD_ADDR_BITS(`CPU_ADDR_BITS)
//) dcache (
cache #(
  .FORCE_WRITE_BACK(1)
) dcache (
  .clk(clk),
  .reset(reset),
  .cpu_req_val((| dcache_we) || dcache_re),
  .cpu_req_rdy(d_stall_n),
  .cpu_req_addr(dcache_addr[31:2]),
  .cpu_req_data(dcache_din),
  .cpu_req_write(dcache_we),
  .cpu_resp_val(dcache_val),
  .cpu_resp_data(dcache_dout),
  .mem_req_val(dc_mem_req_valid),
  .mem_req_rdy(dc_mem_req_ready),
  .mem_req_addr(dc_mem_req_addr),
  .mem_req_rw(dc_mem_req_rw),
  .mem_req_data_valid(mem_req_data_valid),
  .mem_req_data_bits(mem_req_data_bits),
  .mem_req_data_mask(mem_req_data_mask),
  .mem_req_data_ready(mem_req_data_ready),
  .mem_resp_val(dc_mem_resp_valid),
  .mem_resp_data(mem_resp_data)
);
assign stall =  ~i_stall_n || ~d_stall_n;
//assign stall = ~i_stall_n;
//assign dc_mem_req_valid = 0;
//assign dc_mem_req_rw = 0;
//assign dc_mem_req_addr = 0;

riscv_arbiter arbiter (
  .clk(clk),
  .reset(reset),
  .ic_mem_req_valid(ic_mem_req_valid),
  .ic_mem_req_ready(ic_mem_req_ready),
  .ic_mem_req_addr(ic_mem_req_addr),
  .ic_mem_resp_valid(ic_mem_resp_valid),

  .dc_mem_req_valid(dc_mem_req_valid),
  .dc_mem_req_ready(dc_mem_req_ready),
  .dc_mem_req_rw(dc_mem_req_rw),
  .dc_mem_req_addr(dc_mem_req_addr),
  .dc_mem_resp_valid(dc_mem_resp_valid),

  .mem_req_valid(mem_req_valid),
  .mem_req_ready(mem_req_ready),
  .mem_req_rw(mem_req_rw),
  .mem_req_addr(mem_req_addr),
  .mem_req_tag(mem_req_tag),
  .mem_resp_valid(mem_resp_valid),
  .mem_resp_tag(mem_resp_tag)
);
`endif

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

module riscv_arbiter
(
  input clk,
  input reset,

  input                       ic_mem_req_valid,
  output                      ic_mem_req_ready,
  input [`MEM_ADDR_BITS-1:0]  ic_mem_req_addr,
  output                      ic_mem_resp_valid,

  input                       dc_mem_req_valid,
  output                      dc_mem_req_ready,
  input                       dc_mem_req_rw,
  input [`MEM_ADDR_BITS-1:0]  dc_mem_req_addr,
  output                      dc_mem_resp_valid,

  output                      mem_req_valid,
  input                       mem_req_ready,
  output                      mem_req_rw,
  output [`MEM_ADDR_BITS-1:0] mem_req_addr,
  output [`MEM_TAG_BITS-1:0]  mem_req_tag,
  input                       mem_resp_valid,
  input [`MEM_TAG_BITS-1:0]   mem_resp_tag
);

  assign ic_mem_req_ready = mem_req_ready;
  assign dc_mem_req_ready = mem_req_ready & ~ic_mem_req_valid;

  assign mem_req_valid = ic_mem_req_valid | dc_mem_req_valid;
  assign mem_req_rw
    = ic_mem_req_valid ? 1'b0
    : dc_mem_req_rw;
  assign mem_req_addr
    = ic_mem_req_valid ? ic_mem_req_addr
    : dc_mem_req_addr;
  assign mem_req_tag
    = ic_mem_req_valid ? 4'd0
    : 4'd1;

  assign ic_mem_resp_valid = mem_resp_valid & (mem_resp_tag == 4'd0);
  assign dc_mem_resp_valid = mem_resp_valid & (mem_resp_tag == 4'd1);

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

`define ceilLog2(x) ( \
(x) > 2**30 ? 31 : \
(x) > 2**29 ? 30 : \
(x) > 2**28 ? 29 : \
(x) > 2**27 ? 28 : \
(x) > 2**26 ? 27 : \
(x) > 2**25 ? 26 : \
(x) > 2**24 ? 25 : \
(x) > 2**23 ? 24 : \
(x) > 2**22 ? 23 : \
(x) > 2**21 ? 22 : \
(x) > 2**20 ? 21 : \
(x) > 2**19 ? 20 : \
(x) > 2**18 ? 19 : \
(x) > 2**17 ? 18 : \
(x) > 2**16 ? 17 : \
(x) > 2**15 ? 16 : \
(x) > 2**14 ? 15 : \
(x) > 2**13 ? 14 : \
(x) > 2**12 ? 13 : \
(x) > 2**11 ? 12 : \
(x) > 2**10 ? 11 : \
(x) > 2**9 ? 10 : \
(x) > 2**8 ? 9 : \
(x) > 2**7 ? 8 : \
(x) > 2**6 ? 7 : \
(x) > 2**5 ? 6 : \
(x) > 2**4 ? 5 : \
(x) > 2**3 ? 4 : \
(x) > 2**2 ? 3 : \
(x) > 2**1 ? 2 : \
(x) > 2**0 ? 1 : 0)

`include "const.vh"

module cache #
(
  parameter CACHE_SIZE_BYTES = 1024,
  parameter ASSOCIATIVITY = 2,
  parameter LINE_SIZE_BYTES = 64,
  parameter WORD_BITS = `CPU_DATA_BITS,
  parameter NUM_SETS = CACHE_SIZE_BYTES/LINE_SIZE_BYTES/ASSOCIATIVITY,
  parameter LINE_SIZE_WORDS = LINE_SIZE_BYTES/(WORD_BITS/8),
  parameter LINE_SIZE_BITS = LINE_SIZE_BYTES * 8,
  parameter CPU_ADDR_BITS = `CPU_ADDR_BITS,
  // TODO(aryap): Huh?
  parameter WORD_ADDR_BITS = `CPU_ADDR_BITS-`ceilLog2(`CPU_INST_BITS/8),
  // Number of bits needed to select a byte within a word.
  parameter BYTE_OFFSET_BITS = `ceilLog2(`CPU_DATA_BITS/8),
  // Number of bits needed to select a word (block) within a cache line.
  parameter BLOCK_OFFSET_BITS = `ceilLog2(LINE_SIZE_BYTES / (WORD_BITS/8)),
  // Number of bits needed to select between all our cache sets.
  parameter SET_OFFSET_BITS = `ceilLog2(CACHE_SIZE_BYTES / LINE_SIZE_BYTES / ASSOCIATIVITY),
  // Number of bits used for the tag check.
  parameter TAG_BITS = WORD_ADDR_BITS-SET_OFFSET_BITS-BLOCK_OFFSET_BITS,
  // Width of the memory request address bus.
  parameter MEM_ADDR_BITS = `MEM_ADDR_BITS,
  // Number of data bits per memory line.
  parameter MEM_DATA_BITS = `MEM_DATA_BITS,
  // The number of bits required to select a byte from within a memory line.
  // Equivalently, the number of address bits we skip per memory line.
  parameter MEM_PAGE_BITS = `ceilLog2(MEM_DATA_BITS/8),
  parameter FORCE_WRITE_BACK = 0
)
(
  input clk,
  input reset,

  input                             cpu_req_val,
  output reg                        cpu_req_rdy,
  input [WORD_ADDR_BITS-1:0]        cpu_req_addr,
  input [WORD_BITS-1:0]             cpu_req_data,
  input [3:0]                       cpu_req_write,

  output wire                       cpu_resp_val,
  output [WORD_BITS-1:0]            cpu_resp_data,

  output reg                       mem_req_val,
  input                             mem_req_rdy,
  output reg [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/WORD_BITS)] mem_req_addr,
  output reg                       mem_req_rw,
  output reg                       mem_req_data_valid,
  input                            mem_req_data_ready,
  output [`MEM_DATA_BITS-1:0]      mem_req_data_bits,
  // byte level masking
  output reg [(`MEM_DATA_BITS/8)-1:0]  mem_req_data_mask,

  input                       mem_resp_val,
  input [`MEM_DATA_BITS-1:0]  mem_resp_data
);
  // -------------------------------------------------------------------------
  // State
  // -------------------------------------------------------------------------

  // TODO(aryap): Ok we really need a "WRITE" state.
  localparam
    COMP            = 2'd0,
    WRITE_BACK      = 2'd1,
    READ_MEMORY     = 2'd2;

  reg [1:0] current_state;  // An actual register.
  // Latch the CPU requested address.
  reg [WORD_ADDR_BITS-1:0] cpu_req_addr_r;

  // -------------------------------------------------------------------------
  // Index selection from cpu_req_addr
  // -------------------------------------------------------------------------

  localparam BLOCK_OFFSET_HIGH = BLOCK_OFFSET_BITS-1;
  localparam SET_OFFSET_HIGH = BLOCK_OFFSET_BITS+SET_OFFSET_BITS-1;

  // Set & block offsets, tag from the addr presented during *this* cycle;
  // used for hit detection and setting up writes.
  wire [BLOCK_OFFSET_BITS-1:0] block_offset_c =
    cpu_req_addr[BLOCK_OFFSET_HIGH:0];
  wire [SET_OFFSET_BITS-1:0] set_offset_c =
    cpu_req_addr[SET_OFFSET_HIGH:BLOCK_OFFSET_HIGH+1];
  wire [TAG_BITS-1:0] tag_c =
    cpu_req_addr[WORD_ADDR_BITS-1:SET_OFFSET_HIGH+1];

  // Set & block offsets, tag from the addr saved from a previous cycle,
  // usually used after read or write.
  wire [BLOCK_OFFSET_BITS-1:0] block_offset_r =
    cpu_req_addr_r[BLOCK_OFFSET_HIGH:0];
  wire [SET_OFFSET_BITS-1:0] set_offset_r =
    cpu_req_addr_r[SET_OFFSET_HIGH:BLOCK_OFFSET_HIGH+1];
  wire [TAG_BITS-1:0] tag_r =
    cpu_req_addr_r[WORD_ADDR_BITS-1:SET_OFFSET_HIGH+1];

  // -------------------------------------------------------------------------
  // Hit checking, line state bookkeeping
  // -------------------------------------------------------------------------

  // For each set, we need an array of bits per way to indicate whether the
  // corresponding way in that set is valid. We also need a bit for whether
  // the data in a given way of a given set is modified.
  reg [ASSOCIATIVITY-1:0] valid_by_set [NUM_SETS-1:0];
  reg [ASSOCIATIVITY-1:0] modified_by_set [NUM_SETS-1:0];

  // (Verilog sucks.)
  // Resets.
  //genvar i_s;
  //generate
  //  for (i_s = 0; i_s < NUM_SETS; i_s = i_s + 1) begin:RESETS_BY_ASSOC
  //    always @(posedge clk) begin
  //      if (reset) valid_by_set[i_s] <= {ASSOCIATIVITY{1'b0}};
  //      if (reset) modified_by_set[i_s] <= {ASSOCIATIVITY{1'b0}};
  //    end
  //  end
  //endgenerate

  wire [ASSOCIATIVITY-1:0] valid;
  wire [ASSOCIATIVITY-1:0] modified;

  genvar i_b;
  generate
    for (i_b = 0; i_b < ASSOCIATIVITY; i_b = i_b + 1) begin:ASSIGN_BITS
      assign valid[i_b] = valid_by_set[set_offset_r][i_b];
      assign modified[i_b] = modified_by_set[set_offset_r][i_b];
    end
  endgenerate

  // TODO(aryap): Parameterise with generate loop.
  wire [TAG_BITS-1:0] tag_w[ASSOCIATIVITY-1:0];
  wire [ASSOCIATIVITY-1:0] tag_check;
  assign tag_check[0] = (tag_w[0] == tag_r);
  assign tag_check[1] = (tag_w[1] == tag_r);

  wire [ASSOCIATIVITY-1:0] hit;
  assign hit[0] = valid[0] & tag_check[0];
  assign hit[1] = valid[1] & tag_check[1];

  reg [`ceilLog2(ASSOCIATIVITY)-1:0] hit_index;
  always @(*) begin
    case (1'b1)
      hit[1] : hit_index = 1'b1;
      default: hit_index = 1'b0;
    endcase
  end

  // (Verilog sucks.)
  //genvar i_h;
  //generate
  //  for (i_h = 0; i_h < ASSOCIATIVITY; i_h = i_h+1) begin:DETERMINE_HIT_INDEX
  //    always @(*) if (hit[i_h]) hit_index = i_h;
  //  end
  //endgenerate

  wire any_hit = |hit;

  wire write = |cpu_req_write;

  // TODO(aryap): Replace write_r with write depending on cpu_req_write_r
  // instead.
  reg write_r;

  reg response_is_from_memory;
  wire cpu_resp_new = ~write_r & (any_hit | response_is_from_memory);

  // -------------------------------------------------------------------------
  // "LRU" line way selection
  // -------------------------------------------------------------------------

  // A pointer to the way to write to next. This is a number, the index of the
  // way to target.
  // TODO(aryap): I can't for the life of me get this to reset properly:
  // reg [`ceilLog2(ASSOCIATIVITY)-1:0] next_ways [NUM_SETS-1:0];
  reg [ASSOCIATIVITY-1:0] next_ways [NUM_SETS-1:0];

  // Set offset here comes from the latched request addr, not the one
  // presented on the current cycle, since this is used in READ_MEMORY to
  // write to the cache.
  wire [`ceilLog2(ASSOCIATIVITY)-1:0] next_way =
    next_ways[set_offset_r][`ceilLog2(ASSOCIATIVITY)-1:0];

  // (Verilog sucks.)
  //genvar i_r;
  //generate
  //  for (i_r = 0; i_r < NUM_SETS; i_r = i_r + 1) begin:RESETS_BY_SET
  //    always @(posedge clk) begin
  //      if (reset) next_ways[i_r] <= {ASSOCIATIVITY{1'b0}};
  //    end
  //  end
  //endgenerate

  // -------------------------------------------------------------------------
  // Memory request/response
  // -------------------------------------------------------------------------

  // TODO(aryap):
  // Ok so this is how memory actually works: assert req_val when
  // req_rdy and then over the next N cycles you receive N*128 bits of
  // data. Wtf?
  //wire response_valid =
  //  mem_resp_val && (num_mem_resps < NUM_MEM_RESPONSES) && mem_req_in_flight;


  // We can't issue multiple requests to memory, so we have to serialise them
  // on this.
  reg mem_req_in_flight;

  localparam NUM_MEM_RESPONSES = LINE_SIZE_BITS / MEM_DATA_BITS;
  localparam NUM_MEM_WRITE_REQUESTS = NUM_MEM_RESPONSES;
  localparam NUM_MEM_READ_REQUESTS = NUM_MEM_RESPONSES / 4;

  reg [MEM_DATA_BITS-1:0] memory_line_chunks[NUM_MEM_RESPONSES-1:0];
  wire [LINE_SIZE_BITS-1:0] memory_line = {
    memory_line_chunks[3], memory_line_chunks[2],
    memory_line_chunks[1], memory_line_chunks[0]};

  // Each of these has +1 bit to count the overflow state.
  reg [MEM_ADDR_BITS:0] num_mem_reqs;
  reg [MEM_ADDR_BITS:0] num_mem_resps;

  wire all_write_reqs_sent = num_mem_reqs == NUM_MEM_WRITE_REQUESTS;
  wire all_resps_received = num_mem_resps == NUM_MEM_RESPONSES;

  // If 0, use the CPU request address as the memory address source; if 1, use
  // the tag stored for the target cache set/way to recreate the original
  // address.
  reg mem_req_addr_src;

  wire [WORD_ADDR_BITS-1:0] write_back_addr =
    {tag_w[next_way],
    cpu_req_addr_r[WORD_ADDR_BITS-TAG_BITS-1:MEM_PAGE_BITS],
    {MEM_PAGE_BITS{1'b0}}};

  wire [WORD_ADDR_BITS-1:0] read_memory_addr =
    {cpu_req_addr_r[WORD_ADDR_BITS-1:MEM_PAGE_BITS],
    {MEM_PAGE_BITS{1'b0}}};

  // MEM_PAGE_BITS is the LSB to increment at to select the next memory line;
  // but our cpu_req_addr doesn't include the byte offset so we have to adjust
  // for that.
  //
  // The bounds for cpu_req_addr_r come from where it is declared in the input
  // list.
  wire [MEM_ADDR_BITS-1:0] mem_req_addr_base =
    mem_req_addr_src ?
    write_back_addr[WORD_ADDR_BITS-1:MEM_PAGE_BITS-BYTE_OFFSET_BITS] :
    read_memory_addr[WORD_ADDR_BITS-1:MEM_PAGE_BITS-BYTE_OFFSET_BITS];

  //reg [MEM_ADDR_BITS-1:0] mem_req_addr_r;
  always @(*) mem_req_addr = mem_req_addr_base + num_mem_resps;

  // -------------------------------------------------------------------------
  // SRAMs
  // -------------------------------------------------------------------------

  reg [ASSOCIATIVITY-1:0] sram_we; // Comes from next_way
  //reg [ASSOCIATIVITY-1:0] sram_we_r; // Actual reg.

  always @(*) begin
    sram_we = 0;
    if (current_state == COMP && any_hit) begin
      sram_we[hit_index] = write_r;
    end else if (current_state == READ_MEMORY && all_resps_received) begin
      sram_we[next_way] = `CONTROL_TRUE;
    end
  end

  // We need a signal to indicate to WRITE_BACK that the correct tag is
  // available (after one cycle).
  //
  // TODO(aryap): We could just re-use sram_data_valid?
  reg sram_tag_valid_for_write_back;

  wire [SET_OFFSET_BITS-1:0] sram_addr =
    write_r ? set_offset_r :
    current_state == COMP ?  set_offset_c : set_offset_r;
  wire [TAG_BITS-1:0] sram_tag_in =
    write_r ? tag_r :
    current_state == COMP ?  tag_c : tag_r;

  TagSRAMs #(
    .CACHE_SET_BITS(SET_OFFSET_BITS),
    .CACHE_TAG_BITS(TAG_BITS)
  ) tag_srams_w0 (
    .clk(clk),
    .we(sram_we[0]),
    .addr(sram_addr),
    .data_in(sram_tag_in),
    .data_out(tag_w[0]));

  TagSRAMs #(
    .CACHE_SET_BITS(SET_OFFSET_BITS),
    .CACHE_TAG_BITS(TAG_BITS)
  ) tag_srams_w1 (
    .clk(clk),
    .we(sram_we[1]),
    .addr(sram_addr),
    .data_in(sram_tag_in),
    .data_out(tag_w[1]));

  wire [LINE_SIZE_BITS-1:0] dout[ASSOCIATIVITY-1:0];
  wire [LINE_SIZE_BITS-1:0] din;

  DataSRAMs #(
    .CACHE_SET_BITS(SET_OFFSET_BITS),
    .CACHE_LINE_BITS(LINE_SIZE_BITS)
  ) data_srams_w0 (
    .clk(clk),
    .we(sram_we[0]),
    .addr(sram_addr),
    .data_in(din),
    .data_out(dout[0]));

  DataSRAMs #(
    .CACHE_SET_BITS(SET_OFFSET_BITS),
    .CACHE_LINE_BITS(LINE_SIZE_BITS)
  ) data_srams_w1 (
    .clk(clk),
    .we(sram_we[1]),
    .addr(sram_addr),
    .data_in(din),
    .data_out(dout[1]));

  // This is true one cycle after an address is presented to the SRAM whose
  // data we want to read.
  reg sram_data_valid;
 
  // -------------------------------------------------------------------------
  // Busy signal
  // -------------------------------------------------------------------------

  always @(*) begin
    // Ready to receive a new address when the last address hit (so we can
    // just read out the data now) or we didn't have a valid address last
    // time.
    cpu_req_rdy = current_state == COMP && (any_hit || !sram_data_valid)  && !write_r;
  end
 
  // -------------------------------------------------------------------------
  // Line with CPU write req; buffer for newly read data
  // -------------------------------------------------------------------------

  wire [LINE_SIZE_BITS-1:0] existing_line = current_state == COMP ?
    dout[hit_index] : dout[next_way];

  // Either the output from the SRAM or that retrieved from memory.
  //wire line_src = current_state == READ_MEMORY;
  reg line_src;
  wire [LINE_SIZE_BITS-1:0] line = line_src ?  memory_line : existing_line;


  // Merge the desired write data into our value for the current cache line.
  reg [WORD_BITS-1:0] cpu_req_data_r;
  reg [3:0] cpu_req_write_r;

  localparam CACHE_LINE_PAD = LINE_SIZE_BITS - WORD_BITS;

  wire [LINE_SIZE_BITS-1:0] cpu_req_data_in_line =
    ({{CACHE_LINE_PAD{1'b0}}, cpu_req_data_r} << (
        block_offset_r * WORD_BITS));

  wire [LINE_SIZE_BITS-1:0] line_update_bitmask =
    ~({ {CACHE_LINE_PAD{1'b0}},
        {8{cpu_req_write_r[3]}},
        {8{cpu_req_write_r[2]}},
        {8{cpu_req_write_r[1]}},
        {8{cpu_req_write_r[0]}}} << (block_offset_r * WORD_BITS));

  wire [LINE_SIZE_BITS-1:0] line_with_update =
    cpu_req_data_in_line | (line_update_bitmask & line);

  assign din = write_r ? line_with_update : line;

  // TODO: Figure out how to make overwriting a sub-word nicer in PAR and in
  // Verilog.
 
  wire [LINE_SIZE_BITS-1:0] line_shifted_cpu =
    line >> (block_offset_r*WORD_BITS);

  wire [WORD_BITS-1:0] line_shifted_cpu_trunc =
    line_shifted_cpu[WORD_BITS-1:0];

  reg [WORD_BITS-1:0] cpu_resp_data_r;
  always @(posedge clk) begin
    if (cpu_resp_new) cpu_resp_data_r <= line_shifted_cpu_trunc;
  end

  assign cpu_resp_val = cpu_resp_new;
  assign cpu_resp_data = cpu_resp_new ?
    line_shifted_cpu_trunc : cpu_resp_data_r;

  wire [LINE_SIZE_BITS-1:0] line_shifted_mem =
    line >> (num_mem_resps*MEM_DATA_BITS);
  assign mem_req_data_bits = line_shifted_mem[MEM_DATA_BITS-1:0];

  // Sequential logic in each state.
  always @(posedge clk) begin
    if (reset) begin
      // TODO: Maybe fix for associativity > 2. This sets the value _for all
      // sets_ to zero.
      num_mem_reqs <= 0;
      num_mem_resps <= 0;
      mem_req_in_flight <= `CONTROL_FALSE;
      current_state <= COMP;
      response_is_from_memory <= `CONTROL_FALSE;
      sram_data_valid <= `CONTROL_FALSE;
      sram_tag_valid_for_write_back <= `CONTROL_FALSE;
      mem_req_addr_src <= 1'b0;
      line_src <= 1'b0;

      // I hate myself. This sucks.
      // Verilog sucks.
      // TODO(aryap): Can we transpose this?
      valid_by_set[0] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[1] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[2] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[3] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[4] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[5] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[6] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[7] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[8] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[9] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[10] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[11] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[12] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[13] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[14] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[15] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[16] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[17] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[18] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[19] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[20] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[21] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[22] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[23] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[24] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[25] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[26] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[27] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[28] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[29] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[30] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[31] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[32] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[33] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[34] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[35] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[36] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[37] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[38] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[39] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[40] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[41] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[42] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[43] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[44] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[45] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[46] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[47] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[48] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[49] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[50] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[51] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[52] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[53] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[54] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[55] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[56] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[57] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[58] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[59] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[60] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[61] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[62] <= {ASSOCIATIVITY{1'b0}};
      valid_by_set[63] <= {ASSOCIATIVITY{1'b0}};

      modified_by_set[0] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[1] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[2] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[3] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[4] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[5] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[6] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[7] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[8] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[9] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[10] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[11] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[12] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[13] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[14] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[15] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[16] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[17] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[18] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[19] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[20] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[21] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[22] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[23] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[24] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[25] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[26] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[27] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[28] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[29] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[30] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[31] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[32] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[33] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[34] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[35] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[36] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[37] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[38] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[39] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[40] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[41] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[42] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[43] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[44] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[45] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[46] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[47] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[48] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[49] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[50] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[51] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[52] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[53] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[54] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[55] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[56] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[57] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[58] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[59] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[60] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[61] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[62] <= {ASSOCIATIVITY{1'b0}};
      modified_by_set[63] <= {ASSOCIATIVITY{1'b0}};

      // next_ways[0] <= {ASSOCIATIVITY{1'b0}};
      // next_ways[1] <= {ASSOCIATIVITY{1'b0}};
      // next_ways[2] <= {ASSOCIATIVITY{1'b0}};
      // next_ways[3] <= {ASSOCIATIVITY{1'b0}};

    end else begin
      case (current_state)
        COMP: begin
          if (cpu_req_val) begin
            cpu_req_addr_r <= cpu_req_addr;
            cpu_req_data_r <= cpu_req_data;
            cpu_req_write_r <= cpu_req_write;
            write_r <= write;
          end
          sram_data_valid <= cpu_req_val;
          response_is_from_memory <= `CONTROL_FALSE;
          sram_tag_valid_for_write_back <= `CONTROL_FALSE;

          // Every following cycle should use the line from the SRAM output.
          line_src <= 1'b0;

          num_mem_reqs <= 0;
          num_mem_resps <= 0;

          // If in the current cycle we had a read hit, the data available
          // next cycle will be valid.

          if (sram_data_valid && !any_hit) begin
            cpu_req_addr_r <= cpu_req_addr_r;
            cpu_req_data_r <= cpu_req_data_r;
            cpu_req_write_r <= cpu_req_write_r;
            write_r <= write_r;
            sram_data_valid <= `CONTROL_FALSE;
            if (valid[next_way] && modified[next_way]) begin
              current_state <= WRITE_BACK;
            end else begin
              current_state <= READ_MEMORY;
              // READ_MEMORY stages need the line to come from the memory
              // buffer.
              line_src <= 1'b1;
            end
          end

          if (any_hit) begin
            if (write_r) begin
              // This is LRU. TODO(aryap): This only picks between two ways.
              modified_by_set[set_offset_r][hit_index] <= `CONTROL_TRUE;
              current_state <= COMP;
              cpu_req_addr_r <= 0;
              cpu_req_data_r <= 0;
              cpu_req_write_r <= 0;
              write_r <= `CONTROL_FALSE;
            end
          end
        end

        WRITE_BACK: begin
          if (!sram_tag_valid_for_write_back) begin
            // Set up write back starting state and add 1 cycle delay.
            sram_tag_valid_for_write_back <= `CONTROL_TRUE;
            mem_req_rw <= 1'b1;
            mem_req_val <= `CONTROL_TRUE;
            mem_req_data_valid <= `CONTROL_TRUE;
            mem_req_data_mask <= 16'hffff;
            mem_req_addr_src <= 1'b1;

          end else begin

            if (all_write_reqs_sent) begin
              mem_req_rw <= 1'b0;
            end else if (mem_req_rdy) begin
              num_mem_reqs <= num_mem_reqs + 1;
              mem_req_in_flight <= `CONTROL_TRUE;
            end

            if (all_resps_received) begin
              num_mem_resps <= 0;
              mem_req_val <= 1'b0;
              line_src <= 1'b1;
              current_state <= READ_MEMORY;
              sram_tag_valid_for_write_back <= `CONTROL_FALSE;
              mem_req_data_valid <= `CONTROL_FALSE;
              mem_req_data_mask <= 0;
              mem_req_addr_src <= 1'b0;
              // We can reset the # sent requests now.
              num_mem_reqs <= 0;
            end else if (mem_req_data_ready) begin
              num_mem_resps <= num_mem_resps + 1;
              mem_req_in_flight <= `CONTROL_FALSE;
            end 

          end
        end

        READ_MEMORY: begin
          // If in the current cycle we finished our memory read, the data
          // available next cycle will be valid.

          // TODO(aryap): Save a cycle by setting these values before leaving
          // COMP or WRITE_BACK?
          if (mem_req_in_flight && mem_req_val && mem_req_rdy) begin
            // Pulse valid for one cycle.
            mem_req_val <= `CONTROL_FALSE;
          end else if (mem_req_rdy && num_mem_reqs < NUM_MEM_READ_REQUESTS) begin
            // If mem_req_rdy, assume that on this clock cycle we issued a request
            mem_req_in_flight <= `CONTROL_TRUE;

            num_mem_reqs <= num_mem_reqs + 1;

            mem_req_val <= `CONTROL_TRUE;
            // Read, not write.
            mem_req_rw <= 1'b0;
          end

          if (all_resps_received) begin
            num_mem_resps <= 0;
            // Pseudo-LRU:
            next_ways[set_offset_r] <= next_ways[set_offset_r] + 1;
            valid_by_set[set_offset_r][next_way] <= 1'b1;

            // TODO(aryap): This is high for one cycle too many.
            mem_req_in_flight <= `CONTROL_FALSE;

            // The very first instance of COMP after READ_MEMORY should
            // continue to read memory data for the line source.
            line_src <= 1'b1;
            response_is_from_memory <= `CONTROL_TRUE;
            current_state <= COMP;

            modified_by_set[set_offset_r][next_way] <= write_r;
            if (write_r) begin
              cpu_req_addr_r <= 0;
              cpu_req_data_r <= 0;
              cpu_req_write_r <= 0;
              write_r <= `CONTROL_FALSE;
            end

          end else if (mem_req_in_flight && mem_resp_val) begin
            memory_line_chunks[num_mem_resps] <= mem_resp_data;
            num_mem_resps <= num_mem_resps + 1;
          end
        end

        default:;
      endcase
    end
  end

endmodule



// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

`include "Opcode.vh"
`include "const.vh"

module datapath(
  input             clk, reset,
  //input   [0:0]   hazard_controls,

  input               stall,

  // Stage 1 controls and output to controller.
  input wire [1:0]    s1_pc_sel,
  input wire          s3_csr_we,
  input wire          s1_fwd_s3_rs1,
  input wire          s1_fwd_s3_rs2,
  output wire [4:0]   s1_rs1,
  output wire [4:0]   s1_rs2,
  output wire [4:0]   s1_rd,
  output wire [6:0]   s1_opcode,
  output wire [2:0]   s1_func,

  // Stage 2 controls and output to controller.
  input wire [1:0]    s2_alu_a_sel,
  input wire [2:0]    s2_alu_b_sel,
  input wire [1:0]    s2_adder_a_sel,
  input wire          s2_adder_b_sel,
  input wire          s2_pc_out_sel,
  input wire [1:0]    s2_dmem_we,
  input wire          s2_dmem_re,
  input wire          s2_fwd_s3_rs1,
  input wire          s2_fwd_s3_rs2,
  output wire [4:0]   s2_rs1,
  output wire [4:0]   s2_rs2,
  output wire [4:0]   s2_rd,
  output wire [6:0]   s2_opcode,
  output wire [2:0]   s2_func,

  // Stage 3 controls and output to controller.
  input wire [2:0]    s3_rdata_sel,
  input wire [1:0]    s3_reg_wdata_sel,
  input wire          s3_reg_we,
  input wire          s3_csr_new_data_sel,
  output wire [4:0]   s3_rs1,
  output wire [4:0]   s3_rs2,
  output wire [4:0]   s3_rd,
  output wire [6:0]   s3_opcode,
  output wire [2:0]   s3_func,
  output wire         s3_branch,

  // Memory system connections
  output [31:0]       dcache_addr,
  output [31:0]       icache_addr,
  output reg [3:0]    dcache_we,
  output              dcache_re,
  output reg [31:0]   dcache_din,
  input [31:0]        dcache_dout,
  input [31:0]        icache_dout,
  output wire [31:0]  csr_tohost

);
  //-------------------------------------------------------------------
  // Control status registers (CSR)
  //-------------------------------------------------------------------

  reg [`CPU_DATA_BITS-1:0] csr_tohost_reg;
  assign csr_tohost = csr_tohost_reg;

  //-------------------------------------------------------------------
  // Stage 1
  //-------------------------------------------------------------------

  wire [4:0] rf_raddr0;
  wire [4:0] rf_raddr1;
  wire [4:0] rf_waddr;

  wire [`CPU_DATA_BITS-1:0] rf_rdata0;
  wire [`CPU_DATA_BITS-1:0] rf_rdata1;
  reg [`CPU_DATA_BITS-1:0] rf_wdata;
  // Latch the last s3_result in case we need to forward it.
  reg [`CPU_DATA_BITS-1:0] s2_s3_result_reg;

  RegisterFile #(
    .LOG2_NUM_REGISTERS(5),
    .NUM_REGISTERS(32)
  ) integer_register_file (
    .clk(clk),
    .reset(reset),
    .waddr(rf_waddr),
    .wdata(rf_wdata),
    .write_enable(s3_reg_we),
    .raddr0(rf_raddr0),
    .rdata0(rf_rdata0),
    .raddr1(rf_raddr1),
    .rdata1(rf_rdata1)
  );

  wire [`CPU_ADDR_BITS-1:0] s1_pc;
  wire [`CPU_ADDR_BITS-1:0] override_pc;
  //wire [4:0] s1_rs1, [4:0] s1_rs2, [4:0] s1_rd;
  wire [11:0] s1_imm_i;
  wire [19:0] s1_imm_uj;
  wire [11:0] s1_imm_bs;
  wire s1_add_rshift_type;

  reg [`CPU_ADDR_BITS-1:0] s3_pc_reg;

  assign rf_raddr0 = s1_rs1;
  assign rf_raddr1 = s1_rs2;

  FetchDecodeStage fetch_decode_stage (
    .clk(clk),
    .reset(reset),
    .s1_pc(s1_pc),
    .s1_imem_addr(icache_addr),
    .s3_pc(s3_pc_reg),
    .override_pc(0),    // TODO(aryap): Not sure if this is necessary or where to connect it.
    .s1_pc_sel(s1_pc_sel),
    .s1_inst(icache_dout),
    .s1_rs1(s1_rs1),
    .s1_rs2(s1_rs2),
    .s1_rd(s1_rd),
    .s1_imm_i(s1_imm_i),
    .s1_imm_uj(s1_imm_uj),
    .s1_imm_bs(s1_imm_bs),
    .s1_opcode(s1_opcode),
    .s1_func(s1_func),
    .s1_add_rshift_type(s1_add_rshift_type)
  );

  // TODO(aryap): CSR can be written immediately in the first stage, since the
  // data is available from the register file. But this violates precise
  // exceptions, if we care about that. The alternative is to propagate the
  // rs1 and csr values through the pipeline stages, which is what we do. But
  // if we can get away with it, it will improve performance to do it early.
  // Maybe.

  //-------------------------------------------------------------------
  // Stage 2
  //-------------------------------------------------------------------

  // S1/S2 pipeline registers.
  //
  // The naming convention is to follow the stage receiving the latched
  // values.
  reg [`CPU_DATA_BITS-1:0] s2_csr_data_reg;
  reg [`CPU_DATA_BITS-1:0] s2_rs1_data_reg;
  reg [`CPU_DATA_BITS-1:0] s2_rs2_data_reg;
  reg [11:0] s2_imm_i_reg;
  reg [19:0] s2_imm_uj_reg;
  reg [11:0] s2_imm_bs_reg;
  reg [`CPU_ADDR_BITS-1:0] s2_pc_reg;
  reg [6:0] s2_opcode_reg;
  reg [2:0] s2_func_reg;
  reg s2_add_rshift_type_reg;
  reg [4:0] s2_rs1_reg;
  reg [4:0] s2_rs2_reg;
  reg [4:0] s2_rd_reg;
  reg [1:0] s2_byte_sel_reg;
  reg s2_s1_fwd_s3_rs1_reg;
  reg s2_s1_fwd_s3_rs2_reg;

  // Forwarding registers.
  reg [`CPU_DATA_BITS-1:0] s3_alu_result_reg;

  assign s2_opcode = s2_opcode_reg;
  assign dcache_re = s2_dmem_re;
  assign s2_rs1 = s2_rs1_reg;
  assign s2_rs2 = s2_rs2_reg;
  assign s2_rd = s2_rd_reg;

  always @(posedge clk) begin
    if (!stall) begin
      // Because we only implement one CSR, we will add custom logic here to
      // connect it instead of another register file. But since it is memory, we
      // don't include in the FetchDecodeStage directly. TODO(aryap): Maybe.
      s2_csr_data_reg <=
          s1_imm_i == 12'h51E && s1_rd != 0 ? csr_tohost_reg : 0;
      s2_rs1_data_reg <= rf_rdata0;
      s2_rs2_data_reg <= rf_rdata1;
      s2_imm_i_reg <= s1_imm_i;
      s2_imm_uj_reg <= s1_imm_uj;
      s2_imm_bs_reg <= s1_imm_bs;
      s2_pc_reg <= s1_pc;
      s2_opcode_reg <= s1_opcode;
      s2_func_reg <= s1_func;
      s2_add_rshift_type_reg <= s1_add_rshift_type;
      s2_rs1_reg <= s1_rs1;
      s2_rs2_reg <= s1_rs2;
      s2_rd_reg <= s1_rd;
      s2_s1_fwd_s3_rs1_reg <= s1_fwd_s3_rs1;
      s2_s1_fwd_s3_rs2_reg <= s1_fwd_s3_rs2;
      // Store the last S3 result for forwarding to the instruction currently
      // in S1 (when it gets to S2).
      s2_s3_result_reg <= rf_wdata;
    end
  end

  wire [`CPU_DATA_BITS-1:0] s2_imm_i_out;
  wire s2_branch;
  wire [`CPU_DATA_BITS-1:0] s2_alu_out;
  wire [`CPU_ADDR_BITS-1:0] s2_pc_out;
  wire [`CPU_DATA_BITS-1:0] s2_rs1_data_eff;
  wire [`CPU_DATA_BITS-1:0] s2_rs2_data_eff;
  wire [`CPU_DATA_BITS-1:0] s2_rs2_data_out;

  // TODO(aryap): Put all of the DMEM signal handling in the Execute stage.
  assign s2_rs1_data_eff = s2_fwd_s3_rs1 ? rf_wdata :
                           s2_s1_fwd_s3_rs1_reg ? s2_s3_result_reg : s2_rs1_data_reg;
  assign s2_rs2_data_eff = s2_fwd_s3_rs2 ? rf_wdata :
                           s2_s1_fwd_s3_rs2_reg ? s2_s3_result_reg : s2_rs2_data_reg;

  assign dcache_addr = s2_alu_out;
  assign s2_func = s2_func_reg;

  // Figure out dmem_we byte mask if dmem writes are enabled.
  always @(*) begin
    s2_byte_sel_reg = s2_alu_out[1:0];
    dcache_din = s2_rs2_data_out;
    case (s2_dmem_we)
      `S2_DMEM_WE_BYTE: begin
        dcache_we = 4'b1 << s2_byte_sel_reg;
        dcache_din = s2_rs2_data_out[7:0] << (s2_byte_sel_reg * 8);
      end
      `S2_DMEM_WE_HALF_WORD: begin
        dcache_we = 4'b11 << s2_byte_sel_reg;
        dcache_din = s2_rs2_data_out[15:0] << (s2_byte_sel_reg * 8);
      end
      `S2_DMEM_WE_WORD: begin
        dcache_we = 4'b1111;
      end
      default: begin
        dcache_we = 0;   // `S2_DMEM_WE_OFF
      end
    endcase
  end

  ExecuteStage execute_stage (
    .clk(clk),
    .reset(reset),
    .s2_rs1_data(s2_rs1_data_eff),
    .s2_rs2_data(s2_rs2_data_eff),
    .s2_imm_i(s2_imm_i_reg),
    .s2_imm_uj(s2_imm_uj_reg),
    .s2_imm_bs(s2_imm_bs_reg),
    .s2_pc(s2_pc_reg),
    .s2_opcode(s2_opcode_reg),
    .s2_func(s2_func_reg),
    .s2_add_rshift_type(s2_add_rshift_type_reg),

    .s2_imm_i_out(s2_imm_i_out),
    .s2_alu_out(s2_alu_out),
    .s2_pc_out(s2_pc_out),
    .s2_rs2_data_out(s2_rs2_data_out),

    .s2_branch(s2_branch),

    // Control signals.
    .s2_alu_a_sel(s2_alu_a_sel),
    .s2_alu_b_sel(s2_alu_b_sel),
    .s2_adder_a_sel(s2_adder_a_sel),
    .s2_adder_b_sel(s2_adder_b_sel),
    .s2_pc_out_sel(s2_pc_out_sel)
  );

  //-------------------------------------------------------------------
  // Stage 3
  //-------------------------------------------------------------------

  // S2/S3 pipeline registers.
  reg [6:0] s3_opcode_reg;
  reg [2:0] s3_func_reg;
  reg s3_branch_reg;
  reg [`CPU_DATA_BITS-1:0] s3_rs1_data_reg;
  reg [`CPU_DATA_BITS-1:0] s3_imm_i_reg;
  // NOTE(aryap): This is instead of a general-purpose second write port for
  // registers or any bypassing.
  reg [`CPU_DATA_BITS-1:0] s3_csr_data_reg;   
  reg [4:0] s3_rs1_reg;
  reg [4:0] s3_rs2_reg;
  reg [4:0] s3_rd_reg;
  reg [1:0] s3_byte_sel_reg;
  
  assign s3_opcode = s3_opcode_reg;
  assign s3_func = s3_func_reg;
  assign s3_branch = s3_branch_reg;
  assign s3_rs1 = s3_rs1_reg;
  assign s3_rs2 = s3_rs2_reg;
  assign s3_rd = s3_rd_reg;

  always @(posedge clk) begin
    if (!stall) begin
      s3_opcode_reg <= s2_opcode;
      s3_func_reg <= s2_func;
      s3_branch_reg <= s2_branch;
      s3_alu_result_reg <= s2_alu_out;
      s3_rs1_data_reg <= s2_rs1_data_eff;
      s3_pc_reg <= s2_pc_out;
      s3_rd_reg <= s2_rd_reg;
      s3_imm_i_reg <= s2_imm_i_out;
      s3_csr_data_reg <= s2_csr_data_reg;
      s3_rs1_reg <= s2_rs1_reg;
      s3_rs2_reg <= s2_rs2_reg;
      s3_byte_sel_reg <= s2_alu_out[1:0];
    end
  end

  wire [`CPU_DATA_BITS-1:0] s3_rdata_out;

  WriteBackStage write_back_stage (
    .clk(clk),
    .reset(reset),
    .byte_select(s3_byte_sel_reg),
    .s3_rdata_sel(s3_rdata_sel),
    .s3_rdata(dcache_dout),
    .s3_rdata_out(s3_rdata_out)
  );

  assign rf_waddr = s3_rd_reg;

  always @(*) begin
    case (s3_reg_wdata_sel)
      `S3_REG_WDATA_SEL_S3_RS1: rf_wdata = s3_rs1_data_reg;
      `S3_REG_WDATA_SEL_S3_RESULT: rf_wdata = s3_alu_result_reg;
      `S3_REG_WDATA_SEL_S3_RDATA_OUT: rf_wdata = s3_rdata_out;
      `S3_REG_WDATA_SEL_S3_CSR_DATA: rf_wdata = s3_csr_data_reg;
      default: rf_wdata = s3_alu_result_reg;
    endcase
  end

  // TODO(aryap): Move this with the other immediate generation in
  // ExecuteStage?
  parameter NUM_IMM_RS1_0_BITS = `CPU_DATA_BITS - 5;
  wire [`CPU_DATA_BITS-1:0] s3_imm_rs1 =
    {{NUM_IMM_RS1_0_BITS{1'b0}}, s3_rs1_reg};

  always @(posedge clk) begin
    if (!stall)
      if (s3_csr_we)
        case (s3_csr_new_data_sel)
          `S3_CSR_NEW_DATA_SEL_IMM_RS1: csr_tohost_reg <= s3_imm_rs1;
          // `S3_CSR_NEW_DATA_SEL_RS1_DATA
          default: csr_tohost_reg <= s3_rs1_data_reg; 
        endcase
  end

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

`include "Opcode.vh"
`include "const.vh"

module controller(
  // This is used to push signals that only control sources and alone uses
  // through the different stages.
  input clk,
  input reset,

  // Stops pipeline registers.
  input hard_stall,

  input dcache_val,

  input wire [6:0]  s1_opcode,
  input wire [6:0]  s2_opcode,
  input wire [6:0]  s3_opcode,

  input wire [4:0]  s1_rs1,
  input wire [4:0]  s2_rs1,
  input wire [4:0]  s3_rs1,

  input wire [4:0]  s1_rs2,
  input wire [4:0]  s2_rs2,
  input wire [4:0]  s3_rs2,

  input wire [4:0]  s1_rd,
  input wire [4:0]  s2_rd,
  input wire [4:0]  s3_rd,

  input wire [2:0]  s1_func,
  input wire [2:0]  s2_func,
  input wire [2:0]  s3_func,

  input wire        s3_branch,

  // Stage 1 controls.
  output reg [1:0]  s1_pc_sel,
  output            s1_imem_re,
  output reg        s1_fwd_s3_rs1,
  output reg        s1_fwd_s3_rs2,

  // Stage 2 controls.
  output reg [1:0]  s2_alu_a_sel,
  output reg [2:0]  s2_alu_b_sel,
  output reg [1:0]  s2_adder_a_sel,
  output reg        s2_adder_b_sel,
  output reg        s2_pc_out_sel,
  output reg [1:0]  s2_dmem_we,
  output reg        s2_dmem_re,
  output reg        s2_fwd_s3_rs1,
  output reg        s2_fwd_s3_rs2,

  // Stage 3 controls.
  output reg [2:0]  s3_rdata_sel,
  output reg [1:0]  s3_reg_wdata_sel,
  output reg        s3_reg_we,
  output reg        s3_csr_we,
  output reg        s3_csr_new_data_sel
);
  // Kill signals propagate with instructions down the pipe. The instructions
  // are made ineffectual if their kill bit is set. The first two are for
  // combinationally set kills in the current cycles. The second two
  // propagate these values to subsequent stages.
  reg s1_kill, s2_kill;
  reg s2_kill_reg, s3_kill_reg;

  // s1_kill kills s1; s2_kill_reg tracks whether the instruction in stage was
  // killed in stage 1. s2_kill kills s2. So we need to combine the signal to
  // know if the instruction in s2 was ever killed (now or in s1):
  wire s2_killed;

  // TODO(aryap): Is it easier to define all signals for all stages once per
  // instruction, in a giant vector? Or will that be a nightmare to debug?

  // TODO(aryap): When isn't this true? On a stall?
  assign s1_imem_re = `CONTROL_TRUE;

  // Hazard detection.

  // The stall signal tells us to spin on our S1 PC select.
  reg s1_stall;

  // TODO(aryap): Wire?
  reg s3_maybe_writes_rd, s1_maybe_uses_rs1, s1_maybe_uses_rs2;
  reg s3_writes_rd;

  always @(*) begin
    s1_maybe_uses_rs1 = `CONTROL_FALSE;
    s1_maybe_uses_rs2 = `CONTROL_FALSE;
    s3_maybe_writes_rd = `CONTROL_FALSE;

    case (s3_opcode)
      `OPC_LUI, `OPC_AUIPC, `OPC_JAL, `OPC_JALR, `OPC_LOAD, `OPC_ARI_RTYPE,
        `OPC_ARI_ITYPE, `OPC_CSR: s3_maybe_writes_rd = `CONTROL_TRUE;
      default: s3_maybe_writes_rd = `CONTROL_FALSE;
    endcase

    case (s1_opcode)
      `OPC_JALR, `OPC_BRANCH, `OPC_STORE, `OPC_LOAD, `OPC_ARI_RTYPE,
        `OPC_ARI_ITYPE, `OPC_CSR: s1_maybe_uses_rs1  = `CONTROL_TRUE;
      default: s1_maybe_uses_rs1  = `CONTROL_FALSE;
    endcase

    case (s1_opcode)
      `OPC_BRANCH, `OPC_STORE, `OPC_ARI_RTYPE:
        s1_maybe_uses_rs2  = `CONTROL_TRUE;
      default: s1_maybe_uses_rs2  = `CONTROL_FALSE;
    endcase

    // S1 only cares about RS1/RS2 if it hasn't been killed.
    s3_writes_rd = !s3_kill_reg && s3_maybe_writes_rd && s3_rd != 0;

    s1_stall = `CONTROL_FALSE;

    s1_fwd_s3_rs1 = `CONTROL_FALSE;
    s1_fwd_s3_rs2 = `CONTROL_FALSE;
    s2_fwd_s3_rs1 = `CONTROL_FALSE;
    s2_fwd_s3_rs2 = `CONTROL_FALSE;

    // RAW
    //
    // add r0, r1, r2
    // add r3, r4, r0 (or) add r3, r0, r4
    // TODO(aryap): Only check for forwarding between instructions that
    // actually write/read registers (though it doesn't matter for
    // forwarding if they don't?)
    if (s3_writes_rd) begin
      if (s2_rs1 == s3_rd) s2_fwd_s3_rs1 = `CONTROL_TRUE;
      if (s2_rs2 == s3_rd) s2_fwd_s3_rs2 = `CONTROL_TRUE;
    end
    // add r0, r1, r2
    // <something unrelated>
    // add r3, r4, r0 (or) add r3, r0, r0, etc
    //
    // Since s3 results won't be available until next cycle, we stall.
    // Otherwise we have to mux in s3_result into the register output fed to
    // s2 (not hard...)
    //
    // TODO(aryap): I don't think we need 's1_maybe_uses_rs1' now...
    if (s3_writes_rd) begin
      // if (s1_maybe_uses_rs1 && s1_rs1 == s3_rd) begin
      //   s1_stall = `CONTROL_TRUE;
      // end
      // if (s1_maybe_uses_rs2 && s1_rs2 == s3_rd) begin
      //   s1_stall = `CONTROL_TRUE;
      // end
      if (s1_maybe_uses_rs1 && s1_rs1 == s3_rd) s1_fwd_s3_rs1 = `CONTROL_TRUE;
      if (s1_maybe_uses_rs2 && s1_rs2 == s3_rd) s1_fwd_s3_rs2 = `CONTROL_TRUE;
    end

    // WAR
    //
    // add r0, r1, r2
    // add r1, r3, r4   (cannot finish before first instr)
    //
    // -> Not a problem. TODO(aryap): Or is it?
    //
    // WAW
    //
    // add r0, r1, r2
    // add r0, r2, r3   (cannot finish before first instr)
    //
    // -> Not a problem.
  end

  //-------------------------------------------------------------------
  // Stage 1
  //-------------------------------------------------------------------

  //-------------------------------------------------------------------
  // Stage 2
  //-------------------------------------------------------------------
  //
  // Forwarding to repalce RS1 or RS2 data is taken care of in the datapath.

  always @(*) begin
    // TODO(aryap): Can these be don't-cares? X?
    s2_alu_a_sel = `S2_ALU_A_SEL_RS1_DATA;
    s2_alu_b_sel = `S2_ALU_B_SEL_CONST_4;
    s2_adder_a_sel = `S2_ADDER_A_SEL_RS1_DATA;
    s2_adder_b_sel = `S2_ADDER_B_SEL_PC;
    s2_pc_out_sel = `S2_PC_OUT_SEL_STRAIGHT;
    s2_dmem_we = `S2_DMEM_WE_OFF;
    s2_dmem_re = `CONTROL_FALSE;

    if (!hard_stall)
      case (s2_opcode)
        `OPC_CSR: /* Nothing to change */;

        `OPC_LUI: begin
          s2_alu_b_sel = `S2_ALU_B_SEL_IMM_U;
        end

        `OPC_AUIPC: begin
          s2_alu_a_sel = `S2_ALU_A_SEL_S2_PC;
          s2_alu_b_sel = `S2_ALU_B_SEL_IMM_U;
        end

        `OPC_JAL: begin
          s2_adder_a_sel = `S2_ADDER_A_SEL_IMM_J;
          s2_adder_b_sel = `S2_ADDER_B_SEL_PC;
          s2_alu_a_sel = `S2_ALU_A_SEL_S2_PC;
          s2_alu_b_sel = `S2_ALU_B_SEL_CONST_4;
          // s2_branch taken care of by combinational logic in
          // FetchExecuteStage. ALUdec sets ALU op to ADD for JAL/JALR.
        end

        `OPC_JALR: begin
          s2_adder_a_sel = `S2_ADDER_A_SEL_RS1_DATA;
          s2_adder_b_sel = `S2_ADDER_B_SEL_IMM_I;
          s2_alu_a_sel = `S2_ALU_A_SEL_S2_PC;
          s2_alu_b_sel = `S2_ALU_B_SEL_CONST_4;
          s2_pc_out_sel = `S2_PC_OUT_SEL_MASKED;
          // s2_branch taken care of by combinational logic in
          // FetchExecuteStage. ALUdec sets ALU op to ADD for JAL/JALR.
        end

        `OPC_BRANCH: begin
          // Adder should add B-type to PC.
          s2_adder_a_sel = `S2_ADDER_A_SEL_IMM_B;
          s2_adder_b_sel = `S2_ADDER_B_SEL_PC;
          // ALU should perform rs1 (op) rs2.
          s2_alu_a_sel = `S2_ALU_A_SEL_RS1_DATA;
          s2_alu_b_sel = `S2_ALU_B_SEL_RS2_DATA;
        end

        `OPC_STORE: begin
          s2_dmem_re = `CONTROL_FALSE;
          if (!s2_killed)
            case (s2_func)
              `FNC_SB: s2_dmem_we = `S2_DMEM_WE_BYTE;
              `FNC_SH: s2_dmem_we = `S2_DMEM_WE_HALF_WORD;
              //`FNC_SW
              default: s2_dmem_we = `S2_DMEM_WE_WORD;
            endcase
          s2_alu_a_sel = `S2_ALU_A_SEL_RS1_DATA;
          s2_alu_b_sel = `S2_ALU_B_SEL_IMM_S;
        end

        `OPC_LOAD: begin
          s2_dmem_we = `S2_DMEM_WE_OFF;
          if (!s2_killed) s2_dmem_re = `CONTROL_TRUE;
          s2_alu_a_sel = `S2_ALU_A_SEL_RS1_DATA;
          s2_alu_b_sel = `S2_ALU_B_SEL_IMM_I;
        end

        `OPC_ARI_RTYPE: begin
          s2_alu_a_sel = `S2_ALU_A_SEL_RS1_DATA;
          s2_alu_b_sel = `S2_ALU_B_SEL_RS2_DATA;
        end
        `OPC_ARI_ITYPE: begin
          s2_alu_a_sel = `S2_ALU_A_SEL_RS1_DATA;
          s2_alu_b_sel = `S2_ALU_B_SEL_IMM_I;
        end
        default: /* ERROR */;
      endcase
  end

  //-------------------------------------------------------------------
  // Stage 3
  //-------------------------------------------------------------------

  always @(*) begin
    // TODO(aryap): Can these be don't-cares? X?

    // TODO(aryap): OH SHIT THE IMEM TAKES 1 CYCLE TO READ
    //   so our idea of what each stage's PC is slightly wrong.
    //   s1_pc contains PC of _next_ instruction in that stage.
    //   likewise s2, s3... so we should shift.

    s1_pc_sel = `S1_PC_SEL_INC;
    s1_kill = `CONTROL_FALSE;
    s2_kill = `CONTROL_FALSE;
    // This can be overridden by jumps.
    if (hard_stall) begin
      s1_pc_sel = `S1_PC_SEL_STALL;
    end else if (s1_stall) begin
      s1_pc_sel = `S1_PC_SEL_STALL;
      s1_kill = `CONTROL_TRUE;
    end

    // These are the defaults that amount to a NO-OP.
    // TODO(aryap): Or at least they should be.
    s3_reg_we = `CONTROL_FALSE;
    s3_csr_we = `CONTROL_FALSE;
    // TODO(aryap): Make the default S3_RESULT not S3_RS1, save some lines.
    // Also maybe make s3_reg_we true by default.
    s3_reg_wdata_sel = `S3_REG_WDATA_SEL_S3_RS1;
    s3_rdata_sel = `S3_RDATA_SEL_PASSTHROUGH;
    s3_csr_new_data_sel = `S3_CSR_NEW_DATA_SEL_RS1_DATA;

    if (!s3_kill_reg) begin
      case (s3_opcode)
        `OPC_CSR:
          case (s3_func)
            `FNC2_CSRRW, `FNC2_CSRRWI: begin
              if (s3_func == `FNC2_CSRRWI)
                s3_csr_new_data_sel = `S3_CSR_NEW_DATA_SEL_IMM_RS1;
              s3_csr_we = `CONTROL_TRUE;
              // No side effects of _reading_ CSR if RD is 0 (i.e. writing its
              // value to a register).
              if (s3_rd != 0) begin
                s3_reg_wdata_sel = `S3_REG_WDATA_SEL_S3_CSR_DATA;
                s3_reg_we = `CONTROL_TRUE;
              end
            end
            default: /* ERROR */;
          endcase

        `OPC_LUI, `OPC_AUIPC: begin
          s3_reg_wdata_sel = `S3_REG_WDATA_SEL_S3_RESULT;
          s3_reg_we = `CONTROL_TRUE;
        end

        `OPC_JAL, `OPC_JALR: begin
          s3_reg_wdata_sel = `S3_REG_WDATA_SEL_S3_RESULT;   // PC + 4
          s1_pc_sel = `S1_PC_SEL_S3;                        // PC + j-immediate
          s3_reg_we = `CONTROL_TRUE;
          // s2_branch taken care of by combinational logic in
          // FetchExecuteStage. ALUdec sets ALU op to ADD for JAL/JALR.
          s1_kill = `CONTROL_TRUE;
          s2_kill = `CONTROL_TRUE;
        end

        `OPC_BRANCH: begin
          // In S3, branches determine the next PC source and whether the
          // pipeline gets flushed.
          s3_reg_we = `CONTROL_TRUE;
          if (s3_branch) begin
            // Take the next PC from branch target.
            s1_pc_sel = `S1_PC_SEL_S3;
            // Kill the current instructions in stages 1 & 2.
            s1_kill = `CONTROL_TRUE;
            s2_kill = `CONTROL_TRUE;
          end
        end

        `OPC_STORE:;

        `OPC_LOAD: begin
          // TODO(arya): Stall pipeline if dcache signal not yet valid?
          s3_reg_we = dcache_val;
          s3_reg_wdata_sel = `S3_REG_WDATA_SEL_S3_RDATA_OUT;
          case (s3_func)
            `FNC_LB: s3_rdata_sel = `S3_RDATA_SEL_LOW_BYTE_SIGNED;
            `FNC_LBU: s3_rdata_sel = `S3_RDATA_SEL_LOW_BYTE;
            `FNC_LH: s3_rdata_sel = `S3_RDATA_SEL_LOW_HALF_WORD_SIGNED;
            `FNC_LHU: s3_rdata_sel = `S3_RDATA_SEL_LOW_HALF_WORD;
            //`FNC_LW, 
            default: s3_rdata_sel = `S3_RDATA_SEL_PASSTHROUGH;
          endcase
        end

        `OPC_ARI_RTYPE,`OPC_ARI_ITYPE: begin
          // Result should be written back. rd is perma-wired to the regfile
          // waddr.
          s3_reg_wdata_sel = `S3_REG_WDATA_SEL_S3_RESULT;
          s3_reg_we = `CONTROL_TRUE;
        end
        default: /* ERROR */;
      endcase
    end
  end

  assign s2_killed = s2_kill_reg || s2_kill;

  // Propagate S1 -> S2, S2 -> S3.
  always @(posedge clk) begin
    if (!hard_stall) begin
      s2_kill_reg <= s1_kill;
      s3_kill_reg <= s2_killed;
    end
  end

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

// Stage #3: Write-back unit.

`include "const.vh"

module WriteBackStage #(

)(
  input clk, reset,
  input wire [2:0] s3_rdata_sel,
  input wire [1:0] byte_select,

  input wire [`CPU_DATA_BITS-1:0] s3_rdata,
  output reg [`CPU_DATA_BITS-1:0] s3_rdata_out
);

  // TODO(aryap): This is because I don't want to understand Verilog's
  // signed/unsigned operator semantics. There's probably an easier way...
  localparam BYTE_SIGN_BITS = `CPU_DATA_BITS - 8;
  localparam HALF_WORD_SIGN_BITS = `CPU_DATA_BITS - 16;


  wire [31:0] byteX =
    (s3_rdata & (32'hFF << (byte_select * 8))) >> (byte_select * 8);
  wire [31:0] half_word =
    (s3_rdata & (32'hFFFF << (byte_select * 8))) >> (byte_select * 8);

  always @(*) begin
    case (s3_rdata_sel)
      `S3_RDATA_SEL_PASSTHROUGH:
        s3_rdata_out = s3_rdata;
      `S3_RDATA_SEL_LOW_BYTE:
        s3_rdata_out = {{BYTE_SIGN_BITS{1'b0}}, byteX[7:0]};
      `S3_RDATA_SEL_LOW_BYTE_SIGNED:
        s3_rdata_out = {{BYTE_SIGN_BITS{byteX[7]}}, byteX[7:0]};
      `S3_RDATA_SEL_LOW_HALF_WORD:
        s3_rdata_out = {{HALF_WORD_SIGN_BITS{1'b0}}, half_word[15:0]};
      `S3_RDATA_SEL_LOW_HALF_WORD_SIGNED: 
        s3_rdata_out =
            {{HALF_WORD_SIGN_BITS{half_word[15]}}, half_word[15:0]};
      default: s3_rdata_out = s3_rdata;
    endcase
  end

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

// Stage #2: Execute stage.

`include "Opcode.vh"
`include "const.vh"

module ExecuteStage #(
)(
  input clk, reset,

  input wire [`CPU_DATA_BITS-1:0] s2_rs1_data,
  input wire [`CPU_DATA_BITS-1:0] s2_rs2_data,
  input wire [11:0] s2_imm_i,
  input wire [19:0] s2_imm_uj,
  input wire [11:0] s2_imm_bs,
  input wire [`CPU_ADDR_BITS-1:0] s2_pc,

  input wire [6:0] s2_opcode,
  input wire [2:0] s2_func,
  input wire s2_add_rshift_type,

  input wire [1:0] s2_alu_a_sel,
  input wire [2:0] s2_alu_b_sel,
  input wire [1:0] s2_adder_a_sel,
  input wire s2_adder_b_sel,
  input wire s2_pc_out_sel,
  //input wire [1:0] s2_rs2_data_mask_sel,

  output wire [`CPU_DATA_BITS-1:0] s2_imm_i_out,
  output wire [`CPU_DATA_BITS-1:0] s2_alu_out,
  output reg [`CPU_ADDR_BITS-1:0] s2_pc_out,
  output wire [`CPU_DATA_BITS-1:0] s2_rs2_data_out,

  output wire s2_branch
);
  // Calculate constants for various masks and concatenations.
  localparam IMM_I_EXTEND_BITS = `CPU_DATA_BITS - 12;
  localparam IMM_J_EXTEND_BITS = `CPU_DATA_BITS - (20 + 1);
  localparam IMM_B_PAD_BITS = `CPU_DATA_BITS - (12 + 1);
  localparam IMM_S_PAD_BITS = `CPU_DATA_BITS - 12;
  localparam CONST_4_PAD_BITS = `CPU_DATA_BITS - 3;

  //always @(*) begin
  //  case (s2_rs2_data_mask_sel) begin
  //    `S2_RS2_DATA_MASK_SEL_LOW_BYTE: s2_rs2_data_out = s2_rs2_data & 8'hFF;
  //    `S2_RS2_DATA_MASK_SEL_LOW_HALF_WORD: s2_rs2_data_out = s2_rs2_data & 16'hFFFF;
  //    `S2_RS2_DATA_MASK_SEL_WORD: s2_rs2_data_out = s2_rs2_data;
  //    default: s2_rs2_data_out = s2_rs2_data;
  //  end
  //end
  assign s2_rs2_data_out = s2_rs2_data;

  // Shift and sign extend the immediates:
  //    TODO(aryap): Which syntax? $signed() or {8{s2_imm_i[11]}, s2_imm_i}?
  //                 e.g. = $signed(s2_imm_i)?
  //    TODO(aryap): Do this in Fetch and Decode?
  wire [`CPU_DATA_BITS-1:0] s2_imm_i_ext = {{IMM_I_EXTEND_BITS{s2_imm_i[11]}},
                                            s2_imm_i};
  wire [`CPU_DATA_BITS-1:0] s2_imm_j = {{IMM_J_EXTEND_BITS{s2_imm_uj[19]}},
                                        s2_imm_uj[19],
                                        s2_imm_uj[7:0],
                                        s2_imm_uj[8],
                                        s2_imm_uj[18:9],
                                        1'b0};
  wire [`CPU_DATA_BITS-1:0] s2_imm_u = s2_imm_uj << 12;
  wire [`CPU_DATA_BITS-1:0] s2_imm_b = {{IMM_B_PAD_BITS{s2_imm_bs[11]}},
                                        s2_imm_bs[11],
                                        s2_imm_bs[0],
                                        s2_imm_bs[10:5],
                                        s2_imm_bs[4:1], 1'b0};
  wire [`CPU_DATA_BITS-1:0] s2_imm_s = {{IMM_S_PAD_BITS{s2_imm_bs[11]}},
                                        s2_imm_bs};

  assign s2_imm_i_out = s2_imm_i_ext;

  wire [4:0] alu_op;
  reg [`CPU_DATA_BITS-1:0] A;
  reg [`CPU_DATA_BITS-1:0] B;

  // Choose A, B ALU inputs and instantiate the ALU to do the work.
  always @(*) begin
    case (s2_alu_a_sel)
      `S2_ALU_A_SEL_RS1_DATA: A = s2_rs1_data;
      `S2_ALU_A_SEL_S2_PC: A = s2_pc;
      `S2_ALU_A_SEL_IMM_J: A = s2_imm_j;
      default: A = s2_rs1_data;
    endcase
  end

  always @(*) begin
    case (s2_alu_b_sel)
      `S2_ALU_B_SEL_IMM_I: B = s2_imm_i_ext;
      `S2_ALU_B_SEL_IMM_U: B = s2_imm_u;
      `S2_ALU_B_SEL_IMM_S: B = s2_imm_s;
      `S2_ALU_B_SEL_CONST_4: B = {{CONST_4_PAD_BITS{1'b0}}, 3'h4};
      default: B = s2_rs2_data; // `S2_ALU_B_SEL_RS2_DATA
    endcase
  end

  // ALU decoder and the ALU itself do most of the heavy lifting here.
  ALUdec alu_decoder (
    .opcode(s2_opcode),
    .funct(s2_func),
    .add_rshift_type(s2_add_rshift_type),
    .ALUop(alu_op));

  ALU alu(
    .A(A),
    .B(B),
    .ALUop(alu_op),
    .Out(s2_alu_out));

  // Take the first bit of ALU output as the branch flag.
  //
  // This signal is only an indication of the branch condition, not whether
  // the branch should be taken. For that, we must also be sure that we're
  // completing a valid branch/jump instruction.
  assign s2_branch = s2_opcode == `OPC_BRANCH ?
      s2_alu_out[0] : (s2_opcode == `OPC_JAL | s2_opcode == `OPC_JALR);

  // A second adder deals with incrementing the PC for branches.
  // TODO(aryap): when CPU_ADDR_BITS != CPU_DATA_BITS, we have to sign extend
  // the inputs to the adder separately to those to the ALU.
  reg [`CPU_ADDR_BITS-1:0] adder_a;
  reg [`CPU_ADDR_BITS-1:0] adder_b;
  wire [`CPU_ADDR_BITS-1:0] adder_out;
  localparam PC_MASK_1_BITS = `CPU_ADDR_BITS - 1;

  // Choose A, B PC computation inputs and use a simple adder to do the work.
  always @(*) begin
    case (s2_adder_a_sel)
      `S2_ADDER_A_SEL_IMM_J: adder_a = s2_imm_j;
      `S2_ADDER_A_SEL_IMM_B: adder_a = s2_imm_b;
      default: adder_a = s2_rs1_data; // `S2_ADDER_A_SEL_RS1_DATA
    endcase
  end

  always @(*) begin
    case (s2_adder_b_sel)
      `S2_ADDER_B_SEL_IMM_I: adder_b = s2_imm_i_ext;
      default: adder_b = s2_pc; // `S2_ADDER_B_SEL_PC
    endcase
  end

  assign adder_out = $signed(adder_a) + $signed(adder_b);

  always @(*) begin
    case (s2_pc_out_sel)
      `S2_PC_OUT_SEL_MASKED: s2_pc_out = adder_out & {{PC_MASK_1_BITS{1'b1}}, 1'b0};
      default: s2_pc_out = adder_out; // `S2_PC_OUT_SEL_STRAIGHT
    endcase
  end

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

// Stage #1: Fetch and Decode.

`include "const.vh"

module FetchDecodeStage #(
  parameter ADDR_LEN = `CPU_ADDR_BITS
)(
  input wire clk,
  input wire reset,
  // This is the address presented to the instruction memory. We expect it to
  // take 1 cycle to read.
  output wire [ADDR_LEN-1:0] s1_imem_addr,
  // This is the address associated with the instruction presented to s1_inst,
  // since it took 1 cycle to read.
  output wire [ADDR_LEN-1:0] s1_pc,
  input wire [ADDR_LEN-1:0] s3_pc,
  input wire [ADDR_LEN-1:0] override_pc,

  // Select source for next PC.
  input wire [1:0] s1_pc_sel,

  // Instruction from memory.
  input wire [`CPU_INST_BITS-1:0] s1_inst,

  // Decoded instruction parts.
  output wire [4:0] s1_rs1,
  output wire [4:0] s1_rs2,
  output wire [4:0] s1_rd,
  output wire [11:0] s1_imm_i,
  output wire [19:0] s1_imm_uj,
  output wire [11:0] s1_imm_bs,

  output wire [6:0] s1_opcode,
  output wire [2:0] s1_func,
  output wire s1_add_rshift_type
);
  reg [ADDR_LEN-1:0] pc;
  reg [ADDR_LEN-1:0] next_pc;

  always @(*) begin
    case (s1_pc_sel)
      `S1_PC_SEL_OVERRIDE: next_pc = override_pc;
      `S1_PC_SEL_S3: next_pc = s3_pc;
      `S1_PC_SEL_STALL: next_pc = pc;
      default: next_pc = pc + 4;
    endcase
  end

  assign s1_imem_addr = next_pc;

  // NOTE(aryap): Tragedy. Instruction fetch takes a whole cycle. We need to
  // associate the previous pc value with the current instruction.

  // Set next cycle's PC value.
  always @(posedge clk) begin
    if (reset) pc <= 0;
    // NOTE(aryap): No explicitly stall here; controller has to hold
    // s1_pc_sel.
    else pc <= next_pc;
  end

  // Decode instruction.
  // TODO(aryap): These indices can be `defined in a header.
  assign s1_rs1 = s1_inst[19:15];
  assign s1_rs2 = s1_inst[24:20];
  assign s1_rd = s1_inst[11:7];
  assign s1_imm_i = s1_inst[31:20];
  assign s1_imm_uj = s1_inst[31:12];
  assign s1_imm_bs = {s1_inst[31:25], s1_inst[11:7]};

  assign s1_opcode = s1_inst[6:0];
  assign s1_func = s1_inst[14:12];
  assign s1_add_rshift_type = s1_inst[30];

  assign s1_pc = pc;

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

`include "const.vh"

module RegisterFile #(
  parameter LOG2_NUM_REGISTERS = 5,
  parameter NUM_REGISTERS = 1 << (LOG2_NUM_REGISTERS)
)(
  input clk,
  input reset,

  // NOTE(aryap): This should just be 4:0 for the initial code.
  input [LOG2_NUM_REGISTERS-1:0] waddr,
  input [`CPU_DATA_BITS-1:0] wdata,
  input write_enable,

  input [LOG2_NUM_REGISTERS-1:0] raddr0,
  output [`CPU_DATA_BITS-1:0] rdata0,

  input [LOG2_NUM_REGISTERS-1:0] raddr1,
  output [`CPU_DATA_BITS-1:0] rdata1
);
 // Integer registers.
 reg [`CPU_DATA_BITS-1:0] registers[NUM_REGISTERS-1:0];

 // Data read and propagate.

 // TODO(aryap): This is combinational only. Data is not moved on a clock. We
 // may need to add a cycle to read and straddle the S1/S2 boundary?
 assign rdata0 = registers[raddr0];
 assign rdata1 = registers[raddr1];


 // TODO(aryap): Reset all registers to 0 on a 'rst' signal.
 always @(posedge clk) begin
   // Don't write to zero!
   if (write_enable && waddr != 0) registers[waddr] <= wdata;
 end

endmodule
// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

`include "const.vh"

module DataSRAMs #(
  parameter CACHE_SET_BITS = 2,
  parameter CACHE_LINE_BITS = 512
)( 
  input                         clk,
  input                         we,

  input [CACHE_SET_BITS-1:0]    addr,

  input [CACHE_LINE_BITS-1:0]   data_in,
  output [CACHE_LINE_BITS-1:0]  data_out
);

  wire oeb = 1'b0;  // Output enable (bar)
  wire csb = 1'b0;  // Chip select (bar)

  // We have 2-6 bits of address but need to provide 6. To handle
  // having 6 cache set bits, without verilog spewing a warning and munging
  // it, we add one bit here that we then ignore when passing data.
  wire [6:0] sram_addr_concat = {{7-CACHE_SET_BITS{1'b0}}, addr};
  wire [5:0] sram_addr = sram_addr_concat[5:0];

  wire [127:0] din0 = data_in[127:0];
  wire [127:0] din1 = data_in[255:128];
  wire [127:0] din2 = data_in[383:256];
  wire [127:0] din3 = data_in[511:384];

  wire [127:0] dout0, dout1, dout2, dout3;
  assign data_out = {dout3, dout2, dout1, dout0};

  // Data for way 0, sets 0 - 64, should that many every exist.
  SRAM1RW64x128 dn0(.A(sram_addr),.CE(clk),.WEB(~we),.OEB(oeb),.CSB(csb),.I(din0),.O(dout0));
  SRAM1RW64x128 dn1(.A(sram_addr),.CE(clk),.WEB(~we),.OEB(oeb),.CSB(csb),.I(din1),.O(dout1));
  SRAM1RW64x128 dn2(.A(sram_addr),.CE(clk),.WEB(~we),.OEB(oeb),.CSB(csb),.I(din2),.O(dout2));
  SRAM1RW64x128 dn3(.A(sram_addr),.CE(clk),.WEB(~we),.OEB(oeb),.CSB(csb),.I(din3),.O(dout3));

endmodule

// This is a fake SRAM1RW64x128 model to enable complete synthesis without the
// Synopsys 32 (educational) PDK's SRAMs.
module SRAM1RW64x128 (
  input [6:0] A,
  input CE,
  input WEB,
  input OEB,
  input CSB,
  input [127:0] I,
  output reg [127:0] O
);

// 64-element array of 128-bit-wide registers.
reg [127:0] ram [63:0];

always @(posedge CE) begin
  if (~CSB) begin
    if (~WEB) begin
      ram[A] <= I;
    end
    if (~OEB) begin
      O <= ram[A];
    end
  end
end

endmodule

// UC Berkeley CS251
// Spring 2018
// Arya Reais-Parsi (aryap@berkeley.edu)

`include "const.vh"

module TagSRAMs #(
  parameter CACHE_SET_BITS = 2,
  parameter CACHE_TAG_BITS = 24
)( 
  input                       clk,
  input                       we,

  input [CACHE_SET_BITS-1:0]  addr,

  input [CACHE_TAG_BITS-1:0]   data_in,
  output [CACHE_TAG_BITS-1:0]  data_out
);

  wire oeb = 1'b0;  // Output enable (bar)
  wire csb = 1'b0;  // Chip select (bar)

  wire [6:0] sram_addr_concat = {{7-CACHE_SET_BITS{1'b0}}, addr};
  wire [5:0] sram_addr = sram_addr_concat[5:0];

  localparam SRAM_WIDTH = 32;
  localparam PAD_BITS = SRAM_WIDTH - CACHE_TAG_BITS;

  wire [SRAM_WIDTH-1:0] din = {{PAD_BITS{1'b0}}, data_in};
  wire [SRAM_WIDTH-1:0] dout;
  assign data_out = dout[CACHE_TAG_BITS-1:0];

  SRAM1RW64x32 tn0(.A(sram_addr),.CE(clk),.WEB(~we),.OEB(oeb),.CSB(csb),.I(din),.O(dout));

endmodule

// This is a fake SRAM1RW64x32 model to enable complete synthesis without the
// Synopsys 32 (educational) PDK's SRAMs.
module SRAM1RW64x32 (
  input [6:0] A,
  input CE,
  input WEB,
  input OEB,
  input CSB,
  input [31:0] I,
  output reg [31:0] O
);

// 64-element array of 128-bit-wide registers.
reg [31:0] ram [63:0];

always @(posedge CE) begin
  if (~CSB) begin
    if (~WEB) begin
      ram[A] <= I;
    end
    if (~OEB) begin
      O <= ram[A];
    end
  end
end

endmodule
// UC Berkeley CS150
// Lab 3, Fall 2014
// Module: ALU.v
// Desc:   32-bit ALU for the MIPS150 Processor
// Inputs: 
//    A: 32-bit value
//    B: 32-bit value
//    ALUop: Selects the ALU's operation 
// 						
// Outputs:
//    Out: The chosen function mapped to A and B.
//
// This version written by Arya Reais-Parsi (aryap@berkeley.edu), Spring 2018

`include "Opcode.vh"
`include "ALUop.vh"

module ALU(
  input [31:0] A,B,
  input [4:0] ALUop,
  output reg [31:0] Out
);

wire [4:0] shamt;

assign shamt = B[4:0];

always @(*)
  case(ALUop)
    `ALU_ADD:     Out = A+B;
    `ALU_SUB:     Out = A-B;
    `ALU_AND:     Out = A & B;
    `ALU_OR:      Out = A | B;
    `ALU_XOR:     Out = A ^ B;
    `ALU_SLT:     Out = ($signed(A)<$signed(B)) ? 32'd1 : 32'd0;
    `ALU_SLTU:    Out = (A<B) ? 32'd1 : 32'd0;
    `ALU_SLL:     Out = A << shamt;
    `ALU_SRA:     Out = $signed(A) >>> $signed(shamt);
    `ALU_SRL:     Out = A >> shamt;
    `ALU_COPY_B:  Out = B;
    `ALU_EQ:      Out = (A==B) ? 32'd1 : 32'd0;
    `ALU_NE:      Out = (A!=B) ? 32'd1 : 32'd0;
    `ALU_LT:      Out = ($signed(A) < $signed(B))  ? 32'd1 : 32'd0;
    `ALU_GE:      Out = ($signed(A) >= $signed(B))  ? 32'd1 : 32'd0;
    `ALU_LTU:     Out = (A < B)  ? 32'd1 : 32'd0;
    `ALU_GEU:     Out = (A >= B)  ? 32'd1 : 32'd0;
    default:      Out = 32'd0;
  endcase		
endmodule


// UC Berkeley CS150
// Lab 3, Fall 2014
// Module: ALUdecoder
// Desc:   Sets the ALU operation
// Inputs: opcode: the top 6 bits of the instruction
//         funct: the funct, in the case of r-type instructions
//         add_rshift_type: selects whether an ADD vs SUB, or an SRA vs SRL
// Outputs: ALUop: Selects the ALU's operation
//
// This version written by Arya Reais-Parsi (aryap@berkeley.edu), Spring 2018

`include "Opcode.vh"
`include "ALUop.vh"

module ALUdec(
  input [6:0]       opcode,
  input [2:0]       funct,
  input             add_rshift_type,
  output reg [4:0]  ALUop
);

  // Implement your ALU decoder here, then delete this comment
  always @(*) begin
    case (opcode)
      `OPC_LUI: ALUop = `ALU_COPY_B;
      `OPC_AUIPC, `OPC_LOAD, `OPC_STORE, `OPC_JAL, `OPC_JALR:
        ALUop = `ALU_ADD;
      `OPC_BRANCH:
        case (funct)
          `FNC_BEQ: ALUop = `ALU_EQ;
          `FNC_BNE: ALUop = `ALU_NE;
          `FNC_BLT: ALUop = `ALU_LT; 
          `FNC_BGE: ALUop = `ALU_GE;
          `FNC_BLTU: ALUop = `ALU_LTU;
          `FNC_BGEU: ALUop = `ALU_GEU;
          default: ALUop = `ALU_COPY_B;
        endcase
      `OPC_ARI_ITYPE:
        case (funct)
          // TODO(aryap): FNC_ADD_SUB is the only difference to the RTYPE
          // decode. It doesn't depend on the add_rshift_type bit (there is no
          // SUBI) Merge!
          `FNC_ADD_SUB: ALUop = `ALU_ADD;
          `FNC_SLT: ALUop = `ALU_SLT;
          `FNC_SLTU: ALUop = `ALU_SLTU;
          `FNC_XOR: ALUop = `ALU_XOR;
          `FNC_OR: ALUop = `ALU_OR;
          `FNC_AND: ALUop = `ALU_AND;
          `FNC_SLL: ALUop = `ALU_SLL;
          `FNC_SRL_SRA: ALUop = add_rshift_type == `FNC2_SRL ? `ALU_SRL : `ALU_SRA;
        endcase
      `OPC_ARI_RTYPE:
        case (funct)
          `FNC_ADD_SUB: ALUop = add_rshift_type == `FNC2_ADD ? `ALU_ADD : `ALU_SUB;
          `FNC_SLL: ALUop = `ALU_SLL;
          `FNC_SLT: ALUop = `ALU_SLT;
          `FNC_SLTU: ALUop = `ALU_SLTU;
          `FNC_XOR: ALUop = `ALU_XOR;
          `FNC_SRL_SRA: ALUop = add_rshift_type == `FNC2_SRL ? `ALU_SRL : `ALU_SRA;
          `FNC_OR: ALUop = `ALU_OR;
          `FNC_AND: ALUop = `ALU_AND;
          default: ALUop = `ALU_COPY_B;
        endcase
      default: ALUop = `ALU_COPY_B;
    endcase
  end

endmodule
/**
 * UC Berkeley CS150
 * Fall 2014
 * List of ALU operations.
 *
 * This version written by Arya Reais-Parsi (aryap@berkeley.edu), Spring 2018
*/
`ifndef ALUOP
`define ALUOP

`define ALU_ADD		5'd0
`define ALU_SUB     	5'd1
`define ALU_AND     	5'd2
`define ALU_OR      	5'd3
`define ALU_XOR     	5'd4
`define ALU_SLT     	5'd5
`define ALU_SLTU    	5'd6
`define ALU_SLL     	5'd7
`define ALU_SRA     	5'd8
`define ALU_SRL     	5'd9
`define ALU_COPY_B  	5'd10		// TODO(aryap): Is the additional bit justified?
`define ALU_EQ      	5'd11
`define ALU_NE      	5'd12
`define ALU_LT			5'd13
`define ALU_GE			5'd14
`define ALU_LTU		5'd15
`define ALU_GEU		5'd16

`endif //ALUOP
