//**************************************************************************
// Test harness for CS250 RISCV Processor
//--------------------------------------------------------------------------
// This test harness hooks the CS250 RISCV processor up to a magic memory
// and then reads a program in verilog memory dump format into this memory.
// The program is specified on the command line with the +exe parameter.
// The riscvProc module is clocked until testrig_tohost is non-zero.

`include "riscvConst.vh"

module riscvTestHarness;

  //-----------------------------------------------
  // Instantiate the processor

  reg clk   = 0;
  reg reset = 1;

  always #`CLOCK_PERIOD clk = ~clk;

  wire error_mode;

  wire       console_out_val;
  wire       console_out_rdy;
  wire [7:0] console_out_bits;

  wire                      mem_req_val;
  wire                      mem_req_rdy_r;
  wire                      mem_req_rw;
  wire [`MEM_ADDR_BITS-1:0] mem_req_addr;
  wire [`MEM_DATA_BITS-1:0] mem_req_data;
  wire [`MEM_TAG_BITS-1:0]  mem_req_tag;
  
  wire                      mem_resp_val_r;
  wire [`MEM_DATA_BITS-1:0] mem_resp_data_r;
  wire [`MEM_TAG_BITS-1:0]  mem_resp_tag_r;

  wire #0.6 mem_req_rdy = mem_req_rdy_r;
  wire #0.6 mem_resp_val = mem_resp_val_r;
  wire [`MEM_DATA_BITS-1:0] #0.6 mem_resp_data = mem_resp_data_r;
  wire [`MEM_TAG_BITS-1:0] #0.6 mem_resp_tag = mem_resp_tag_r;
  
  riscvFPGA_no_htif core
  (
    .clk(clk),
    .reset_ext(reset),

    .error_mode(error_mode),

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
  // Count activities

`ifndef GATE_LEVEL
  integer num_inst   = 0;
  integer num_cycles = 0;

  always @(posedge clk)
  begin
    // The num_cycles stat counts how many cycles the processor
    // has been running for (excluding reset cycles)

    if (~core.core.core.proc.ctrl.reset)
      num_cycles <= num_cycles + 1;

    // The num_insts stat counts how many instructions were actually
    // executed. Since this simple processor has no stalls it executes
    // an instruction every (non-reset) cycle.

    if (~core.core.core.proc.ctrl.reset && ~core.core.core.proc.ctrl.ctrl_killf)
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

  disasmInst dasm_f(core.core.core.proc.imemresp_data);
  disasmInst dasm_d(core.core.core.proc.dpath_inst);
`ifndef GATE_LEVEL
  disasmInst dasm_x(core.core.core.proc.dpath.ex_reg_loginst);
`endif

`ifndef GATE_LEVEL
  integer cycle = 0;
  always @(posedge clk)
  begin
    #2;
    if (!quiet)
    begin
      if (core.core.core.proc.dpath.rfile.wen0_p && core.core.core.proc.dpath.rfile.waddr0_p != 5'd0)
        $display("%t: write %d=%016x", $time, core.core.core.proc.dpath.rfile.waddr0_p, core.core.core.proc.dpath.rfile.wdata0_p);

      $display("CYC: %4d reset=%d [pc=%x] [inst=%x] R[r%d=%x] R[r%d=%x] W[r%d=%x] %s",
        cycle_count,
        core.core.core.proc.ctrl.reset,
        core.core.core.proc.dpath.imemreq_addr,
        core.core.core.proc.dpath.imemresp_data,
        core.core.core.proc.dpath.rfile.raddr0,
        core.core.core.proc.dpath.rfile.rdata0,
        core.core.core.proc.dpath.rfile.raddr1,
        core.core.core.proc.dpath.rfile.rdata1,
        core.core.core.proc.dpath.rfile.waddr0_p & {5{core.core.core.proc.dpath.rfile.wen0_p}},
        core.core.core.proc.dpath.rfile.wdata0_p,
        dasm_d.dasm);

      cycle = cycle + 1;
    end
  end
`endif

endmodule
