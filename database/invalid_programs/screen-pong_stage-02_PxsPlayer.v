//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 12/03/2018
// Module Name: PxsPlayer
// Description: Draw a player in a stream RGB.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module PxsPlayer
#(
   parameter type = 1'b0,          // Type of player. [Horizontal, Vertical]
   parameter pos_offset = 100      // Offset from border.
)(
   input wire        px_clk,       // Pixel clock.
   input wire [25:0] RGBStr_i,     // Input RGB stream.
   input wire [9:0]  pos,          // Player position. 
   output reg [25:0] RGBStr_o      // Output RGB stream.
);

// Alias 
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

localparam width_screen = 640;
localparam height_screen = 480;

parameter [3:0] white = 3'b111;

// Task 1: Draw player.
always @(posedge px_clk)
begin
    // Clone VGA stream in a RGB stream.
    RGBStr_o[`VGA] <= RGBStr_i[`VGA];

    // Which player type?
    case (type)
        // Vertical player.
        1'b0 :
             begin
             RGBStr_o[`RGB] <= (
                               (RGBStr_i[`YC] > pos) && (RGBStr_i[`YC] < pos+size_player) &&
                               (RGBStr_i[`XC] > pos_offset) && (RGBStr_i[`XC] < pos_offset + width_player)
                               ) ? white : RGBStr_i[`RGB];
             end

             // Horizontal player.
        1'b1 :
             begin
             RGBStr_o[`RGB] <= (
                               (RGBStr_i[`XC] > pos) && (RGBStr_i[`XC] < pos+size_player) &&
                               (RGBStr_i[`YC] > pos_offset) && (RGBStr_i[`YC] < pos_offset + width_player)
                               ) ? white : RGBStr_i[`RGB];
             end
/*
        // Some error in type -> player RED.
        default :
            begin
            RGBStr_o[`RGB] <= (
                              (RGBStr_i[`XC] > pos) && (RGBStr_i[`XC] < pos+size_player) &&
                              (RGBStr_i[`YC] > pos_offset) && (RGBStr_i[`YC] < pos_offset + width_player)
                               ) ? 3'b100 : RGBStr_i[`RGB];
            end
*/
    endcase
end

endmodule
