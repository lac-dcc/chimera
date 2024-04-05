`include "defines.v"
module axi4lite_2mt16s (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
    //AXI4-Lite总线接口 core->m0
    //AW写地址
    input wire [`MemAddrBus]    m0_axi_awaddr ,//写地址
    input wire [2:0]            m0_axi_awprot ,//写保护类型，恒为0
    input wire                  m0_axi_awvalid,//写地址有效
    output reg                  m0_axi_awready,//写地址准备好
    //W写数据
    input wire [`MemBus]        m0_axi_wdata  ,//写数据
    input wire [3:0]            m0_axi_wstrb  ,//写数据选通
    input wire                  m0_axi_wvalid ,//写数据有效
    output reg                  m0_axi_wready ,//写数据准备好
    //B写响应
    output reg [1:0]            m0_axi_bresp  ,//写响应
    output reg                  m0_axi_bvalid ,//写响应有效
    input wire                  m0_axi_bready ,//写响应准备好
    //AR读地址
    input wire [`MemAddrBus]    m0_axi_araddr ,//读地址
    input wire [2:0]            m0_axi_arprot ,//读保护类型，恒为0
    input wire                  m0_axi_arvalid,//读地址有效
    output reg                  m0_axi_arready,//读地址准备好
    //R读数据
    output reg [`MemBus]        m0_axi_rdata  ,//读数据
    output reg [1:0]            m0_axi_rresp  ,//读响应
    output reg                  m0_axi_rvalid ,//读数据有效
    input wire                  m0_axi_rready ,//读数据准备好
	//AXI4-Lite总线接口 jtag->m1
    //AW写地址
    input wire [`MemAddrBus]    m1_axi_awaddr ,//写地址
    input wire [2:0]            m1_axi_awprot ,//写保护类型，恒为0
    input wire                  m1_axi_awvalid,//写地址有效
    output reg                  m1_axi_awready,//写地址准备好
    //W写数据
    input wire [`MemBus]        m1_axi_wdata  ,//写数据
    input wire [3:0]            m1_axi_wstrb  ,//写数据选通
    input wire                  m1_axi_wvalid ,//写数据有效
    output reg                  m1_axi_wready ,//写数据准备好
    //B写响应
    output reg [1:0]            m1_axi_bresp  ,//写响应
    output reg                  m1_axi_bvalid ,//写响应有效
    input wire                  m1_axi_bready ,//写响应准备好
    //AR读地址
    input wire [`MemAddrBus]    m1_axi_araddr ,//读地址
    input wire [2:0]            m1_axi_arprot ,//读保护类型，恒为0
    input wire                  m1_axi_arvalid,//读地址有效
    output reg                  m1_axi_arready,//读地址准备好
    //R读数据
    output reg [`MemBus]        m1_axi_rdata  ,//读数据
    output reg [1:0]            m1_axi_rresp  ,//读响应
    output reg                  m1_axi_rvalid ,//读数据有效
    input wire                  m1_axi_rready ,//读数据准备好

    //AXI4-Lite总线接口 s0
    //AW写地址
    output wire [`MemAddrBus]    s0_axi_awaddr ,//写地址
    output wire                  s0_axi_awvalid,//写地址有效
    input  wire                  s0_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s0_axi_wdata  ,//写数据
    output wire [3:0]            s0_axi_wstrb  ,//写数据选通
    output wire                  s0_axi_wvalid ,//写数据有效
    input  wire                  s0_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s0_axi_araddr ,//读地址
    output wire                  s0_axi_arvalid,//读地址有效
    input  wire                  s0_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s0_axi_rdata  ,//读数据
    input  wire                  s0_axi_rvalid ,//读数据有效
    output wire                  s0_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s1
    //AW写地址
    output wire [`MemAddrBus]    s1_axi_awaddr ,//写地址
    output wire                  s1_axi_awvalid,//写地址有效
    input  wire                  s1_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s1_axi_wdata  ,//写数据
    output wire [3:0]            s1_axi_wstrb  ,//写数据选通
    output wire                  s1_axi_wvalid ,//写数据有效
    input  wire                  s1_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s1_axi_araddr ,//读地址
    output wire                  s1_axi_arvalid,//读地址有效
    input  wire                  s1_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s1_axi_rdata  ,//读数据
    input  wire                  s1_axi_rvalid ,//读数据有效
    output wire                  s1_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s2
    //AW写地址
    output wire [`MemAddrBus]    s2_axi_awaddr ,//写地址
    output wire                  s2_axi_awvalid,//写地址有效
    input  wire                  s2_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s2_axi_wdata  ,//写数据
    output wire [3:0]            s2_axi_wstrb  ,//写数据选通
    output wire                  s2_axi_wvalid ,//写数据有效
    input  wire                  s2_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s2_axi_araddr ,//读地址
    output wire                  s2_axi_arvalid,//读地址有效
    input  wire                  s2_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s2_axi_rdata  ,//读数据
    input  wire                  s2_axi_rvalid ,//读数据有效
    output wire                  s2_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s3
    //AW写地址
    output wire [`MemAddrBus]    s3_axi_awaddr ,//写地址
    output wire                  s3_axi_awvalid,//写地址有效
    input  wire                  s3_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s3_axi_wdata  ,//写数据
    output wire [3:0]            s3_axi_wstrb  ,//写数据选通
    output wire                  s3_axi_wvalid ,//写数据有效
    input  wire                  s3_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s3_axi_araddr ,//读地址
    output wire                  s3_axi_arvalid,//读地址有效
    input  wire                  s3_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s3_axi_rdata  ,//读数据
    input  wire                  s3_axi_rvalid ,//读数据有效
    output wire                  s3_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s4
    //AW写地址
    output wire [`MemAddrBus]    s4_axi_awaddr ,//写地址
    output wire                  s4_axi_awvalid,//写地址有效
    input  wire                  s4_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s4_axi_wdata  ,//写数据
    output wire [3:0]            s4_axi_wstrb  ,//写数据选通
    output wire                  s4_axi_wvalid ,//写数据有效
    input  wire                  s4_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s4_axi_araddr ,//读地址
    output wire                  s4_axi_arvalid,//读地址有效
    input  wire                  s4_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s4_axi_rdata  ,//读数据
    input  wire                  s4_axi_rvalid ,//读数据有效
    output wire                  s4_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s5
    //AW写地址
    output wire [`MemAddrBus]    s5_axi_awaddr ,//写地址
    output wire                  s5_axi_awvalid,//写地址有效
    input  wire                  s5_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s5_axi_wdata  ,//写数据
    output wire [3:0]            s5_axi_wstrb  ,//写数据选通
    output wire                  s5_axi_wvalid ,//写数据有效
    input  wire                  s5_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s5_axi_araddr ,//读地址
    output wire                  s5_axi_arvalid,//读地址有效
    input  wire                  s5_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s5_axi_rdata  ,//读数据
    input  wire                  s5_axi_rvalid ,//读数据有效
    output wire                  s5_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s6
    //AW写地址
    output wire [`MemAddrBus]    s6_axi_awaddr ,//写地址
    output wire                  s6_axi_awvalid,//写地址有效
    input  wire                  s6_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s6_axi_wdata  ,//写数据
    output wire [3:0]            s6_axi_wstrb  ,//写数据选通
    output wire                  s6_axi_wvalid ,//写数据有效
    input  wire                  s6_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s6_axi_araddr ,//读地址
    output wire                  s6_axi_arvalid,//读地址有效
    input  wire                  s6_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s6_axi_rdata  ,//读数据
    input  wire                  s6_axi_rvalid ,//读数据有效
    output wire                  s6_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s7
    //AW写地址
    output wire [`MemAddrBus]    s7_axi_awaddr ,//写地址
    output wire                  s7_axi_awvalid,//写地址有效
    input  wire                  s7_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s7_axi_wdata  ,//写数据
    output wire [3:0]            s7_axi_wstrb  ,//写数据选通
    output wire                  s7_axi_wvalid ,//写数据有效
    input  wire                  s7_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s7_axi_araddr ,//读地址
    output wire                  s7_axi_arvalid,//读地址有效
    input  wire                  s7_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s7_axi_rdata  ,//读数据
    input  wire                  s7_axi_rvalid ,//读数据有效
    output wire                  s7_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s8
    //AW写地址
    output wire [`MemAddrBus]    s8_axi_awaddr ,//写地址
    output wire                  s8_axi_awvalid,//写地址有效
    input  wire                  s8_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s8_axi_wdata  ,//写数据
    output wire [3:0]            s8_axi_wstrb  ,//写数据选通
    output wire                  s8_axi_wvalid ,//写数据有效
    input  wire                  s8_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s8_axi_araddr ,//读地址
    output wire                  s8_axi_arvalid,//读地址有效
    input  wire                  s8_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s8_axi_rdata  ,//读数据
    input  wire                  s8_axi_rvalid ,//读数据有效
    output wire                  s8_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s9
    //AW写地址
    output wire [`MemAddrBus]    s9_axi_awaddr ,//写地址
    output wire                  s9_axi_awvalid,//写地址有效
    input  wire                  s9_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s9_axi_wdata  ,//写数据
    output wire [3:0]            s9_axi_wstrb  ,//写数据选通
    output wire                  s9_axi_wvalid ,//写数据有效
    input  wire                  s9_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s9_axi_araddr ,//读地址
    output wire                  s9_axi_arvalid,//读地址有效
    input  wire                  s9_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s9_axi_rdata  ,//读数据
    input  wire                  s9_axi_rvalid ,//读数据有效
    output wire                  s9_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s10
    //AW写地址
    output wire [`MemAddrBus]    s10_axi_awaddr ,//写地址
    output wire                  s10_axi_awvalid,//写地址有效
    input  wire                  s10_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s10_axi_wdata  ,//写数据
    output wire [3:0]            s10_axi_wstrb  ,//写数据选通
    output wire                  s10_axi_wvalid ,//写数据有效
    input  wire                  s10_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s10_axi_araddr ,//读地址
    output wire                  s10_axi_arvalid,//读地址有效
    input  wire                  s10_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s10_axi_rdata  ,//读数据
    input  wire                  s10_axi_rvalid ,//读数据有效
    output wire                  s10_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s11
    //AW写地址
    output wire [`MemAddrBus]    s11_axi_awaddr ,//写地址
    output wire                  s11_axi_awvalid,//写地址有效
    input  wire                  s11_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s11_axi_wdata  ,//写数据
    output wire [3:0]            s11_axi_wstrb  ,//写数据选通
    output wire                  s11_axi_wvalid ,//写数据有效
    input  wire                  s11_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s11_axi_araddr ,//读地址
    output wire                  s11_axi_arvalid,//读地址有效
    input  wire                  s11_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s11_axi_rdata  ,//读数据
    input  wire                  s11_axi_rvalid ,//读数据有效
    output wire                  s11_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s12
    //AW写地址
    output wire [`MemAddrBus]    s12_axi_awaddr ,//写地址
    output wire                  s12_axi_awvalid,//写地址有效
    input  wire                  s12_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s12_axi_wdata  ,//写数据
    output wire [3:0]            s12_axi_wstrb  ,//写数据选通
    output wire                  s12_axi_wvalid ,//写数据有效
    input  wire                  s12_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s12_axi_araddr ,//读地址
    output wire                  s12_axi_arvalid,//读地址有效
    input  wire                  s12_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s12_axi_rdata  ,//读数据
    input  wire                  s12_axi_rvalid ,//读数据有效
    output wire                  s12_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s13
    //AW写地址
    output wire [`MemAddrBus]    s13_axi_awaddr ,//写地址
    output wire                  s13_axi_awvalid,//写地址有效
    input  wire                  s13_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s13_axi_wdata  ,//写数据
    output wire [3:0]            s13_axi_wstrb  ,//写数据选通
    output wire                  s13_axi_wvalid ,//写数据有效
    input  wire                  s13_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s13_axi_araddr ,//读地址
    output wire                  s13_axi_arvalid,//读地址有效
    input  wire                  s13_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s13_axi_rdata  ,//读数据
    input  wire                  s13_axi_rvalid ,//读数据有效
    output wire                  s13_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s14
    //AW写地址
    output wire [`MemAddrBus]    s14_axi_awaddr ,//写地址
    output wire                  s14_axi_awvalid,//写地址有效
    input  wire                  s14_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s14_axi_wdata  ,//写数据
    output wire [3:0]            s14_axi_wstrb  ,//写数据选通
    output wire                  s14_axi_wvalid ,//写数据有效
    input  wire                  s14_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s14_axi_araddr ,//读地址
    output wire                  s14_axi_arvalid,//读地址有效
    input  wire                  s14_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s14_axi_rdata  ,//读数据
    input  wire                  s14_axi_rvalid ,//读数据有效
    output wire                  s14_axi_rready ,//读数据准备好
    //AXI4-Lite总线接口 s15
    //AW写地址
    output wire [`MemAddrBus]    s15_axi_awaddr ,//写地址
    output wire                  s15_axi_awvalid,//写地址有效
    input  wire                  s15_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]        s15_axi_wdata  ,//写数据
    output wire [3:0]            s15_axi_wstrb  ,//写数据选通
    output wire                  s15_axi_wvalid ,//写数据有效
    input  wire                  s15_axi_wready ,//写数据准备好
    //AR读地址
    output wire [`MemAddrBus]    s15_axi_araddr ,//读地址
    output wire                  s15_axi_arvalid,//读地址有效
    input  wire                  s15_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]        s15_axi_rdata  ,//读数据
    input  wire                  s15_axi_rvalid ,//读数据有效
    output wire                  s15_axi_rready //读数据准备好

);
//m0比m1更优先
//线网定义
wire m0_wbus_en = m0_axi_awvalid & m0_axi_wvalid;//m0写地址数据都有效，开启m0写通道
wire m1_wbus_en = m1_axi_awvalid & m1_axi_wvalid & ~m0_wbus_en;//m1写地址数据都有效，m0写通道无效，开启m1写通道

