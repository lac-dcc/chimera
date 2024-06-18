// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 写步骤：
/*  1. 生成写首地址；
    2. 生成写 valid 信号，等待发回 ready 信号；
    3. awvalid && awready 首地址有效；
    4. 送入写数据流；
    5. 最后一位数据拉高写 last 信号；
    6. 验证成功写入，slave 发送 bvalid 等待 master 回应 bready，同时有效时 slave 发送 bresp == 2'b00；
    7. 注意突发长度，选取合适的下一个写首地址。
*/
// 读步骤：
/*  1. 生成读首地址；
    2. arvalid && arready 首地址有效；
    3. 从机发出数据流，最后一位传入 master 读 last 信号；
*/
// AXI Master Interface

module axi_master#(
    parameter M_SLAVE_BASE_ADDR = 32'h40_000_000,
    parameter M_AXI_BURST_LEN = 6'd16,
    parameter M_AXI_ID_WIDTH = 6'd1,
    parameter M_AXI_ADDR_WIDTH = 6'd32,
    parameter M_AXI_DATA_WIDTH = 6'd32,
    parameter M_AXI_AWUSER_WIDTH = 6'd0,
    parameter M_AXI_ARUSER_WIDTH = 6'd0,
    parameter M_AXI_WUSER_WIDTH = 6'd0,
    parameter M_AXI_RUSER_WIDTH = 6'd0,
    parameter M_AXI_BUSER_WIDTH = 6'd0
)(
    input                                   m_axi_aclk,
    input                                   m_axi_aresetn,

    input       [M_AXI_DATA_WIDTH-1'b1:0]   data_in,
    input                                   write_start,
    input                                   read_start,

    // 写地址通道
    output      [M_AXI_ID_WIDTH-1'b1:0]     m_axi_awid,     // 写地址 ID
    output      [M_AXI_ADDR_WIDTH-1'b1:0]   m_axi_awaddr,   // 写地址
    output      [7:0]                       m_axi_awlen,    // 突发写长度
    output      [2:0]                       m_axi_awsize,   // 突发写长度参数配置
    output      [1:0]                       m_axi_awburst,  // 突发类型
    output                                  m_axi_awlock,   // 锁类型
    output      [3:0]                       m_axi_awcache,  // 缓存类型
    output      [2:0]                       m_axi_awprot,   // 保护类型
    output      [3:0]                       m_axi_awqos,    // 写 QOS 标志符
    output      [M_AXI_AWUSER_WIDTH-1'b1:0] m_axi_awuser,   
    output                                  m_axi_awvalid,  // 写地址有效
    input                                   m_axi_awready,  // 写地址准备
    // 写数据通道
    output      [M_AXI_DATA_WIDTH-1'b1:0]   m_axi_wdata,
    output      [M_AXI_DATA_WIDTH/8-1'b1:0] m_axi_wstrb,    // 写选通
    output                                  m_axi_wlast,
    output      [M_AXI_WUSER_WIDTH-1'b1:0]  m_axi_wuser,
    output                                  m_axi_wvalid,
    input                                   m_axi_wready,
    // 写响应通道
    input       [M_AXI_ID_WIDTH-1'b1:0]     m_axi_bid,      // 写响应 ID
    input       [1:0]                       m_axi_bresp,    // 写响应
    input       [M_AXI_BUSER_WIDTH-1'b1:0]  m_axi_buser,
    input                                   m_axi_bvalid,   // 写响应有效
    output                                  m_axi_bready,   // 写响应准备
    // 读地址通道
    output      [M_AXI_ID_WIDTH-1'b1:0]     m_axi_arid,
    output      [M_AXI_ADDR_WIDTH-1'b1:0]   m_axi_araddr,
    output      [7:0]                       m_axi_arlen,
    output      [2:0]                       m_axi_arsize,
    output      [1:0]                       m_axi_arburst,
    output                                  m_axi_arlock,
    output      [3:0]                       m_axi_arcache,
    output      [2:0]                       m_axi_arprot,
    output      [3:0]                       m_axi_arqos,
    output      [M_AXI_ARUSER_WIDTH-1'b1:0] m_axi_aruser,
    output                                  m_axi_arvalid,
    output                                  m_axi_arready,
    // 读数据通道
    input       [M_AXI_ID_WIDTH-1'b1:0]     m_axi_rid,
    input       [M_AXI_DATA_WIDTH-1'b1:0]   m_axi_rdata,
    input       [1:0]                       m_axi_rresp,
    input                                   m_axi_rlast,
    input       [M_AXI_RUSER_WIDTH-1'b1:0]  m_axi_ruser,
    input                                   m_axi_rvalid,
    output                                  m_axi_rready
);

// 计算输入数据的二进制位宽，定义突发传输的尺寸
function integer clogb2(input integer number);
begin
    for(clogb2 = 0; number > 0; clogb2 = clogb2 + 1)
        number = number >> 1;
end
endfunction

wire                            clk;
wire                            rst;

reg [M_AXI_ADDR_WIDTH-1'b1:0]   reg_m_axi_awaddr;
reg                             reg_m_axi_awvalid;
reg [M_AXI_DATA_WIDTH-1'b1:0]   reg_m_axi_wdata;
reg                             reg_m_axi_wlast;
reg                             reg_m_axi_wvalid;
reg [M_AXI_ADDR_WIDTH-1'b1:0]   reg_m_axi_araddr;
reg                             reg_m_axi_arvalid;
reg                             reg_m_axi_rready;
reg [M_AXI_DATA_WIDTH-1'b1:0]   reg_m_axi_rdata;
reg                             reg_m_axi_rlast;

//reg                             write_start;
reg [7:0]                       burst_data_cnt;
//reg                             read_start;

assign m_axi_awid = 'b0;
assign m_axi_awaddr = reg_m_axi_awaddr + M_SLAVE_BASE_ADDR;
assign m_axi_awvalid = reg_m_axi_awvalid;
assign m_axi_awlen = M_AXI_BURST_LEN - 1'b1;
assign m_axi_awsize = clogb2((M_AXI_DATA_WIDTH/8) - 1'b1);  // 000:1, 001:2, 010:4, 011:8, 100: 16
assign m_axi_awburst = 2'b01;                               // 00:固定模式, 01:自增模式
assign m_axi_awlock = 1'b0;
assign m_axi_awcache = 4'b0010;                             // 0010:无缓存无 buffer
assign m_axi_awprot = 3'b0;                                 // 000:无特权访问
assign m_axi_awqos = 4'b0;
assign m_axi_awuser = 'b0;

assign m_axi_wdata = reg_m_axi_wdata;
assign m_axi_wstrb = {(M_AXI_DATA_WIDTH/8){1'b1}};
assign m_axi_wlast = reg_m_axi_wlast;
assign m_axi_wuser = 'b0;
assign m_axi_wvalid = reg_m_axi_wvalid;

assign m_axi_bready = 1'b1;

assign m_axi_arid = 'b0;
assign m_axi_araddr = reg_m_axi_araddr + M_SLAVE_BASE_ADDR;
assign m_axi_arlen = M_AXI_BURST_LEN - 1'b1;
assign m_axi_arsize = clogb2((M_AXI_DATA_WIDTH/8) - 1'b1);
assign m_axi_arburst = 2'b01;
assign m_axi_arlock = 1'b0;
assign m_axi_arcache = 4'b0010;
assign m_axi_arprot = 3'b0;
assign m_axi_arqos = 4'b0;
assign m_axi_aruser = 'b0;
assign m_axi_arvalid = reg_m_axi_arvalid;

assign m_axi_rready = reg_m_axi_rready;

assign clk = m_axi_aclk;
assign rst = m_axi_aresetn;


// 写地址有效信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_awvalid <= 'b0;
    end
    else if(write_start) begin              // 在此标志信号后开始写操作
        reg_m_axi_awvalid <= 1'b1;
    end
    else if((m_axi_awvalid == 1'b1) && (m_axi_awready == 1'b1)) begin
        reg_m_axi_awvalid <= 1'b0;
    end
    else begin
        reg_m_axi_awvalid <= reg_m_axi_awvalid;
    end
end


// 写首地址，此处控制为 1
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_awaddr <= 'b0;
    end
    else if(write_start) begin
        reg_m_axi_awaddr <= 'd1;
    end
    else begin
        reg_m_axi_awaddr <= reg_m_axi_awaddr;
    end
end


// 写有效信号，只要能保证 awvalid 和 awready 同时为高时该信号已经为高即可
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_wvalid <= 'b0;
    end
    else if(write_start) begin      // 选择与 awvalid 同时拉高
        reg_m_axi_wvalid <= 1'b1;
    end
    else if(m_axi_wlast) begin
        reg_m_axi_wvalid <= 1'b0;
    end
    else begin
        reg_m_axi_wvalid <= reg_m_axi_wvalid;
    end
end


// 写数据信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_wdata <= 'b0;
    end
    else if((m_axi_awvalid == 1'b1) && (m_axi_awready == 1'b1)) begin
        reg_m_axi_wdata <= data_in;
    end
    else if(m_axi_wlast) begin
        reg_m_axi_wdata <= 'b0;
    end
    else begin
        reg_m_axi_wdata <= reg_m_axi_wdata;
    end
end


// 写数据计数
// 只适用于突发长度大于等于 4 的情况
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        burst_data_cnt <= 8'b0;
    end
    else if((m_axi_wready == 1'b1) && (m_axi_wvalid == 1'b1)) begin
        burst_data_cnt <= burst_data_cnt + 1'b1;
    end
    else if(burst_data_cnt == M_AXI_BURST_LEN - 1'b1) begin
        burst_data_cnt <= 8'b0;
    end
end

// 写最后一个数据标志
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_wlast <= 'b0;
    end
    else if(burst_data_cnt == M_AXI_BURST_LEN - 2'd2) begin
        reg_m_axi_wlast <= 1'b1;
    end
    else begin
        reg_m_axi_wlast <= 1'b0;
    end
end


// 写响应准备


// 读地址有效信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_arvalid <= 'b0;
    end
    else if(read_start) begin
        reg_m_axi_arvalid <= 1'b1;
    end
    else if((m_axi_arvalid == 1'b1) && (m_axi_arready == 1'b1)) begin
        reg_m_axi_arvalid <= 1'b0;
    end
    else begin
        reg_m_axi_arvalid <= reg_m_axi_arvalid;
    end
end


// 读地址信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_araddr <= 'b0;
    end
    else if(read_start) begin
        reg_m_axi_araddr <= 'b1;
    end
    else begin
        reg_m_axi_araddr <= reg_m_axi_araddr;
    end
end


// 读数据准备
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_rready <= 'b0;
    end
    else if((m_axi_arvalid == 1'b1) && (m_axi_arready == 1'b1)) begin
        reg_m_axi_rready <= 1'b1;
    end
    else if(m_axi_rlast) begin
        reg_m_axi_rready <= 1'b0;
    end
end


// 读数据信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_m_axi_rdata <= 'b0;
    end
    else if((m_axi_rvalid == 1'b1) && (m_axi_rready == 1'b1)) begin
        reg_m_axi_rdata <= m_axi_rdata;
    end
    else begin
        reg_m_axi_rdata <= reg_m_axi_rdata;
    end
end



endmodule