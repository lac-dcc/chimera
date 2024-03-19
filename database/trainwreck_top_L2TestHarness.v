module L2TestHarness;

  reg clk   = 0;
  reg reset = 1;

  reg         dut_req_val = 0;
  wire        dut_req_rdy;
  reg [1:0]   dut_req_rw = 0;
  reg [4:0]   dut_req_tag = 0;
  reg [127:0] dut_req_data = 128'd0;
  reg [13:0]  dut_req_addr = 0;

  wire dut_resp_val;
  wire dut_resp_nack;
  wire [4:0] dut_resp_tag;
  wire [127:0] dut_resp_data;

  always #1 clk = ~clk;

  reg reset_del1, reset_del2;
  always @(posedge clk) begin
    reset_del1 <= reset;
    reset_del2 <= reset_del1;
  end
 
  sramL2_256K dut
  (
    .clk(clk),
    .reset(reset),

    .mem_req_val(dut_req_val),
    .mem_req_rdy(dut_req_rdy),
    .mem_req_rw(dut_req_rw),
    .mem_req_addr(dut_req_addr),
    .mem_req_data(dut_req_data),
    .mem_req_tag(dut_req_tag),

    .mem_resp_val(dut_resp_val),
    .mem_resp_nack(dut_resp_nack),
    .mem_resp_data(dut_resp_data),
    .mem_resp_tag(dut_resp_tag)
  );

  //-----------------------------------------------
  // Start the simulation

  integer fh;
  reg [ 639:0] error_msg;
  reg [1023:0] vpd_filename;
  reg [  31:0] max_cycles;

  initial
  begin

    if (!$value$plusargs("vpd=%s", vpd_filename))
      vpd_filename = "vcdplus.vpd";

    if (!$value$plusargs("max-cycles=%d", max_cycles))
      max_cycles = 100;

    $vcdplusmemon();
    $vcdplusfile(vpd_filename);
    $vcdpluson(0);

    // Stobe reset
        reset = 1;
    #10 reset = 0;

    // very basic read/write test

    #10 dut_req_val  = 1;
        dut_req_addr = 14'd3;
        dut_req_tag  = 5'd2;
        dut_req_data = 128'hDEADBEEFDEADBEEFDEADBEEFDEADBEEF;
        dut_req_rw   = 2'b01;
    #2  dut_req_val  = 0;
        dut_req_data = 128'hx;

    #2  dut_req_val  = 1;
        dut_req_addr = 14'd4;
        dut_req_tag  = 5'd3;
        dut_req_data = 128'd2;
        dut_req_rw   = 2'b01;
    #2  dut_req_val  = 0;
        dut_req_data = 128'hx;

    #2  dut_req_val  = 1;
        dut_req_addr = 14'd5;
        dut_req_tag  = 5'd4;
        dut_req_data = 128'd3;
        dut_req_rw   = 2'b01;
    #2  dut_req_val  = 0;
        dut_req_data = 128'hx;

    #2  dut_req_val  = 1;
        dut_req_addr = 14'd6;
        dut_req_tag  = 5'd5;
        dut_req_data = 128'd4;
        dut_req_rw   = 2'b01;
    #2  dut_req_val  = 0;
        dut_req_data = 128'hx;
        
    #8  dut_req_val  = 1;
        dut_req_rw   = 2'b00;
        dut_req_addr = 14'd3;
        dut_req_tag  = 5'd1;
    #2  dut_req_val  = 0;

    #6  dut_req_val  = 1;
        dut_req_rw   = 2'b10;
        dut_req_addr = 14'd4;
        dut_req_tag  = 5'd8;
    #2  dut_req_val  = 0;
  end

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

endmodule