wire m0_abus_en = m0_axi_arvalid;//m0读地址有效，开启m0读通道
wire m1_abus_en = m1_axi_arvalid & ~m0_abus_en;//m1读地址有效，m0读通道无效，开启m1读通道


reg m0_rbus_en;//m0读数据通道
reg m1_rbus_en;//m1读数据通道

//------------- m0/m1 <-> master ------------
wire [`MemAddrBus]    master_axi_awaddr ;//写地址m->
wire                  master_axi_awvalid;//写地址有效m->
wire                  master_axi_awready;//写地址准备好s->
wire [`MemBus]        master_axi_wdata  ;//写数据m->
wire [3:0]            master_axi_wstrb  ;//写数据选通m->
wire                  master_axi_wvalid ;//写数据有效m->
wire                  master_axi_wready ;//写数据准备好s->
wire [`MemAddrBus]    master_axi_araddr ;//读地址m->
wire                  master_axi_arvalid;//读地址有效m->
wire                  master_axi_arready;//读地址准备好s->
wire [`MemBus]        master_axi_rdata  ;//读数据s->
wire                  master_axi_rvalid ;//读数据有效s->
wire                  master_axi_rready ;//读数据准备好m->
//mx->master
assign master_axi_awaddr  = m0_wbus_en ? m0_axi_awaddr : m1_axi_awaddr;
assign master_axi_awvalid = ({1{m0_wbus_en}} & m0_axi_awvalid)
                            | ({1{m1_wbus_en}} & m1_axi_awvalid);
