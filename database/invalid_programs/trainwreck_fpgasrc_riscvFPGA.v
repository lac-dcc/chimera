`include "riscvConst.vh"
`include "macros.vh"

module riscvFPGA_no_htif
(
  input clk,
  input reset,

  output error_mode,

  output       console_out_val,
  input        console_out_rdy,
  output [7:0] console_out_bits
);

  wire log_control;

  wire        htif_start        = 1'b1;
  wire        htif_fromhost_wen = 1'b0;
  wire [31:0] htif_fromhost;
  wire [31:0] htif_tohost;
  wire        htif_req_val      = 1'b0;
  wire        htif_req_rdy;
  wire[3:0]   htif_req_op;
  wire[31:0]  htif_req_addr;
  wire[63:0]  htif_req_data;
  wire[7:0]   htif_req_wmask;
  wire[11:0]  htif_req_tag;
  wire        htif_resp_val;
  wire [63:0] htif_resp_data;
  wire [11:0] htif_resp_tag;

  riscvFPGA core
  (
    .clk(clk),
    .reset(reset),

    .error_mode(error_mode),
    .log_control(log_control),

    .htif_start(htif_start),
    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),
    .htif_req_val(htif_req_val),
    .htif_req_rdy(htif_req_rdy),
    .htif_req_op(htif_req_op),
    .htif_req_addr(htif_req_addr),
    .htif_req_data(htif_req_data),
    .htif_req_wmask(htif_req_wmask),
    .htif_req_tag(htif_req_tag),
    .htif_resp_val(htif_resp_val),
    .htif_resp_data(htif_resp_data),
    .htif_resp_tag(htif_resp_tag),

    .console_out_val(console_out_val),
    .console_out_rdy(console_out_rdy),
    .console_out_bits(console_out_bits)
  );

endmodule

