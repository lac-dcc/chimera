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

    // Drawing logic
    always @(posedge clk_pix) begin
        // Pattern 1
        if (v < 630) begin
            if (h >= 240 && h < 1680) begin
                // 75% Bars
                if (h >= 240 && h < 446) begin
                    // 75% White
                    r <= 8'hB4;
                    g <= 8'hB4;
                    b <= 8'hB4;
                end else if (h >= 446 && h < 651) begin
                    // 75% Yellow
                    r <= 8'hB4;
                    g <= 8'hB4;
                    b <= 8'h10;
                end else if (h >= 651 && h < 857) begin
                    // 75% Cyan
                    r <= 8'h10;
                    g <= 8'hB4;
                    b <= 8'hB4;
                end else if (h >= 857 && h < 1063) begin
                    // 75% Green
                    r <= 8'h10;
                    g <= 8'hB4;
                    b <= 8'h10;
                end else if (h >= 1063 && h < 1269) begin
                    // 75% Magenta
                    r <= 8'hB4;
                    g <= 8'h10;
                    b <= 8'hB4;
                end else if (h >= 1269 && h < 1474) begin
                    // 75% Red
                    r <= 8'hB4;
                    g <= 8'h10;
                    b <= 8'h10;
                end else if (h >= 1474 && h < 1680) begin
                    // 75% Blue
                    r <= 8'h10;
                    g <= 8'h10;
                    b <= 8'hB4;
                end
            end else begin
                // 40% Gray
                r <= 8'h68;
                g <= 8'h68;
                b <= 8'h68;
            end
        end

        // Pattern 2
        if (v >= 630 && v < 720) begin
            if (h < 240) begin
                // 100% Cyan
                r <= 8'h10;
                g <= 8'hEB;
                b <= 8'hEB;
            end else if (h >= 240 && h < 446) begin
                // -I
                r <= 8'h10;
                g <= 8'h46;
                b <= 8'h6A;
            end else if (h >= 446 && h < 1680) begin
                // 75% White
                r <= 8'hB4;
                g <= 8'hB4;
                b <= 8'hB4;
            end else if (h >= 1680 && h < 1920) begin
                // 100% Blue
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'hEB;
            end
        end

        // Pattern 3
        if (v >= 720 && v < 810) begin
            if (h < 240) begin
                // 100% Yellow
                r <= 8'hEB;
                g <= 8'hEB;
                b <= 8'h10;
            end else if (h >= 240 && h < 446) begin
                // +Q
                r <= 8'h48;
                g <= 8'h10;
                b <= 8'h76;
            end else if (h >= 446 && h < 1680) begin
                // Ramp
                /* verilator lint_off REALCVT */
                r <= (h - 446) / 5.25;
                g <= (h - 446) / 5.25;
                b <= (h - 446) / 5.25;
                /* verilator lint_on REALCVT */
            end else if (h >= 1680 && h < 1920) begin
                // 100% Red
                r <= 8'hEB;
                g <= 8'h10;
                b <= 8'h10;
            end
        end

        // Pattern 4
        if (v >= 810) begin
            if (h >= 240 && h < 1680) begin
                // 75% Bars
                if (h >= 240 && h < 548) begin
                    // Black
                    r <= 8'h10;
                    g <= 8'h10;
                    b <= 8'h10;
                end else if (h >= 548 && h < 960) begin
                    // 100% White
                    r <= 8'hEB;
                    g <= 8'hEB;
                    b <= 8'hEB;
                end else if (h >= 960 && h < 1131) begin
                    // Black
                    r <= 8'h10;
                    g <= 8'h10;
                    b <= 8'h10;
                end else if (h >= 1131 && h < 1200) begin
                    // -2% Black
                    r <= 8'h00;
                    g <= 8'h00;
                    b <= 8'h00;
                end else if (h >= 1200 && h < 1269) begin
                    // Black
                    r <= 8'h10;
                    g <= 8'h10;
                    b <= 8'h10;
                end else if (h >= 1269 && h < 1337) begin
                    // +2% Black
                    r <= 8'h17;
                    g <= 8'h17;
                    b <= 8'h17;
                end else if (h >= 1337 && h < 1406) begin
                    // Black
                    r <= 8'h10;
                    g <= 8'h10;
                    b <= 8'h10;
                end else if (h >= 1406 && h < 1474) begin
                    // +4% Black
                    r <= 8'h1F;
                    g <= 8'h1F;
                    b <= 8'h1F;
                end else if (h >= 1474 && h < 1680) begin
                    // Black
                    r <= 8'h10;
                    g <= 8'h10;
                    b <= 8'h10;
                end
            end else begin
                // 15% Gray
                r <= 8'h26;
                g <= 8'h26;
                b <= 8'h26;
            end
        end
    end

    // RGB outputs
    assign sdl_r = active ? r : 8'h00;
    assign sdl_g = active ? g : 8'h00;
    assign sdl_b = active ? b : 8'h00;

endmodule