assign master_axi_wdata   = m0_wbus_en ? m0_axi_wdata : m1_axi_wdata;
assign master_axi_wstrb   = m0_wbus_en ? m0_axi_wstrb : m1_axi_wstrb;
assign master_axi_wvalid  = ({1{m0_wbus_en}} & m0_axi_wvalid)
                            | ({1{m1_wbus_en}} & m1_axi_wvalid);
assign master_axi_araddr  = m0_abus_en ? m0_axi_araddr : m1_axi_araddr;
assign master_axi_arvalid = ({1{m0_abus_en}} & m0_axi_arvalid)
                            | ({1{m1_abus_en}} & m1_axi_arvalid);
assign master_axi_rready  = ({1{m0_rbus_en}} & m0_axi_rready)
                            | ({1{m1_rbus_en}} & m1_axi_rready);
//master->mx
always @(*) begin
    m0_axi_awready = {1 {m0_wbus_en}} & master_axi_awready;
    m0_axi_wready  = {1 {m0_wbus_en}} & master_axi_wready ;
    m0_axi_arready = {1 {m0_abus_en}} & master_axi_arready;
    m0_axi_rdata   = master_axi_rdata  ;
    m0_axi_rvalid  = {1 {m0_rbus_en}} & master_axi_rvalid ;
    m1_axi_awready = {1 {m1_wbus_en}} & master_axi_awready;
    m1_axi_wready  = {1 {m1_wbus_en}} & master_axi_wready ;
    m1_axi_arready = {1 {m1_abus_en}} & master_axi_arready;
    m1_axi_rdata   = master_axi_rdata  ;
    m1_axi_rvalid  = {1 {m1_rbus_en}} & master_axi_rvalid ;
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        m0_rbus_en <= 0;
        m1_rbus_en <= 0;
    end
    else begin
        if (m0_axi_arvalid & m0_axi_arready)
            m0_rbus_en <=1'b1;
        else if (m0_rbus_en & m0_axi_rvalid & m0_axi_rready)
            m0_rbus_en <=1'b0;
        else
            m0_rbus_en <= m0_rbus_en;
        if (m1_axi_arvalid & m1_axi_arready)
            m1_rbus_en <=1'b1;
        else if (m1_rbus_en & m1_axi_rvalid & m1_axi_rready)
            m1_rbus_en <=1'b0;
        else
            m1_rbus_en <= m1_rbus_en;
    end
