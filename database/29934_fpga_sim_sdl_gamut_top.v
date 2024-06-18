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

        if (h <= (H_RES / 2) && v <= (V_RES / 2)) begin
            r <= h / 2;
            g <= 8'h00;
            b <= 8'h00;
        end
        else if (h > (H_RES / 2) && v <= (V_RES / 2)) begin
            r <= 8'h00;
            g <= h / 2;
            b <= 8'h00;
        end
        else if (h <= (H_RES / 2) && v > (V_RES / 2)) begin
            r <= 8'h00;
            g <= 8'h00;
            b <= h / 2;
        end
        else if (h > (H_RES / 2) && v > (V_RES / 2)) begin
            r <= h / 2;
            g <= h / 2;
            b <= h / 2;
        end
        else begin
            r <= 8'h00;
            g <= 8'h00;
            b <= 8'h00;
        end

        /* verilator lint_on WIDTH */
    end

    // RGB outputs
    assign sdl_r = active ? r : 8'h00;
    assign sdl_g = active ? g : 8'h00;
    assign sdl_b = active ? b : 8'h00;

endmodule