module riscvFPGA
(
  input clk,
  input reset,

  output error_mode,
  output log_control,

  output       console_out_val,
  input        console_out_rdy,
  output [7:0] console_out_bits,

  input         htif_start,
  input         htif_fromhost_wen,
  input  [31:0] htif_fromhost,
  output [31:0] htif_tohost,
  input         htif_req_val,
  output        htif_req_rdy,
  input [3:0]   htif_req_op,
  input [31:0]  htif_req_addr,
  input [63:0]  htif_req_data,
  input [7:0]   htif_req_wmask,
  input [11:0]  htif_req_tag,
  output        htif_resp_val,
  output [63:0] htif_resp_data,
  output [11:0] htif_resp_tag
);

  wire                       mem_req_val;
  wire                       mem_req_rdy;
  wire                       mem_req_rw;
  wire  [`MEM_ADDR_BITS-1:0] mem_req_addr;
  wire  [`MEM_DATA_BITS-1:0] mem_req_data;
  wire  [`MEM_TAG_BITS-1:0]  mem_req_tag;

  wire                       mem_resp_val;
  wire [`MEM_DATA_BITS-1:0]  mem_resp_data;
  wire [`MEM_TAG_BITS-1:0]   mem_resp_tag;

  riscvCore core
  (
    .clk(clk),
    .reset(reset),

    .error_mode(error_mode),
    .log_control(log_control),

    .htif_start(htif_start),
    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),
    .htif_req_val(htif_req_val),
    .htif_req_rdy(htif_req_rdy),
    .htif_req_op(htif_req_op),
    .htif_req_addr(htif_req_addr),
    .htif_req_data(htif_req_data),
    .htif_req_wmask(htif_req_wmask),
    .htif_req_tag(htif_req_tag),
    .htif_resp_val(htif_resp_val),
    .htif_resp_data(htif_resp_data),
    .htif_resp_tag(htif_resp_tag),

    .console_out_val(console_out_val),
    .console_out_rdy(console_out_rdy),
    .console_out_bits(console_out_bits),

    .mem_req_val(mem_req_val),
    .mem_req_rdy(mem_req_rdy),
    .mem_req_rw(mem_req_rw),
    .mem_req_addr(mem_req_addr),
    .mem_req_data(mem_req_data),
    .mem_req_tag(mem_req_tag),

    .mem_resp_val(mem_resp_val),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag)
  );

  riscvBRAMMemory riscvBRAMMemory
  (
    .clk(clk),
    .reset(reset),

    .mem_req_val(mem_req_val),
    .mem_req_rdy(mem_req_rdy),
    .mem_req_rw(mem_req_rw),
    .mem_req_addr(mem_req_addr),
    .mem_req_data(mem_req_data),
    .mem_req_tag(mem_req_tag),

    .mem_resp_val(mem_resp_val),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag)
  );

endmodule

module riscvBRAMMemory
(
  input clk,
  input reset,

  input                      mem_req_val,
  output                     mem_req_rdy,
  input                      mem_req_rw,
  input [`MEM_ADDR_BITS-1:0] mem_req_addr,
  input [`MEM_DATA_BITS-1:0] mem_req_data,
  input [`MEM_TAG_BITS-1:0]  mem_req_tag,

  output                      mem_resp_val,
  output [`MEM_DATA_BITS-1:0] mem_resp_data,
  output [`MEM_TAG_BITS-1:0]  mem_resp_tag
);

  parameter MEMSIZE = 512*1024;
  localparam ADDR_BITS = `ceilLog2(MEMSIZE*8/`MEM_DATA_BITS);

  reg read_valid;
  reg [`MEM_TAG_BITS-1:0] tag;
  reg [`ceilLog2(`MEM_DATA_CYCLES)-1:0] read_cycle,write_cycle;
  reg [`MEM_DATA_BITS-1:0] dout;
  reg [`MEM_ADDR_BITS-1:0] r_mem_req_addr;

  wire busy = |read_cycle;
  wire read_en = mem_req_val & ~busy & ~mem_req_rw | busy & read_valid;
  wire write_en = mem_req_val & ~busy & mem_req_rw;

  wire [`ceilLog2(`MEM_DATA_CYCLES)-1:0] cycle
    = read_en ? read_cycle : write_cycle;

  wire [`MEM_ADDR_BITS-1:0] cpu_addr
    = (mem_req_val & ~busy) ? mem_req_addr
    : r_mem_req_addr;
  reg [ADDR_BITS-`ceilLog2(`MEM_DATA_CYCLES)-1:0] translated_addr;

  always @(*) begin
    if(cpu_addr < `MEM_ADDR_BITS'h1000)
      translated_addr = {2'b00,cpu_addr[11:0]};
    else if(cpu_addr < `MEM_ADDR_BITS'h2001000)
      translated_addr = {2'b01,cpu_addr[11:0]};
    else if(cpu_addr < `MEM_ADDR_BITS'h3800000)
      translated_addr = {2'b10,cpu_addr[11:0]};
    else if(cpu_addr < `MEM_ADDR_BITS'h3801000)
      translated_addr = {2'b11,cpu_addr[11:0]};
    else
      translated_addr = {14{1'bx}};
  end

  wire [ADDR_BITS-1:0] addr = {translated_addr,cycle};

  always @(posedge clk) begin
    if(reset)
      read_cycle <= {`ceilLog2(`MEM_DATA_CYCLES){1'b0}};
    else if(read_en)
      read_cycle <= read_cycle+1'b1;

    if(reset)
      write_cycle <= {`ceilLog2(`MEM_DATA_CYCLES){1'b0}};
    else if(write_en)
      write_cycle <= write_cycle+1'b1;

    if(mem_req_val && !busy && !mem_req_rw)
      r_mem_req_addr <= mem_req_addr;

    if(reset)
      read_valid <= 1'b0;
    else
      read_valid <= read_en;

    if(mem_req_val && !busy)
      tag <= mem_req_tag;
  end

  (* syn_ramstyle = "block_ram" *) reg [`MEM_DATA_BITS-1:0] ram [0:2**ADDR_BITS-1];
  always @(posedge clk) begin
    if(!reset && write_en)
        ram[addr] <= mem_req_data;
    dout <= ram[addr];
  end

  reg [ADDR_BITS-1:0] r_addr;
  always @(posedge clk) begin
    r_addr <= addr;
    //if(read_valid)
    //  $display("mem[%x] => %x",r_addr,dout);
    //if(write_en)
    //  $display("mem[%x] <= %x",addr,mem_req_data);
  end

  assign mem_req_rdy = ~busy;
  assign mem_resp_data = dout;
  assign mem_resp_val = read_valid;
  assign mem_resp_tag = tag;

endmodule
