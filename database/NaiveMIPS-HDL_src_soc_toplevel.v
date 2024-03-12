// `default_nettype none
//`define EXT_UART_CLOCK
module soc_toplevel(/*autoport*/
//inout
      gpio0,
      gpio1,
      ddr3_dq,
      ddr3_dqs_p,
      ddr3_dqs_n,
//output
      txd,
      NUM_CSn,
      NUM_A_G,
      vga_pixel,
      vga_hsync,
      vga_vsync,
      ddr3_addr,
      ddr3_ba,
      ddr3_ras_n,
      ddr3_cas_n,
      ddr3_we_n,
      ddr3_odt,
      ddr3_reset_n,
      ddr3_cke,
      ddr3_dm,
      ddr3_ck_p,
      ddr3_ck_n,
//input
      rst_in,
      clk_in,
      clk_uart_in,
      rxd);

input wire rst_in;
input wire clk_in;

wire clk2x,clk,locked,rst_n;
wire clk_uart, clk_uart_pll;
wire clk_tick;
wire clk_ddr_ref;
wire clk_50M;
wire locked2;

input wire clk_uart_in;
`ifdef EXT_UART_CLOCK
assign clk_uart = clk_uart_in;
`else
assign clk_uart = clk_uart_pll;
`endif

sys_pll pll1(
    .areset(~rst_in),
    .inclk0(clk_in),
    .c0(clk),
    .c1(clk2x),
    .c2(clk_uart_pll),
    .c3(clk_tick),
    .locked(locked));

clk_wiz_0 pll2
 (
  // Clock out ports
  .clk_out1(clk_ddr_ref),
  .clk_out2(clk_50M),
  // Status and control signals
  .locked(locked2),
 // Clock in ports
  .clk_in1(clk_in)
 );

clk_ctrl clk_ctrl1(/*autoinst*/
         .rst_out_n(rst_n),
         .clk(clk),
         .rst_in_n(locked&locked2));

output wire txd;
input wire rxd;

inout wire[15:0] gpio0;
inout wire[7:0] gpio1;
output wire[7:0] NUM_CSn;
output wire[7:0] NUM_A_G;

wire rs232_rxd = 1'b1;
wire rs232_txd;

output wire[7:0] vga_pixel;
output wire vga_hsync;
output wire vga_vsync;
wire vga_clk;
wire vga_de;

//------DDR3 interface------
inout  wire[15:0] ddr3_dq;
output wire[12:0] ddr3_addr;
output wire[2 :0] ddr3_ba;
output wire       ddr3_ras_n;
output wire       ddr3_cas_n;
output wire       ddr3_we_n;
output wire       ddr3_odt;
output wire       ddr3_reset_n;
output wire       ddr3_cke;
output wire[1:0]  ddr3_dm;
inout  wire[1:0]  ddr3_dqs_p;
inout  wire[1:0]  ddr3_dqs_n;
output wire       ddr3_ck_p;
output wire       ddr3_ck_n;

wire[4:0] irq_line;
wire uart_irq;

(* MARK_DEBUG = "TRUE" *) wire dbus_write;
(* MARK_DEBUG = "TRUE" *) wire [31:0]dbus_rddata;
wire ibus_read;
wire [3:0]ibus_byteenable;
(* MARK_DEBUG = "TRUE" *) wire [3:0]dbus_byteenable;
(* MARK_DEBUG = "TRUE" *) wire [31:0]dbus_wrdata;
wire [31:0]ibus_wrdata;
wire ibus_write;
(* MARK_DEBUG = "TRUE" *) wire dbus_read;
(* MARK_DEBUG = "TRUE" *) wire [31:0]ibus_rddata;
(* MARK_DEBUG = "TRUE" *) wire [31:0]dbus_address;
(* MARK_DEBUG = "TRUE" *) wire [31:0]ibus_address;
(* MARK_DEBUG = "TRUE" *) wire dbus_stall;
(* MARK_DEBUG = "TRUE" *) wire ibus_stall;

wire [31:0]rom_data;
wire [12:0]rom_address;

wire [23:0]ibus_ram_address;
wire [31:0]ibus_ram_rddata;
wire [31:0]ibus_ram_wrdata;
wire [3:0]ibus_ram_byteenable;
wire ibus_ram_read;
wire ibus_ram_write;
wire ibus_ram_stall;

wire [23:0]dbus_ram_address;
wire [31:0]dbus_ram_rddata;
wire [31:0]dbus_ram_wrdata;
wire [3:0]dbus_ram_byteenable;
wire dbus_ram_read;
wire dbus_ram_write;
wire dbus_ram_stall;

wire [31:0]uart_data_o;
wire [31:0]uart_data_i;
wire [3:0]uart_address;
wire uart_read;
wire uart_write;

wire [31:0]flash_dbus_data_o;
wire [31:0]flash_dbus_data_i;
wire [23:0]flash_dbus_address;
wire [3:0]flash_dbus_data_enable;
wire flash_dbus_read;
wire flash_dbus_write;
wire flash_dbus_stall;

wire [31:0]usb_dbus_data_o;
wire [31:0]usb_dbus_data_i;
wire [2:0]usb_dbus_address;
wire usb_dbus_read;
wire usb_dbus_write;
wire usb_dbus_stall;
wire usb_irq;

wire [31:0]gpio_dbus_data_o;
wire [31:0]gpio_dbus_data_i;
wire [7:0]gpio_dbus_address;
wire gpio_dbus_read;
wire gpio_dbus_write;

wire [31:0]gpu_dbus_data_o;
wire [31:0]gpu_dbus_data_i;
wire [23:0]gpu_dbus_address;
wire gpu_dbus_read;
wire gpu_dbus_write;

wire [31:0]ticker_dbus_data_o;
wire [31:0]ticker_dbus_data_i;
wire [7:0]ticker_dbus_address;
wire ticker_dbus_read;
wire ticker_dbus_write;

wire debugger_uart_rxd;
wire debugger_uart_txd;

wire [31:0] segdisp_din;
wire [23:0] gpio1_high;

assign debugger_uart_rxd = rs232_rxd;
assign rs232_txd = debugger_uart_txd;

assign vga_clk = clk_50M;

seg_disp dec(
    .clk(clk),
    .din(segdisp_din),
    .seg(NUM_A_G),
    .com(NUM_CSn)
  );

ibus ibus0(/*autoinst*/
         .master_rddata(ibus_rddata),
         .bootrom_address(rom_address),
         .ram_address(ibus_ram_address),
         .ram_data_i(ibus_ram_wrdata),
         .ram_data_enable(ibus_ram_byteenable),
         .ram_rd(ibus_ram_read),
         .ram_wr(ibus_ram_write),
         .master_address(ibus_address),
         .master_byteenable(ibus_byteenable),
         .master_read(ibus_read),
         .master_write(ibus_write),
         .master_wrdata(ibus_wrdata),
         .master_stall(ibus_stall),
         .ram_stall(ibus_ram_stall),
         .bootrom_data_o(rom_data),
         .ram_data_o(ibus_ram_rddata));

bootrom rom(
        .address(rom_address[12:2]),
        .clock(~clk),
        .q(rom_data));

naive_mips cpu(/*autoinst*/
         .ibus_address(ibus_address[31:0]),
         .ibus_byteenable(ibus_byteenable[3:0]),
         .ibus_read(ibus_read),
         .ibus_write(ibus_write),
         .ibus_wrdata(ibus_wrdata[31:0]),
         .dbus_address(dbus_address[31:0]),
         .dbus_byteenable(dbus_byteenable[3:0]),
         .dbus_read(dbus_read),
         .dbus_write(dbus_write),
         .dbus_wrdata(dbus_wrdata[31:0]),
         .rst_n(rst_n),
         .clk(clk),
         .debugger_uart_clk(clk_uart),
         .debugger_uart_rxd(debugger_uart_rxd),
         .debugger_uart_txd(debugger_uart_txd),
         .ibus_rddata(ibus_rddata[31:0]),
         .ibus_stall(ibus_stall),
         .dbus_rddata(dbus_rddata[31:0]),
         .dbus_stall(dbus_stall),
         .hardware_int_in(irq_line));

dram_adapter mainram(/*autoinst*/
            // Inouts
           .ddr3_dq             (ddr3_dq         ),  
           .ddr3_dqs_p          (ddr3_dqs_p      ),    // for X16 parts 
           .ddr3_dqs_n          (ddr3_dqs_n      ),  // for X16 parts
            // Outputs
           .ddr3_addr           (ddr3_addr       ),  
           .ddr3_ba             (ddr3_ba         ),
           .ddr3_ras_n          (ddr3_ras_n      ),                        
           .ddr3_cas_n          (ddr3_cas_n      ),                        
           .ddr3_we_n           (ddr3_we_n       ),                          
           .ddr3_reset_n        (ddr3_reset_n    ),
           .ddr3_ck_p           (ddr3_ck_p       ),                          
           .ddr3_ck_n           (ddr3_ck_n       ),       
           .ddr3_cke            (ddr3_cke        ),                          
           .ddr3_dm             (ddr3_dm         ),
           .ddr3_odt            (ddr3_odt        ),
           .sysclk100M  (clk_in),
           .refclk200M  (clk_ddr_ref),
           .rddata1(ibus_ram_rddata),
           .rddata2(dbus_ram_rddata),
           .rst_n(rst_n),
           .clk(clk),
           .address1(ibus_ram_address),
           .wrdata1(ibus_ram_wrdata),
           .rd1(ibus_ram_read),
           .wr1(ibus_ram_write),
           .stall1(ibus_ram_stall),
           .dataenable1(ibus_ram_byteenable),
           .address2(dbus_ram_address),
           .wrdata2(dbus_ram_wrdata),
           .rd2(dbus_ram_read),
           .wr2(dbus_ram_write),
           .stall2      (dbus_ram_stall),
           .dataenable2(dbus_ram_byteenable));

dbus dbus0(/*autoinst*/
         .master_rddata(dbus_rddata[31:0]),
         .uart_address(uart_address),
         .uart_data_i(uart_data_i[31:0]),
         .uart_rd(uart_read),
         .uart_wr(uart_write),
         .gpio_address(gpio_dbus_address),
         .gpio_data_i(gpio_dbus_data_i),
         .gpio_rd(gpio_dbus_read),
         .gpio_wr(gpio_dbus_write),
         .ticker_address(ticker_dbus_address),
         .ticker_data_i(ticker_dbus_data_i),
         .ticker_rd(ticker_dbus_read),
         .ticker_wr(ticker_dbus_write),
         .gpu_address(gpu_dbus_address),
         .gpu_data_i(gpu_dbus_data_i),
         .gpu_rd(gpu_dbus_read),
         .gpu_wr(gpu_dbus_write),
         .ram_address(dbus_ram_address[23:0]),
         .ram_data_i(dbus_ram_wrdata[31:0]),
         .ram_data_enable(dbus_ram_byteenable[3:0]),
         .ram_rd(dbus_ram_read),
         .ram_wr(dbus_ram_write),
         .flash_address(flash_dbus_address[23:0]),
         .flash_data_i(flash_dbus_data_i[31:0]),
         .flash_data_enable(flash_dbus_data_enable[3:0]),
         .flash_rd(flash_dbus_read),
         .flash_wr(flash_dbus_write),
         .usb_address      (usb_dbus_address),
         .usb_data_o       (usb_dbus_data_o),
         .usb_data_i       (usb_dbus_data_i),
         .usb_read         (usb_dbus_read),
         .usb_write        (usb_dbus_write),
         .usb_stall        (usb_dbus_stall),
         .master_address(dbus_address[31:0]),
         .master_byteenable(dbus_byteenable[3:0]),
         .master_read(dbus_read),
         .master_write(dbus_write),
         .master_wrdata(dbus_wrdata[31:0]),
         .master_stall(dbus_stall),
         .uart_data_o(uart_data_o[31:0]),
         .gpio_data_o(gpio_dbus_data_o),
         .ticker_data_o(ticker_dbus_data_o),
         .gpu_data_o(gpu_dbus_data_o),
         .ram_data_o(dbus_ram_rddata[31:0]),
         .ram_stall(dbus_ram_stall),
         .flash_stall (flash_dbus_stall),
         .flash_data_o(flash_dbus_data_o[31:0]));

uart_top uart0(/*autoinst*/
         .bus_data_o(uart_data_o[31:0]),
         .txd(txd),
         .clk_bus(clk),
         .clk_uart(clk_uart),
         .rst_n(rst_n),
         .bus_address(uart_address),
         .bus_data_i(uart_data_i[31:0]),
         .bus_read(uart_read),
         .bus_write(uart_write),
         .uart_irq(uart_irq),
         .rxd(rxd));

gpio_top gpio_inst(/*autoinst*/
         .gpio0(segdisp_din),
         .gpio1({gpio1_high,gpio1}),
         .bus_data_o(gpio_dbus_data_o[31:0]),
         .clk_bus(clk),
         .rst_n(rst_n),
         .bus_address(gpio_dbus_address[7:0]),
         .bus_data_i(gpio_dbus_data_i[31:0]),
         .bus_read(gpio_dbus_read),
         .bus_write(gpio_dbus_write));

ticker ticker_inst(
        .clk_bus(clk),
        .rst_n(rst_n),
        .clk_tick(clk_tick),
        .rst_tick_n(rst_n),
        .bus_data_o(ticker_dbus_data_o[31:0]),
        .bus_address(ticker_dbus_address[7:0]),
        .bus_data_i(ticker_dbus_data_i[31:0]),
        .bus_read(ticker_dbus_read),
        .bus_write(ticker_dbus_write));

gpu gpu_inst(
        .clk_bus  (clk),
        .clk_pixel(vga_clk), //50 MHz
        .rst_n    (rst_n),
        .bus_read (gpu_dbus_read),
        .bus_write(gpu_dbus_write),
        .bus_data_o(gpu_dbus_data_o),
        .bus_address(gpu_dbus_address),
        .bus_data_i(gpu_dbus_data_i),
        .de       (vga_de),
        .vsync    (vga_vsync),
        .hsync    (vga_hsync),
        .pxlData  (vga_pixel)
);

assign irq_line = {1'b0,1'b0,uart_irq,2'b0};

endmodule
