//**************************************************************************
// Test harness for CS250 RISCV Processor
//--------------------------------------------------------------------------
// This test harness hooks the CS250 RISCV processor up to a magic memory
// and then reads a program in verilog memory dump format into this memory.
// The program is specified on the command line with the +exe parameter.
// The riscvProc module is clocked until testrig_tohost is non-zero.

extern "A" void htif_init(input bit [31:0] fromhost, input bit [31:0] tohost);

extern "A" void htif_tick
(
  output bit htif_start,
  output bit htif_stop,

  output bit       in_val,
  output bit [3:0] in_bits,
  input  bit       in_rdy,

  output bit       out_rdy,
  input  bit       out_val,
  input  bit [3:0] out_bits
);
  
module topTestHarness;

  //-----------------------------------------------
  // Instantiate the processor

  reg clk   = 0;
  reg reset = 1;

  always #`CLOCK_PERIOD clk = ~clk;

  `define DELAY_TH2CHIP 0.5
  `define DELAY_CHIP2TH 0.5

  bit        th_output_htif_tuning = 1'b0;
  bit        th_output_htif_in_val;
  bit  [3:0] th_output_htif_in_bits;
  bit        th_output_htif_out_rdy; // DON'T USE
  bit        th_output_htif_start; // DON'T USE
  bit        th_output_htif_stop; // DON'T USE
  bit  [3:0] test_in_bits;

  wire       #`DELAY_TH2CHIP chip_input_htif_tuning = th_output_htif_tuning;
  wire       #`DELAY_TH2CHIP chip_input_htif_in_val = th_output_htif_in_val;
  wire [3:0] #`DELAY_TH2CHIP chip_input_htif_in_bits = th_output_htif_in_bits;

  bit        chip_output_htif_in_rdy;
  bit        chip_output_htif_out_clk;
  bit        chip_output_htif_out_val;
  bit  [3:0] chip_output_htif_out_bits;
  bit        chip_output_error_core0;
  bit        chip_output_error_core1;
  bit        chip_output_error_htif;

  wire       #`DELAY_CHIP2TH th_input_htif_in_rdy = chip_output_htif_in_rdy;
  wire       #`DELAY_CHIP2TH th_input_htif_out_clk = chip_output_htif_out_clk;
  wire       #`DELAY_CHIP2TH th_input_htif_out_val = chip_output_htif_out_val;
  wire [3:0] #`DELAY_CHIP2TH th_input_htif_out_bits = chip_output_htif_out_bits;
  wire       #`DELAY_CHIP2TH th_input_error_core0 = chip_output_error_core0;
  wire       #`DELAY_CHIP2TH th_input_error_core1 = chip_output_error_core1;
  wire       #`DELAY_CHIP2TH th_input_error_htif = chip_output_error_htif;

  riscvTop top
  (
    .clk(clk),

    .htif_reset(reset),

`ifndef ASIC
    .console_out_val(),
    .console_out_rdy(),
    .console_out_bits(),
`endif

    .htif_in_val(chip_input_htif_in_val),
    .htif_in_bits(chip_input_htif_in_bits),
    .htif_in_rdy(chip_output_htif_in_rdy),

    .htif_out_clk(chip_output_htif_out_clk),
    .htif_out_val(chip_output_htif_out_val),
    .htif_out_bits(chip_output_htif_out_bits),

    .error_core0(chip_output_error_core0),
    .error_core1(chip_output_error_core1),
    .error_htif(chip_output_error_htif)
  );

  //-----------------------------------------------
  // Host-Target interface

  wire htif_clk;

`ifdef HTIF_2CLKS
  assign htif_clk = th_input_htif_out_clk;
`else
  assign #`DELAY_CHIP2TH htif_clk = clk;
