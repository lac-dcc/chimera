// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module LEDs (
    input wire clk,
    input wire reset,
    input wire read,
    input wire write,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output wire [31:0] read_data,
    output wire response,
    output wire [7:0] leds
);

assign response = read | write;

reg [32:0] data;

initial begin
    data = 0;
end

assign read_data = (read == 1'b1) ? data : 32'h00000000;

always @(posedge clk ) begin
    if(reset == 1'b1) begin
        data <= 1'b0;
    end else if(write) begin
        data <= write_data;
    end
end

assign leds = ~data[7:0];
    
endmodule