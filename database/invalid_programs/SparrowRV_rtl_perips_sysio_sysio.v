`include "defines.v"
module sysio (
	input clk,
	input rst_n,

    inout wire [31:0] fpioa,//处理器IO接口

    //AXI4-Lite总线接口 Slave
    //AW写地址
    input wire [`MemAddrBus]    sysio_axi_awaddr ,//写地址
    input wire                  sysio_axi_awvalid,//写地址有效
    output reg                  sysio_axi_awready,//写地址准备好
    //W写数据
    input wire [`MemBus]        sysio_axi_wdata  ,//写数据
    input wire [3:0]            sysio_axi_wstrb  ,//写数据选通
    input wire                  sysio_axi_wvalid ,//写数据有效
    output reg                  sysio_axi_wready ,//写数据准备好
    //AR读地址
    input wire [`MemAddrBus]    sysio_axi_araddr ,//读地址
    input wire                  sysio_axi_arvalid,//读地址有效
    output reg                  sysio_axi_arready,//读地址准备好
    //R读数据
    output reg [`MemBus]        sysio_axi_rdata  ,//读数据
    output reg                  sysio_axi_rvalid ,//读数据有效
    input wire                  sysio_axi_rready //读数据准备好
	
);
//外设线网
wire [31:0] gpio_oe ;
wire [31:0] gpio_out;
wire [31:0] gpio_in ;
//---------总线交互--------
//写
wire axi_whsk = sysio_axi_awvalid & sysio_axi_wvalid;//写通道、读地址握手
wire [7:0] waddr = {sysio_axi_awaddr[7:2], 2'b00};//写地址，屏蔽低位，字节选通替代
wire [`MemBus]din = sysio_axi_wdata;//写数据
wire [3:0]sel = sysio_axi_wstrb;//写选通
wire we = axi_whsk;//写使能
always @(*) begin
    sysio_axi_awready = axi_whsk;
    sysio_axi_wready  = axi_whsk;
