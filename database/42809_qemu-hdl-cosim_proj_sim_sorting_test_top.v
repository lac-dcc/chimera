// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License

`timescale 1ns / 100ps

module test_top ();

reg  PCIE_CLK_N;
reg  PCIE_CLK_P;
wire [7:0] PCIE_RX_N;
wire [7:0] PCIE_RX_P;
wire [7:0] PCIE_TX_N;
wire [7:0] PCIE_TX_P;
reg  PERSTN;
reg  FPGA_SYSCLK_N;
reg  FPGA_SYSCLK_P;
reg  RESET;
wire  UART_RXD_OUT;
wire  UART_TXD_IN;
top_wrapper DUT (
  .PCIE_CLK_N (PCIE_CLK_N),
  .PCIE_CLK_P (PCIE_CLK_P),
  .PCIE_RX_N (PCIE_RX_N),
  .PCIE_RX_P (PCIE_RX_P),
  .PCIE_TX_N (PCIE_TX_N),
  .PCIE_TX_P (PCIE_TX_P),
  .PERSTN (PERSTN),
  .FPGA_SYSCLK_N (FPGA_SYSCLK_N),
  .FPGA_SYSCLK_P (FPGA_SYSCLK_P),
  .RESET (RESET),
  .UART_RXD_OUT (UART_RXD_OUT),
  .UART_TXD_IN (UART_TXD_IN)
);

always
begin
  PCIE_CLK_N = 1;
  #5.0;
  PCIE_CLK_N = 0;
  #5.0;
end
always
begin
  PCIE_CLK_P = 0;
  #5.0;
  PCIE_CLK_P = 1;
  #5.0;
end

always
begin
  FPGA_SYSCLK_N = 0;
  #2.5;
  FPGA_SYSCLK_N = 1;
  #2.5;
end
always
begin
  FPGA_SYSCLK_P = 1;
  #2.5;
  FPGA_SYSCLK_P = 0;
  #2.5;
end

initial
begin
  $display("[%t] : System Reset(test_top/RESET) Is Asserted...", $realtime);
  RESET = 1;
  #5000;
  $display("[%t] : System Reset(test_top/RESET) Is DeAsserted...", $realtime);
  RESET = 0;
end

initial
begin
  $display("[%t] : System Reset(test_top/PERSTN) Is Asserted...", $realtime);
  PERSTN = 0;
  #100;
  $display("[%t] : System Reset(test_top/PERSTN) Is DeAsserted...", $realtime);
  PERSTN = 1;
end
//initial begin
//    $fsdbDumpfile("./testbench.fsdb");
//    $fsdbDumpvars;
//end

initial begin
  $display("V: testbench init.");
end

endmodule