end
//------------- m0/m1 <-> master ------------

//------------- slave <-> master ------------
wire [3:0] wbus_mux;//写通道多路选择从机
wire [15:0] wbus_sel;//写通道选择从机
wire [3:0] abus_mux;//读地址通道多路选择从机
wire [15:0] abus_sel;//读地址通道选择从机
reg [3:0] rbus_mux;//读数据通道多路选择从机
reg [15:0] rbus_sel;//读数据通道选择从机

// slave w <-> master w
assign wbus_mux = master_axi_awaddr [31:28];
assign wbus_sel[0 ] = wbus_mux == 4'd0  ? 1'b1 : 1'b0;
assign wbus_sel[1 ] = wbus_mux == 4'd1  ? 1'b1 : 1'b0;
assign wbus_sel[2 ] = wbus_mux == 4'd2  ? 1'b1 : 1'b0;
assign wbus_sel[3 ] = wbus_mux == 4'd3  ? 1'b1 : 1'b0;
assign wbus_sel[4 ] = wbus_mux == 4'd4  ? 1'b1 : 1'b0;
assign wbus_sel[5 ] = wbus_mux == 4'd5  ? 1'b1 : 1'b0;
assign wbus_sel[6 ] = wbus_mux == 4'd6  ? 1'b1 : 1'b0;
assign wbus_sel[7 ] = wbus_mux == 4'd7  ? 1'b1 : 1'b0;
assign wbus_sel[8 ] = wbus_mux == 4'd8  ? 1'b1 : 1'b0;
assign wbus_sel[9 ] = wbus_mux == 4'd9  ? 1'b1 : 1'b0;
assign wbus_sel[10] = wbus_mux == 4'd10 ? 1'b1 : 1'b0;
assign wbus_sel[11] = wbus_mux == 4'd11 ? 1'b1 : 1'b0;
assign wbus_sel[12] = wbus_mux == 4'd12 ? 1'b1 : 1'b0;
assign wbus_sel[13] = wbus_mux == 4'd13 ? 1'b1 : 1'b0;
assign wbus_sel[14] = wbus_mux == 4'd14 ? 1'b1 : 1'b0;
assign wbus_sel[15] = wbus_mux == 4'd15 ? 1'b1 : 1'b0;

