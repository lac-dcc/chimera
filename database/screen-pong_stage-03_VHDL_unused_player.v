////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: player.v
//
// Description: Draw a player in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module player
#(
   parameter type_ply = 1'b0,      // Type of player. [Horizontal, Vertical]
   parameter pos_offset = 100      // Offset from border.
)(
   input wire         px_clk,       // Pixel clock.
   input wire  [25:0] strRGB_i,     // Input RGB stream.
   input wire  [9:0]  pos,          // Player position. 
   output wire [25:0] strRGB_o      // Output RGB stream.
);

    // Bit address alias. 
    `define Active 0:0
    `define VS 1:1
    `define HS 2:2
    `define YC 12:3
    `define XC 22:13
    `define R 23:23
    `define G 24:24
    `define B 25:25
    `define RGB 25:23
    `define VGA 22:0
    
    // Player dimension.
    parameter size_player = 80;
    parameter width_player = 10;

    localparam width_screen = 800;
    localparam height_screen = 600;

    parameter [2:0] white = 3'b111;

    // Output RGB stream pipeline register.
    reg [25:0] strRGB_reg;

    // Pipeline register for RGB stream.
    assign strRGB_o = strRGB_reg;

    // Draw player.
    always @(posedge px_clk)
    begin
        // Clone VGA stream in an output RGB stream.
        strRGB_reg[`VGA] <= strRGB_i[`VGA];

        // Which player type?
        case (type_ply)
            // Vertical player.
            1'b0 :
                begin
                strRGB_reg[`RGB] <= (
                                (strRGB_i[`YC] > pos) && (strRGB_i[`YC] < pos+size_player) &&
                                (strRGB_i[`XC] > pos_offset) && (strRGB_i[`XC] < pos_offset + width_player)
                                ) ? white : strRGB_i[`RGB];
                end
            // Horizontal player.
            1'b1 :
                begin
                strRGB_reg[`RGB] <= (
                                (strRGB_i[`XC] > pos) && (strRGB_i[`XC] < pos+size_player) &&
                                (strRGB_i[`YC] > pos_offset) && (strRGB_i[`YC] < pos_offset + width_player)
                                ) ? white : strRGB_i[`RGB];
                end
        endcase
    end

endmodule
