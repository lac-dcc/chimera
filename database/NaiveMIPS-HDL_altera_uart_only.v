`default_nettype none
module uart_only(/*autoport*/
//output
           txd,
           rx_state,
           rxd_dbg,
           rx_data_available,
//input
           rst_in_n,
           clk_in,
           rxd);

input wire rst_in_n;
input wire clk_in;
input wire rxd;
output wire txd;
output wire[3:0]rx_state;
output wire rxd_dbg;

wire clk,clk2x,clk_uart_pll,clk_uart;
wire locked, rst_n;

sys_pll pll1(
    .areset(!rst_in_n),
    .inclk0(clk_in),
    .c0(clk),
    .c1(clk2x),
    .c2(clk_uart_pll),
    .locked(locked));
clk_ctrl clk_ctrl1(/*autoinst*/
         .rst_out_n(rst_n),
         .clk(clk),
         .rst_in_n(locked));

assign clk_uart = clk_uart_pll;
assign rxd_dbg = rxd;
wire tx_idle;
output wire rx_data_available;
wire[7:0] rx_data;
reg rx_clear;

uart_tx tx0(/*autoinst*/
            .idle(tx_idle),
            .txd(txd),
            .clk_bus(clk),
            .clk_uart(clk_uart),
            .rst_n(rst_n),
            .tx_request(rx_data_available),
            .data(rx_data));

uart_rx rx0(/*autoinst*/
            .data(rx_data),
            .data_available(rx_data_available),
            .clk_bus(clk),
            .clk_uart(clk_uart),
            .rst_n(rst_n),
            .clear(rx_clear),
            .state(rx_state),
            .rxd_in(rxd));

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_clear <=1'b0;
    end
    else begin
        rx_clear <= rx_data_available;
    end
end
endmodule
