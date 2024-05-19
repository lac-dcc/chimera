// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module axim_controller_tb;
// ******************************************************************
// Parameters
// ******************************************************************
  parameter         C_M_AXI_PROTOCOL                   = "AXI3";
  parameter integer C_M_AXI_ADDR_WIDTH                 = 32;
  parameter integer C_M_AXI_DATA_WIDTH                 = 64;
  parameter integer C_M_AXI_AWUSER_WIDTH               = 1;
  parameter integer C_M_AXI_ARUSER_WIDTH               = 1;
  parameter integer C_M_AXI_WUSER_WIDTH                = 1;
  parameter integer C_M_AXI_RUSER_WIDTH                = 1;
  parameter integer C_M_AXI_BUSER_WIDTH                = 1;
  parameter integer C_OFFSET_WIDTH                     = 16;
  parameter integer C_M_AXI_RD_BURST_LEN               = 16;
  parameter integer C_M_AXI_WR_BURST_LEN               = 16;
  parameter         TX_SIZE_WIDTH                      = 10;
// ******************************************************************
//
// ******************************************************************
// IO
// ******************************************************************
  // System Signals
  reg                                  clk;
  reg                                  resetn;
  reg  [10-1:0]                        rx_size;
  reg                                  rx_req;
  reg  [C_M_AXI_ADDR_WIDTH-1:0]        rx_addr;
  wire [10-1:0]                        axim_hp0_rx_size;
  wire                                 axim_hp0_rx_req;
  wire [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp0_rx_addr;
  wire [10-1:0]                        axim_hp1_rx_size;
  wire                                 axim_hp1_rx_req;
  wire [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp1_rx_addr;
  wire [10-1:0]                        axim_hp2_rx_size;
  wire                                 axim_hp2_rx_req;
  wire [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp2_rx_addr;
  wire [10-1:0]                        axim_hp3_rx_size;
  wire                                 axim_hp3_rx_req;
  wire [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp3_rx_addr;
// ******************************************************************

axim_controller u_axim_controller (
  .clk                ( clk                 ),
  .resetn             ( resetn              ),
  .rx_req             ( rx_req              ),
  .rx_size            ( rx_size             ),
  .rx_addr            ( rx_addr             ),

  .axim_hp0_rx_req    ( axim_hp0_rx_req     ),
  .axim_hp0_rx_size   ( axim_hp0_rx_size    ),
  .axim_hp0_rx_addr   ( axim_hp0_rx_addr    ),

  .axim_hp1_rx_req    ( axim_hp1_rx_req     ),
  .axim_hp1_rx_size   ( axim_hp1_rx_size    ),
  .axim_hp1_rx_addr   ( axim_hp1_rx_addr    ),

  .axim_hp2_rx_req    ( axim_hp2_rx_req     ),
  .axim_hp2_rx_size   ( axim_hp2_rx_size    ),
  .axim_hp2_rx_addr   ( axim_hp2_rx_addr    ),

  .axim_hp3_rx_req    ( axim_hp3_rx_req     ),
  .axim_hp3_rx_size   ( axim_hp3_rx_size    ),
  .axim_hp3_rx_addr   ( axim_hp3_rx_addr    )
);



initial begin
  clk = 0;
  resetn = 0;
  @(negedge clk);
  @(negedge clk);
  resetn = 1;

  rx_req = 1;
  rx_addr = 32'hDEADBEEF;
  rx_size = $random;
  @(negedge clk);
  rx_req = 0;

#10000;
$finish;
end

initial
begin
    $dumpfile("hw-imp/bin/waveform/axim_controller.vcd");
    $dumpvars(0,axim_controller_tb);
end

always #1 clk = !clk;

endmodule
