// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// See: https://www.nesdev.org/wiki/PPU_rendering

module ppu_dummy(
    input clk_ppu,          // 21.477272 MHz / 4 = 5,369,318 Hz
                            // pixel clock is .
    output reg [5:0] video,     // pixel color (index into NES palette)
    output reg [8:0] scanline,  // 0-261, video active when 0-239
    output reg [8:0] cycle      // 0-340, video active when 1-256
    );

    reg [8:0] y = 0;
    reg [8:0] x = 0;
    
    // 1/10 second is 536,932 times
    reg [23:0] count = 1;
    reg [7:0] x_sprite = 0;
    reg [7:0] y_sprite = 8;
    
    wire active = (y <= 239) && (x != 0) && (x < 257);
    wire insprite = (y >= y_sprite) && (y < y_sprite+8) && (x >= x_sprite) && (x < x_sprite+8);
    
    // count until next sprite move and drawing
    always @(posedge clk_ppu) begin
        count <= count == 539_932 ? 0 : count + 1;
    end
    
    // advance cycle and scanline
    always @(posedge clk_ppu) begin
        if (x == 340) begin
            x <= 0;
            if (y == 261) begin
                y <= 0;
            end else begin
                y <= y + 1;
            end
        end else begin
            x <= x + 1;
        end
    end

    // update sprite position every 1/10 of a second
    always @(posedge clk_ppu) begin
        if (count==0) begin
            if (x_sprite == 256-8) begin
                x_sprite <= 0;
                if (y_sprite == 224-8) begin
                    y_sprite <= 8;
                end else begin
                    y_sprite <= y_sprite + 8;
                end
            end else begin
                x_sprite <= x_sprite + 1;
            end            
        end
    end

    // final output of video is very simple
    always @(posedge clk_ppu) begin
        video <= (active && insprite) ? 32 : (y[5:0]);         // 32 is (236,238,236)
        cycle <= x;
        scanline <= y;
    end

endmodule
