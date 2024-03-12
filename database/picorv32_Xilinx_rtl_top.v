`timescale 1 ns / 1 ps
module top #
(
  parameter DMA_RX_INTERVAL = 32'd1249999,
  parameter UART_BAUD       = 32'd271
)(
    // input [31:0] test,

    input        clk_125mhz,
    input        resetn_125mhz,

    input        clk_200mhz,
    input        resetn_200mhz,

    output [3:0] led,
    input        rxd,
    output       txd,

    input        phy_rx_clk,
    input  [7:0] phy_rxd,
    input        phy_rx_dv,
    input        phy_rx_er,
    output       phy_gtx_clk,
    input        phy_tx_clk,
    output [7:0] phy_txd,
    output       phy_tx_en,
    output       phy_tx_er,
    output       phy_reset_n
);

  assign phy_reset_n = (resetn_125mhz == 0) ? 0 : 1;

  wire trap;
  wire mem_valid;
  wire mem_instr;
  wire [31:0] mem_addr;
  wire [31:0] mem_wdata;
  wire [3:0] mem_wstrb;

  reg  mem_ready;
  reg  [31:0] mem_rdata;

  wire mem_ready_o;
  wire [31:0] mem_rdata_o;

  reg [31:0] irq;
  
  picorv32 #(
    // .TWO_CYCLE_ALU(1),
    .ENABLE_REGS_DUALPORT(1),
    .COMPRESSED_ISA(0),
    .ENABLE_MUL(1),
    .ENABLE_DIV(1),
    .ENABLE_IRQ(1),
    .STACKADDR(32'h 0003_ffff)) 
  _picorv32(
    .clk(clk_200mhz),
    .resetn(resetn_200mhz),
    .trap(trap),
    .mem_valid(mem_valid),
    .mem_instr(mem_instr),
    .mem_ready(mem_ready),
    .mem_addr(mem_addr),
    .mem_wdata(mem_wdata),
    .mem_wstrb(mem_wstrb),
    .mem_rdata(mem_rdata),
    .irq(irq)
  );
  
  wire rx_DMA_int;
  always @(posedge clk_200mhz) begin
    irq <= 0;
    irq[4] <= 0;//buttons_i[0];
    irq[5] <= rx_DMA_int;//buttons_i[1];
  end

  reg  [31:0] text_addr;
  reg  [31:0] text_wdata;
  reg  [ 3:0] text_wstrb;
  reg         text_valid;
  wire        text_ready;
  wire [31:0] text_rdata;

  reg  [31:0] heap_addr;
  reg  [31:0] heap_wdata;
  reg  [ 3:0] heap_wstrb;
  reg         heap_valid;
  wire        heap_ready;
  wire [31:0] heap_rdata;

  reg  [31:0] io_addr;
  reg  [31:0] io_wdata;
  reg  [ 3:0] io_wstrb;
  reg         io_valid;
  wire        io_ready;
  wire [31:0] io_rdata;

  reg  [31:0] DMA_addr;
  reg  [31:0] DMA_wdata;
  reg  [ 3:0] DMA_wstrb;
  reg         DMA_valid;
  wire        DMA_ready;
  wire [31:0] DMA_rdata;

  reg  [31:0] uart_addr;
  reg  [31:0] uart_wdata;
  reg  [ 3:0] uart_wstrb;
  reg         uart_valid;
  wire        uart_ready;
  wire [31:0] uart_rdata;

  always @(posedge clk_200mhz) begin
    text_addr  <= mem_addr;
    text_wdata <= mem_wdata;
    text_wstrb <= mem_wstrb;
    text_valid <= mem_valid && (mem_addr[31:16] == 16'h0000);

    heap_addr  <= mem_addr;
    heap_wdata <= mem_wdata;
    heap_wstrb <= mem_wstrb;
    heap_valid <= mem_valid && (mem_addr[31:16] == 16'h0001);

    io_addr  <= mem_addr;
    io_wdata <= mem_wdata;
    io_wstrb <= mem_wstrb;
    io_valid <= mem_valid && (mem_addr[31:16] == 16'h8001);

    DMA_addr  <= mem_addr;
    DMA_wdata <= mem_wdata;
    DMA_wstrb <= mem_wstrb;
    DMA_valid <= mem_valid && (mem_addr[31:16] == 16'h8000);

    uart_addr  <= mem_addr;
    uart_wdata <= mem_wdata;
    uart_wstrb <= mem_wstrb;
    uart_valid <= mem_valid && (mem_addr[31:16] == 16'h8002);
  end

  wire        mux_heap_valid;
  wire [31:0] mux_heap_addr;
  wire [31:0] mux_heap_wdata;
  wire [ 3:0] mux_heap_wstrb;
  wire        mux_heap_ready;
  wire [31:0] mux_heap_rdata;

  wire        DMA_heap_valid;
  wire [31:0] DMA_heap_addr;
  wire [31:0] DMA_heap_wdata;
  wire [ 3:0] DMA_heap_wstrb;
  wire        DMA_heap_ready;
  wire [31:0] DMA_heap_rdata;
  
  wire        BUS_valid;
  wire        BUS_ready;

  RAM_64KB _text_RAM
    (
      .clk       (clk_200mhz),
      .resetn    (resetn_200mhz),
      .mem_valid (text_valid),
      .mem_ready (text_ready),
      .mem_addr  (text_addr),
      .mem_wdata (text_wdata),
      .mem_wstrb (text_wstrb),
      .mem_rdata (text_rdata)
    );

  RAM_64KB _heap_RAM
    (
      .clk       (clk_200mhz),
      .resetn    (resetn_200mhz),
      .mem_valid (mux_heap_valid),
      .mem_ready (mux_heap_ready),
      .mem_addr  (mux_heap_addr),
      .mem_wdata (mux_heap_wdata),
      .mem_wstrb (mux_heap_wstrb),
      .mem_rdata (mux_heap_rdata)
    );

  IO _IO
    (
      .clk       (clk_200mhz),
      .resetn    (resetn_200mhz),
      .mem_valid (io_valid),
      .mem_ready (io_ready),
      .mem_addr  (io_addr),
      .mem_wdata (io_wdata),
      .mem_wstrb (io_wstrb),
      .mem_rdata (io_rdata),
      .io        (led)
    );

   mux_heap _mux_heap
      (
         .clk            (clk_200mhz),
         .resetn         (resetn_200mhz),

         .mux_heap_valid (mux_heap_valid),
         .mux_heap_ready (mux_heap_ready),
         .mux_heap_addr  (mux_heap_addr),
         .mux_heap_wdata (mux_heap_wdata),
         .mux_heap_wstrb (mux_heap_wstrb),
         .mux_heap_rdata (mux_heap_rdata),
         
         .BUS_valid      (BUS_valid),
         .BUS_ready      (BUS_ready),

         .DMA_heap_valid (DMA_heap_valid),
         .DMA_heap_ready (DMA_heap_ready),
         .DMA_heap_addr  (DMA_heap_addr),
         .DMA_heap_wdata (DMA_heap_wdata),
         .DMA_heap_wstrb (DMA_heap_wstrb),
         .DMA_heap_rdata (DMA_heap_rdata),

         .CPU_heap_valid (heap_valid),
         .CPU_heap_ready (heap_ready),
         .CPU_heap_addr  (heap_addr),
         .CPU_heap_wdata (heap_wdata),
         .CPU_heap_wstrb (heap_wstrb),
         .CPU_heap_rdata (heap_rdata)
      );

    // AXI between MAC and Ethernet modules
    wire [31:0] rx_axis_tdata;
    wire rx_axis_tvalid;
    wire rx_axis_tready;
    wire [ 3:0] rx_axis_tkeep;
    wire rx_axis_tlast;
    wire rx_axis_tuser;

    wire [31:0] tx_axis_tdata;
    wire tx_axis_tvalid;
    wire tx_axis_tready;
    wire [ 3:0] tx_axis_tkeep;
    wire tx_axis_tlast;
    wire tx_axis_tuser;

   DMAC   #(
         .DMA_RX_INTERVAL(DMA_RX_INTERVAL))
   _DMAC
      (
         .clk            (clk_200mhz),
         .resetn         (resetn_200mhz),
         .mem_valid      (DMA_valid),
         .mem_ready      (DMA_ready),
         .mem_addr       (DMA_addr),
         .mem_wdata      (DMA_wdata),
         .mem_wstrb      (DMA_wstrb),
         .mem_rdata      (DMA_rdata),
         .BUS_valid      (BUS_valid),
         .BUS_ready      (BUS_ready),
         .heap_valid     (DMA_heap_valid),
         .heap_ready     (DMA_heap_ready),
         .heap_addr      (DMA_heap_addr),
         .heap_wdata     (DMA_heap_wdata),
         .heap_wstrb     (DMA_heap_wstrb),
         .heap_rdata     (DMA_heap_rdata),
         .rx_axis_tdata  (rx_axis_tdata),
         .rx_axis_tkeep  (rx_axis_tkeep),
         .rx_axis_tvalid (rx_axis_tvalid),
         .rx_axis_tready (rx_axis_tready),
         .rx_axis_tlast  (rx_axis_tlast),
         .rx_axis_tuser  (rx_axis_tuser),
         .tx_axis_tdata  (tx_axis_tdata),
         .tx_axis_tkeep  (tx_axis_tkeep),
         .tx_axis_tvalid (tx_axis_tvalid),
         .tx_axis_tready (tx_axis_tready),
         .tx_axis_tlast  (tx_axis_tlast),
         .tx_axis_tuser  (tx_axis_tuser),
         .rx_DMA_int     (rx_DMA_int)
         // .tx_DMA_int     (tx_DMA_int)
      );

    eth_mac_1g_gmii_fifo #(
        .TARGET("XILINX"),
        .IODDR_STYLE("IODDR"),
        .CLOCK_INPUT_STYLE("BUFG"),
        .ENABLE_PADDING(1),
        .MIN_FRAME_LENGTH(64),
        .AXIS_DATA_WIDTH(32),
        .TX_FIFO_DEPTH(4096),
        .TX_FRAME_FIFO(1),
        .RX_FIFO_DEPTH(4096),
        .RX_FRAME_FIFO(1)
    )
    eth_mac_inst (
        .gtx_clk(clk_125mhz),
        .gtx_rst(~resetn_125mhz),
        .logic_clk(clk_200mhz),
        .logic_rst(~resetn_200mhz),

        .tx_axis_tdata(tx_axis_tdata),
        .tx_axis_tvalid(tx_axis_tvalid),
        .tx_axis_tready(tx_axis_tready),
        .tx_axis_tlast(tx_axis_tlast),
        .tx_axis_tuser(tx_axis_tuser),
        .tx_axis_tkeep(tx_axis_tkeep),

        .rx_axis_tdata(rx_axis_tdata),
        .rx_axis_tvalid(rx_axis_tvalid),
        .rx_axis_tready(rx_axis_tready),
        .rx_axis_tlast(rx_axis_tlast),
        .rx_axis_tuser(rx_axis_tuser),
        .rx_axis_tkeep(rx_axis_tkeep),

        .gmii_rx_clk(phy_rx_clk),
        .gmii_rxd(phy_rxd),
        .gmii_rx_dv(phy_rx_dv),
        .gmii_rx_er(phy_rx_er),
        .gmii_tx_clk(phy_gtx_clk),
        .mii_tx_clk(phy_tx_clk),
        .gmii_txd(phy_txd),
        .gmii_tx_en(phy_tx_en),
        .gmii_tx_er(phy_tx_er),

        .tx_fifo_overflow(),
        .tx_fifo_bad_frame(),
        .tx_fifo_good_frame(),
        .rx_error_bad_frame(),
        .rx_error_bad_fcs(),
        .rx_fifo_overflow(),
        .rx_fifo_bad_frame(),
        .rx_fifo_good_frame(),
        .speed(),

        .ifg_delay(12)
    );
// baud 115200
// 250MHz 2170
// 200MHz 1736
// 125MHz 1085
  uart_top #(
      .CLOCK_DIVIDE(UART_BAUD)
    ) 
  _uart_top (
      .clk       (clk_200mhz),
      .resetn    (resetn_200mhz),
      .mem_valid (uart_valid),
      .mem_ready (uart_ready),
      .mem_addr  (uart_addr),
      .mem_wdata (uart_wdata),
      .mem_wstrb (uart_wstrb),
      .mem_rdata (uart_rdata),
      .tx        (txd),
      .rx        (rxd)
    );

  assign mem_rdata_o = uart_valid ? uart_rdata :
               text_valid ? text_rdata : 
               (!BUS_ready && mux_heap_valid) ? mux_heap_rdata : 
               DMA_valid ? DMA_rdata : 32'h 0000_0000 ;

  assign mem_ready_o = (text_valid && text_ready) || 
                     (!BUS_ready && mux_heap_valid && mux_heap_ready) || 
                     (io_valid && io_ready) || 
                     (uart_valid && uart_ready) ||
                     (DMA_valid && DMA_ready) ;

  always @(posedge clk_200mhz) begin
    mem_rdata <= mem_rdata_o;
    mem_ready <= mem_ready_o;
  end
  
 // wire [35:0] CONTROL0;
 // ICON ICON0 (
 // .CONTROL0(CONTROL0) // INOUT BUS [35:0]
 // );

 // ILA ILA0 (
 // .CONTROL(CONTROL0), // INOUT BUS [35:0]
 // .CLK(clk_200mhz), // IN
 // .TRIG0(mem_valid), // IN BUS [7:0]
 // .TRIG1(mem_ready), // IN BUS [0:0]
 // .TRIG2(mem_addr),
 // .TRIG3(mem_rdata),
 // .TRIG4(mem_wstrb),
 // .TRIG5(mem_instr)// IN BUS [31:0]
 // );


endmodule

module RAM_128KB(
  input clk, resetn,

  input            mem_valid,
  output           mem_ready,

  input     [31:0] mem_addr,
  input     [31:0] mem_wdata,
  input     [ 3:0] mem_wstrb,
  output    [31:0] mem_rdata
);

  wire [31:0] ram_rdata_0;
  wire [31:0] ram_rdata_1;
  wire [31:0] ram_rdata_2;
  wire [31:0] ram_rdata_3;
  wire [31:0] ram_rdata_4;
  wire [31:0] ram_rdata_5;
  wire [31:0] ram_rdata_6;
  wire [31:0] ram_rdata_7;

  ram_4k_32 _ram_4k_32_0(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_0, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b000)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_1(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_1, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b001)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_2(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_2, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b010)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_3(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_3, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b011)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_4(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_4, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b100)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_5(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_5, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b101)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_6(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_6, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b110)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);
  ram_4k_32 _ram_4k_32_7(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_7, 
    (mem_valid && !mem_ready && (mem_addr[16:14] == 3'b111)) ? mem_wstrb : 4'b0,
    mem_valid && !mem_addr[31]);

  reg ram_ready1, ram_ready2;
  reg mem_valid_reg;
  reg [31:0] mem_addr_reg0;
  reg [31:0] mem_addr_reg1;

  always @(posedge clk) begin
      if (!resetn) begin
        ram_ready2 <= 0;
        ram_ready1 <= 0;
        mem_valid_reg <= 0;
        mem_addr_reg0 <= 0;
        mem_addr_reg1 <= 0;
      end else begin
        if ((mem_valid == 1) && (mem_valid_reg == 0))
          ram_ready1 <= 1;
        if (ram_ready1)
          ram_ready1 <= 0;

        mem_valid_reg <= mem_valid;
        ram_ready2 <= ram_ready1;
        mem_addr_reg0 <= mem_addr;
        mem_addr_reg1 <= mem_addr_reg0;
      end
  end

  assign mem_ready = (|mem_wstrb == 1) ? ram_ready1 : ram_ready2;

  reg [31:0] ram_rdata_0_reg0;
  reg [31:0] ram_rdata_1_reg0;
  reg [31:0] ram_rdata_2_reg0;
  reg [31:0] ram_rdata_3_reg0;
  reg [31:0] ram_rdata_4_reg0;
  reg [31:0] ram_rdata_5_reg0;
  reg [31:0] ram_rdata_6_reg0;
  reg [31:0] ram_rdata_7_reg0;

  always @(posedge clk) begin
    ram_rdata_0_reg0 <= ram_rdata_0;
    ram_rdata_1_reg0 <= ram_rdata_1;
    ram_rdata_2_reg0 <= ram_rdata_2;
    ram_rdata_3_reg0 <= ram_rdata_3;
    ram_rdata_4_reg0 <= ram_rdata_4;
    ram_rdata_5_reg0 <= ram_rdata_5;
    ram_rdata_6_reg0 <= ram_rdata_6;
    ram_rdata_7_reg0 <= ram_rdata_7;
  end

  assign mem_rdata =
              (mem_valid && (mem_addr_reg1[16:14] == 3'b000)) ? ram_rdata_0_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b001)) ? ram_rdata_1_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b010)) ? ram_rdata_2_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b011)) ? ram_rdata_3_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b100)) ? ram_rdata_4_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b101)) ? ram_rdata_5_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b110)) ? ram_rdata_6_reg0 : 
              (mem_valid && (mem_addr_reg1[16:14] == 3'b111)) ? ram_rdata_7_reg0 : 32'h 0000_0000 ;

endmodule

module RAM_64KB(
  input clk, resetn,

  input            mem_valid,
  output reg          mem_ready,

  input     [31:0] mem_addr,
  input     [31:0] mem_wdata,
  input     [ 3:0] mem_wstrb,
  output reg   [31:0] mem_rdata
);

  wire [31:0] ram_rdata_0;
  wire [31:0] ram_rdata_1;
  wire [31:0] ram_rdata_2;
  wire [31:0] ram_rdata_3;

  wire [ 3:0] ram_wstrb0_w = (mem_addr[15:14] == 2'b00) ? mem_wstrb : 4'b0;
  wire [ 3:0] ram_wstrb1_w = (mem_addr[15:14] == 2'b01) ? mem_wstrb : 4'b0;
  wire [ 3:0] ram_wstrb2_w = (mem_addr[15:14] == 2'b10) ? mem_wstrb : 4'b0;
  wire [ 3:0] ram_wstrb3_w = (mem_addr[15:14] == 2'b11) ? mem_wstrb : 4'b0;

  reg  [ 3:0] ram_wstrb0;
  reg  [ 3:0] ram_wstrb1;
  reg  [ 3:0] ram_wstrb2;
  reg  [ 3:0] ram_wstrb3;

  reg  [ 3:0] ram_wstrb0_r;
  reg  [ 3:0] ram_wstrb1_r;
  reg  [ 3:0] ram_wstrb2_r;
  reg  [ 3:0] ram_wstrb3_r;

  reg ram_ready1, ram_ready2;
  reg mem_valid_reg;
  reg [31:0] mem_addr_reg0;
  reg [31:0] mem_addr_reg1;

  always @(posedge clk) begin
    ram_wstrb0_r <= ram_wstrb0_w ;
    ram_wstrb1_r <= ram_wstrb1_w ;
    ram_wstrb2_r <= ram_wstrb2_w ;
    ram_wstrb3_r <= ram_wstrb3_w ;
    ram_wstrb0 <= mem_valid_reg ? ram_wstrb0_r : 4'b0000;
    ram_wstrb1 <= mem_valid_reg ? ram_wstrb1_r : 4'b0000;
    ram_wstrb2 <= mem_valid_reg ? ram_wstrb2_r : 4'b0000;
    ram_wstrb3 <= mem_valid_reg ? ram_wstrb3_r : 4'b0000;
  end

  ram_4k_32 _ram_4k_32_0(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_0, 
    ram_wstrb0,
    mem_valid);
  ram_4k_32 _ram_4k_32_1(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_1, 
    ram_wstrb1,
    mem_valid);
  ram_4k_32 _ram_4k_32_2(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_2, 
    ram_wstrb2,
    mem_valid);
  ram_4k_32 _ram_4k_32_3(clk, mem_addr[13:2],
    mem_wdata, ram_rdata_3, 
    ram_wstrb3,
    mem_valid);

  always @(posedge clk) begin
      if (!resetn) begin
        ram_ready2 <= 0;
        ram_ready1 <= 0;
        mem_valid_reg <= 0;
        mem_addr_reg0 <= 0;
        mem_addr_reg1 <= 0;
      end else begin
        if ((mem_valid == 1) && (mem_valid_reg == 0))
          ram_ready1 <= 1;
        if (ram_ready1)
          ram_ready1 <= 0;

        mem_valid_reg <= mem_valid;
        ram_ready2 <= ram_ready1;
        mem_addr_reg0 <= mem_addr;
        mem_addr_reg1 <= mem_addr_reg0;
      end
  end

  wire        mem_ready_w;
  wire [31:0] mem_rdata_w;

  assign mem_ready_w = (|mem_wstrb == 1) ? ram_ready1 : ram_ready2;

  reg [31:0] ram_rdata_0_reg0;
  reg [31:0] ram_rdata_1_reg0;
  reg [31:0] ram_rdata_2_reg0;
  reg [31:0] ram_rdata_3_reg0;

  always @(posedge clk) begin
    ram_rdata_0_reg0 <= ram_rdata_0;
    ram_rdata_1_reg0 <= ram_rdata_1;
    ram_rdata_2_reg0 <= ram_rdata_2;
    ram_rdata_3_reg0 <= ram_rdata_3;
  end

  assign mem_rdata_w =
              (mem_addr_reg1[15:14] == 2'b00) ? ram_rdata_0_reg0 : 
              (mem_addr_reg1[15:14] == 2'b01) ? ram_rdata_1_reg0 : 
              (mem_addr_reg1[15:14] == 2'b10) ? ram_rdata_2_reg0 : 
              (mem_addr_reg1[15:14] == 2'b11) ? ram_rdata_3_reg0 : 32'h 0000_0000 ;

  always @(posedge clk) begin
    mem_rdata <= mem_rdata_w;
    mem_ready <= mem_ready_w;
  end

endmodule

module IO(
  input clk, resetn,

  input            mem_valid,
  output reg       mem_ready,

  input     [31:0] mem_addr,
  input     [31:0] mem_wdata,
  input     [ 3:0] mem_wstrb,
  output reg   [31:0] mem_rdata,
  output    [ 3:0] io
);
  assign io = io_int;
  
  reg [3:0] io_int;
  reg       mem_valid_reg;

  always @(posedge clk) begin
    if (!resetn) begin
      io_int <= 0;
      mem_ready <= 0;
      mem_rdata <= 0;
      mem_valid_reg <= 0;
    end else begin
      if ((mem_valid == 1) && (mem_valid_reg == 0))
        mem_ready <= 1;
      if (mem_ready)
        mem_ready <= 0;

      mem_valid_reg <= mem_valid;

      if ((mem_valid == 1) && (mem_valid_reg == 0)) begin
        // rx_BD_adr
        if (mem_addr[7:2] == 6'h10) begin
          mem_rdata <= {28'd0, io_int};
          if (mem_wstrb==4'hF) io_int <= mem_wdata[3:0];
        end
      end
    end
  end

endmodule

module ram_4k_32(
  input clk,
  input [11:0] addr,
  input [31:0] din,
  output [31:0] dout,
  input [3:0] we,
  input en
);

  bram_4k_8 _bram0(clk, addr, din[7:0], dout[7:0], we[0], en);
  bram_4k_8 _bram1(clk, addr, din[15:8], dout[15:8], we[1], en);
  bram_4k_8 _bram2(clk, addr, din[23:16], dout[23:16], we[2], en);
  bram_4k_8 _bram3(clk, addr, din[31:24], dout[31:24], we[3], en);

endmodule

module bram_4k_8(
  input clk,
  input [11:0] addr,
  input [7:0] din,
  output reg [7:0] dout,
  input we,
  input en
);
  (* ram_style = "block" *)
  reg [7:0] mem[0:4095];
    always @(posedge clk)
    begin
        if (en)
        begin
            if (we)
            begin
                mem[addr] <= din;
                dout <= din;
            end
            else
                dout <= mem[addr];
        end
    end

endmodule
