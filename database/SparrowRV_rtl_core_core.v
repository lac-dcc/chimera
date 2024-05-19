// This program was cloned from: https://github.com/xiaowuzxc/SparrowRV
// License: MIT License

`include "defines.v"
module core (
    input  wire clk,
    input  wire rst_n,


    input  wire halt_req_i,//jtag停住cpu

    output wire hx_valid,//处理器运行指示

    output wire soft_rst,//mcctr[3]软件复位

    //外部中断
    input  wire core_ex_trap_valid,//外部中断请求
    output wire core_ex_trap_ready,//外部中断被响应

    //AXI4-Lite总线接口 Master core
    //AW写地址
    output wire [`MemAddrBus]   core_axi_awaddr ,//写地址
    output wire [2:0]           core_axi_awprot ,//写保护类型，恒为0
    output wire                 core_axi_awvalid,//写地址有效
    input  wire                 core_axi_awready,//写地址准备好
    //W写数据
    output wire [`MemBus]       core_axi_wdata  ,//写数据
    output wire [3:0]           core_axi_wstrb  ,//写数据选通
    output wire                 core_axi_wvalid ,//写数据有效
    input  wire                 core_axi_wready ,//写数据准备好
    //B写响应
    input  wire [1:0]           core_axi_bresp  ,//写响应
    input  wire                 core_axi_bvalid ,//写响应有效
    output wire                 core_axi_bready ,//写响应准备好
    //AR读地址
    output wire [`MemAddrBus]   core_axi_araddr ,//读地址
    output wire [2:0]           core_axi_arprot ,//读保护类型，恒为0
    output wire                 core_axi_arvalid,//读地址有效
    input  wire                 core_axi_arready,//读地址准备好
    //R读数据
    input  wire [`MemBus]       core_axi_rdata  ,//读数据
    input  wire [1:0]           core_axi_rresp  ,//读响应
    input  wire                 core_axi_rvalid ,//读数据有效
    output wire                 core_axi_rready ,//读数据准备好

    //AXI4-Lite Slave iram
    input  wire [`MemAddrBus]   iram_axi_awaddr ,//写地址
    input  wire [2:0]           iram_axi_awprot ,//写保护类型，恒为0
    input  wire                 iram_axi_awvalid,//写地址有效
    output wire                 iram_axi_awready,//写地址准备好
    input  wire [`MemBus]       iram_axi_wdata  ,//写数据
    input  wire [3:0]           iram_axi_wstrb  ,//写数据选通
    input  wire                 iram_axi_wvalid ,//写数据有效
    output wire                 iram_axi_wready ,//写数据准备好
    output wire [1:0]           iram_axi_bresp  ,//写响应
    output wire                 iram_axi_bvalid ,//写响应有效
    input  wire                 iram_axi_bready ,//写响应准备好
    input  wire [`MemAddrBus]   iram_axi_araddr ,//读地址
    input  wire [2:0]           iram_axi_arprot ,//读保护类型，恒为0
    input  wire                 iram_axi_arvalid,//读地址有效
    output wire                 iram_axi_arready,//读地址准备好
    output wire [`MemBus]       iram_axi_rdata  ,//读数据
    output wire [1:0]           iram_axi_rresp  ,//读响应
    output wire                 iram_axi_rvalid ,//读数据有效
    input  wire                 iram_axi_rready //读数据准备好
);

//-------------定义内部线网--------------
wire [`MemBus] mem_wdata;//存储空间写数据
wire [`MemBus] mem_rdata;//存储空间读数据
wire [`MemAddrBus] mem_addr;//存储空间访问地址
wire [3:0] mem_wem;//存储空间写掩码

