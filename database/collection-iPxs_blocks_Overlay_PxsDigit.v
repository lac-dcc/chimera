//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 18/03/2018 
// Module Name: PxsDigit
// Description: Draw a simple digit in a stream RGB.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments:
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "Pxs.vh"

module PxsDigit #(
        parameter color = 3'b111)
        (
        input wire        px_clk,      // Pixel clock.
        input wire [25:0] RGBStr_i,    // Input RGB stream.
        input wire [9:0]  pos_x,       // X number position.
        input wire [9:0]  pos_y,       // Y number position.
        input wire [3:0]  number,      // Number to stream.
        output reg [25:0] RGBStr_o     // Output RGB stream.
        );


// Number color and dimension.
parameter wseg = 30;             // Width of a horizontal segment.
parameter hseg = 10;             // Height of a horizontal segment.

reg [6:0] segments;

// Stage0: Get the segments.
always @(posedge px_clk)
begin
    case (number)
        4'd0: segments <= 7'b1111110;    // Zero
        4'd1: segments <= 7'b0110000;    // One
        4'd2: segments <= 7'b1101101;    // Two
        4'd3: segments <= 7'b1111001;    // Three
        4'd4: segments <= 7'b0110011;    // Four
        4'd5: segments <= 7'b1011011;    // Five
        4'd6: segments <= 7'b1011111;    // Six
        4'd7: segments <= 7'b1110000;    // Seven
        4'd8: segments <= 7'b1111111;    // Eight
        4'd9: segments <= 7'b1110011;    // Nine
        4'hA: segments <= 7'b1110111;    // A
        4'hB: segments <= 7'b0011111;    // B
        4'hC: segments <= 7'b1001110;    // C
        4'hD: segments <= 7'b0111101;    // D
        4'hE: segments <= 7'b1001111;    // E
        4'hF: segments <= 7'b1000111;    // F
//      default: segments = 7'b0000000;  // Off
    endcase
end

// Stage1: Draw the number.
always @(posedge px_clk)
begin
    // Clone VGA stream in a RGB stream.
    RGBStr_o[`VGA] <= RGBStr_i[`VGA];

    // Draw the number.
    RGBStr_o[`RGB] <= (
               // Draw segment "a".
               (segments[6]) &&
               (RGBStr_i[`YC] > pos_y) && (RGBStr_i[`YC] < pos_y + hseg) &&
               (RGBStr_i[`XC] > pos_x) && (RGBStr_i[`XC] < pos_x + wseg)
               ) || (
               // Draw segment "b".
               (segments[5]) &&
               (RGBStr_i[`YC] > pos_y) && (RGBStr_i[`YC] < pos_y+wseg) &&
               (RGBStr_i[`XC] > pos_x+wseg-hseg) && (RGBStr_i[`XC] < pos_x+wseg)
               ) || (
               // Draw segment "c".
               (segments[4]) &&
               (RGBStr_i[`YC] > pos_y+wseg-hseg) && (RGBStr_i[`YC] < pos_y+2*wseg-hseg) &&
               (RGBStr_i[`XC] > pos_x+wseg-hseg) && (RGBStr_i[`XC] < pos_x+wseg)
               ) || (
               // Draw segment "d".
               (segments[3]) &&
               (RGBStr_i[`YC] > pos_y+2*(wseg-hseg)) && (RGBStr_i[`YC] < pos_y+2*wseg-hseg) &&
               (RGBStr_i[`XC] > pos_x) && (RGBStr_i[`XC] < pos_x+wseg)
               ) || (
               // Draw segment "e".
               (segments[2]) &&
               (RGBStr_i[`YC] > pos_y+wseg-hseg) && (RGBStr_i[`YC] < pos_y+2*wseg-hseg) &&
               (RGBStr_i[`XC] > pos_x) && (RGBStr_i[`XC] < pos_x+hseg)
               ) || (
               // Draw segment "f".
               (segments[1]) &&
               (RGBStr_i[`YC] > pos_y) && (RGBStr_i[`YC] < pos_y+wseg) &&
               (RGBStr_i[`XC] > pos_x) && (RGBStr_i[`XC] < pos_x+hseg)
               ) || (
               // Draw segment "g".
               (segments[0]) &&
               (RGBStr_i[`YC] > pos_y+wseg-hseg) && (RGBStr_i[`YC] < pos_y+wseg) &&
               (RGBStr_i[`XC] > pos_x) && (RGBStr_i[`XC] < pos_x+wseg)
               ) ? color : RGBStr_i[`RGB];
end

endmodule
