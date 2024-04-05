`include "defines.v"
//总线、系统控制、阻塞
module sctr (
    input clk,
    input rst_n,

    //信号输入
    input wire  reg_we_i,                    //是否要写通用寄存器
    input wire  csr_we_i,                    //写CSR寄存器请求

    input wire [`MemBus] mem_wdata_i,       //写内存数据
    input wire [`MemAddrBus] mem_addr_i,    //访问内存地址，复用读
    input wire mem_we_i,                    //写内存使能
    input wire [3:0] mem_wem_i,             //写内存掩码
    input wire mem_en_i,                    //访问内存使能，复用读
    output reg [`MemBus] mem_rdata_o,       //读内存数据

    //信号输出
    output reg reg_we_o,                    //是否要写通用寄存器
    output reg csr_we_o,                    //写CSR寄存器请求
    output reg iram_rd_o,      //iram指令存储器读使能

    //阻塞指示
    input wire div_start_i,//除法启动
    input wire div_ready_i,//除法结束
    input wire mult_inst_i,//乘法开始
    input wire iram_rstn_i,//iram模块阻塞
    input wire halt_req_i,//jtag停住cpu

    //中断相关
    input wire trap_in_i,//进中断指示
    input wire trap_jump_i,//中断跳转指示，进中断最后一步
    input wire idex_mret_i,//中断返回
    output reg trap_stat_o,//中断状态指示

    //AXI4-Lite总线接口
    //AW写地址
    output reg [`MemAddrBus]    sctr_axi_awaddr ,//写地址
    output reg [2:0]            sctr_axi_awprot ,//写保护类型，恒为0
    output reg                  sctr_axi_awvalid,//写地址有效
    input  wire                 sctr_axi_awready,//写地址准备好
    //W写数据
    output reg [`MemBus]        sctr_axi_wdata  ,//写数据
    output reg [3:0]            sctr_axi_wstrb  ,//写数据选通
    output reg                  sctr_axi_wvalid ,//写数据有效
    input wire                  sctr_axi_wready ,//写数据准备好
    //B写响应
    input wire [1:0]            sctr_axi_bresp  ,//写响应
    input wire                  sctr_axi_bvalid ,//写响应有效
    output reg                  sctr_axi_bready ,//写响应准备好
    //AR读地址
    output reg [`MemAddrBus]    sctr_axi_araddr ,//读地址
    output reg [2:0]            sctr_axi_arprot ,//读保护类型，恒为0
    output reg                  sctr_axi_arvalid,//读地址有效
    input  wire                 sctr_axi_arready,//读地址准备好
    //R读数据
    input wire [`MemBus]        sctr_axi_rdata  ,//读数据
    input wire [1:0]            sctr_axi_rresp  ,//读响应
    input wire                  sctr_axi_rvalid ,//读数据有效
    output reg                  sctr_axi_rready ,//读数据准备好



    //回写使能
    output reg hx_valid//回写使能信号


);

//--------------FSM------------------
//0:初始阶段
//1:结束阶段
reg sta_p;
reg sta_n;
always @(posedge clk or negedge rst_n) begin//状态切换
    if (~rst_n)
        sta_p <= 1'b0;
    else
        sta_p <= sta_n;
end

always @(*) begin//状态转移条件
    if (sta_p == 1'b0) begin
        if( ~trap_in_i & ~halt_req_i & (div_start_i | mult_inst_i | ((~mem_we_i) & sctr_axi_arvalid & sctr_axi_arready)))//没有中断且(开始除法，或乘法指令，或读总线)
            sta_n = 1'b1;
        else
            sta_n = 1'b0;
    end 
    else begin
        if( div_ready_i | mult_inst_i | trap_in_i | halt_req_i | (sctr_axi_rvalid & sctr_axi_rready & sctr_axi_rresp==2'b00))//除法结束，或乘法指令，或中断，或读返回成功
            sta_n = 1'b0;
        else
            sta_n = 1'b1;
    end
end

always @(*) begin//阻塞条件hx_valid控制
    if (sta_p == 1'b0) begin//初始状态
        if( div_start_i | mult_inst_i | iram_rstn_i | trap_in_i | halt_req_i | (mem_en_i & (~mem_we_i)) | (mem_en_i & mem_we_i & ~(sctr_axi_wready | sctr_axi_awready)))//开始除法，或乘法指令，或iram复位未结束，或中断，或halt，或总线等待
            hx_valid = 1'b0;
        else
            hx_valid = 1'b1;
    end
    else begin//结束状态
        if( ~trap_in_i & ~halt_req_i & (div_ready_i | mult_inst_i | (sctr_axi_rvalid & sctr_axi_rready & sctr_axi_rresp==2'b00 )))//没有中断且(除法结束，或乘法指令，或读返回成功)
            hx_valid = 1'b1;
        else
            hx_valid = 1'b0;
    end
end
//--------------FSM-End--------------

always @(*) begin//reg,csr,iram写控制
    if(hx_valid) begin
        reg_we_o = reg_we_i;
        csr_we_o = csr_we_i;
        iram_rd_o = 1'b1;
    end
    else begin
        reg_we_o = 1'b0;
        csr_we_o = 1'b0;
        if(trap_jump_i)
            iram_rd_o = 1'b1;//发生中断，可以寻址
        else
            iram_rd_o = 1'b0;//未中断，不许寻址
    end
end

always @(*) begin//总线控制
    sctr_axi_awprot  = 0;//写保护类型，恒为0
    sctr_axi_arprot  = 0;//读保护类型，恒为0
    sctr_axi_bready  = 1;//写响应准备好，恒为1
    sctr_axi_rready  = 1'b1;//读数据准备好
    sctr_axi_awaddr  = {mem_addr_i[31:2], 2'b00};//写地址，屏蔽低位，字节选通替代
    sctr_axi_araddr  = {mem_addr_i[31:2], 2'b00};//读地址，屏蔽低位，译码执行部分替代
    if(sta_p == 1'b0) begin
        mem_rdata_o      = 0;
        sctr_axi_awvalid = mem_en_i & ~trap_in_i & ~halt_req_i;//写地址有效
        sctr_axi_wdata   = mem_wdata_i;//写数据
        sctr_axi_wstrb   = mem_wem_i;//写数据选通
        sctr_axi_wvalid  = mem_en_i & mem_we_i & ~trap_in_i & ~halt_req_i;//写数据有效
        sctr_axi_arvalid = mem_en_i & ~mem_we_i & ~trap_in_i & ~halt_req_i;//读地址有效
    end
    else begin
        mem_rdata_o      = sctr_axi_rdata;//读数据
        sctr_axi_awvalid = 0;//写地址有效
        sctr_axi_wdata   = 0;//写数据
        sctr_axi_wstrb   = 0;//写数据选通
        sctr_axi_wvalid  = 0;//写数据有效
        sctr_axi_arvalid = 0;//读地址有效
    end
end

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        trap_stat_o <= 0;
    end 
    else begin
        if(~trap_stat_o)//未处于中断
            if(trap_jump_i)//若跳转到中断入口
                trap_stat_o <= 1;//切换到中断状态
            else begin end
        else//处于中断
            if(idex_mret_i & hx_valid)//遇到mret指令且写回使能
                trap_stat_o <= 0;//退出中断状态
            else begin end
    end
end

endmodule