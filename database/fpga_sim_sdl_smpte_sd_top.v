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
        if (v < 384) begin
            if (h < 102) begin
                // 75% Gray
                r <= 8'hB4;
                g <= 8'hB4;
                b <= 8'hB4;
            end else if (h >= 102 && h < 206) begin
                // 75% Yellow
                r <= 8'hB4;
                g <= 8'hB4;
                b <= 8'h10;
            end else if (h >= 206 && h < 309) begin
                // 75% Cyan
                r <= 8'h10;
                g <= 8'hB4;
                b <= 8'hB4;
            end else if (h >= 309 && h < 412) begin
                // 75% Green
                r <= 8'h10;
                g <= 8'hB4;
                b <= 8'h10;
            end else if (h >= 412 && h < 515) begin
                // 75% Magenta
                r <= 8'hB4;
                g <= 8'h10;
                b <= 8'hB4;
            end else if (h >= 515 && h < 618) begin
                // 75% Red
                r <= 8'hB4;
                g <= 8'h10;
                b <= 8'h10;
            end else if (h >= 618 && h < 720) begin
                // 75% Blue
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'hB4;
            end
        end

        // Pattern 2
        if (v >= 384 && v < 430) begin
            if (h < 102) begin
                // 75% Blue
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'hB4;
            end else if (h >= 102 && h < 206) begin
                // Black
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'h10;
            end else if (h >= 206 && h < 309) begin
                // 75% Magenta
                r <= 8'hB4;
                g <= 8'h10;
                b <= 8'hB4;
            end else if (h >= 309 && h < 412) begin
                // Black
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'h10;
            end else if (h >= 412 && h < 515) begin
                // 75% Cyan
                r <= 8'h10;
                g <= 8'hB4;
                b <= 8'hB4;
            end else if (h >= 515 && h < 618) begin
                // Black
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'h10;
            end else if (h >= 618 && h < 720) begin
                // 75% Gray
                r <= 8'hB4;
                g <= 8'hB4;
                b <= 8'hB4;
            end
        end

        // Pattern 3
        if (v >= 430) begin
            if (h < 128) begin
                // -I
                r <= 8'h10;
                g <= 8'h46;
                b <= 8'h6A;
            end else if (h >= 128 && h < 256) begin
                // White
                r <= 8'hEB;
                g <= 8'hEB;
                b <= 8'hEB;
            end else if (h >= 256 && h < 384) begin
                // +Q
                r <= 8'h48;
                g <= 8'h10;
                b <= 8'h76;
            end else if (h >= 384 && h < 514) begin
                // Black
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'h10;
            end else if (h >= 514 && h < 548) begin
                // Super Black -4
                r <= 8'h00;
                g <= 8'h00;
                b <= 8'h00;
            end else if (h >= 548 && h < 582) begin
                // Black
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'h10;
            end else if (h >= 582 && h < 616) begin
                // Black +4
                r <= 8'h1F;
                g <= 8'h1F;
                b <= 8'h1F;
            end else if (h >= 616 && h < 720) begin
                // Black
                r <= 8'h10;
                g <= 8'h10;
                b <= 8'h10;
            end
        end
    end

    // RGB outputs
    assign sdl_r = active ? r : 8'h00;
    assign sdl_g = active ? g : 8'h00;
    assign sdl_b = active ? b : 8'h00;

endmodule
