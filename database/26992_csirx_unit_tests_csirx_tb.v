// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

`timescale 1ns/1ps

module csirx_tb #
(
  parameter integer N_DATA_LANES = 2
)
();

  reg clk;
  reg resetn;

  // PPI input simulating Xilinx D-PHY core
  reg cl_stopstate;
  reg dl0_rxactivehs; // Whether high-speed receive is in progress
  reg dl1_rxactivehs;
  reg dl0_rxsynchs; // Pulse at the beginning of high-speed transmission
  reg dl1_rxsynchs;
  wire cl_enable; // Clock enable
  wire dl0_enable; // Data lane 0 enable
  wire dl1_enable; // Data lane 1 enables
  wire dl0_forcerxmode;
  wire dl1_forcerxmode;
  reg dl0_rxvalidhs; // Lane 0 valid
  reg dl1_rxvalidhs; // Lane 1 valid
  reg [7:0] dl0_rxdatahs; // Lane 0 data
  reg [7:0] dl1_rxdatahs; // Lane 1 data

  // AXI-stream master output
  wire  m_axis_tvalid;
  wire [(N_DATA_LANES*8)-1 : 0] m_axis_tdata;
  wire [N_DATA_LANES-1 : 0] m_axis_tstrb;
  wire  m_axis_tlast;
  reg m_axis_tready;

  // Simulation control variables
  integer d0_start;
  integer d1_start;
  integer datalen;
  integer n_cycles;

  // Simulation control
  initial begin
    $display("Starting the test...");
    $dumpfile("csirx_test.vcd");
    $dumpvars; // Dump everything
    #500 $finish; // End after N ticks
  end

  // Initialization
  initial begin
    clk = 1'b0;
    resetn = 1'b1;

    d0_start = 4;
    d1_start = 2;
    datalen = 16;
    n_cycles = 0;
  end

  // Reset signal
  initial begin
    #5 
    resetn = 1'b0;
    #10
    resetn = 1'b1;
  end


  always begin
    #10
  
    clk = 1'b1;

    // Sync pulse once at the start
    dl0_rxsynchs = (n_cycles == d0_start-1);
    dl1_rxsynchs = (n_cycles == d1_start-1);

    // If the start time has passed, then set the data valid bit
    // and set the data to a counting value
    if(n_cycles >= d0_start && n_cycles < d0_start + datalen) begin
      dl0_rxdatahs = n_cycles - d0_start;
      dl0_rxvalidhs = 1'b1;
    end
    else begin
      dl0_rxdatahs = 8'hxx;
      dl0_rxvalidhs = 1'b0;
    end

    if(n_cycles >= d1_start && n_cycles < d1_start + datalen) begin
      dl1_rxdatahs = n_cycles - d1_start + 8'h10;
      dl1_rxvalidhs = 1'b1;
    end
    else begin
      dl1_rxdatahs = 8'hxx;
      dl1_rxvalidhs = 1'b0;
    end
 
  
    #10
    clk = 1'b0;

    n_cycles += 1;
  end

  // DUT
  csirx csirx_dut(
    .cl_stopstate(cl_stopstate),
    .dl0_rxactivehs(dl0_rxactivehs),
    .dl1_rxactivehs(dl1_rxactivehs),
    .dl0_rxsynchs(dl0_rxsynchs),
    .dl1_rxsynchs(dl1_rxsynchs),
    .cl_enable(cl_enable),
    .dl0_enable(dl0_enable),
    .dl1_enable(dl1_enable),
    .dl0_forcerxmode(dl0_forcerxmode),
    .dl1_forcerxmode(dl1_forcerxmode),
    .dl0_rxvalidhs(dl0_rxvalidhs),
    .dl1_rxvalidhs(dl1_rxvalidhs),
    .dl0_rxdatahs(dl0_rxdatahs),
    .dl1_rxdatahs(dl1_rxdatahs),
    .rxbyteclkhs(clk),
    .rxbyteclkhs_resetn(resetn),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tstrb(m_axis_tstrb),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready)
  );

endmodule