assign s0_axi_awaddr  = wbus_mux == 4'd0  ? master_axi_awaddr : 32'b0;
assign s1_axi_awaddr  = wbus_mux == 4'd1  ? master_axi_awaddr : 32'b0;
assign s2_axi_awaddr  = wbus_mux == 4'd2  ? master_axi_awaddr : 32'b0;
assign s3_axi_awaddr  = wbus_mux == 4'd3  ? master_axi_awaddr : 32'b0;
assign s4_axi_awaddr  = wbus_mux == 4'd4  ? master_axi_awaddr : 32'b0;
assign s5_axi_awaddr  = wbus_mux == 4'd5  ? master_axi_awaddr : 32'b0;
assign s6_axi_awaddr  = wbus_mux == 4'd6  ? master_axi_awaddr : 32'b0;
assign s7_axi_awaddr  = wbus_mux == 4'd7  ? master_axi_awaddr : 32'b0;
assign s8_axi_awaddr  = wbus_mux == 4'd8  ? master_axi_awaddr : 32'b0;
assign s9_axi_awaddr  = wbus_mux == 4'd9  ? master_axi_awaddr : 32'b0;
assign s10_axi_awaddr = wbus_mux == 4'd10 ? master_axi_awaddr : 32'b0;
assign s11_axi_awaddr = wbus_mux == 4'd11 ? master_axi_awaddr : 32'b0;
assign s12_axi_awaddr = wbus_mux == 4'd12 ? master_axi_awaddr : 32'b0;
assign s13_axi_awaddr = wbus_mux == 4'd13 ? master_axi_awaddr : 32'b0;
assign s14_axi_awaddr = wbus_mux == 4'd14 ? master_axi_awaddr : 32'b0;
assign s15_axi_awaddr = wbus_mux == 4'd15 ? master_axi_awaddr : 32'b0;

assign s0_axi_awvalid  =  {1{wbus_sel[0]}} & master_axi_awvalid;
assign s1_axi_awvalid  =  {1{wbus_sel[1]}} & master_axi_awvalid;
assign s2_axi_awvalid  =  {1{wbus_sel[2]}} & master_axi_awvalid;
assign s3_axi_awvalid  =  {1{wbus_sel[3]}} & master_axi_awvalid;
assign s4_axi_awvalid  =  {1{wbus_sel[4]}} & master_axi_awvalid;
assign s5_axi_awvalid  =  {1{wbus_sel[5]}} & master_axi_awvalid;
assign s6_axi_awvalid  =  {1{wbus_sel[6]}} & master_axi_awvalid;
assign s7_axi_awvalid  =  {1{wbus_sel[7]}} & master_axi_awvalid;
assign s8_axi_awvalid  =  {1{wbus_sel[8]}} & master_axi_awvalid;
assign s9_axi_awvalid  =  {1{wbus_sel[9]}} & master_axi_awvalid;
assign s10_axi_awvalid = {1{wbus_sel[10]}} & master_axi_awvalid;
assign s11_axi_awvalid = {1{wbus_sel[11]}} & master_axi_awvalid;
assign s12_axi_awvalid = {1{wbus_sel[12]}} & master_axi_awvalid;
assign s13_axi_awvalid = {1{wbus_sel[13]}} & master_axi_awvalid;
assign s14_axi_awvalid = {1{wbus_sel[14]}} & master_axi_awvalid;
assign s15_axi_awvalid = {1{wbus_sel[15]}} & master_axi_awvalid;

assign s0_axi_wdata   = master_axi_wdata  ;
assign s1_axi_wdata   = master_axi_wdata  ;
assign s2_axi_wdata   = master_axi_wdata  ;
assign s3_axi_wdata   = master_axi_wdata  ;
assign s4_axi_wdata   = master_axi_wdata  ;
assign s5_axi_wdata   = master_axi_wdata  ;
assign s6_axi_wdata   = master_axi_wdata  ;
assign s7_axi_wdata   = master_axi_wdata  ;
assign s8_axi_wdata   = master_axi_wdata  ;
assign s9_axi_wdata   = master_axi_wdata  ;
assign s10_axi_wdata  = master_axi_wdata  ;
assign s11_axi_wdata  = master_axi_wdata  ;
assign s12_axi_wdata  = master_axi_wdata  ;
assign s13_axi_wdata  = master_axi_wdata  ;
assign s14_axi_wdata  = master_axi_wdata  ;
assign s15_axi_wdata  = master_axi_wdata  ;

