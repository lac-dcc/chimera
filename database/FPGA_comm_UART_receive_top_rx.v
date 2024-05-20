// This program was cloned from: https://github.com/mr-bammby/FPGA_comm
// License: MIT License

module top
(
    input clk,
    output [1:0] led_err,
    output [3:0] led_res,
    input uartRx
);

wire err;
wire new_data;
wire [7:0] data;
reg [7:0] data_reg = "0";
reg new_transmition = 0;
reg [3:0]  out_reg = 0;

uart_rx u(  .clk(clk),
.led(led_err),
.rx_pin(uartRx),
.data(data),
.data_ready(new_data),
.comm_err(err));

always @(posedge clk) begin
    if (new_data == 1) begin
        data_reg <= data;
    end
    if (err == 1)
        out_reg <= 14;
    else if ((data_reg >= "/") && (data_reg <= "9")) // No fucking idea why "/" is needed instead of "0", "0" == ("/" + 1) 
        out_reg <= (data_reg - "0");
    else
        out_reg <= 15;
end

assign led_res = ~out_reg[3:0];

endmodule