// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// VGA 16 Color Palette:
// https://en.wikipedia.org/wiki/Color_Graphics_Adapter

module index_color_to_rgb (
    input wire [3:0] color_index,
    output reg [23:0] color_rgb
);
    always @ (*) begin
        case (color_index)
            4'd0: color_rgb = 24'b00000000_00000000_00000000; // #000000 = black
            4'd1: color_rgb = 24'b00000000_00000000_10101010; // #0000aa = blue
            4'd2: color_rgb = 24'b00000000_10101010_00000000; // #00aa00 = green
            4'd3: color_rgb = 24'b00000000_10101010_10101010; // #00aaaa = cyan
            4'd4: color_rgb = 24'b10101010_00000000_00000000; // #aa0000 = red
            4'd5: color_rgb = 24'b10101010_00000000_10101010; // #aa00aa = magenta
            4'd6: color_rgb = 24'b10101010_01010101_00000000; // #aa5500 = brown
            4'd7: color_rgb = 24'b10101010_10101010_10101010; // #aaaaaa = light gray
            4'd8: color_rgb = 24'b01010101_01010101_01010101; // #555555 = dark gray
            4'd9: color_rgb = 24'b01010101_01010101_11111111; // #5555ff = light blue
            4'd10: color_rgb = 24'b01010101_11111111_01010101; // #55ff55 = light green
            4'd11: color_rgb = 24'b01010101_11111111_11111111; // #55ffff = light cyan
            4'd12: color_rgb = 24'b11111111_01010101_01010101; // #ff5555 = light red
            4'd13: color_rgb = 24'b11111111_01010101_11111111; // #ff55ff = light magenta
            4'd14: color_rgb = 24'b11111111_11111111_01010101; // #ffff55 = yellow
            4'd15: color_rgb = 24'b11111111_11111111_11111111; // #ffffff = white
        endcase
    end
endmodule