assign s0_axi_wstrb  = master_axi_wstrb ;
assign s1_axi_wstrb  = master_axi_wstrb ;
assign s2_axi_wstrb  = master_axi_wstrb ;
assign s3_axi_wstrb  = master_axi_wstrb ;
assign s4_axi_wstrb  = master_axi_wstrb ;
assign s5_axi_wstrb  = master_axi_wstrb ;
assign s6_axi_wstrb  = master_axi_wstrb ;
assign s7_axi_wstrb  = master_axi_wstrb ;
assign s8_axi_wstrb  = master_axi_wstrb ;
assign s9_axi_wstrb  = master_axi_wstrb ;
assign s10_axi_wstrb = master_axi_wstrb ;
assign s11_axi_wstrb = master_axi_wstrb ;
assign s12_axi_wstrb = master_axi_wstrb ;
assign s13_axi_wstrb = master_axi_wstrb ;
assign s14_axi_wstrb = master_axi_wstrb ;
assign s15_axi_wstrb = master_axi_wstrb ;

assign s0_axi_wvalid =  {1{wbus_sel[0]}} & master_axi_wvalid ;
assign s1_axi_wvalid =  {1{wbus_sel[1]}} & master_axi_wvalid ;
assign s2_axi_wvalid =  {1{wbus_sel[2]}} & master_axi_wvalid ;
assign s3_axi_wvalid =  {1{wbus_sel[3]}} & master_axi_wvalid ;
assign s4_axi_wvalid =  {1{wbus_sel[4]}} & master_axi_wvalid ;
assign s5_axi_wvalid =  {1{wbus_sel[5]}} & master_axi_wvalid ;
assign s6_axi_wvalid =  {1{wbus_sel[6]}} & master_axi_wvalid ;
assign s7_axi_wvalid =  {1{wbus_sel[7]}} & master_axi_wvalid ;
assign s8_axi_wvalid =  {1{wbus_sel[8]}} & master_axi_wvalid ;
assign s9_axi_wvalid =  {1{wbus_sel[9]}} & master_axi_wvalid ;
assign s10_axi_wvalid = {1{wbus_sel[10]}} & master_axi_wvalid ;
assign s11_axi_wvalid = {1{wbus_sel[11]}} & master_axi_wvalid ;
assign s12_axi_wvalid = {1{wbus_sel[12]}} & master_axi_wvalid ;
assign s13_axi_wvalid = {1{wbus_sel[13]}} & master_axi_wvalid ;
assign s14_axi_wvalid = {1{wbus_sel[14]}} & master_axi_wvalid ;
assign s15_axi_wvalid = {1{wbus_sel[15]}} & master_axi_wvalid ;


assign master_axi_awready = wbus_sel[0] & s0_axi_awready
        | wbus_sel[1]  & s1_axi_awready
        | wbus_sel[2]  & s2_axi_awready
        | wbus_sel[3]  & s3_axi_awready
        | wbus_sel[4]  & s4_axi_awready
        | wbus_sel[5]  & s5_axi_awready
        | wbus_sel[6]  & s6_axi_awready
        | wbus_sel[7]  & s7_axi_awready
        | wbus_sel[8]  & s8_axi_awready
        | wbus_sel[9]  & s9_axi_awready
        | wbus_sel[10] & s10_axi_awready
        | wbus_sel[11] & s11_axi_awready
        | wbus_sel[12] & s12_axi_awready
        | wbus_sel[13] & s13_axi_awready
        | wbus_sel[14] & s14_axi_awready
        | wbus_sel[15] & s15_axi_awready;
assign master_axi_wready  = wbus_sel[0] & s0_axi_wready
        | wbus_sel[1]  & s1_axi_wready
        | wbus_sel[2]  & s2_axi_wready
        | wbus_sel[3]  & s3_axi_wready
        | wbus_sel[4]  & s4_axi_wready
        | wbus_sel[5]  & s5_axi_wready
        | wbus_sel[6]  & s6_axi_wready
        | wbus_sel[7]  & s7_axi_wready
        | wbus_sel[8]  & s8_axi_wready
        | wbus_sel[9]  & s9_axi_wready
        | wbus_sel[10] & s10_axi_wready
        | wbus_sel[11] & s11_axi_wready
        | wbus_sel[12] & s12_axi_wready
        | wbus_sel[13] & s13_axi_wready
        | wbus_sel[14] & s14_axi_wready
        | wbus_sel[15] & s15_axi_wready;