`endif

  always @(posedge htif_clk)
  begin
   if (!reset) 
   begin
      htif_tick
      (
        th_output_htif_start,
        th_output_htif_stop,
      
        th_output_htif_in_val,
        th_output_htif_in_bits,
        th_input_htif_in_rdy,

        th_output_htif_out_rdy,   
        th_input_htif_out_val,
        th_input_htif_out_bits
      );
    end
    else
    begin
      th_output_htif_start <= 0;
      th_output_htif_stop <= 0;
      th_output_htif_in_val <= 0;
      th_output_htif_in_bits <= test_in_bits;
      th_output_htif_out_rdy <= 0;
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
  integer seed, outrand;
  initial
  begin
    if ($value$plusargs("fromhost=%d", fromhost) && $value$plusargs("tohost=%d", tohost))
    begin
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
    
    if (!$value$plusargs("seed=%d",seed))
      seed = 0;

    if (!stats)
    begin
      $vcdplusfile(vpd_filename);
      $vcdplusmemon();
      $vcdpluson(0);
    end
   
    if ($random(seed) < 0) 
      outrand = $random(seed) * (-1);
    else 
      outrand = $random(seed);

`ifdef HTIF_2CLKS
`ifndef GATE_LEVEL
  top.htif.count = outrand % 64;
`endif
`endif

    // Stobe reset
         reset = 1;
         test_in_bits = 4'b0000;
    #80 test_in_bits = 4'b0101;
    #80 test_in_bits = 4'b1111;
    #80 test_in_bits = 4'b0101;
    #80 test_in_bits = 4'b0101;
    #80 test_in_bits = 4'b1111;
    #80 test_in_bits = 4'b0101;
    #380 reset = 0;

  end

  always @(posedge htif_clk)
  begin
    if (th_output_htif_stop)
    begin
      $display("*** STOPPED ***");
      if (!stats)
      begin
        $vcdplusoff(0);
        $vcdplusclose;
      end
      $finish;
    end

    if (th_input_error_core0 || th_input_error_core1 || th_input_error_htif)
    begin
      if (th_input_error_htif) $display("*** HTIF ENTERED ERROR MODE ***");
      if (th_input_error_core0) $display("*** CORE0 ENTERED ERROR MODE ***");
      if (th_input_error_core1) $display("*** CORE1 ENTERED ERROR MODE ***");

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

    if (~top.resiliency1.core1.proc.ctrl.reset)
      num_cycles <= num_cycles + 1;

    // The num_insts stat counts how many instructions were actually
    // executed. Since this simple processor has no stalls it executes
    // an instruction every (non-reset) cycle.

    if (~top.resiliency1.core1.proc.ctrl.reset && ~top.resiliency1.core1.proc.ctrl.ctrl_killf)
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

//  disasmInst dasm_f(top.resiliency1.core0.proc.imem_resp_data);
  disasmInst dasm_d(top.resiliency1.core0.proc.dpath_inst);
//`ifndef GATE_LEVEL
//  disasmInst dasm_x(top.resiliency1.core0.proc.dpath.ex_reg_loginst);
//`endif

`ifndef GATE_LEVEL
  integer cycle = 0;
  always @(posedge clk)
  begin
    #0.6;
    if (th_output_htif_start && !quiet)
    begin
      if (top.resiliency1.core1.proc.dpath.rfile.wen0_p && top.resiliency1.core1.proc.dpath.rfile.waddr0_p != 5'd0)
        $display("%t: write %d=%016x", $time, top.resiliency1.core1.proc.dpath.rfile.waddr0_p, top.resiliency1.core1.proc.dpath.rfile.wdata0_p);
      if (top.resiliency1.core1.proc.dpath.rfile.wen1_p && top.resiliency1.core1.proc.dpath.rfile.waddr1_p != 5'd0)
        $display("%t: write %d=%016x", $time, top.resiliency1.core1.proc.dpath.rfile.waddr1_p, top.resiliency1.core1.proc.dpath.rfile.wdata1_p);

      
      if (~top.resiliency1.core0.proc.ctrl.reset)
	$display("CYC: %4d CORE0 [pc=%x] [inst=%x] R[r%d=%x] R[r%d=%x] W[r%d=%x] W[r%d=%x] %s",
	  cycle_count,
	  top.resiliency1.core0.proc.dpath.imem_req_addr,
	  top.resiliency1.core0.proc.dpath.imem_resp_data,
	  top.resiliency1.core0.proc.dpath.rfile.raddr0,
	  top.resiliency1.core0.proc.dpath.rfile.rdata0,
	  top.resiliency1.core0.proc.dpath.rfile.raddr1,
	  top.resiliency1.core0.proc.dpath.rfile.rdata1,
	  top.resiliency1.core0.proc.dpath.rfile.waddr0_p & {5{top.resiliency1.core0.proc.dpath.rfile.wen0_p}},
	  top.resiliency1.core0.proc.dpath.rfile.wdata0_p,
	  top.resiliency1.core0.proc.dpath.rfile.waddr1_p & {5{top.resiliency1.core0.proc.dpath.rfile.wen1_p}},
	  top.resiliency1.core0.proc.dpath.rfile.wdata1_p,
	  dasm_d.dasm);

      if (~top.resiliency1.core1.proc.ctrl.reset)
	$display("CYC: %4d CORE1 [pc=%x] [inst=%x] R[r%d=%x] R[r%d=%x] W[r%d=%x] W[r%d=%x] %s",
	  cycle_count,
	  top.resiliency1.core1.proc.dpath.imem_req_addr,
	  top.resiliency1.core1.proc.dpath.imem_resp_data,
	  top.resiliency1.core1.proc.dpath.rfile.raddr0,
	  top.resiliency1.core1.proc.dpath.rfile.rdata0,
	  top.resiliency1.core1.proc.dpath.rfile.raddr1,
	  top.resiliency1.core1.proc.dpath.rfile.rdata1,
	  top.resiliency1.core1.proc.dpath.rfile.waddr0_p & {5{top.resiliency1.core1.proc.dpath.rfile.wen0_p}},
	  top.resiliency1.core1.proc.dpath.rfile.wdata0_p,
	  top.resiliency1.core1.proc.dpath.rfile.waddr1_p & {5{top.resiliency1.core1.proc.dpath.rfile.wen1_p}},
	  top.resiliency1.core1.proc.dpath.rfile.wdata1_p,
	  dasm_d.dasm);

      cycle = cycle + 1;
    end
  end
`else
  integer cycle = 0;
  always @(posedge clk)
  begin
    cycle = cycle + 1;
    $display("cycle=%d", cycle);
  end
`endif

endmodule
