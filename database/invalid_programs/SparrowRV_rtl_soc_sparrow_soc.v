`include "defines.v"
module sparrow_soc (
    input wire clk,    //时钟输入
    input wire hard_rst_n,  //来自外部引脚的复位信号

    output wire hx_valid,//处理器运行指示

    input  wire JTAG_TCK,
    input  wire JTAG_TMS,
    input  wire JTAG_TDI,
    output wire JTAG_TDO,

    inout wire [31:0] fpioa,//处理器IO接口

    output wire NorFlash_WP,//25Flash WP引脚拉高
    output wire NorFlash_Hold,//25Flash Hold引脚拉高

    input wire core_ex_trap_valid,//外部中断
    output wire core_ex_trap_ready
);

//*********************************
//           定义线网
//
wire [`MemAddrBus]  iram_axi_awaddr ;
wire [2:0]          iram_axi_awprot ;
wire                iram_axi_awvalid;
wire                iram_axi_awready;
wire [`MemBus]      iram_axi_wdata  ;
wire [3:0]          iram_axi_wstrb  ;
wire                iram_axi_wvalid ;
wire                iram_axi_wready ;
wire [1:0]          iram_axi_bresp  ;
wire                iram_axi_bvalid ;
wire                iram_axi_bready ;
wire [`MemAddrBus]  iram_axi_araddr ;
wire [2:0]          iram_axi_arprot ;
wire                iram_axi_arvalid;
wire                iram_axi_arready;
wire [`MemBus]      iram_axi_rdata  ;
wire [1:0]          iram_axi_rresp  ;
wire                iram_axi_rvalid ;
wire                iram_axi_rready ;

wire [`MemAddrBus]  core_axi_awaddr ;
wire [2:0]          core_axi_awprot ;
wire                core_axi_awvalid;
wire                core_axi_awready;
wire [`MemBus]      core_axi_wdata  ;
wire [3:0]          core_axi_wstrb  ;
wire                core_axi_wvalid ;
wire                core_axi_wready ;
wire [1:0]          core_axi_bresp  ;
wire                core_axi_bvalid ;
wire                core_axi_bready ;
wire [`MemAddrBus]  core_axi_araddr ;
wire [2:0]          core_axi_arprot ;
wire                core_axi_arvalid;
wire                core_axi_arready;
wire [`MemBus]      core_axi_rdata  ;
wire [1:0]          core_axi_rresp  ;
wire                core_axi_rvalid ;
wire                core_axi_rready ;

wire [`MemAddrBus]  jtag_axi_awaddr ;
wire [2:0]          jtag_axi_awprot ;
wire                jtag_axi_awvalid;
wire                jtag_axi_awready;
wire [`MemBus]      jtag_axi_wdata  ;
wire [3:0]          jtag_axi_wstrb  ;
wire                jtag_axi_wvalid ;
wire                jtag_axi_wready ;
wire [1:0]          jtag_axi_bresp  ;
wire                jtag_axi_bvalid ;
wire                jtag_axi_bready ;
wire [`MemAddrBus]  jtag_axi_araddr ;
wire [2:0]          jtag_axi_arprot ;
wire                jtag_axi_arvalid;
wire                jtag_axi_arready;
wire [`MemBus]      jtag_axi_rdata  ;
wire [1:0]          jtag_axi_rresp  ;
wire                jtag_axi_rvalid ;
wire                jtag_axi_rready ;

wire [`MemAddrBus]  sram_axi_awaddr ;
wire                sram_axi_awvalid;
wire                sram_axi_awready;
wire [`MemBus]      sram_axi_wdata  ;
wire [3:0]          sram_axi_wstrb  ;
wire                sram_axi_wvalid ;
wire                sram_axi_wready ;
wire [`MemAddrBus]  sram_axi_araddr ;
wire                sram_axi_arvalid;
wire                sram_axi_arready;
wire [`MemBus]      sram_axi_rdata  ;
wire                sram_axi_rvalid ;
wire                sram_axi_rready ;

wire [`MemAddrBus]  sysio_axi_awaddr ;
wire                sysio_axi_awvalid;
wire                sysio_axi_awready;
wire [`MemBus]      sysio_axi_wdata  ;
wire [3:0]          sysio_axi_wstrb  ;
wire                sysio_axi_wvalid ;
wire                sysio_axi_wready ;
wire [`MemAddrBus]  sysio_axi_araddr ;
wire                sysio_axi_arvalid;
wire                sysio_axi_arready;
wire [`MemBus]      sysio_axi_rdata  ;
wire                sysio_axi_rvalid ;
wire                sysio_axi_rready ;
//
//           定义线网
//*********************************

//小麻雀内核
core inst_core
(
    .clk              (clk),
    .rst_n            (rst_n),
    .halt_req_i       (halt_req),
    .hx_valid         (hx_valid),
    .soft_rst         (soft_rst_en),
    .core_ex_trap_valid  (core_ex_trap_valid),
    .core_ex_trap_ready  (core_ex_trap_ready),
//m1 内核
    .core_axi_awaddr  (core_axi_awaddr ),
    .core_axi_awprot  (core_axi_awprot ),
    .core_axi_awvalid (core_axi_awvalid),
    .core_axi_awready (core_axi_awready),
    .core_axi_wdata   (core_axi_wdata  ),
    .core_axi_wstrb   (core_axi_wstrb  ),
    .core_axi_wvalid  (core_axi_wvalid ),
    .core_axi_wready  (core_axi_wready ),
    .core_axi_bresp   (core_axi_bresp  ),
    .core_axi_bvalid  (core_axi_bvalid ),
    .core_axi_bready  (core_axi_bready ),
    .core_axi_araddr  (core_axi_araddr ),
    .core_axi_arprot  (core_axi_arprot ),
    .core_axi_arvalid (core_axi_arvalid),
    .core_axi_arready (core_axi_arready),
    .core_axi_rdata   (core_axi_rdata  ),
    .core_axi_rresp   (core_axi_rresp  ),
    .core_axi_rvalid  (core_axi_rvalid ),
    .core_axi_rready  (core_axi_rready ),
//s0 iram指令存储器
    .iram_axi_awaddr  (iram_axi_awaddr ),
    .iram_axi_awprot  (3'h0),
    .iram_axi_awvalid (iram_axi_awvalid),
    .iram_axi_awready (iram_axi_awready),
    .iram_axi_wdata   (iram_axi_wdata  ),
    .iram_axi_wstrb   (iram_axi_wstrb  ),
    .iram_axi_wvalid  (iram_axi_wvalid ),
    .iram_axi_wready  (iram_axi_wready ),
    .iram_axi_bresp   (),
    .iram_axi_bvalid  (),
    .iram_axi_bready  (1'b0),
    .iram_axi_araddr  (iram_axi_araddr ),
    .iram_axi_arprot  (3'h0),
    .iram_axi_arvalid (iram_axi_arvalid),
    .iram_axi_arready (iram_axi_arready),
    .iram_axi_rdata   (iram_axi_rdata  ),
    .iram_axi_rresp   (),
    .iram_axi_rvalid  (iram_axi_rvalid ),
    .iram_axi_rready  (iram_axi_rready )
);

//JTAG模块
jtag_top inst_jtag_top
(
    .clk              (clk),
    .jtag_rst_n       (rst_n),
    .jtag_pin_TCK     (JTAG_TCK),
    .jtag_pin_TMS     (JTAG_TMS),
    .jtag_pin_TDI     (JTAG_TDI),
    .jtag_pin_TDO     (JTAG_TDO),
    .reg_we_o         (),
    .reg_addr_o       (),
    .reg_wdata_o      (),
    .reg_rdata_i      (32'b0),
    //m0 jtag
    .jtag_axi_awaddr  (jtag_axi_awaddr ),
    .jtag_axi_awprot  (jtag_axi_awprot ),
    .jtag_axi_awvalid (jtag_axi_awvalid),
    .jtag_axi_awready (jtag_axi_awready),
    .jtag_axi_wdata   (jtag_axi_wdata  ),
    .jtag_axi_wstrb   (jtag_axi_wstrb  ),
    .jtag_axi_wvalid  (jtag_axi_wvalid ),
    .jtag_axi_wready  (jtag_axi_wready ),
    .jtag_axi_bresp   (jtag_axi_bresp  ),
    .jtag_axi_bvalid  (jtag_axi_bvalid ),
    .jtag_axi_bready  (jtag_axi_bready ),
    .jtag_axi_araddr  (jtag_axi_araddr ),
    .jtag_axi_arprot  (jtag_axi_arprot ),
    .jtag_axi_arvalid (jtag_axi_arvalid),
    .jtag_axi_arready (jtag_axi_arready),
    .jtag_axi_rdata   (jtag_axi_rdata  ),
    .jtag_axi_rresp   (jtag_axi_rresp  ),
    .jtag_axi_rvalid  (jtag_axi_rvalid ),
    .jtag_axi_rready  (jtag_axi_rready ),
    .halt_req_o       (halt_req),
    .reset_req_o      (jtag_rst_en)
);

//s1 sram外设
sram inst_sram
(
    .clk              (clk),
    .rst_n            (rst_n),
    .sram_axi_awaddr  (sram_axi_awaddr ),
    .sram_axi_awvalid (sram_axi_awvalid),
    .sram_axi_awready (sram_axi_awready),
    .sram_axi_wdata   (sram_axi_wdata  ),
    .sram_axi_wstrb   (sram_axi_wstrb  ),
    .sram_axi_wvalid  (sram_axi_wvalid ),
    .sram_axi_wready  (sram_axi_wready ),
    .sram_axi_araddr  (sram_axi_araddr ),
    .sram_axi_arvalid (sram_axi_arvalid),
    .sram_axi_arready (sram_axi_arready),
    .sram_axi_rdata   (sram_axi_rdata  ),
    .sram_axi_rvalid  (sram_axi_rvalid ),
    .sram_axi_rready  (sram_axi_rready )
);
//s2 sysio系统输入输出接口
sysio inst_sysio
(
    .clk               (clk),
    .rst_n             (rst_n),

    .fpioa             (fpioa),

    .sysio_axi_awaddr  (sysio_axi_awaddr ),
    .sysio_axi_awvalid (sysio_axi_awvalid),
    .sysio_axi_awready (sysio_axi_awready),
    .sysio_axi_wdata   (sysio_axi_wdata  ),
    .sysio_axi_wstrb   (sysio_axi_wstrb  ),
    .sysio_axi_wvalid  (sysio_axi_wvalid ),
    .sysio_axi_wready  (sysio_axi_wready ),
    .sysio_axi_araddr  (sysio_axi_araddr ),
    .sysio_axi_arvalid (sysio_axi_arvalid),
    .sysio_axi_arready (sysio_axi_arready),
    .sysio_axi_rdata   (sysio_axi_rdata  ),
    .sysio_axi_rvalid  (sysio_axi_rvalid ),
    .sysio_axi_rready  (sysio_axi_rready )
);


axi4lite_2mt16s inst_axi4lite_2mt16s
(
    .clk             (clk),
    .rst_n           (rst_n),

    .m0_axi_awaddr   (jtag_axi_awaddr ),
    .m0_axi_awprot   (jtag_axi_awprot ),
    .m0_axi_awvalid  (jtag_axi_awvalid),
    .m0_axi_awready  (jtag_axi_awready),
    .m0_axi_wdata    (jtag_axi_wdata  ),
    .m0_axi_wstrb    (jtag_axi_wstrb  ),
    .m0_axi_wvalid   (jtag_axi_wvalid ),
    .m0_axi_wready   (jtag_axi_wready ),
    .m0_axi_bresp    (jtag_axi_bresp  ),
    .m0_axi_bvalid   (jtag_axi_bvalid ),
    .m0_axi_bready   (jtag_axi_bready ),
    .m0_axi_araddr   (jtag_axi_araddr ),
    .m0_axi_arprot   (jtag_axi_arprot ),
    .m0_axi_arvalid  (jtag_axi_arvalid),
    .m0_axi_arready  (jtag_axi_arready),
    .m0_axi_rdata    (jtag_axi_rdata  ),
    .m0_axi_rresp    (jtag_axi_rresp  ),
    .m0_axi_rvalid   (jtag_axi_rvalid ),
    .m0_axi_rready   (jtag_axi_rready ),

    .m1_axi_awaddr   (core_axi_awaddr ),
    .m1_axi_awprot   (core_axi_awprot ),
    .m1_axi_awvalid  (core_axi_awvalid),
    .m1_axi_awready  (core_axi_awready),
    .m1_axi_wdata    (core_axi_wdata  ),
    .m1_axi_wstrb    (core_axi_wstrb  ),
    .m1_axi_wvalid   (core_axi_wvalid ),
    .m1_axi_wready   (core_axi_wready ),
    .m1_axi_bresp    (core_axi_bresp  ),
    .m1_axi_bvalid   (core_axi_bvalid ),
    .m1_axi_bready   (core_axi_bready ),
    .m1_axi_araddr   (core_axi_araddr ),
    .m1_axi_arprot   (core_axi_arprot ),
    .m1_axi_arvalid  (core_axi_arvalid),
    .m1_axi_arready  (core_axi_arready),
    .m1_axi_rdata    (core_axi_rdata  ),
    .m1_axi_rresp    (core_axi_rresp  ),
    .m1_axi_rvalid   (core_axi_rvalid ),
    .m1_axi_rready   (core_axi_rready ),

    .s0_axi_awaddr   (iram_axi_awaddr ),
    .s0_axi_awvalid  (iram_axi_awvalid),
    .s0_axi_awready  (iram_axi_awready),
    .s0_axi_wdata    (iram_axi_wdata  ),
    .s0_axi_wstrb    (iram_axi_wstrb  ),
    .s0_axi_wvalid   (iram_axi_wvalid ),
    .s0_axi_wready   (iram_axi_wready ),
    .s0_axi_araddr   (iram_axi_araddr ),
    .s0_axi_arvalid  (iram_axi_arvalid),
    .s0_axi_arready  (iram_axi_arready),
    .s0_axi_rdata    (iram_axi_rdata  ),
    .s0_axi_rvalid   (iram_axi_rvalid ),
    .s0_axi_rready   (iram_axi_rready ),

    .s1_axi_awaddr   (sram_axi_awaddr ),
    .s1_axi_awvalid  (sram_axi_awvalid),
    .s1_axi_awready  (sram_axi_awready),
    .s1_axi_wdata    (sram_axi_wdata  ),
    .s1_axi_wstrb    (sram_axi_wstrb  ),
    .s1_axi_wvalid   (sram_axi_wvalid ),
    .s1_axi_wready   (sram_axi_wready ),
    .s1_axi_araddr   (sram_axi_araddr ),
    .s1_axi_arvalid  (sram_axi_arvalid),
    .s1_axi_arready  (sram_axi_arready),
    .s1_axi_rdata    (sram_axi_rdata  ),
    .s1_axi_rvalid   (sram_axi_rvalid ),
    .s1_axi_rready   (sram_axi_rready ),
    
    .s2_axi_awaddr   (sysio_axi_awaddr ),
    .s2_axi_awvalid  (sysio_axi_awvalid),
    .s2_axi_awready  (sysio_axi_awready),
    .s2_axi_wdata    (sysio_axi_wdata  ),
    .s2_axi_wstrb    (sysio_axi_wstrb  ),
    .s2_axi_wvalid   (sysio_axi_wvalid ),
    .s2_axi_wready   (sysio_axi_wready ),
    .s2_axi_araddr   (sysio_axi_araddr ),
    .s2_axi_arvalid  (sysio_axi_arvalid),
    .s2_axi_arready  (sysio_axi_arready),
    .s2_axi_rdata    (sysio_axi_rdata  ),
    .s2_axi_rvalid   (sysio_axi_rvalid ),
    .s2_axi_rready   (sysio_axi_rready ),

    .s3_axi_awaddr   (),
    .s3_axi_awvalid  (),
    .s3_axi_awready  (1'b0),
    .s3_axi_wdata    (),
    .s3_axi_wstrb    (),
    .s3_axi_wvalid   (),
    .s3_axi_wready   (1'b0),
    .s3_axi_araddr   (),
    .s3_axi_arvalid  (),
    .s3_axi_arready  (1'b0),
    .s3_axi_rdata    (32'b0),
    .s3_axi_rvalid   (1'b0),
    .s3_axi_rready   (),

    .s4_axi_awaddr   (),
    .s4_axi_awvalid  (),
    .s4_axi_awready  (1'b0),
    .s4_axi_wdata    (),
    .s4_axi_wstrb    (),
    .s4_axi_wvalid   (),
    .s4_axi_wready   (1'b0),
    .s4_axi_araddr   (),
    .s4_axi_arvalid  (),
    .s4_axi_arready  (1'b0),
    .s4_axi_rdata    (32'b0),
    .s4_axi_rvalid   (1'b0),
    .s4_axi_rready   (),

    .s5_axi_awaddr   (),
    .s5_axi_awvalid  (),
    .s5_axi_awready  (1'b0),
    .s5_axi_wdata    (),
    .s5_axi_wstrb    (),
    .s5_axi_wvalid   (),
    .s5_axi_wready   (1'b0),
    .s5_axi_araddr   (),
    .s5_axi_arvalid  (),
    .s5_axi_arready  (1'b0),
    .s5_axi_rdata    (32'b0),
    .s5_axi_rvalid   (1'b0),
    .s5_axi_rready   (),

    .s6_axi_awaddr   (),
    .s6_axi_awvalid  (),
    .s6_axi_awready  (1'b0),
    .s6_axi_wdata    (),
    .s6_axi_wstrb    (),
    .s6_axi_wvalid   (),
    .s6_axi_wready   (1'b0),
    .s6_axi_araddr   (),
    .s6_axi_arvalid  (),
    .s6_axi_arready  (1'b0),
    .s6_axi_rdata    (32'b0),
    .s6_axi_rvalid   (1'b0),
    .s6_axi_rready   (),

    .s7_axi_awaddr   (),
    .s7_axi_awvalid  (),
    .s7_axi_awready  (1'b0),
    .s7_axi_wdata    (),
    .s7_axi_wstrb    (),
    .s7_axi_wvalid   (),
    .s7_axi_wready   (1'b0),
    .s7_axi_araddr   (),
    .s7_axi_arvalid  (),
    .s7_axi_arready  (1'b0),
    .s7_axi_rdata    (32'b0),
    .s7_axi_rvalid   (1'b0),
    .s7_axi_rready   (),

    .s8_axi_awaddr   (),
    .s8_axi_awvalid  (),
    .s8_axi_awready  (1'b0),
    .s8_axi_wdata    (),
    .s8_axi_wstrb    (),
    .s8_axi_wvalid   (),
    .s8_axi_wready   (1'b0),
    .s8_axi_araddr   (),
    .s8_axi_arvalid  (),
    .s8_axi_arready  (1'b0),
    .s8_axi_rdata    (32'b0),
    .s8_axi_rvalid   (1'b0),
    .s8_axi_rready   (),

    .s9_axi_awaddr   (),
    .s9_axi_awvalid  (),
    .s9_axi_awready  (1'b0),
    .s9_axi_wdata    (),
    .s9_axi_wstrb    (),
    .s9_axi_wvalid   (),
    .s9_axi_wready   (1'b0),
    .s9_axi_araddr   (),
    .s9_axi_arvalid  (),
    .s9_axi_arready  (1'b0),
    .s9_axi_rdata    (32'b0),
    .s9_axi_rvalid   (1'b0),
    .s9_axi_rready   (),

    .s10_axi_awaddr  (),
    .s10_axi_awvalid (),
    .s10_axi_awready (1'b0),
    .s10_axi_wdata   (),
    .s10_axi_wstrb   (),
    .s10_axi_wvalid  (),
    .s10_axi_wready  (1'b0),
    .s10_axi_araddr  (),
    .s10_axi_arvalid (),
    .s10_axi_arready (1'b0),
    .s10_axi_rdata   (32'b0),
    .s10_axi_rvalid  (1'b0),
    .s10_axi_rready  (),

    .s11_axi_awaddr  (),
    .s11_axi_awvalid (),
    .s11_axi_awready (1'b0),
    .s11_axi_wdata   (),
    .s11_axi_wstrb   (),
    .s11_axi_wvalid  (),
    .s11_axi_wready  (1'b0),
    .s11_axi_araddr  (),
    .s11_axi_arvalid (),
    .s11_axi_arready (1'b0),
    .s11_axi_rdata   (32'b0),
    .s11_axi_rvalid  (1'b0),
    .s11_axi_rready  (),

    .s12_axi_awaddr  (),
    .s12_axi_awvalid (),
    .s12_axi_awready (1'b0),
    .s12_axi_wdata   (),
    .s12_axi_wstrb   (),
    .s12_axi_wvalid  (),
    .s12_axi_wready  (1'b0),
    .s12_axi_araddr  (),
    .s12_axi_arvalid (),
    .s12_axi_arready (1'b0),
    .s12_axi_rdata   (32'b0),
    .s12_axi_rvalid  (1'b0),
    .s12_axi_rready  (),

    .s13_axi_awaddr  (),
    .s13_axi_awvalid (),
    .s13_axi_awready (1'b0),
    .s13_axi_wdata   (),
    .s13_axi_wstrb   (),
    .s13_axi_wvalid  (),
    .s13_axi_wready  (1'b0),
    .s13_axi_araddr  (),
    .s13_axi_arvalid (),
    .s13_axi_arready (1'b0),
    .s13_axi_rdata   (32'b0),
    .s13_axi_rvalid  (1'b0),
    .s13_axi_rready  (),

    .s14_axi_awaddr  (),
    .s14_axi_awvalid (),
    .s14_axi_awready (1'b0),
    .s14_axi_wdata   (),
    .s14_axi_wstrb   (),
    .s14_axi_wvalid  (),
    .s14_axi_wready  (1'b0),
    .s14_axi_araddr  (),
    .s14_axi_arvalid (),
    .s14_axi_arready (1'b0),
    .s14_axi_rdata   (32'b0),
    .s14_axi_rvalid  (1'b0),
    .s14_axi_rready  (),

    .s15_axi_awaddr  (),
    .s15_axi_awvalid (),
    .s15_axi_awready (1'b0),
    .s15_axi_wdata   (),
    .s15_axi_wstrb   (),
    .s15_axi_wvalid  (),
    .s15_axi_wready  (1'b0),
    .s15_axi_araddr  (),
    .s15_axi_arvalid (),
    .s15_axi_arready (1'b0),
    .s15_axi_rdata   (32'b0),
    .s15_axi_rvalid  (1'b0),
    .s15_axi_rready  ()
);
//复位控制器
rstc inst_rstc
(
    .clk         (clk),
    .hard_rst_n  (hard_rst_n),
    .soft_rst_en (soft_rst_en),
    .jtag_rst_en (jtag_rst_en),
    .rst_n       (rst_n)
);

assign NorFlash_WP = 1'b1;
assign NorFlash_Hold = 1'b1;
endmodule