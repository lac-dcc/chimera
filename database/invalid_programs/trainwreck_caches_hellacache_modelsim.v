`include "riscvConst.vh"
`include "macros.vh"

`define OP_IS_AMO(x) ((x) == `M_XA_ADD  || (x) == `M_XA_SWAP || \
                      (x) == `M_XA_AND  || (x) == `M_XA_OR   || \
                      (x) == `M_XA_MIN  || (x) == `M_XA_MINU || \
                      (x) == `M_XA_MAX  || (x) == `M_XA_MAXU)
`define OP_IS_LOAD(x) ((x) == `M_XRD || `OP_IS_AMO(x))
`define OP_IS_STORE(x) ((x) == `M_XWR || `OP_IS_AMO(x))
`define OP_IS_FLUSH(x) ((x) == `M_FLA || (x) == `M_RST)

`define CL_BITS (`MEM_DATA_BITS*`MEM_DATA_CYCLES)

module priority_onehot #(parameter WIDTH=1)
(
  input [WIDTH-1:0]    in,
  output reg [WIDTH-1:0] out
);

  always @(*)
  begin
    integer i;
    out[0] = in[0];
    for(i = 1; i < WIDTH; i=i+1)
      out[i] = in[i] & ~out[i-1];
  end
endmodule

module onehot_decoder #(parameter WIDTH=1)
(
  input [WIDTH-1:0]     in,
  output reg [2**WIDTH-1:0] out
);

  always @(*)
  begin
    out = {2**WIDTH{1'b0}};
    out[in] = 1'b1;
  end

endmodule

module priority_encoder #(parameter WIDTH=1)
(
  input [WIDTH-1:0]                 in,
  output reg [`ceilLog2(WIDTH)-1:0] out
);
  always @(*)
  begin
    integer i;
    out = {`ceilLog2(WIDTH){1'bx}};
    for(i = 0; i < WIDTH; i=i+1)
    begin
      if(in[i])
      begin
        out = i;
        break;
      end
    end
  end
endmodule

module MSHRFile #
(
  parameter SETS = 2,
  parameter WAYS = 1,
  parameter NMSHR = 4,
  parameter NSECONDARY_PER_MSHR = 8,
  parameter NSECONDARY_STORES = 16,
  parameter CPU_WIDTH = 64,
  parameter WORD_ADDR_BITS = 29
)
(
  input                       clk,
  input                       reset,

  input                       mshr_req_val,
  output                      mshr_req_rdy,
  output                      mshr_req_rdy_primary,
  input [`CPU_OP_BITS-1:0]    mshr_req_op,
  input [WORD_ADDR_BITS-1:0]  mshr_req_addr,
  input [`ceilLog2(WAYS):0]   mshr_req_way,
  input [CPU_WIDTH-1:0]       mshr_req_data,
  input [CPU_WIDTH/8-1:0]     mshr_req_wmask,
  input [`CPU_TAG_BITS-1:0]   mshr_req_cpu_tag,
  input                       mshr_req_dirty,
  input [WORD_ADDR_BITS-1:`ceilLog2(SETS*`CL_BITS/CPU_WIDTH)] mshr_req_dirty_tag,

  output               tag_req_val,
  input                tag_req_rdy,
  output [`ceilLog2(SETS)-1:0] tag_req_addr,
  output [WAYS-1:0]    tag_req_way_onehot,
  output [WORD_ADDR_BITS+2-1:`ceilLog2(SETS*`CL_BITS/CPU_WIDTH)] tag_req_data,

  output cpu_resp_val,

  output data_req_val,
  input  data_req_rdy,
  output [`CPU_OP_BITS-1:0] data_req_op,
  output [`ceilLog2(SETS*WAYS*`MEM_DATA_CYCLES)-1:0] data_req_addr,
  output [`MEM_DATA_BITS/CPU_WIDTH-1:0] data_req_offset,
  output [CPU_WIDTH-1:0] data_req_data,
  output [CPU_WIDTH/8-1:0] data_req_wmask,
  output [`CPU_TAG_BITS-1:0] data_req_cpu_tag,

  output                        mem_req_val,
  input                         mem_req_rdy,
  output                        mem_req_rw,
  output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)] mem_req_addr,
  output [`ceilLog2(NMSHR)-1:0] mem_req_tag,

  input                        mem_resp_val,
  input                        mem_resp_nack,
  input [`ceilLog2(NMSHR)-1:0] mem_resp_tag,
  output [`ceilLog2(SETS*WAYS*`MEM_DATA_CYCLES)-1:0] mem_resp_addr
);

  localparam LG_NMSHR = `ceilLog2(NMSHR);
  localparam LG_SETS = `ceilLog2(SETS);
  localparam REFILL_CYCLES = `MEM_DATA_CYCLES;
  localparam LG_REFILL_CYCLES = `ceilLog2(REFILL_CYCLES);

  localparam OFFLSB = 0;
  localparam OFFMSB = OFFLSB-1+`ceilLog2(`CL_BITS/CPU_WIDTH);
  localparam IDXLSB = OFFMSB+1;
  localparam IDXMSB = IDXLSB-1+`ceilLog2(SETS);
  localparam IDXBITS = IDXMSB-IDXLSB+1;
  localparam TAGLSB = IDXMSB+1;
  localparam TAGMSB = WORD_ADDR_BITS-1;
  localparam TAGBITS = TAGMSB-TAGLSB+1;
  localparam DATAIDXLSB = `ceilLog2(`MEM_DATA_BITS/CPU_WIDTH);
  localparam MEM_REQ_LSB = `ceilLog2(`MEM_DATA_BITS/CPU_WIDTH);
  localparam DATAIDXBITS = `ceilLog2(WAYS*SETS*`MEM_DATA_CYCLES);

  // MSHR state
  reg [NMSHR-1:0]            valid;
  reg [NMSHR-1:0]            flush;
  reg [NMSHR-1:0]            dirty;
  reg [NMSHR-1:0]            needs_writeback;
  reg [NMSHR-1:0]            needs_refill;
  reg [NMSHR-1:0]            waiting_for_refill;
  reg [LG_REFILL_CYCLES-1:0] writeback_count    [NMSHR-1:0];
  reg [TAGMSB:IDXLSB]        tag                [NMSHR-1:0];
  reg [TAGMSB:TAGLSB]        dirty_tag          [NMSHR-1:0];
  reg [`ceilLog2(WAYS):0]    way                [NMSHR-1:0];

  wire [NMSHR-1:0] secondary_rdy;
  wire [NMSHR-1:0] needs_replay;
  wire [NMSHR-1:0] needs_dealloc;
  wire [NMSHR-1:0] alloc_grant;
  wire [NMSHR-1:0] writeback_grant;
  wire [NMSHR-1:0] refill_grant;
  wire [NMSHR-1:0] replay_grant;
  wire [NMSHR-1:0] dealloc_grant;
  wire [NMSHR-1:0] hit;
  wire [NMSHR-1:0] conflict;

  wire [LG_NMSHR-1:0] replay_tag, writeback_tag, dealloc_tag, mrq_tag;

  // replay queue heads
  wire [`CPU_OP_BITS-1:0]                 secondary_op        [NMSHR-1:0];
  wire [`CPU_TAG_BITS-1:0]                secondary_tag       [NMSHR-1:0];
  wire [OFFMSB:OFFLSB]                    secondary_offset    [NMSHR-1:0];
  wire [`ceilLog2(NSECONDARY_STORES)-1:0] secondary_store_idx [NMSHR-1:0];
  localparam SECONDARY_BITS = `CPU_OP_BITS + `CPU_TAG_BITS +
                              OFFMSB-OFFLSB+1 +
                              `ceilLog2(NSECONDARY_STORES);

  // secondary store state
  reg [NSECONDARY_STORES-1:0] secondary_store_valid;
  reg [CPU_WIDTH-1:0]         secondary_store_data  [NSECONDARY_STORES-1:0];
  reg [CPU_WIDTH/8-1:0]       secondary_store_wmask [NSECONDARY_STORES-1:0];

  wire primary_miss = ~|hit & ~|conflict;
  wire primary_rdy = ~&valid;
  wire mshr_req_store = `OP_IS_STORE(mshr_req_op);
  wire mshr_req_store_rdy = ~mshr_req_store | ~&secondary_store_valid;

  wire writeback_val = |needs_writeback;
  wire replay_val = |needs_replay;
  wire refill_val = |needs_refill;

  wire drq_enq_rdy, mrq_enq_rdy, drq_deq_val, mrq_deq_val;
  wire writeback_rdy = drq_enq_rdy & mrq_enq_rdy;
  wire refill_rdy = mrq_enq_rdy & ~writeback_val;
  wire replay_rdy = drq_enq_rdy & ~writeback_val & ~refill_val;
  wire dealloc_rdy = tag_req_rdy;

  wire drq_enq_val = writeback_val & mrq_enq_rdy | replay_val & ~writeback_val & ~refill_val;
  wire mrq_enq_val = writeback_val & drq_enq_rdy | refill_val & ~writeback_val;

  // alloc/dealloc secondary store data
  wire [`ceilLog2(NSECONDARY_STORES)-1:0] allocatable_store_idx;
  priority_encoder #(NSECONDARY_STORES) enc_storeidx
    (~secondary_store_valid, allocatable_store_idx);
  always @(posedge clk)
  begin
    if(reset)
      secondary_store_valid <= 1'b0;
    else
    begin
      if(mshr_req_rdy && mshr_req_val && mshr_req_store)
        secondary_store_valid[allocatable_store_idx] <= 1'b1;

      if(replay_rdy && replay_val && `OP_IS_STORE(secondary_op[replay_tag]))
        secondary_store_valid[secondary_store_idx[replay_tag]] <= 1'b0;
    end

    if(mshr_req_rdy && mshr_req_val && mshr_req_store)
    begin
      secondary_store_data[allocatable_store_idx] <= mshr_req_data;
      secondary_store_wmask[allocatable_store_idx] <= mshr_req_wmask;
    end
  end

  // mshr logic
  generate
    genvar i;
    for(i = 0; i < NMSHR; i=i+1)
    begin : mshr
      assign hit[i] = valid[i] & ~`OP_IS_FLUSH(mshr_req_op) & ~flush[i] &
        (tag[i] == mshr_req_addr[TAGMSB:IDXLSB]);
      assign conflict[i] = valid[i] & ~hit[i] &
        (tag[i][IDXMSB:IDXLSB] == mshr_req_addr[IDXMSB:IDXLSB]);
      wire alloc_primary = alloc_grant[i] & primary_miss &
                              mshr_req_val & mshr_req_store_rdy;
      wire rpq_enq_val = mshr_req_val & ~`OP_IS_FLUSH(mshr_req_op) &
        (hit[i] & ~needs_dealloc[i] | alloc_grant[i] & primary_miss);
      wire rpq_enq_rdy;
      assign secondary_rdy[i] = rpq_enq_rdy & ~needs_dealloc[i];

      wire rpq_deq_val;
      assign needs_replay[i]
        = rpq_deq_val & ~needs_refill[i] & ~waiting_for_refill[i];
      wire rpq_deq_rdy = replay_rdy & replay_grant[i];

      assign needs_dealloc[i]
        = valid[i] & ~(needs_writeback[i] | needs_refill[i] |
                       waiting_for_refill[i] | needs_replay[i]);

      wire next_needs_writeback
        = (alloc_primary & mshr_req_dirty) |
          (needs_writeback[i] & ~(writeback_grant[i] & writeback_rdy &
                               writeback_count[i] == {LG_REFILL_CYCLES{1'b1}}));
      wire next_needs_refill
        = (alloc_primary & ~`OP_IS_FLUSH(mshr_req_op)) |
          (mem_resp_nack & (mem_resp_tag == i)) |
          (needs_refill[i] & ~(refill_grant[i] & refill_rdy));
      wire next_waiting_for_refill
        = (refill_grant[i] & refill_rdy) |
          (waiting_for_refill[i] & ~((mem_resp_tag == i) & (mem_resp_nack |
           mem_resp_val & writeback_count[i] == {LG_REFILL_CYCLES{1'b1}})));
      wire next_valid
        = alloc_primary |
          valid[i] & ~(dealloc_grant[i] & dealloc_rdy);
      wire next_flush
        = alloc_primary & `OP_IS_FLUSH(mshr_req_op) |
          flush[i] & ~(dealloc_grant[i] & dealloc_rdy);
      wire next_dirty
        = (dirty[i] & ~(dealloc_grant[i] & dealloc_rdy)) |
          (rpq_enq_val & rpq_enq_rdy & mshr_req_store);

      // mshr state logic
      always @(posedge clk)
      begin
        if(reset)
        begin
          valid[i] <= 1'b0;
          flush[i] <= 1'b0;
          dirty[i] <= 1'b0;
          needs_writeback[i] <= 1'b0;
          needs_refill[i] <= 1'b0;
          waiting_for_refill[i] <= 1'b0;
          writeback_count[i] <= {LG_REFILL_CYCLES{1'b0}};
        end
        else
        begin
          valid[i] <= next_valid;
          flush[i] <= next_flush;
          dirty[i] <= next_dirty;
          needs_writeback[i] <= next_needs_writeback;
          needs_refill[i] <= next_needs_refill;
          waiting_for_refill[i] <= next_waiting_for_refill;

          if(writeback_grant[i] & writeback_rdy | mem_resp_val & (mem_resp_tag == i))
            writeback_count[i] <= writeback_count[i] + 1'b1;
        end

        if(alloc_primary)
        begin
          tag[i] <= mshr_req_addr[TAGMSB:IDXLSB];
          dirty_tag[i] <= mshr_req_dirty_tag;
          way[i] <= mshr_req_way;
        end
      end
      
      // secondary miss replay queue
      `VC_SIMPLE_QUEUE(SECONDARY_BITS, NSECONDARY_PER_MSHR) rpq
      (
        .clk(clk),
        .reset(reset),

        .enq_bits({mshr_req_op, mshr_req_cpu_tag, mshr_req_addr[OFFMSB:OFFLSB], allocatable_store_idx}),
        .enq_val(rpq_enq_val),
        .enq_rdy(rpq_enq_rdy),

        .deq_bits({secondary_op[i], secondary_tag[i], secondary_offset[i], secondary_store_idx[i]}),
        .deq_val(rpq_deq_val),
        .deq_rdy(rpq_deq_rdy)
      );
    end

    priority_onehot #(NMSHR) onh_v (~valid, alloc_grant);
    priority_onehot #(NMSHR) onh_d (needs_dealloc, dealloc_grant);
    priority_onehot #(NMSHR) onh_w (needs_writeback, writeback_grant);
    priority_onehot #(NMSHR) onh_r (needs_refill, refill_grant);
    priority_onehot #(NMSHR) onh_p (needs_replay, replay_grant);

    priority_encoder #(NMSHR) enc_m (writeback_grant | ({NMSHR{~|needs_writeback}} & (refill_grant | ({NMSHR{~|needs_refill}} & replay_grant))), mrq_tag);
    priority_encoder #(NMSHR) enc_w (needs_writeback, writeback_tag);
    priority_encoder #(NMSHR) enc_p (needs_replay, replay_tag);
    priority_encoder #(NMSHR) enc_d (needs_dealloc, dealloc_tag);
  endgenerate

  assign mshr_req_rdy_primary = mshr_req_store_rdy & primary_miss & primary_rdy;
  assign mshr_req_rdy = mshr_req_store_rdy & (|(hit & secondary_rdy)) |
                        mshr_req_rdy_primary;

  // update tags after replay
  assign tag_req_addr = tag[dealloc_tag][IDXMSB:IDXLSB];
  generate
    if(WAYS == 1)
      assign tag_req_way_onehot = 1'b1;
    else
      onehot_decoder #(`ceilLog2(WAYS)) waydec
        (way[dealloc_tag][`ceilLog2(WAYS)-1:0], tag_req_way_onehot);
  endgenerate

  assign tag_req_val = |needs_dealloc;
  assign tag_req_data
    = {~flush[dealloc_tag], dirty[dealloc_tag], tag[dealloc_tag][TAGMSB:TAGLSB]};

  // generate requests to the data ram for writebacks and replays

  wire [DATAIDXBITS-1:0] drq_addr;
  assign drq_addr[DATAIDXBITS-`ceilLog2(WAYS)-1:0]
    = {tag[mrq_tag][IDXMSB:IDXLSB],
       writeback_val ? writeback_count[writeback_tag]
                     : secondary_offset[replay_tag][OFFMSB:DATAIDXLSB]};
  generate
    if(WAYS > 1)
      assign drq_addr[DATAIDXBITS-1:DATAIDXBITS-`ceilLog2(WAYS)]
        = way[mrq_tag][`ceilLog2(WAYS)-1:0];
  endgenerate

  wire [`CPU_OP_BITS-1:0] drq_op
    = writeback_val ? `M_XRD : secondary_op[replay_tag];
  wire [CPU_WIDTH-1:0] drq_data = secondary_store_data[secondary_store_idx[replay_tag]];
  wire [CPU_WIDTH/8-1:0] drq_wmask = secondary_store_wmask[secondary_store_idx[replay_tag]];
  wire [`CPU_TAG_BITS-1:0] drq_tag = secondary_tag[replay_tag];

  wire [`MEM_DATA_BITS/CPU_WIDTH-1:0] drq_offset;
  generate
    if(`MEM_DATA_BITS == CPU_WIDTH)
      assign drq_offset = 1'b1;
    else
      onehot_decoder #(`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)) off
        (secondary_offset[replay_tag][DATAIDXLSB-1:0], drq_offset);
  endgenerate

  // don't perform writeback unless mem_req_rdy
  wire drq_deq_rdy = data_req_rdy & ~(~mem_req_rdy & mrq_deq_val & mem_req_rw);
  assign data_req_val = drq_deq_val&~(~mem_req_rdy & mrq_deq_val & mem_req_rw);
  assign cpu_resp_val = drq_deq_rdy & drq_deq_val & ~(mem_req_rdy & mem_req_val & mem_req_rw);

  `VC_PIPE1_QUEUE(`CPU_OP_BITS+DATAIDXBITS+`MEM_DATA_BITS/CPU_WIDTH+CPU_WIDTH+CPU_WIDTH/8+`CPU_TAG_BITS) drq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({drq_op, drq_addr, drq_offset, drq_data, drq_wmask, drq_tag}),
    .enq_val(drq_enq_val),
    .enq_rdy(drq_enq_rdy),

    .deq_bits({data_req_op, data_req_addr, data_req_offset, data_req_data, data_req_wmask, data_req_cpu_tag}),
    .deq_val(drq_deq_val),
    .deq_rdy(drq_deq_rdy)
  );

  // look up data ram index for a memory response
  assign mem_resp_addr[DATAIDXBITS-`ceilLog2(WAYS)-1:0]
    = {tag[mem_resp_tag][IDXMSB:IDXLSB],writeback_count[mem_resp_tag]};
  generate
    if(WAYS > 1)
      assign mem_resp_addr[DATAIDXBITS-1:DATAIDXBITS-`ceilLog2(WAYS)]
        = way[mem_resp_tag][`ceilLog2(WAYS)-1:0];
  endgenerate

  // generate WB/RF requests to next level of hierarchy.
  wire mrq_rw = writeback_val;
  wire [TAGMSB:MEM_REQ_LSB] mrq_addr =
    writeback_val ? {dirty_tag[writeback_tag], tag[mrq_tag][IDXMSB:IDXLSB], writeback_count[writeback_tag]}
                  : {tag[mrq_tag], {LG_REFILL_CYCLES{1'b0}}};

  // don't perform writeback unless data_req_rdy
  wire mrq_deq_rdy = mem_req_rdy & (data_req_rdy | ~mem_req_rw);
  assign mem_req_val = mrq_deq_val & (data_req_rdy | ~mem_req_rw);

  `VC_PIPE1_QUEUE(1+TAGMSB+1-MEM_REQ_LSB+LG_NMSHR) mrq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({mrq_rw, mrq_addr, mrq_tag}),
    .enq_val(mrq_enq_val),
    .enq_rdy(mrq_enq_rdy),

    .deq_bits({mem_req_rw, mem_req_addr, mem_req_tag}),
    .deq_val(mrq_deq_val),
    .deq_rdy(mrq_deq_rdy)
  );

endmodule

module HellaCache #
(
  parameter SETS = 2,
  parameter WAYS = 1,
  parameter NMSHR = 4,
  parameter NSECONDARY_PER_MSHR = 8,
  parameter NSECONDARY_STORES = 16,
  parameter CPU_WIDTH = 64,
  parameter WORD_ADDR_BITS = 29
)
(
  input clk,
  input reset,
  
  input                       cpu_req_val,
  output                      cpu_req_rdy,
  input [`CPU_OP_BITS-1:0]    cpu_req_op,
  input [WORD_ADDR_BITS-1:0]  cpu_req_addr,
  input [CPU_WIDTH-1:0]       cpu_req_data,
  input [CPU_WIDTH/8-1:0]     cpu_req_wmask,
  input [`CPU_TAG_BITS-1:0]   cpu_req_tag,
  
  output reg                     cpu_resp_val,
  output reg [CPU_WIDTH-1:0]     cpu_resp_data,
  output reg [`CPU_TAG_BITS-1:0] cpu_resp_tag,
  
  output                        mem_req_val,
  input                         mem_req_rdy,
  output                        mem_req_rw,
  output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)] mem_req_addr,
  output [`MEM_DATA_BITS-1:0]   mem_req_data,
  output [`ceilLog2(NMSHR)-1:0] mem_req_tag,
  
  input                        mem_resp_val,
  input                        mem_resp_nack,
  input [`MEM_DATA_BITS-1:0]   mem_resp_data,
  input [`ceilLog2(NMSHR)-1:0] mem_resp_tag
);

  localparam LG_NMSHR = `ceilLog2(NMSHR);
  localparam LG_SETS = `ceilLog2(SETS);
  localparam REFILL_CYCLES = `MEM_DATA_CYCLES;
  localparam LG_REFILL_CYCLES = `ceilLog2(REFILL_CYCLES);

  localparam OFFLSB = 0;
  localparam OFFMSB = OFFLSB-1+`ceilLog2(`CL_BITS/CPU_WIDTH);
  localparam OFFBITS = OFFMSB-OFFLSB+1;
  localparam IDXLSB = OFFMSB+1;
  localparam IDXMSB = IDXLSB-1+`ceilLog2(SETS);
  localparam IDXBITS = IDXMSB-IDXLSB+1;
  localparam TAGLSB = IDXMSB+1;
  localparam TAGMSB = WORD_ADDR_BITS-1;
  localparam TAGBITS = TAGMSB-TAGLSB+1;
  localparam DATAIDXLSB = `ceilLog2(`MEM_DATA_BITS/CPU_WIDTH);
  localparam MEM_REQ_LSB = `ceilLog2(`MEM_DATA_BITS/CPU_WIDTH);
  localparam DATAIDXBITS = `ceilLog2(WAYS*SETS*`MEM_DATA_CYCLES);

  // pipeline stage 1.  initiate tag check.
  wire flush_tag_req_val, flush_tag_req_rdy;
  wire stage2_enq_rdy, cpu_tag_req_rdy;
  wire [IDXMSB:IDXLSB] flush_tag_req_addr;
  wire [`CPU_OP_BITS-1:0] flush_tag_req_op, stage1_op;
  assign stage1_op = cpu_tag_req_rdy ? cpu_req_op : flush_tag_req_op;
  wire [WORD_ADDR_BITS-1:0] stage1_addr = cpu_tag_req_rdy ? cpu_req_addr
    : {{WORD_ADDR_BITS-OFFBITS-IDXBITS{1'bx}},flush_tag_req_addr,{OFFBITS{1'bx}}};

  assign cpu_req_rdy = cpu_tag_req_rdy & stage2_enq_rdy;
  wire flush_req_val = cpu_req_val & cpu_tag_req_rdy & stage2_enq_rdy & `OP_IS_FLUSH(cpu_req_op);
  wire stage2_enq_val = cpu_req_val & cpu_tag_req_rdy & ~`OP_IS_FLUSH(cpu_req_op) |
      flush_tag_req_val & flush_tag_req_rdy;

  // pipeline stage 2.  tag comparison and mshr probe.
  // on a miss with ~mshr_req_rdy or a store hit with ~data_req_rdy,
  // this serves as a skid buffer.
  wire [`CPU_OP_BITS-1:0] stage2_op;
  wire [WORD_ADDR_BITS-1:0] stage2_addr;
  wire [CPU_WIDTH-1:0] stage2_data;
  wire [CPU_WIDTH/8-1:0] stage2_wmask;
  wire [`CPU_TAG_BITS-1:0] stage2_cpu_tag;
  wire skid_tag_req_rdy, mshr_tag_req_rdy, mshr_tag_req_val;
  wire amo_req_rdy, amo_req_val, mshr_req_rdy, mshr_req_rdy_primary;
  wire [WAYS-1:0] mshr_tag_req_way_onehot, repl_way_onehot,
                  stage2_tag_req_way_onehot;
  wire stage2_data_req_rdy;
  wire [`ceilLog2(WAYS):0] mshr_req_way, repl_way, hit_way, flush_way,
                           flush_tag_req_way;

  wire [(TAGBITS+2)*WAYS-1:0] tag_out;
  wire stage2_repl_valid, stage2_repl_dirty, stage2_hit_dirty, stage2_hit;
  wire [TAGBITS-1:0] stage2_repl_tag;
  wire [WAYS-1:0] stage2_hits;
  generate
    genvar i;
    wire [WAYS-1:0] stage2_valids, stage2_dirtys;
    wire [TAGBITS+1:0] tags[WAYS-1:0];

    for(i = 0; i < WAYS; i=i+1)
    begin : tagchecks
      assign tags[i] = tag_out[(TAGBITS+2)*(i+1)-1:(TAGBITS+2)*i];
      assign stage2_valids[i] = tags[i][TAGBITS+1];
      assign stage2_dirtys[i] = tags[i][TAGBITS];
      assign stage2_hits[i] = stage2_valids[i] &
        (tags[i][TAGBITS-1:0] == stage2_addr[TAGMSB:TAGLSB]);
    end

    if(WAYS == 1)
    begin
      assign stage2_repl_valid = stage2_valids[0];
      assign stage2_repl_dirty = stage2_dirtys[0];
      assign stage2_hit_dirty = stage2_dirtys[0];
      assign stage2_repl_tag = tags[0][TAGBITS-1:0];
      assign repl_way_onehot = 1'b1;
    end
    else
    begin
      reg [15:0] lfsr;
      always @(posedge clk)
      begin
        if(reset)
          lfsr <= 16'b1;
        else
          lfsr <= {lfsr[0]^lfsr[2]^lfsr[3]^lfsr[5],lfsr[15:1]};
      end
      assign repl_way
        = `OP_IS_FLUSH(stage2_op) ? flush_way : lfsr[`ceilLog2(WAYS)-1:0];
      onehot_decoder #(`ceilLog2(WAYS)) replway
        (repl_way[`ceilLog2(WAYS)-1:0], repl_way_onehot);

      priority_encoder #(WAYS) hitway
        (stage2_hits, hit_way[`ceilLog2(WAYS)-1:0]);

      assign stage2_repl_valid = stage2_valids[repl_way[`ceilLog2(WAYS)-1:0]];
      assign stage2_repl_dirty = stage2_dirtys[repl_way[`ceilLog2(WAYS)-1:0]];
      assign stage2_hit_dirty = |(stage2_hits & stage2_dirtys);
      assign stage2_repl_tag = tags[repl_way[`ceilLog2(WAYS)-1:0]][TAGBITS-1:0];
    end

    assign stage2_hit = |stage2_hits & ~`OP_IS_FLUSH(stage2_op);
    assign mshr_req_way = stage2_hit ? hit_way : repl_way;
  endgenerate

  reg skid_tag_checked;
  always @(posedge clk)
    skid_tag_checked <= skid_tag_req_rdy /* | cpu_tag_req_rdy */;

  wire stage2_deq_val;
  wire stage2_deq_rdy = skid_tag_checked &
    (stage2_hit ? stage2_data_req_rdy : mshr_req_rdy);
  wire stage2_data_req_val = stage2_deq_val & stage2_hit & skid_tag_checked;
  wire mshr_req_val = stage2_deq_val & ~stage2_hit & skid_tag_checked;

  // set dirty bit on a clean store, or clear valid bit on a miss
  assign stage2_tag_req_way_onehot
    = stage2_hit ? stage2_hits : repl_way_onehot;
  wire stage2_tag_req_val 
    = stage2_deq_val & stage2_deq_rdy & ~`OP_IS_FLUSH(stage2_op) &
      (stage2_hit ? `OP_IS_STORE(stage2_op) & ~stage2_hit_dirty : mshr_req_rdy_primary & stage2_repl_valid);
  wire [TAGBITS+1:0] stage2_tag_req_data
    = {stage2_hit, stage2_hit, stage2_addr[TAGMSB:TAGLSB]};
  wire skid_tag_req_val = stage2_deq_val & ~stage2_deq_rdy;

  wire [`MEM_DATA_BITS/CPU_WIDTH-1:0] stage2_data_req_offset;
  generate
    if(`MEM_DATA_BITS == CPU_WIDTH)
      assign stage2_data_req_offset = 1'b1;
    else
      onehot_decoder #(`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)) off
        (stage2_addr[DATAIDXLSB-1:0], stage2_data_req_offset);
  endgenerate

  wire [DATAIDXBITS-1:0] stage2_data_req_addr;
  assign stage2_data_req_addr[DATAIDXBITS-`ceilLog2(WAYS)-1:0]
    = stage2_addr[IDXMSB:DATAIDXLSB];
  generate
    if(WAYS > 1)
      assign stage2_data_req_addr[DATAIDXBITS-1:DATAIDXBITS-`ceilLog2(WAYS)]
        = hit_way[`ceilLog2(WAYS)-1:0];
  endgenerate

  `VC_PIPE1_QUEUE(`CPU_OP_BITS+WORD_ADDR_BITS+WAYS+CPU_WIDTH+CPU_WIDTH/8+`CPU_TAG_BITS) stage2
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({stage1_op, stage1_addr, flush_tag_req_way, cpu_req_data, cpu_req_wmask, cpu_req_tag}),
    .enq_val(stage2_enq_val),
    .enq_rdy(stage2_enq_rdy),

    .deq_bits({stage2_op, stage2_addr, flush_way, stage2_data, stage2_wmask, stage2_cpu_tag}),
    .deq_val(stage2_deq_val),
    .deq_rdy(stage2_deq_rdy)
  );

  // stage2 accesses (misses clearing valid bit or stores setting dirty bit)
  // have first priority for tag ram access, followed by MSHR file,
  // followed by skid-buffered CPU requests, followed by CPU requests.

  wire [IDXMSB:IDXLSB] mshr_tag_req_addr;
  wire [TAGBITS+1:0] mshr_tag_req_data;

  assign mshr_tag_req_rdy = ~stage2_tag_req_val;
  assign skid_tag_req_rdy = mshr_tag_req_rdy & ~mshr_tag_req_val;
  assign flush_tag_req_rdy = skid_tag_req_rdy & ~skid_tag_req_val;
  assign cpu_tag_req_rdy = flush_tag_req_rdy & ~flush_tag_req_val;
  wire tag_req_val = stage2_tag_req_val | mshr_tag_req_val |
                     cpu_req_val | skid_tag_req_val | flush_tag_req_val;

  wire
  tag_req_rw         = stage2_tag_req_val ? 1'b1
                     : mshr_tag_req_val   ? 1'b1
                     : skid_tag_req_val   ? 1'b0
                     : flush_tag_req_val  ? 1'b0
                     :                      1'b0;
  wire [IDXMSB:IDXLSB]
  tag_req_addr       = stage2_tag_req_val ? stage2_addr[IDXMSB:IDXLSB]
                     : mshr_tag_req_val   ? mshr_tag_req_addr
                     : skid_tag_req_val   ? stage2_addr[IDXMSB:IDXLSB]
                     : flush_tag_req_val  ? flush_tag_req_addr
                     :                      cpu_req_addr[IDXMSB:IDXLSB];
  wire [TAGBITS+1:0]
  tag_req_data       = stage2_tag_req_val ? stage2_tag_req_data
                     :                      mshr_tag_req_data;
  wire [WAYS-1:0]
  tag_req_way_onehot = stage2_tag_req_val ? stage2_tag_req_way_onehot
                     :                      mshr_tag_req_way_onehot;

  wire [(TAGBITS+2)*WAYS-1:0] tag_req_data_expanded;
//  wire [8*WAYS-1:0] tag_req_data_expanded;
  generate
    for(i = 0; i < WAYS; i=i+1)
    begin : tagdata
//      assign tag_req_data_expanded[8*(i+1)-1:8*i] = {1'b0, tag_req_data};
      assign tag_req_data_expanded[(TAGBITS+2)*(i+1)-1:(TAGBITS+2)*i]
        = tag_req_data;
    end
  endgenerate


  HellaCacheRAM #
  (
    .WIDTH((TAGBITS+2)*WAYS),
    .DEPTH(SETS),
    .BYTESIZE(TAGBITS+2)
  )
  tag
  (
    .clk(clk),

    .en(tag_req_val),
    .rw(tag_req_rw),
    .addr(tag_req_addr),
    .din(tag_req_data_expanded),
    .wmask(tag_req_way_onehot),

    .dout(tag_out)
  ); 

/*
  wire [48:0] dummy;
  wire dummy2;
  SRAM6T_64x1024 tag
  (
    .clk(clk),
    .write(tag_req_rw),
    .din({48'd0, tag_req_data_expanded}),
    .writeMask({6'd0, tag_req_way_onehot}),
    .readMask(2'b11),
    .saenTune(2'b00),
    .addr({3'd0, tag_req_addr}),
    .dout({dummy,tag_out[13:7], dummy2, tag_out[6:0]})
  );
*/

  // Refills have highest priority for data ram access, followed by AMOs,
  // followed by MSHR file, followed by stage2 cpu requests.
  wire amo_data_req_val, mshr_data_req_val;
  wire [DATAIDXBITS-1:0] mem_resp_addr, amo_data_req_addr, mshr_data_req_addr;
  wire [CPU_WIDTH-1:0] amo_data_req_data, mshr_data_req_data;
  wire [CPU_WIDTH/8-1:0] amo_data_req_wmask, mshr_data_req_wmask;
  wire [`CPU_TAG_BITS-1:0] amo_data_req_cpu_tag, mshr_data_req_cpu_tag, flush_resp_cpu_tag;
  wire [`CPU_OP_BITS-1:0] mshr_data_req_op;
  wire [`MEM_DATA_BITS/CPU_WIDTH-1:0] amo_data_req_offset,
                                      mshr_data_req_offset;

  wire amo_data_req_rdy = ~mem_resp_val;
  wire mshr_data_req_rdy = amo_data_req_rdy & ~amo_data_req_val
                         & amo_req_rdy; // inhibit mshr/cpu reqs during amo
  assign stage2_data_req_rdy = mshr_data_req_rdy & ~mshr_data_req_val;
  wire flush_resp_rdy = stage2_data_req_rdy & ~stage2_data_req_val;
  wire data_req_val = mem_resp_val | amo_data_req_val |
                      amo_req_rdy & (mshr_data_req_val | stage2_data_req_val);

  wire [DATAIDXBITS-1:0]
  data_req_addr      = mem_resp_val        ? mem_resp_addr
                     : amo_data_req_val    ? amo_data_req_addr
                     : mshr_data_req_val   ? mshr_data_req_addr
                     :                       stage2_data_req_addr;
  wire [`CPU_OP_BITS-1:0]
  data_req_op        = mshr_data_req_val   ? mshr_data_req_op
                     :                       stage2_op;
  wire
  data_req_rw        = mem_resp_val        ? 1'b1
                     : amo_data_req_val    ? 1'b1
                     : mshr_data_req_val   ? mshr_data_req_op == `M_XWR
                     :                       data_req_op == `M_XWR;
  wire [CPU_WIDTH-1:0]
  data_req_data_word = amo_data_req_val    ? amo_data_req_data
                     : mshr_data_req_val   ? mshr_data_req_data
                     :                       stage2_data;
  wire [`MEM_DATA_BITS-1:0] data_req_data_word_expanded;
  wire [`MEM_DATA_BITS-1:0]
  data_req_data      = mem_resp_val        ? mem_resp_data
                     :                       data_req_data_word_expanded;
  wire [CPU_WIDTH/8-1:0]
  data_req_wmask_word= amo_data_req_val    ? amo_data_req_wmask
                     : mshr_data_req_val   ? mshr_data_req_wmask
                     :                       stage2_wmask;
  wire [`MEM_DATA_BITS/8-1:0] data_req_wmask_word_expanded;
  wire [`MEM_DATA_BITS/8-1:0]
  data_req_wmask     = mem_resp_val        ? {`MEM_DATA_BITS/8{1'b1}}
                     :                       data_req_wmask_word_expanded;
  wire [`CPU_TAG_BITS-1:0]
  data_req_cpu_tag   = mshr_data_req_val   ? mshr_data_req_cpu_tag
                     : stage2_data_req_val ? stage2_cpu_tag
                     :                       flush_resp_cpu_tag;
  wire [`MEM_DATA_BITS/CPU_WIDTH-1:0]
  data_req_offset    = mshr_data_req_val   ? mshr_data_req_offset
                     : amo_data_req_val    ? amo_data_req_offset
                     :                       stage2_data_req_offset;

  // expand CPU-width requests to mem-width requests
  reg [`MEM_DATA_BITS/CPU_WIDTH-1:0] cpu_resp_offset;
  wire [`MEM_DATA_BITS-1:0] data_out;
  generate
    for(i = 0; i < `MEM_DATA_BITS/CPU_WIDTH; i=i+1)
    begin : wmask
      assign data_req_data_word_expanded[CPU_WIDTH*(i+1)-1:CPU_WIDTH*i]
        = data_req_data_word;
      assign data_req_wmask_word_expanded[CPU_WIDTH/8*(i+1)-1:CPU_WIDTH/8*i]
        = {(CPU_WIDTH/8){data_req_offset[i]}} & data_req_wmask_word;
    end
    genvar j;
    reg [CPU_WIDTH-1:0] dout_word;
    for(i = 0; i < CPU_WIDTH; i=i+1)
    begin : dout

     //  integer j;
      //  dout_word[i] = 1'b0;
        for(j = 0; j < `MEM_DATA_BITS/CPU_WIDTH; j=j+1)
        begin
          always @(*)
             begin
     
               if (((data_out[i+j*CPU_WIDTH] & cpu_resp_offset[j]) == 1'b1) || (dout_word[i] == 1'b1))
                   dout_word[i] = 1'b1;
               else
                   dout_word[i] = 1'b0;  
//        dout_word[i] |= data_out[i+j*CPU_WIDTH] & cpu_resp_offset[j];
             end
        end
    end
    assign cpu_resp_data = dout_word;
  endgenerate

`ifdef ASIC
  wire [1:0] sram_readmask = {data_req_val & ~data_req_rw, data_req_val & ~data_req_rw};
  SRAM6T_64x1024 data1
  (
    .clk(clk),
    .write(data_req_val & data_req_rw),
    .din(data_req_data[63:0]),
    .writeMask(data_req_wmask[7:0]),
    .readMask(sram_readmask),
    .saenTune(2'b00),
    .addr(data_req_addr),
    .dout(data_out[63:0])
  );

  SRAM6T_64x1024 data2
  (
    .clk(clk),
    .write(data_req_val & data_req_rw),
    .din(data_req_data[127:64]),
    .writeMask(data_req_wmask[15:8]),
    .readMask(sram_readmask),
    .saenTune(2'b00),
    .addr(data_req_addr),
    .dout(data_out[127:64])
  );
`else
  HellaCacheRAM #
  (
    .WIDTH(`MEM_DATA_BITS),
    .DEPTH(2**DATAIDXBITS),
    .BYTESIZE(8)
  )
  data
  (
    .clk(clk),

    .en(data_req_val),
    .rw(data_req_rw),
    .addr(data_req_addr),
    .din(data_req_data),
    .wmask(data_req_wmask),

    .dout(data_out)
  );
`endif

  // MSHR file has highest priority for AMO unit, followed by stage2 cpu
  // requests.  This is already enforced by data_req_rdy, so no arbiter here.
  assign amo_req_val =
    mshr_data_req_rdy & mshr_data_req_val & `OP_IS_AMO(mshr_data_req_op) |
    stage2_data_req_rdy & stage2_data_req_val & `OP_IS_AMO(stage2_op);
 
  reg amo_lhs_val; // lhs ready one cycle after rhs
  always @(posedge clk)
    if(reset)
      amo_lhs_val <= 1'b0;
    else
      amo_lhs_val <= amo_req_val & amo_req_rdy;

  HellaCacheAMO #
  (
    .SETS(SETS),
    .WAYS(WAYS),
    .CPU_WIDTH(CPU_WIDTH)
  )
  amo
  (
    .clk(clk),
    .reset(reset),

    .amo_req_val(amo_req_val),
    .amo_req_rdy(amo_req_rdy),
    .amo_req_op(data_req_op),
    .amo_req_addr(data_req_addr),
    .amo_req_offset(data_req_offset),
    .amo_req_rhs(data_req_data_word),
    .amo_req_wmask(data_req_wmask_word),

    .amo_lhs_val(amo_lhs_val),
    .amo_lhs_rdy(),
    .amo_lhs_data(cpu_resp_data),

    .amo_data_req_val(amo_data_req_val),
    .amo_data_req_rdy(amo_data_req_rdy),
    .amo_data_req_addr(amo_data_req_addr),
    .amo_data_req_offset(amo_data_req_offset),
    .amo_data_req_data(amo_data_req_data),
    .amo_data_req_wmask(amo_data_req_wmask)
  );

  // flush logic
  wire flush_resp_val;
  HellaCacheFlusher #
  (
    .SETS(SETS),
    .WAYS(WAYS),
    .TAGBITS(TAGBITS)
  )
  flusher
  (
    .clk(clk),
    .reset(reset),

    .flush_req_val(flush_req_val),
    .flush_req_rdy(), // tag arbiter takes care of this
    .flush_req_cpu_tag(cpu_req_tag),

    .flush_resp_val(flush_resp_val),
    .flush_resp_rdy(flush_resp_rdy),
    .flush_resp_cpu_tag(flush_resp_cpu_tag),

    .tag_req_val(flush_tag_req_val),
    .tag_req_rdy(flush_tag_req_rdy & stage2_enq_rdy),
    .tag_req_op(flush_tag_req_op),
    .tag_req_addr(flush_tag_req_addr),
    .tag_req_way(flush_tag_req_way)
  );

  // MSHR file
  wire mshr_mem_req_val, mshr_mem_req_rdy, mshr_mem_req_rw, mshr_cpu_resp_val;
  wire [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)] mshr_mem_req_addr;
  wire [LG_NMSHR-1:0] mshr_mem_req_tag;

  MSHRFile #
  (
    .SETS(SETS),
    .WAYS(WAYS),
    .NMSHR(NMSHR),
    .NSECONDARY_PER_MSHR(NSECONDARY_PER_MSHR),
    .NSECONDARY_STORES(NSECONDARY_STORES),
    .CPU_WIDTH(CPU_WIDTH),
    .WORD_ADDR_BITS(WORD_ADDR_BITS)
  )
  mshrfile
  (
    .clk(clk),
    .reset(reset),

    .mshr_req_val(mshr_req_val),
    .mshr_req_rdy(mshr_req_rdy),
    .mshr_req_rdy_primary(mshr_req_rdy_primary),
    .mshr_req_op(stage2_op),
    .mshr_req_addr(stage2_addr),
    .mshr_req_way(mshr_req_way),
    .mshr_req_data(stage2_data),
    .mshr_req_wmask(stage2_wmask),
    .mshr_req_cpu_tag(stage2_cpu_tag),
    .mshr_req_dirty(stage2_repl_valid & stage2_repl_dirty & stage2_op != `M_RST),
    .mshr_req_dirty_tag(stage2_repl_tag),

    .tag_req_val(mshr_tag_req_val),
    .tag_req_rdy(mshr_tag_req_rdy),
    .tag_req_addr(mshr_tag_req_addr),
    .tag_req_way_onehot(mshr_tag_req_way_onehot),
    .tag_req_data(mshr_tag_req_data),

    .cpu_resp_val(mshr_cpu_resp_val),

    .data_req_val(mshr_data_req_val),
    .data_req_rdy(mshr_data_req_rdy),
    .data_req_op(mshr_data_req_op),
    .data_req_addr(mshr_data_req_addr),
    .data_req_offset(mshr_data_req_offset),
    .data_req_data(mshr_data_req_data),
    .data_req_wmask(mshr_data_req_wmask),
    .data_req_cpu_tag(mshr_data_req_cpu_tag),

    .mem_req_val(mshr_mem_req_val),
    .mem_req_rdy(mshr_mem_req_rdy),
    .mem_req_rw(mshr_mem_req_rw),
    .mem_req_addr(mshr_mem_req_addr),
    .mem_req_tag(mshr_mem_req_tag),

    .mem_resp_val(mem_resp_val),
    .mem_resp_nack(mem_resp_nack),
    .mem_resp_tag(mem_resp_tag),
    .mem_resp_addr(mem_resp_addr)
  );

  // pipeline stage 3: cpu response
  wire next_cpu_resp_val
    = (mshr_cpu_resp_val & mshr_data_req_rdy & ~`OP_IS_FLUSH(mshr_data_req_op))|
      (stage2_data_req_val & stage2_data_req_rdy & ~`OP_IS_FLUSH(mshr_data_req_op)) |
      (flush_resp_val & flush_resp_rdy);

  always @(posedge clk)
  begin
    if(reset)
      cpu_resp_val <= 1'b0;
    else
      cpu_resp_val <= next_cpu_resp_val;
    cpu_resp_tag <= data_req_cpu_tag;
    cpu_resp_offset <= data_req_offset;
  end

  // mem request
  // note this assumes that store data is valid the cycle after the mshr req.

  `VC_PIPE1_QUEUE(1+(WORD_ADDR_BITS-`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH))+`ceilLog2(NMSHR)) mrq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({mshr_mem_req_rw, mshr_mem_req_addr, mshr_mem_req_tag}),
    .enq_val(mshr_mem_req_val),
    .enq_rdy(mshr_mem_req_rdy),

    .deq_bits({mem_req_rw, mem_req_addr, mem_req_tag}),
    .deq_val(mem_req_val),
    .deq_rdy(mem_req_rdy)
  );

  reg [`MEM_DATA_BITS-1:0] mrq_data;
  reg mrq_data_val;
  always @(posedge clk)
  begin
    if(reset)
      mrq_data_val <= 1'b0;
    else
      mrq_data_val <= mem_req_val & ~mem_req_rdy;

    if(mem_req_val & ~mem_req_rdy & ~mrq_data_val)
      mrq_data <= data_out;
  end

  assign mem_req_data = mrq_data_val ? mrq_data : data_out;

endmodule


module HellaCacheAMO #
(
  parameter SETS = 2,
  parameter WAYS = 2,
  parameter CPU_WIDTH = 64,
  parameter AMO_WIDTH = 64
)
(
  input  clk,
  input  reset,

  input                    amo_req_val,
  output                   amo_req_rdy,
  input [`CPU_OP_BITS-1:0] amo_req_op,
  input [`ceilLog2(SETS*WAYS*`MEM_DATA_CYCLES)-1:0] amo_req_addr,
  input [`MEM_DATA_BITS/CPU_WIDTH-1:0] amo_req_offset,
  input [CPU_WIDTH-1:0]    amo_req_rhs,
  input [CPU_WIDTH/8-1:0]  amo_req_wmask,

  input                    amo_lhs_val,
  output                   amo_lhs_rdy,
  input [CPU_WIDTH-1:0]    amo_lhs_data,

  output reg               amo_data_req_val,
  input                    amo_data_req_rdy,
  output [`ceilLog2(SETS*WAYS*`MEM_DATA_CYCLES)-1:0] amo_data_req_addr,
  output [`MEM_DATA_BITS/CPU_WIDTH-1:0] amo_data_req_offset,
  output reg [CPU_WIDTH-1:0]   amo_data_req_data,
  output [CPU_WIDTH/8-1:0] amo_data_req_wmask
);

  wire [`CPU_OP_BITS-1:0]     op;
  wire [AMO_WIDTH-1:0]   lhs, rhs, result;
  wire lhs_val, rhs_val;
  wire amo_hilo = amo_req_wmask[7:0] == 8'd0 ? 1'b1 : 1'b0;
  wire amo_data_hilo;
  wire [63:0] amo_req_rhs64  = amo_hilo ? amo_req_rhs[127:64] : amo_req_rhs[63:0];

  `VC_PIPE1_QUEUE(`CPU_OP_BITS + `ceilLog2(SETS*WAYS*`MEM_DATA_CYCLES) + `MEM_DATA_BITS/CPU_WIDTH + AMO_WIDTH + CPU_WIDTH/8 + 1) rhsq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({amo_req_op, amo_req_addr, amo_req_offset, amo_req_rhs64, amo_req_wmask, amo_hilo}),
    .enq_val(amo_req_val),
    .enq_rdy(amo_req_rdy),

    .deq_bits({op, amo_data_req_addr, amo_data_req_offset, rhs, amo_data_req_wmask, amo_data_hilo}),
    .deq_val(rhs_val),
    .deq_rdy(amo_data_req_rdy & amo_data_req_val)
  );

  `VC_PIPE1_QUEUE(AMO_WIDTH) lhsq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits(amo_data_hilo ? amo_lhs_data[127:64] : amo_lhs_data[63:0]),
    .enq_val(amo_lhs_val),
    .enq_rdy(amo_lhs_rdy),

    .deq_bits(lhs),
    .deq_val(lhs_val),
    .deq_rdy(amo_data_req_rdy & amo_data_req_val)
  );

  wire [7:0]  amo_data_req_wmask8 = amo_data_hilo ? amo_data_req_wmask[15:8] : amo_data_req_wmask[7:0];

  HellaCacheAMOALU #
  (
    .CPU_WIDTH(AMO_WIDTH)
  )
  alu
  (
    .op(op),
    .wmask(amo_data_req_wmask8),
    .lhs(lhs),
    .rhs(rhs),
    .result(result)
  );

  always @(posedge clk)
  begin
    if(reset)
      amo_data_req_val <= 1'b0;
    else
      amo_data_req_val <= lhs_val & rhs_val;

    if(lhs_val & rhs_val)
      amo_data_req_data <= {result, result};
  end

endmodule

module HellaCacheFlusher #
(
  parameter SETS = 2,
  parameter WAYS = 2,
  parameter TAGBITS = 1
)
(
  input  clk,
  input  reset,

  input  flush_req_val,
  output flush_req_rdy,
  input  [`CPU_TAG_BITS-1:0] flush_req_cpu_tag,

  output reg flush_resp_val,
  input  flush_resp_rdy,
  output [`CPU_TAG_BITS-1:0] flush_resp_cpu_tag,

  output                       tag_req_val,
  input                        tag_req_rdy,
  output [`CPU_OP_BITS-1:0]    tag_req_op,
  output [`ceilLog2(SETS)-1:0] tag_req_addr,
  output [`ceilLog2(WAYS):0]   tag_req_way
);

  localparam WAYIDXBITS = `ceilLog2(SETS*WAYS);

  reg flushing, resetting;
  reg [WAYIDXBITS-1:0] count;
  reg [`CPU_TAG_BITS-1:0] tag;

  wire done_flushing = tag_req_rdy & count == {WAYIDXBITS{1'b1}};

  always @(posedge clk)
  begin
    if(reset)
    begin
      resetting <= 1'b1;
      flushing <= 1'b1;
      flush_resp_val <= 1'b0;
    end
    else
    begin
      resetting <= resetting & ~done_flushing;
      flushing <= flush_req_val | flushing & ~done_flushing;
      flush_resp_val <= flushing & ~resetting & done_flushing |
                        flush_resp_val & ~flush_resp_rdy;
    end

    if(reset)
      count <= {WAYIDXBITS{1'b0}};
    else if(tag_req_val && tag_req_rdy)
      count <= count+1'b1;

    if(flush_req_val && flush_req_rdy)
      tag <= flush_req_cpu_tag;
  end

  assign flush_req_rdy = ~flushing & ~flush_resp_val;

  assign flush_resp_cpu_tag = tag;

  assign tag_req_val = flushing;
  assign tag_req_op = resetting ? `M_RST : `M_FLA;
  assign tag_req_addr = count[`ceilLog2(SETS)-1:0];

  generate
    if(WAYS > 1)
      assign tag_req_way[`ceilLog2(WAYS)-1:0]
        = count[WAYIDXBITS-1:WAYIDXBITS-`ceilLog2(WAYS)];
  endgenerate

endmodule

module HellaCacheAMOALU #
(
  parameter CPU_WIDTH = 64
)
(
  input  wire [`CPU_OP_BITS-1:0]    op,
  input  wire [CPU_WIDTH/8-1:0] wmask,
  input  wire [CPU_WIDTH-1:0]  lhs,
  input  wire [CPU_WIDTH-1:0]  rhs,
  output reg  [CPU_WIDTH-1:0]  result
);

  reg [CPU_WIDTH-1:0] sum;
  reg signed_comp, sub, tmp;
  reg [CPU_WIDTH-1:0] minmax;
  reg less2[1:0], less;
  reg [CPU_WIDTH-1:0] adder_lhs, adder_rhs;
  reg wmask_hi, wmask_lo;

  always @(*) begin
    signed_comp = op == `M_XA_MIN || op == `M_XA_MAX;
    sub = op == `M_XA_MIN || op == `M_XA_MINU ||
          op == `M_XA_MAX || op == `M_XA_MAXU;

    // zap MSBs of lower word if doing a word AMO on the upper word
//    adder_lhs[CPU_WIDTH/2-1] = adder_lhs[CPU_WIDTH/2-1] & wmask[CPU_WIDTH/8/2-1];
//    adder_rhs = rhs;
//    adder_rhs[CPU_WIDTH/2-1] = adder_rhs[CPU_WIDTH/2-1] & wmask[CPU_WIDTH/8/2-1];

    // NOTE: I made this change because in simulation sum was all Xs when either
    // of adder_lhs or adder_rhs has Xs in it (since data was coming from memory which
    // was not initialized).  However I think the problem would have gone away if I
    // just set the RAM to have any non X initial value)
    // although my changes will prevent a 128 bit ALU from being synthesized unnecessarily

    wmask_hi = (wmask[7:4] == 4'hF);
    wmask_lo = (wmask[3:0] == 4'hF);

    adder_lhs[31:0]  = wmask_lo ? lhs[31:0] : 32'd0;
    adder_lhs[63:32] = wmask_hi ? lhs[63:32] : 32'd0;

    adder_rhs[31:0]  = wmask_lo ? rhs[31:0] : 32'd0;
    adder_rhs[63:32] = wmask_hi ? rhs[63:32] : 32'd0;

    adder_rhs = sub ? ~rhs : rhs;
    {sum,tmp} = {adder_lhs,1'b0}+{adder_rhs,sub};

    less2[0] = lhs[CPU_WIDTH/2-1] == rhs[CPU_WIDTH/2-1] ? sum[CPU_WIDTH/2-1]
             : signed_comp                                          ? lhs[CPU_WIDTH/2-1]
             :                                                        rhs[CPU_WIDTH/2-1];
    less2[1] = lhs[CPU_WIDTH-1] == rhs[CPU_WIDTH-1] ? sum[CPU_WIDTH-1]
             : signed_comp                                      ? lhs[CPU_WIDTH-1]
             :                                                    rhs[CPU_WIDTH-1];
    less = less2[wmask[CPU_WIDTH/8-1]];

    case(op)
      `M_XA_ADD:  result = sum;
      `M_XA_SWAP: result = rhs;
      `M_XA_AND:  result = lhs & rhs;
      `M_XA_OR:   result = lhs | rhs;
      `M_XA_MIN:  result =  less ? lhs : rhs;
      `M_XA_MINU: result =  less ? lhs : rhs;
      `M_XA_MAX:  result = ~less ? lhs : rhs;
      `M_XA_MAXU: result = ~less ? lhs : rhs;
      default:    result = 'x;
    endcase
  end

endmodule

module HellaCacheRAM #
(
  parameter WIDTH = 2,
  parameter DEPTH = 2,
  parameter BYTESIZE = WIDTH
)
(
  input clk,

  input en,
  input rw,
  input [`ceilLog2(DEPTH)-1:0] addr,
  input [WIDTH-1:0] din,
  input [WIDTH/BYTESIZE-1:0] wmask,

  output [WIDTH-1:0] dout
);

  sram #
  (
    .WIDTH(WIDTH),
    .LG_DEPTH(`ceilLog2(DEPTH)),
    .BYTESIZE(BYTESIZE)
  )
  sram
  (
    .A1(addr),
    .BM1(wmask),
    .CE1(clk),
    .WEB1(~rw),
    .OEB1(1'b0),
    .CSB1(~en),
    .I1(din),
    .O1(dout)
  );

endmodule
