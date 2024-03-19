`default_nettype none
`timescale 1ns/1ns

module RAM(CLK, nCS, nWE, ADDR, DI, DO);

  // Port definition
  input CLK, nCS, nWE;
  input  [11:0] ADDR;
  input  [15:0] DI;
  output [15:0] DO;
  
  wire          CLK, nCS, nWE;
  wire   [11:0] ADDR;
  wire   [15:0] DI;
  reg    [15:0] DO;
  
  // Implementation
  reg [15:0] mem[0:4095];
  
  always @(posedge CLK)
  begin
    if (!nCS) begin
      if (!nWE) mem[ADDR[11:0]] <= DI;
    end
  end

  always @(posedge CLK)
  begin
    if (!nCS) begin
      DO <= mem[ADDR[11:0]];
    end
  end

`ifdef __ICARUS__
  initial begin : prefill
    integer i;
    for(i=0; i<4096; i=i+1) mem[i] = 0;
    mem[3] = 16'h0008;
    mem[4] = 16'h4e71;
    mem[5] = 16'h31c0;
    mem[6] = 16'h1234;
    mem[7] = 16'h60f8;
  end
`endif
  
endmodule

module fx68k_tb;

  // ===============================================================
  // 68000 CPU
  // ===============================================================

  // clock generation
  reg clk25_mhz = 0;
  always #20 clk25_mhz <= !clk25_mhz;  
  
  reg  fx68_phi1 = 0; 
  wire fx68_phi2 = !fx68_phi1;

  always @(posedge clk25_mhz) begin
    fx68_phi1 <= ~fx68_phi1;
  end

  reg pwr_up_reset_n = 1;
  
  initial begin
    $dumpfile("fx68k.vcd");
    $dumpvars(0,fx68k_tb);
    #120 pwr_up_reset_n = 0;
    #120 pwr_up_reset_n = 1;
    #100000
    $finish;
  end

  // CPU outputs
  wire cpu_rw;                   // Read = 1, Write = 0
  wire cpu_as_n;                 // Address strobe
  wire cpu_lds_n;                // Lower byte
  wire cpu_uds_n;                // Upper byte
  wire cpu_E;                    // Peripheral enable
  wire vma_n;                    // Valid memory address
  wire [2:0]cpu_fc;              // Processor state
  wire cpu_reset_n_o;            // Reset output signal
  wire cpu_halted_n;
  wire bg_n;                     // Bus grant

  // CPU busses
  wire [15:0] cpu_dout;          // Data from CPU
  wire [23:0] cpu_a;             // Address
  wire [15:0] cpu_din;           // Data to CPU

  // CPU inputs
  wire berr_n = 1'b1;            // Bus error (never error)
  wire dtack_n = 1'b0;           // Data transfer ack (always ready)
  wire vpa_n;                    // Valid peripheral address
  reg  mcu_br_n;                 // Bus request
  reg  bgack_n = 1'b1;           // Bus grant ack
  reg  ipl0_n = 1'b1;            // Interrupt request signals
  reg  ipl1_n = 1'b1;
  reg  ipl2_n = 1'b1;
  
  assign cpu_a[0] = 0;           // to make gtk wave easy

  fx68k fx68k (
    // input
    .clk( clk25_mhz),
    .enPhi1(fx68_phi1),
    .enPhi2(fx68_phi2),
    .extReset(!pwr_up_reset_n),
    .pwrUp(!pwr_up_reset_n),
    .HALTn(pwr_up_reset_n),
    
    // output
    .eRWn(cpu_rw),
    .ASn( cpu_as_n),
    .LDSn(cpu_lds_n),
    .UDSn(cpu_uds_n),
    .E(cpu_E),
    .VMAn(vma_n),
    .VPAn(1'b1),
    .FC0(cpu_fc[0]),
    .FC1(cpu_fc[1]),
    .FC2(cpu_fc[2]),
    .BGn(bg_n),
    .oRESETn(cpu_reset_n_o),
    .oHALTEDn(cpu_halted_n),

    // input
    .DTACKn(dtack_n),
    .BERRn(berr_n),
    .BRn(1'b1),       // No bus requests
    .BGACKn(1'b1),
    .IPL0n(ipl0_n),
    .IPL1n(ipl1_n),
    .IPL2n(ipl2_n),

    // busses
    .iEdb(cpu_din),
    .oEdb(cpu_dout),
    .eab(cpu_a[23:1])
  );

  RAM ram(
    .CLK(clk25_mhz),
    .nCS(cpu_as_n),
    .nWE(cpu_rw),
    .ADDR(cpu_a[12:1]),
    .DI(cpu_dout),
    .DO(cpu_din)
  );

endmodule

