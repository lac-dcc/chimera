// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input wire          clk_pix,
    output wire [12:0]  h,
    output wire [12:0]  v,
    output wire [7:0]   sdl_r,
    output wire [7:0]   sdl_g,
    output wire [7:0]   sdl_b,
    output wire         active

);

    parameter H_RES = 1024;
    parameter V_RES = 768;

    // Sync generator module
    sync sync(
        .CLK(clk_pix),
        .HSYNC(),
        .VSYNC(),
        .ACTIVE(active),
        .h,
        .v
    );

    // 8-bit colour registers
    reg [7:0] r, g, b;

    // Box position registers
    reg [12:0] x, y;

    // Drawing logic
    always @(posedge clk_pix) begin
        /* verilator lint_off WIDTH */

        r <= (H_RES - h) / 4;
        g <= h / 4;
        b <= v / 3;

        /* verilator lint_on WIDTH */
    end

    // RGB outputs
    assign sdl_r = active ? r : 8'h00;
    assign sdl_g = active ? g : 8'h00;
    assign sdl_b = active ? b : 8'h00;

endmodule