end
//读
wire axi_rhsk = sysio_axi_arvalid & (~sysio_axi_rvalid | (sysio_axi_rvalid & sysio_axi_rready));//读通道握手,没有读响应或读响应握手成功
wire [7:0] raddr = {sysio_axi_araddr[7:2], 2'b00};//读地址，屏蔽低位，译码执行部分替代
wire rd = axi_rhsk;//读使能
wire [`MemBus]dout;//读数据
always @(posedge clk or negedge rst_n)//读响应控制
if (~rst_n)
    sysio_axi_rvalid <=1'b0;
else begin
    if (axi_rhsk)
        sysio_axi_rvalid <=1'b1;
    else if (sysio_axi_rvalid & sysio_axi_rready)
        sysio_axi_rvalid <=1'b0;
    else
        sysio_axi_rvalid <= sysio_axi_rvalid;
end
always @(*) begin
    sysio_axi_arready = axi_rhsk;
    sysio_axi_rdata = dout;
end
//---------总线交互--------
// addr[27:0]: 000_0000_0000_0SXX
// S[3:0]: 选择16个外设
// XX[7:0]: 每个外设可使用8b地址宽度，最大支持256/4=64个寄存器
//写通道处理
wire [15:0]we_en;
genvar i;
generate
for (i = 0; i<16; i=i+1) begin
    assign we_en[i] = (sysio_axi_awaddr[11:8] == i)? axi_whsk : 1'b0;
end
endgenerate

//读通道处理
wire [15:0]rd_en;
generate
for (i = 0; i<16; i=i+1) begin
    assign rd_en[i] = (sysio_axi_araddr[11:8] == i)? axi_rhsk : 1'b0;
end
endgenerate
reg [15:0]rd_en_r;
always @(posedge clk ) begin
    if(axi_rhsk)
        rd_en_r <= rd_en;
    else
        rd_en_r <= rd_en_r;
end
wire [`MemBus]data_o[0:15];
assign dout = {32{rd_en_r[0]}} & data_o[0]
            | {32{rd_en_r[1]}} & data_o[1]
            | {32{rd_en_r[2]}} & data_o[2]
            | {32{rd_en_r[3]}} & data_o[3]
            | {32{rd_en_r[4]}} & data_o[4]
            | {32{rd_en_r[5]}} & data_o[5]
            | {32{rd_en_r[6]}} & data_o[6]
            | {32{rd_en_r[7]}} & data_o[7]
            | {32{rd_en_r[8]}} & data_o[8]
            | {32{rd_en_r[9]}} & data_o[9]
            | {32{rd_en_r[10]}} & data_o[10]
            | {32{rd_en_r[11]}} & data_o[11]
            | {32{rd_en_r[12]}} & data_o[12]
            | {32{rd_en_r[13]}} & data_o[13]
            | {32{rd_en_r[14]}} & data_o[14]
            | {32{rd_en_r[15]}} & data_o[15];

//0 uart0
uart inst_uart0
(
    .clk     (clk),
    .rst_n   (rst_n),

    .waddr_i (waddr[7:0]),
    .data_i  (din),
    .sel_i   (sel),
    .we_i    (we_en[0]),
    .raddr_i (raddr),
    .rd_i    (rd_en[0]),
    .data_o  (data_o[0]),

    .tx_pin  (uart0_tx),
    .rx_pin  (uart0_rx)
);
//1 uart1
uart inst_uart1
(
    .clk     (clk),
    .rst_n   (rst_n),

    .waddr_i (waddr),
    .data_i  (din),
    .sel_i   (sel),
    .we_i    (we_en[1]),
    .raddr_i (raddr),
    .rd_i    (rd_en[1]),
    .data_o  (data_o[1]),

    .tx_pin  (uart1_tx),
    .rx_pin  (uart1_rx)
);
//2 spi0
spi inst_spi0
(
    .clk      (clk),
    .rst_n    (rst_n),

    .waddr_i  (waddr),
    .data_i   (din),
    .sel_i    (sel),
    .we_i     (we_en[2]),
    .raddr_i  (raddr),
    .rd_i     (rd_en[2]),
    .data_o   (data_o[2]),

    .spi_mosi (spi0_mosi),
    .spi_miso (spi0_miso),
    .spi_cs   (spi0_cs  ),
    .spi_clk  (spi0_clk )
);
//3 spi1
spi inst_spi1
(
    .clk      (clk),
    .rst_n    (rst_n),

    .waddr_i  (waddr),
    .data_i   (din),
    .sel_i    (sel),
    .we_i     (we_en[3]),
    .raddr_i  (raddr),
    .rd_i     (rd_en[3]),
    .data_o   (data_o[3]),

    .spi_mosi (spi1_mosi),
    .spi_miso (spi1_miso),
    .spi_cs   (spi1_cs  ),
    .spi_clk  (spi1_clk )
);
//4 gpio
gpio inst_gpio
(
    .clk           (clk),
    .rst_n         (rst_n),

    .waddr_i       (waddr),
    .data_i        (din),
    .sel_i         (sel),
    .we_i          (we_en[4]),
    .raddr_i       (raddr),
    .rd_i          (rd_en[4]),
    .data_o        (data_o[4]),

    .gpio_oe       (gpio_oe ),
    .gpio_out      (gpio_out),
    .gpio_in       (gpio_in )
);
//15 fpioa
fpioa inst_fpioa
(
    .clk      (clk),
    .rst_n    (rst_n),

    .waddr_i  (waddr),
    .data_i   (din),
    .sel_i    (sel),
    .we_i     (we_en[15]),
    .raddr_i  (raddr),
    .rd_i     (rd_en[15]),
    .data_o   (data_o[15]),
    //通信接口
    .SPI0_SCK  (spi0_clk),
    .SPI0_MOSI (spi0_mosi),
    .SPI0_MISO (spi0_miso),
    .SPI0_CS   (spi0_cs),
    .SPI1_SCK  (spi1_clk),
    .SPI1_MOSI (spi1_mosi),
    .SPI1_MISO (spi1_miso),
    .SPI1_CS   (spi1_cs),
    .UART0_TX  (uart0_tx),
    .UART0_RX  (uart0_rx),
    .UART1_TX  (uart1_tx),
    .UART1_RX  (uart1_rx),
    //GPIO
    .gpio_oe  (gpio_oe ),
    .gpio_out (gpio_out),
    .gpio_in  (gpio_in ),

    .fpioa    (fpioa)
);

endmodule