wire [`RegAddrBus] reg_raddr1;//rs1地址
wire [`RegAddrBus] reg_raddr2;//rs2地址
wire [`RegBus] reg_rdata1;//rs1数据
wire [`RegBus] reg_rdata2;//rs2数据
wire [`RegAddrBus] reg_waddr;//rd写地址
wire [`RegBus] reg_wdata;//rd写数据
wire [`InstAddrBus] idex_pc_n;//idex下一条指令PC
wire [`InstAddrBus] trap_pc_n;//中断仲裁后的下一条指令PC
wire [`InstAddrBus] pc;//当前指令的PC
wire [`InstBus] inst;//当前指令
wire [`CsrAddrBus] idex_csr_addr;//idex访问csr地址
wire [`RegBus] idex_csr_wdata;//idex写csr数据
wire [`RegBus] idex_csr_rdata;//idex读csr数据
wire [`CsrAddrBus] trap_csr_addr;//trap访问csr地址
wire [`RegBus] trap_csr_wdata;//trap写csr数据
wire [`RegBus] trap_csr_rdata;//trap读csr数据
wire [`RegBus] div_dividend;//被除数
wire [`RegBus] div_divisor;//除数
wire [2:0] div_op;//除法指令
wire [`RegBus] div_result;//除法结果
wire [`InstAddrBus] mepc;//CSR mepc寄存器
//-------------定义内部线网--------------
sctr inst_sctr
(
    .clk              (clk),
    .rst_n            (rst_n),
    .reg_we_i         (reg_we_idex),
    .csr_we_i         (csr_we_idex),
    .mem_wdata_i      (mem_wdata),
    .mem_addr_i       (mem_addr),
    .mem_we_i         (mem_we),//存储空间写使能
    .mem_wem_i        (mem_wem),
    .mem_en_i         (mem_en),
    .mem_rdata_o      (mem_rdata),
    .reg_we_o         (reg_we_sctr),
    .csr_we_o         (csr_we_sctr),
    .iram_rd_o        (iram_rd),
    .div_start_i      (div_start),
    .div_ready_i      (div_ready),
    .mult_inst_i      (mult_inst),
    .iram_rstn_i      (iram_rstn),
    .halt_req_i       (halt_req_i),
    .trap_in_i        (trap_in),
    .trap_jump_i      (trap_jump),
    .idex_mret_i      (idex_mret),
    .trap_stat_o      (),//中断状态指示
    .sctr_axi_awaddr  (core_axi_awaddr ),
    .sctr_axi_awprot  (core_axi_awprot ),
    .sctr_axi_awvalid (core_axi_awvalid),
    .sctr_axi_awready (core_axi_awready),
    .sctr_axi_wdata   (core_axi_wdata  ),
    .sctr_axi_wstrb   (core_axi_wstrb  ),
    .sctr_axi_wvalid  (core_axi_wvalid ),
    .sctr_axi_wready  (core_axi_wready ),
    .sctr_axi_bresp   (core_axi_bresp  ),
    .sctr_axi_bvalid  (core_axi_bvalid ),
    .sctr_axi_bready  (core_axi_bready ),
    .sctr_axi_araddr  (core_axi_araddr ),
    .sctr_axi_arprot  (core_axi_arprot ),
    .sctr_axi_arvalid (core_axi_arvalid),
    .sctr_axi_arready (core_axi_arready),
    .sctr_axi_rdata   (core_axi_rdata  ),
    .sctr_axi_rresp   (core_axi_rresp  ),
    .sctr_axi_rvalid  (core_axi_rvalid ),
    .sctr_axi_rready  (core_axi_rready ),
    .hx_valid         (hx_valid)
);

