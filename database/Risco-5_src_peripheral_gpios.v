// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module GPIOS #(
    parameter WIDHT = 20
) (
    input wire clk,
    input wire reset,
    input wire read,
    input wire write,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output wire [31:0] read_data,
    output wire response,
    inout [WIDHT - 1:0] gpios
);

assign response = read | write;
reg [WIDHT - 1:0] gpio_direction, gpio_value;
wire [WIDHT -1:0] gpio_out;

parameter SET_DIRECTION = 1'b0;
parameter READ = 1'b1;

assign read_data = (read == 1'b1) ? gpio_out : 32'h00000000;

GPIO Gpios[WIDHT - 1:0](
    .gpio(gpios),
    .direction(gpio_direction),
    .data_in(gpio_value),
    .data_out(gpio_out)
);

always @(posedge clk) begin
    if(reset) begin
        gpio_direction <= 32'h00000000;
        gpio_value <= 32'h00000000;
    end else if(write) begin
        if(write_data[31] == SET_DIRECTION)
            gpio_direction <= write_data[WIDHT - 1: 0];
        else
            gpio_value <= write_data[WIDHT - 1: 0];
    end
end
    
endmodule
