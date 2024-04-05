//**************************************************************************
// Test harness for CS250 RISCV Processor
//--------------------------------------------------------------------------
// This test harness hooks the CS250 RISCV processor up to a magic memory
// and then reads a program in verilog memory dump format into this memory.
// The program is specified on the command line with the +exe parameter.
// The riscvProc module is clocked until testrig_tohost is non-zero.

extern void mm_init();
extern void ic_init();
extern void dc_init();
extern "A" void htif_init(input bit [31:0] fromhost, input bit [31:0] tohost);

extern "A" void htif_tick
(
  output bit        htif_start,
  output bit        htif_stop,
  output bit        htif_fromhost_wen,
  output bit [31:0] htif_fromhost,
  input  bit [31:0] htif_tohost,
  output bit        htif_req_val,
  input  bit        htif_req_rdy,
  output bit [3:0]  htif_req_op,
  output bit [31:0] htif_req_addr,
  output bit [63:0] htif_req_data,
  output bit [7:0]  htif_req_wmask,
  output bit [11:0] htif_req_tag,

  input  bit        htif_resp_val,
  input  bit [63:0] htif_resp_data,
  input  bit [11:0] htif_resp_tag
);
  
module riscvTestHarness;

  //-----------------------------------------------
  // Instantiate the processor

  reg clk   = 0;
  reg reset = 1;

  always #`CLOCK_PERIOD clk = ~clk;

  wire error_mode;
  wire log_control;

  bit        htif_start_r;
  bit        htif_stop_r;
  bit        htif_fromhost_wen_r;
  bit [31:0] htif_fromhost_r;
  bit [31:0] htif_tohost;
  bit        htif_req_val_r;
  bit        htif_req_rdy;
  bit [3:0]  htif_req_op_r;
  bit [31:0] htif_req_addr_r;
  bit [63:0] htif_req_data_r;
  bit [7:0]  htif_req_wmask_r;
  bit [11:0] htif_req_tag_r;
  bit        htif_resp_val;
  bit [63:0] htif_resp_data;
  bit [11:0] htif_resp_tag;

  wire #0.6 htif_start = htif_start_r;
  wire #0.6 htif_fromhost_wen = htif_fromhost_wen_r;
  wire [31:0] #0.6 htif_fromhost = htif_fromhost_r;
  wire #0.6 htif_req_val = htif_req_val_r;
  wire [3:0] #0.6 htif_req_op = htif_req_op_r;
  wire [31:0] #0.6 htif_req_addr = htif_req_addr_r;
  wire [63:0] #0.6 htif_req_data = htif_req_data_r;
  wire [7:0] #0.6 htif_req_wmask = htif_req_wmask_r;
  wire [11:0] #0.6 htif_req_tag = htif_req_tag_r;

  wire       console_out_val;
  wire       console_out_rdy;
  wire [7:0] console_out_bits;

  bit                      mem_req_val;
  bit                      mem_req_rdy_r;
  bit                      mem_req_rw;
  bit [`MEM_ADDR_BITS-1:0] mem_req_addr;
  bit [`MEM_DATA_BITS-1:0] mem_req_data;
  bit [`MEM_TAG_BITS-1:0]  mem_req_tag;
  
  bit                      mem_resp_val_r;
  bit [`MEM_DATA_BITS-1:0] mem_resp_data_r;
  bit [`MEM_TAG_BITS-1:0]  mem_resp_tag_r;

  wire #0.6 mem_req_rdy = mem_req_rdy_r;
  wire #0.6 mem_resp_val = mem_resp_val_r;
  wire [`MEM_DATA_BITS-1:0] #0.6 mem_resp_data = mem_resp_data_r;
  wire [`MEM_TAG_BITS-1:0] #0.6 mem_resp_tag = mem_resp_tag_r;
  
  riscvFPGA core
  (
    .clk(clk),
    .reset_ext(reset),

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

  //-----------------------------------------------
  // Console Output
  assign console_out_rdy = 1'b1;
  always @(posedge clk)
    if(console_out_val)
      $fwrite(1,"%c",console_out_bits);

  //-----------------------------------------------
  // Host-Target interface

  always @(posedge clk)
  begin
    if (!reset)
    begin
      htif_tick
      (
        htif_start_r,
        htif_stop_r,
        htif_fromhost_wen_r,
        htif_fromhost_r,
        htif_tohost,

        htif_req_val_r,
        htif_req_rdy,
        htif_req_op_r,
        htif_req_addr_r,
        htif_req_data_r,
        htif_req_wmask_r,
        htif_req_tag_r,

        htif_resp_val,
        htif_resp_data,
        htif_resp_tag
      );
    end
    else
    begin
      htif_start_r <= 0;
      htif_stop_r <= 0;
      htif_fromhost_wen_r <= 0;
      htif_fromhost_r <= 0;
      htif_req_val_r <= 0;
      htif_req_op_r <= 0;
      htif_req_addr_r <= 0;
      htif_req_data_r <= 0;
      htif_req_wmask_r <= 0;
      htif_req_tag_r <= 0;
    end
  end

  //-----------------------------------------------
  // Start the simulation

  integer fh;
  reg [ 639:0] error_msg;
  reg [1023:0] vpd_filename;
  reg [  31:0] max_cycles;
  reg          verify;
  reg [  63:0] uptr;
  reg          stats;
  reg          quiet;
  reg [  31:0] fromhost;
  reg [  31:0] tohost;

  initial
  begin
    if ($value$plusargs("fromhost=%d", fromhost) && $value$plusargs("tohost=%d", tohost))
    begin
      mm_init();
      ic_init();
      dc_init();
      htif_init(fromhost, tohost);
    end
    else
    begin
      $display("\n ERROR: Please specify fromhost and tohost!\n");
      $finish;
    end

    // Get max number of cycles to run simulation for from command line
    if (!$value$plusargs("vpd=%s", vpd_filename))
      vpd_filename = "vcdplus.vpd";

    if (!$value$plusargs("max-cycles=%d", max_cycles))
      max_cycles = 2000;

    // Check to see whether or not we should verify
    if (!$value$plusargs("verify=%d", verify))
      verify = 1;

    // Check to see whether or not we should log stats
    if (!$value$plusargs("stats=%d", stats))
      stats = 0;

    if (!$value$plusargs("quiet=%d", quiet))
      quiet = 0;

    if (!stats)
    begin
      $vcdplusfile(vpd_filename);
      $vcdpluson(0);
    end

    // Stobe reset
        reset = 1;
    #38 reset = 0;

  end

  always @(posedge clk)
  begin
    if (htif_stop_r)
    begin
      $display("*** STOPPED ***");
      if (!stats)
      begin
        $vcdplusoff(0);
        $vcdplusclose;
      end
      $finish;
    end

    if (error_mode)
    begin
      $display("*** ENTERED ERROR MODE ***");
      if (!stats)
      begin
        $vcdplusoff(0);
        $vcdplusclose;
      end
      $finish;
    end
  end

  //-----------------------------------------------
  // Log control
  
  reg log_control_prev;

  always @(posedge clk)
  begin
    if (stats)
    begin
      if (reset)
        log_control_prev <= 1'b0;
      else
        log_control_prev <= log_control;

      if (log_control & ~log_control_prev)
        $vcdpluson(0);

      if (log_control_prev & ~log_control)
      begin
        $vcdplusoff(0);
        $vcdplusclose;
      end
    end
  end

  //-----------------------------------------------
  // Count activities

`ifndef GATE_LEVEL
  integer num_inst   = 0;
  integer num_cycles = 0;

  always @(posedge clk)
  begin
    // The num_cycles stat counts how many cycles the processor
    // has been running for (excluding reset cycles)

    if (~core.core.proc.ctrl.reset)
      num_cycles <= num_cycles + 1;

    // The num_insts stat counts how many instructions were actually
    // executed. Since this simple processor has no stalls it executes
    // an instruction every (non-reset) cycle.

    if (~core.core.proc.ctrl.reset && ~core.core.proc.ctrl.ctrl_killf)
      num_inst <= num_inst + 1;
  end
`endif

  //-----------------------------------------------
  // Safety net to catch infinite loops

  reg [31:0] cycle_count = 0;
  always @(posedge clk)
    cycle_count = cycle_count + 1;

  always @(*)
  begin
    if (cycle_count > max_cycles)
    begin
      $display("*** FAILED *** (timeout)");
      $vcdplusoff(0);
      $vcdplusclose;
      $finish;
   end
  end

  //-----------------------------------------------
  // Tracing code

  disasmInst dasm_f(core.core.proc.imemresp_data);
  disasmInst dasm_d(core.core.proc.dpath_inst);
`ifndef GATE_LEVEL
  disasmInst dasm_x(core.core.proc.dpath.ex_reg_loginst);
`endif

`ifndef GATE_LEVEL
  integer cycle = 0;
  always @(posedge clk)
  begin
    #2;
    if (htif_start && !quiet)
    begin
      if (core.core.proc.dpath.rfile.wen0_p && core.core.proc.dpath.rfile.waddr0_p != 5'd0)
        $display("%t: write %d=%016x", $time, core.core.proc.dpath.rfile.waddr0_p, core.core.proc.dpath.rfile.wdata0_p);

      $display("CYC: %4d reset=%d [pc=%x] [inst=%x] R[r%d=%x] R[r%d=%x] W[r%d=%x] %s",
        cycle_count,
        core.core.proc.ctrl.reset,
        core.core.proc.dpath.imemreq_addr,
        core.core.proc.dpath.imemresp_data,
        core.core.proc.dpath.rfile.raddr0,
        core.core.proc.dpath.rfile.rdata0,
        core.core.proc.dpath.rfile.raddr1,
        core.core.proc.dpath.rfile.rdata1,
        core.core.proc.dpath.rfile.waddr0_p & {5{core.core.proc.dpath.rfile.wen0_p}},
        core.core.proc.dpath.rfile.wdata0_p,
        dasm_d.dasm);

      cycle = cycle + 1;
    end
  end
`endif

endmodule