// slave a <-> master a
assign abus_mux = master_axi_araddr [31:28];
assign abus_sel[0 ] = abus_mux == 4'd0  ? 1'b1 : 1'b0;
assign abus_sel[1 ] = abus_mux == 4'd1  ? 1'b1 : 1'b0;
assign abus_sel[2 ] = abus_mux == 4'd2  ? 1'b1 : 1'b0;
assign abus_sel[3 ] = abus_mux == 4'd3  ? 1'b1 : 1'b0;
assign abus_sel[4 ] = abus_mux == 4'd4  ? 1'b1 : 1'b0;
assign abus_sel[5 ] = abus_mux == 4'd5  ? 1'b1 : 1'b0;
assign abus_sel[6 ] = abus_mux == 4'd6  ? 1'b1 : 1'b0;
assign abus_sel[7 ] = abus_mux == 4'd7  ? 1'b1 : 1'b0;
assign abus_sel[8 ] = abus_mux == 4'd8  ? 1'b1 : 1'b0;
assign abus_sel[9 ] = abus_mux == 4'd9  ? 1'b1 : 1'b0;
assign abus_sel[10] = abus_mux == 4'd10 ? 1'b1 : 1'b0;
assign abus_sel[11] = abus_mux == 4'd11 ? 1'b1 : 1'b0;
assign abus_sel[12] = abus_mux == 4'd12 ? 1'b1 : 1'b0;
assign abus_sel[13] = abus_mux == 4'd13 ? 1'b1 : 1'b0;
assign abus_sel[14] = abus_mux == 4'd14 ? 1'b1 : 1'b0;
assign abus_sel[15] = abus_mux == 4'd15 ? 1'b1 : 1'b0;

assign s0_axi_araddr  = abus_mux == 4'd0  ? master_axi_araddr : 32'b0;
assign s1_axi_araddr  = abus_mux == 4'd1  ? master_axi_araddr : 32'b0;
assign s2_axi_araddr  = abus_mux == 4'd2  ? master_axi_araddr : 32'b0;
assign s3_axi_araddr  = abus_mux == 4'd3  ? master_axi_araddr : 32'b0;
assign s4_axi_araddr  = abus_mux == 4'd4  ? master_axi_araddr : 32'b0;
assign s5_axi_araddr  = abus_mux == 4'd5  ? master_axi_araddr : 32'b0;
assign s6_axi_araddr  = abus_mux == 4'd6  ? master_axi_araddr : 32'b0;
assign s7_axi_araddr  = abus_mux == 4'd7  ? master_axi_araddr : 32'b0;
assign s8_axi_araddr  = abus_mux == 4'd8  ? master_axi_araddr : 32'b0;
assign s9_axi_araddr  = abus_mux == 4'd9  ? master_axi_araddr : 32'b0;
assign s10_axi_araddr = abus_mux == 4'd10 ? master_axi_araddr : 32'b0;
assign s11_axi_araddr = abus_mux == 4'd11 ? master_axi_araddr : 32'b0;
assign s12_axi_araddr = abus_mux == 4'd12 ? master_axi_araddr : 32'b0;
assign s13_axi_araddr = abus_mux == 4'd13 ? master_axi_araddr : 32'b0;
assign s14_axi_araddr = abus_mux == 4'd14 ? master_axi_araddr : 32'b0;
assign s15_axi_araddr = abus_mux == 4'd15 ? master_axi_araddr : 32'b0;

assign s0_axi_arvalid  =  {1{abus_sel[0]}} & master_axi_arvalid ;
assign s1_axi_arvalid  =  {1{abus_sel[1]}} & master_axi_arvalid ;
assign s2_axi_arvalid  =  {1{abus_sel[2]}} & master_axi_arvalid ;
assign s3_axi_arvalid  =  {1{abus_sel[3]}} & master_axi_arvalid ;
assign s4_axi_arvalid  =  {1{abus_sel[4]}} & master_axi_arvalid ;
assign s5_axi_arvalid  =  {1{abus_sel[5]}} & master_axi_arvalid ;
assign s6_axi_arvalid  =  {1{abus_sel[6]}} & master_axi_arvalid ;
assign s7_axi_arvalid  =  {1{abus_sel[7]}} & master_axi_arvalid ;
assign s8_axi_arvalid  =  {1{abus_sel[8]}} & master_axi_arvalid ;
assign s9_axi_arvalid  =  {1{abus_sel[9]}} & master_axi_arvalid ;
assign s10_axi_arvalid = {1{abus_sel[10]}} & master_axi_arvalid ;
assign s11_axi_arvalid = {1{abus_sel[11]}} & master_axi_arvalid ;
assign s12_axi_arvalid = {1{abus_sel[12]}} & master_axi_arvalid ;
assign s13_axi_arvalid = {1{abus_sel[13]}} & master_axi_arvalid ;
assign s14_axi_arvalid = {1{abus_sel[14]}} & master_axi_arvalid ;
assign s15_axi_arvalid = {1{abus_sel[15]}} & master_axi_arvalid ;


