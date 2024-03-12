`default_nettype none
module board_scan(/*autoport*/
//inout
          ram_data,
          flash_data,
          gpio0,
          gpio1,
//output
          base_ram_addr,
          base_ram_ce_n,
          base_ram_oe_n,
          base_ram_we_n,
          ext_ram_addr,
          ext_ram_ce_n,
          ext_ram_oe_n,
          ext_ram_we_n,
          txd,
          rs232_txd,
          flash_address,
          flash_rp_n,
          flash_vpen,
          flash_oe_n,
          flash_ce,
          flash_byte_n,
          flash_we_n,
//input
          rst_in_n,
          clk_in,
			 clk_uart_in,
          rxd,
          rs232_rxd);

input wire rst_in_n;
input wire clk_in;
input wire clk_uart_in;

wire clk2x,clk,locked,rst_n;
wire clk_uart;


sys_pll pll1(
    .areset(1'b0),
    .inclk0(clk_in),
    .c0(clk),
    .c1(clk2x),
    .c2(clk_uart),
    .locked(locked));
clk_ctrl clk_ctrl1(/*autoinst*/
         .rst_out_n(rst_n),
         .clk(clk),
         .rst_in_n(locked));

inout wire[31:0] ram_data;

// inout wire[31:0] base_ram_data;
output wire[19:0] base_ram_addr;
output wire base_ram_ce_n;
output wire base_ram_oe_n;
output wire base_ram_we_n;

// inout wire[31:0] ext_ram_data;
output wire[19:0] ext_ram_addr;
output wire ext_ram_ce_n;
output wire ext_ram_oe_n;
output wire ext_ram_we_n;

output wire txd;
input wire rxd;

output wire rs232_txd;
input wire rs232_rxd;

output wire [23:0]flash_address;
output wire flash_rp_n;
output wire flash_vpen;
output wire flash_oe_n;
inout wire [15:0]flash_data;
output wire [2:0]flash_ce;
output wire flash_byte_n;
output wire flash_we_n;

inout wire[31:0] gpio0;
inout wire[31:0] gpio1;

assign base_ram_ce_n = rst_n;
assign base_ram_oe_n = 1'b1;
assign base_ram_we_n = rst_in_n;

assign ext_ram_ce_n = rst_n;
assign ext_ram_oe_n = 1'b1;
assign ext_ram_we_n = rst_in_n;

assign base_ram_addr = {10{2'b10}};
assign ram_data = {24'b0, locked, 7'h55};

assign ext_ram_addr = {10{2'b10}};

assign txd = rxd;

assign rs232_txd = rs232_rxd;

assign flash_address = 0;
assign flash_rp_n=1;
assign flash_vpen=0;
assign flash_oe_n=1;
assign flash_data=0;
assign flash_ce=0;
assign flash_byte_n=1;
assign flash_we_n=1;

wire CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE, TDO;
assign gpio1[31:16] = {CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE, TDO};

assign TDO = TDI;
BSCAN_SPARTAN6 #(
   .JTAG_CHAIN(2)  // Chain number.
)
BSCAN_SPARTAN6_inst (
    .CAPTURE(CAPTURE), // 1-bit Scan Data Register Capture instruction.
    .DRCK(DRCK),       // 1-bit Scan Clock instruction. DRCK is a gated version of TCTCK, it toggles during
                      // the CAPTUREDR and SHIFTDR states.
    .RESET(RESET),     // 1-bit Scan register reset instruction.
    .RUNTEST(RUNTEST), // 1-bit Asserted when TAP controller is in Run Test Idle state. Make sure is the same
                        // name as BSCAN primitive used in Spartan products.
    .SEL(SEL),// 1-bit Scan mode Select instruction.
    .SHIFT(SHIFT),// 1-bit Scan Chain Shift instruction.
    .TCK(TCK),// 1-bit Scan Clock. Fabric connection to TAP Clock pin.
    .TDI(TDI),// 1-bit Scan Chain Output. Mirror of TDI input pin to FPGA.
    .TMS(TMS),// 1-bit Test Mode Select. Fabric connection to TAP.
    .UPDATE(UPDATE),// 1-bit Scan Register Update instruction.
    .TDO(TDO)// 1-bit Scan Chain Input.
);

endmodule
