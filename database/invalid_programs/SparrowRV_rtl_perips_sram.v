`include "defines.v"
module sram (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low

    //AXI4-Lite总线接口 Slave
    //AW写地址
    input wire [`MemAddrBus]    sram_axi_awaddr ,//写地址
    input wire                  sram_axi_awvalid,//写地址有效
    output reg                  sram_axi_awready,//写地址准备好
    //W写数据
    input wire [`MemBus]        sram_axi_wdata  ,//写数据
    input wire [3:0]            sram_axi_wstrb  ,//写数据选通
    input wire                  sram_axi_wvalid ,//写数据有效
    output reg                  sram_axi_wready ,//写数据准备好
    //AR读地址
    input wire [`MemAddrBus]    sram_axi_araddr ,//读地址
    input wire                  sram_axi_arvalid,//读地址有效
    output reg                  sram_axi_arready,//读地址准备好
    //R读数据
    output reg [`MemBus]        sram_axi_rdata  ,//读数据
    output reg                  sram_axi_rvalid ,//读数据有效
    input wire                  sram_axi_rready //读数据准备好
	
);


//AXI4L总线交互
reg [clogb2(`SRamSize-1)-1:0]addr;
reg we,en;
reg [3:0] wem;
wire [`MemBus]dout;
reg [`MemBus]din;
wire axi_whsk = sram_axi_awvalid & sram_axi_wvalid;//写通道握手
wire axi_rhsk = sram_axi_arvalid & (~sram_axi_rvalid | (sram_axi_rvalid & sram_axi_rready)) & ~axi_whsk;//读通道握手,没有读响应或读响应握手成功

localparam [clogb2(`SRamSize-1)-1:0] addr_zero0 = 0;

always @(posedge clk or negedge rst_n)//读响应控制
if (~rst_n)
    sram_axi_rvalid <=1'b0;
else begin
    if (axi_rhsk)
        sram_axi_rvalid <=1'b1;
    else if (sram_axi_rvalid & sram_axi_rready)
        sram_axi_rvalid <=1'b0;
    else
        sram_axi_rvalid <= sram_axi_rvalid;
end

always @(*) begin
    sram_axi_awready = axi_whsk;//写地址数据同时准备好
    sram_axi_wready = axi_whsk;//写地址数据同时准备好
    sram_axi_rdata = dout;//读数据
    sram_axi_arready = axi_rhsk;//读地址握手
    if(axi_whsk) begin//写握手
        addr = sram_axi_awaddr[clogb2(`SRamSize-1)+1:2];
        we = 1;
    end
    else begin
        if (axi_rhsk) begin//读握手
            addr = sram_axi_araddr[clogb2(`SRamSize-1)+1:2];
            we = 0;
        end
        else begin
            addr = 0;
            we = 0;
        end
    end
    din = sram_axi_wdata;
    en = axi_whsk | axi_rhsk;//握手成功，使能存储器
    wem = sram_axi_wstrb;
end

dpram #(
    .RAM_DEPTH(`SRamSize),
    .RAM_SEL(`SRAM_MODEL),
    .BRAM_EN("32K"),
    .MODE("SP")
) inst_sram (
    .clk    (clk),
    .addra  (addr_zero0),
    .addrb  (addr),
    .dina   (32'h0),
    .dinb   (din),
    .wea    (1'b0),
    .web    (we),
    .wema   (4'h0),
    .wemb   (wem),
    .ena    (1'b0),
    .enb    (en),
    .douta  (),
    .doutb  (dout)
);

function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

endmodule