assign master_axi_arready = abus_sel[0] & s0_axi_arready
    | abus_sel[1]  & s1_axi_arready
    | abus_sel[2]  & s2_axi_arready
    | abus_sel[3]  & s3_axi_arready
    | abus_sel[4]  & s4_axi_arready
    | abus_sel[5]  & s5_axi_arready
    | abus_sel[6]  & s6_axi_arready
    | abus_sel[7]  & s7_axi_arready
    | abus_sel[8]  & s8_axi_arready
    | abus_sel[9]  & s9_axi_arready
    | abus_sel[10] & s10_axi_arready
    | abus_sel[11] & s11_axi_arready
    | abus_sel[12] & s12_axi_arready
    | abus_sel[13] & s13_axi_arready
    | abus_sel[14] & s14_axi_arready
    | abus_sel[15] & s15_axi_arready;


// slave r <-> master r
always @(posedge clk) begin
    if(master_axi_arvalid & master_axi_arready) begin
        rbus_sel <= abus_sel;
        rbus_mux <= abus_mux;
    end
    else begin end
end

assign s0_axi_rready  = {1{rbus_sel[ 0]}} & master_axi_rready ;
assign s1_axi_rready  = {1{rbus_sel[ 1]}} & master_axi_rready ;
assign s2_axi_rready  = {1{rbus_sel[ 2]}} & master_axi_rready ;
assign s3_axi_rready  = {1{rbus_sel[ 3]}} & master_axi_rready ;
assign s4_axi_rready  = {1{rbus_sel[ 4]}} & master_axi_rready ;
assign s5_axi_rready  = {1{rbus_sel[ 5]}} & master_axi_rready ;
assign s6_axi_rready  = {1{rbus_sel[ 6]}} & master_axi_rready ;
assign s7_axi_rready  = {1{rbus_sel[ 7]}} & master_axi_rready ;
assign s8_axi_rready  = {1{rbus_sel[ 8]}} & master_axi_rready ;
assign s9_axi_rready  = {1{rbus_sel[ 9]}} & master_axi_rready ;
assign s10_axi_rready = {1{rbus_sel[10]}} & master_axi_rready ;
assign s11_axi_rready = {1{rbus_sel[11]}} & master_axi_rready ;
assign s12_axi_rready = {1{rbus_sel[12]}} & master_axi_rready ;
assign s13_axi_rready = {1{rbus_sel[13]}} & master_axi_rready ;
assign s14_axi_rready = {1{rbus_sel[14]}} & master_axi_rready ;
assign s15_axi_rready = {1{rbus_sel[15]}} & master_axi_rready ;

assign master_axi_rdata = {32{rbus_mux ==  4'd0}} & s0_axi_rdata
                          | {32{rbus_mux ==  4'd1}} & s1_axi_rdata
                          | {32{rbus_mux ==  4'd2}} & s2_axi_rdata
                          | {32{rbus_mux ==  4'd3}} & s3_axi_rdata
                          | {32{rbus_mux ==  4'd4}} & s4_axi_rdata
                          | {32{rbus_mux ==  4'd5}} & s5_axi_rdata
                          | {32{rbus_mux ==  4'd6}} & s6_axi_rdata
                          | {32{rbus_mux ==  4'd7}} & s7_axi_rdata
                          | {32{rbus_mux ==  4'd8}} & s8_axi_rdata
                          | {32{rbus_mux ==  4'd9}} & s9_axi_rdata
                          | {32{rbus_mux == 4'd10}} & s10_axi_rdata
                          | {32{rbus_mux == 4'd11}} & s11_axi_rdata
                          | {32{rbus_mux == 4'd12}} & s12_axi_rdata
                          | {32{rbus_mux == 4'd13}} & s13_axi_rdata
                          | {32{rbus_mux == 4'd14}} & s14_axi_rdata
                          | {32{rbus_mux == 4'd15}} & s15_axi_rdata;


assign master_axi_rvalid = rbus_sel[0] & s0_axi_rvalid
    | rbus_sel[ 1] & s1_axi_rvalid
    | rbus_sel[ 2] & s2_axi_rvalid
    | rbus_sel[ 3] & s3_axi_rvalid
    | rbus_sel[ 4] & s4_axi_rvalid
    | rbus_sel[ 5] & s5_axi_rvalid
    | rbus_sel[ 6] & s6_axi_rvalid
    | rbus_sel[ 7] & s7_axi_rvalid
    | rbus_sel[ 8] & s8_axi_rvalid
    | rbus_sel[ 9] & s9_axi_rvalid
    | rbus_sel[10] & s10_axi_rvalid
    | rbus_sel[11] & s11_axi_rvalid
    | rbus_sel[12] & s12_axi_rvalid
    | rbus_sel[13] & s13_axi_rvalid
    | rbus_sel[14] & s14_axi_rvalid
    | rbus_sel[15] & s15_axi_rvalid;


//多余端口处理
wire valid = 1'b1;

always @(*) begin
    m0_axi_bresp  = 2'b00;
    m0_axi_bvalid = valid;
    m0_axi_rresp  = 2'b00;
    m1_axi_bresp  = 2'b00;
    m1_axi_bvalid = valid;
    m1_axi_rresp  = 2'b00;
end


endmodule