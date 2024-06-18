// This program was cloned from: https://github.com/Mr-Kaushal-22/WS2812_Interfacing
// License: MIT License

module ws2812_phy(
    /* CLK Signals */
    input                           clk,
    
    /* UART Signals */
    input                           i_rx_serial,
    output                          data,
    output reg                      led = 1
);

/* Global Parameters */
parameter CLKS_PER_BIT      = 435;
parameter PHY_FIFO_WIDTH    = 8;


reg [19:0]  data_depth  = 'd3;
reg [11:0]  num_leds    = 'd88;

/* Connecting Wires */
wire                        w_rx_dv;
wire [PHY_FIFO_WIDTH-1:0]   w_rx_byte;
wire                        w_f_empty;
wire                        w_fifo_rd_en;
wire [PHY_FIFO_WIDTH-1:0]   w_fifo_rd_data;
wire                        w_write;
wire [23:0]                 w_rgb_data;
wire [19:0]                 w_address;


/* Module Instantiations */
test_uart_rx #(
    .CLKS_PER_BIT(CLKS_PER_BIT)
)uartrx(
    .i_Clock        (clk),
    .i_Rx_Serial    (i_rx_serial),
    .o_Rx_DV        (w_rx_dv),
    .o_Rx_Byte      (w_rx_byte)
);

phy_fifo ws_wr_fifo(
    .wr_clk_i       (clk),
    .rd_clk_i       (clk),
    .wr_en_i        (w_rx_dv),
    .rd_en_i        (w_fifo_rd_en),
    .wdata          (w_rx_byte),
    .rdata          (w_fifo_rd_data),
    .empty_o        (w_f_empty)
);

ws2812_ctrl wsctrl(
    .clk            (clk),
    .f_empty        (w_f_empty),
    .fifo_read_data (w_fifo_rd_data),
    .fifo_read_en   (w_fifo_rd_en),
    .data_depth     (data_depth),
    .write          (w_write),
    .rgb_data       (w_rgb_data),
    .address        (w_address)
);

ws2812_interface wsinterface(
    .clk            (clk),
    .rgb_data       (w_rgb_data),
    .data_depth     (data_depth),
    .num_leds       (num_leds),
    .address        (w_address),
    .write          (w_write),
    .data           (data)
);
endmodule