regs inst_regs
(
    .clk         (clk),
    .rst_n       (rst_n),
    .raddr1_i    (reg_raddr1),
    .raddr2_i    (reg_raddr2),
    .rdata1_o    (reg_rdata1),
    .rdata2_o    (reg_rdata2),
    .we_i        (reg_we_sctr),
    .waddr_i     (reg_waddr),
    .wdata_i     (reg_wdata),
    .bus_raddr_i (5'b0),
    .bus_data_o  ()
);

iram inst_iram
(
    .clk              (clk),
    .rst_n            (rst_n),
    .pc_n_i           (trap_pc_n),
    .iram_rd_i        (iram_rd),
    .pc_o             (pc),
    .inst_o           (inst),
    .iram_rstn_o      (iram_rstn),
    .iram_axi_awaddr  (iram_axi_awaddr ),
    .iram_axi_awprot  (iram_axi_awprot ),
    .iram_axi_awvalid (iram_axi_awvalid),
    .iram_axi_awready (iram_axi_awready),
    .iram_axi_wdata   (iram_axi_wdata  ),
    .iram_axi_wstrb   (iram_axi_wstrb  ),
    .iram_axi_wvalid  (iram_axi_wvalid ),
    .iram_axi_wready  (iram_axi_wready ),
    .iram_axi_bresp   (iram_axi_bresp  ),
    .iram_axi_bvalid  (iram_axi_bvalid ),
    .iram_axi_bready  (iram_axi_bready ),
    .iram_axi_araddr  (iram_axi_araddr ),
    .iram_axi_arprot  (iram_axi_arprot ),
    .iram_axi_arvalid (iram_axi_arvalid),
    .iram_axi_arready (iram_axi_arready),
    .iram_axi_rdata   (iram_axi_rdata  ),
    .iram_axi_rresp   (iram_axi_rresp  ),
    .iram_axi_rvalid  (iram_axi_rvalid ),
    .iram_axi_rready  (iram_axi_rready )
);


idex inst_idex
(
    .clk          (clk),
    .inst_i       (inst),
    .pc_i         (pc),
    .reg_rdata1_i (reg_rdata1),
    .reg_rdata2_i (reg_rdata2),
    .csr_rdata_i  (idex_csr_rdata),
    .mem_rdata_i  (mem_rdata),
    .dividend_o   (div_dividend),
    .divisor_o    (div_divisor),
    .div_op_o     (div_op),
    .div_start_o  (div_start),
    .div_result_i (div_result),
    .mult_inst_o  (mult_inst),
    .reg_raddr1_o (reg_raddr1),
    .reg_raddr2_o (reg_raddr2),
    .reg_wdata_o  (reg_wdata),
    .reg_we_o     (reg_we_idex),
    .reg_waddr_o  (reg_waddr),
    .csr_wdata_o  (idex_csr_wdata),
    .csr_we_o     (csr_we_idex),
    .csr_addr_o   (idex_csr_addr),
    .mem_wdata_o  (mem_wdata),
    .mem_addr_o   (mem_addr),
    .mem_we_o     (mem_we),
    .mem_wem_o    (mem_wem),
    .mem_en_o     (mem_en),
    .pc_n_o       (idex_pc_n),
    .ecall_o      (ecall_trap),
    .ebreak_o     (ebreak_trap),
    .wfi_o        (wfi_trap),
    .inst_err_o   (inst_err_trap),
    .idex_mret_o  (idex_mret),
    .mepc         (mepc)
);


div inst_div
(
    .clk         (clk),
    .rst_n       (rst_n),
    .dividend_i  (div_dividend),
    .divisor_i   (div_divisor),
    .start_i     (div_start & (~trap_in)),//发生中断，立即停止除法
    .op_i        (div_op),
    .result_o    (div_result),
    .res_valid_o (div_ready),
    .res_ready_i (hx_valid)
);

csr inst_csr
(
    .clk              (clk),
    .rst_n            (rst_n),
    .idex_csr_we_i    (csr_we_sctr),
    .idex_csr_addr_i  (idex_csr_addr),
    .idex_csr_wdata_i (idex_csr_wdata),
    .idex_csr_rdata_o (idex_csr_rdata),
    .trap_csr_we_i    (trap_csr_we),
    .trap_csr_addr_i  (trap_csr_addr),
    .trap_csr_wdata_i (trap_csr_wdata),
    .trap_csr_rdata_o (trap_csr_rdata),
    .mepc             (mepc),
    .soft_rst         (soft_rst),
    .ex_trap_valid_i  (core_ex_trap_valid),
    .ex_trap_valid_o  (ex_trap_valid),
    .tcmp_trap_valid_o(tcmp_trap_valid),
    .soft_trap_valid_o(soft_trap_valid),
    .mstatus_MIE3     (mstatus_MIE3),

    .hx_valid         (hx_valid)
);

trap inst_trap
(
    .clk                (clk),
    .rst_n              (rst_n),
    .csr_rdata_i        (trap_csr_rdata),
    .csr_wdata_o        (trap_csr_wdata),
    .csr_we_o           (trap_csr_we),
    .csr_addr_o         (trap_csr_addr),
    .ex_trap_ready_o    (core_ex_trap_ready),
    .ecall_i            (ecall_trap),
    .ebreak_i           (ebreak_trap),
    .wfi_i              (wfi_trap),
    .inst_err_i         (inst_err_trap),
    .mem_err_i          (1'b0),//访存错误
    .ex_trap_valid_i    (ex_trap_valid),
    .tcmp_trap_valid_i  (tcmp_trap_valid),
    .soft_trap_valid_i  (soft_trap_valid),
    .mstatus_MIE3       (mstatus_MIE3),
    .pc_i               (pc),
    .inst_i             (inst),
    .mem_addr_i         (mem_addr),
    .pc_n_i             (idex_pc_n),
    .pc_n_o             (trap_pc_n),
    .trap_jump_o        (trap_jump),
    .trap_in_o          (trap_in)
);

endmodule