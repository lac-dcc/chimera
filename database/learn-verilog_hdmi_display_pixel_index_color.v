// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0


module pixel_index_color (
    input valid,
    input [7:0] font_line_data,
    input [2:0] char_pix_x,
    input [7:0] bg_fg_index,
    output [3:0] color_index
);
    reg pix;

    always @ (*) begin
        case (char_pix_x)
            3'd0: pix = font_line_data[7];
            3'd1: pix = font_line_data[6];
            3'd2: pix = font_line_data[5];
            3'd3: pix = font_line_data[4];
            3'd4: pix = font_line_data[3];
            3'd5: pix = font_line_data[2];
            3'd6: pix = font_line_data[1];
            3'd7: pix = font_line_data[0];
        endcase
    end

    // if pix is 1, return fg color index, otherwise bg color:
    assign color_index = valid ? (pix == 1'b1 ? bg_fg_index[3:0] : bg_fg_index[7:4]) : 4'd0;

endmodule
