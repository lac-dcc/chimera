// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// VGA 16 Color Palette:
// https://en.wikipedia.org/wiki/Color_Graphics_Adapter

module index_color_to_rgb (
    input wire [3:0] color_index,
    output reg [15:0] color_rgb
);
    always @ (*) begin
        case (color_index)
            4'd0: color_rgb = 16'b00000_000000_00000; // #000000 = black
            4'd1: color_rgb = 16'b00000_000000_10101; // #0000aa = blue
            4'd2: color_rgb = 16'b00000_101010_00000; // #00aa00 = green
            4'd3: color_rgb = 16'b00000_101010_10101; // #00aaaa = cyan
            4'd4: color_rgb = 16'b10101_000000_00000; // #aa0000 = red
            4'd5: color_rgb = 16'b10101_000000_10101; // #aa00aa = magenta
            4'd6: color_rgb = 16'b10101_010101_00000; // #aa5500 = brown
            4'd7: color_rgb = 16'b10101_101010_10101; // #aaaaaa = light gray
            4'd8: color_rgb = 16'b01010_010101_01010; // #555555 = dark gray
            4'd9: color_rgb = 16'b01010_010101_11111; // #5555ff = light blue
            4'd10: color_rgb = 16'b01010_111111_01010; // #55ff55 = light green
            4'd11: color_rgb = 16'b01010_111111_11111; // #55ffff = light cyan
            4'd12: color_rgb = 16'b11111_010101_01010; // #ff5555 = light red
            4'd13: color_rgb = 16'b11111_010101_11111; // #ff55ff = light magenta
            4'd14: color_rgb = 16'b11111_111111_01010; // #ffff55 = yellow
            4'd15: color_rgb = 16'b11111_111111_11111; // #ffffff = white
        endcase
    end
endmodule
