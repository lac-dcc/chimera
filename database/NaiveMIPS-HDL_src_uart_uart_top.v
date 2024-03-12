module uart_top(/*autoport*/
//output
            bus_data_o,
            uart_irq,
            txd,
//input
            clk_bus,
            clk_uart,
            rst_n,
            bus_address,
            bus_data_i,
            bus_read,
            bus_write,
            rxd);

`define REG_UART_SEND 4'h8
`define REG_UART_STATUS 4'hc
`define REG_UART_RECV 4'h8

input wire clk_bus;
input wire clk_uart;
input wire rst_n;

input wire[3:0] bus_address;
input wire[31:0] bus_data_i;
output reg[31:0] bus_data_o;
input wire bus_read;
input wire bus_write;

output wire uart_irq;

input wire rxd;
output wire txd;

wire tx_idle;
wire tx_request;

wire[7:0] rx_data;
wire rx_data_available;
wire rx_clear;

reg txidle_ie, rxavai_ie;

assign tx_request = bus_write && bus_address==`REG_UART_SEND;
assign rx_clear = bus_read && bus_address==`REG_UART_RECV;
assign uart_irq = (rx_data_available&rxavai_ie)|(tx_idle&txidle_ie);

always @(posedge clk_bus or negedge rst_n) begin
    if(~rst_n)begin 
        txidle_ie <= 1'b0;
        rxavai_ie <= 1'b1;
    end
    else if(bus_write) begin
        case(bus_address)
        `REG_UART_STATUS: begin
            rxavai_ie <= bus_data_i[4];
            txidle_ie <= bus_data_i[3];
        end
        endcase
    end
end

always @(*) begin
    if(bus_read) begin
        case(bus_address)
        `REG_UART_STATUS: begin
            bus_data_o <= {27'b0,rxavai_ie,txidle_ie,1'b0,rx_data_available,tx_idle};
        end
        `REG_UART_RECV: begin
            bus_data_o <= {24'b0, rx_data};
        end
        default: begin
            bus_data_o <= 32'h0;
        end
        endcase
    end else begin
        bus_data_o <= 32'h0;
    end
end

uart_tx tx1(/*autoinst*/
            .idle(tx_idle),
            .txd(txd),
            .clk_bus(clk_bus),
            .clk_uart(clk_uart),
            .rst_n(rst_n),
            .tx_request(tx_request),
            .data(bus_data_i[7:0]));

uart_rx rx1(/*autoinst*/
            .data(rx_data),
            .data_available(rx_data_available),
            .clk_bus(clk_bus),
            .clk_uart(clk_uart),
            .rst_n(rst_n),
            .clear(rx_clear),
            .rxd_in(rxd));

endmodule
