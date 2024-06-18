// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../simple_dual_ram/simple_dual_ram.v"
module framebuffer #(
    parameter HEIGHT = 480,
    parameter WIDTH = 640
)(
    input wire clk,            // Clock input
    input wire vga_clk,
    input wire rst,            // Reset input
    input wire [7:0] game_data, // Game data input (pixel information)
    input wire [18:0] address,
    input wire [9:0] x,
    input wire [9:0] y,
    input wire r_en,
    input wire w_en,
    output reg [7:0] display_data // Data output to display
);


// Define memory size
localparam MEM_SIZE = WIDTH * HEIGHT; // VGA resolution

wire [7:0] data;
wire [18:0] pixel_addr;

assign pixel_addr = y * WIDTH + x;

simple_dual_ram #(.SIZE(8), .DEPTH(MEM_SIZE)) fb (
    .wclk(clk),
    .waddr(address),
    .write_data(game_data),
    .write_en(w_en),
    .rclk(vga_clk),
    .raddr(pixel_addr),
    .read_data(data)
);
// Read data from memory for display
always @(posedge clk) begin
    if (r_en) begin
        display_data <= data;
    end else begin
        display_data <= 8'b0;
    end
end
endmodule
