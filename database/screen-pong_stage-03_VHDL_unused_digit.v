////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: digit.v
//
// Description: Draw a simple digit in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module digit
#(
    parameter color = 3'b111
)(
    input  wire        px_clk,      // Pixel clock.
    input  wire [25:0] strRGB_i,    // Input RGB stream.
    input  wire [9:0]  pos_x,       // X number position.
    input  wire [9:0]  pos_y,       // Y number position.
    input  wire [3:0]  number,      // Number to stream.
    output wire [25:0] strRGB_o     // Output RGB stream.
);

    // Address alias. 
    `define YC 12:3
    `define XC 22:13
    `define RGB 25:23
    `define VGA 22:0

    // Number color and dimension.
    parameter wseg = 30;             // Width of a horizontal segment.
    parameter hseg = 10;             // Height of a horizontal segment.

    // Output RGB stream.
    reg [25:0] strRGB_reg;
    reg [6:0] segments;

    // Assign output stream.
    assign strRGB_o = strRGB_reg;

    // Task 1: Get the segments.
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

    // Task 2: Draw the number.
    always @(posedge px_clk)
    begin
        // Clone VGA stream from in to an out RGB stream.
        strRGB_reg[`VGA] <= strRGB_i[`VGA];

        // Draw the number.
        strRGB_reg[`RGB] <= (
                // Draw segment "a".
                (segments[6]) &&
                (strRGB_i[`YC] > pos_y) && (strRGB_i[`YC] < pos_y + hseg) &&
                (strRGB_i[`XC] > pos_x) && (strRGB_i[`XC] < pos_x + wseg)
                ) || (
                // Draw segment "b".
                (segments[5]) &&
                (strRGB_i[`YC] > pos_y) && (strRGB_i[`YC] < pos_y+wseg) &&
                (strRGB_i[`XC] > pos_x+wseg-hseg) && (strRGB_i[`XC] < pos_x+wseg)
                ) || (
                // Draw segment "c".
                (segments[4]) &&
                (strRGB_i[`YC] > pos_y+wseg-hseg) && (strRGB_i[`YC] < pos_y+2*wseg-hseg) &&
                (strRGB_i[`XC] > pos_x+wseg-hseg) && (strRGB_i[`XC] < pos_x+wseg)
                ) || (
                // Draw segment "d".
                (segments[3]) &&
                (strRGB_i[`YC] > pos_y+2*(wseg-hseg)) && (strRGB_i[`YC] < pos_y+2*wseg-hseg) &&
                (strRGB_i[`XC] > pos_x) && (strRGB_i[`XC] < pos_x+wseg)
                ) || (
                // Draw segment "e".
                (segments[2]) &&
                (strRGB_i[`YC] > pos_y+wseg-hseg) && (strRGB_i[`YC] < pos_y+2*wseg-hseg) &&
                (strRGB_i[`XC] > pos_x) && (strRGB_i[`XC] < pos_x+hseg)
                ) || (
                // Draw segment "f".
                (segments[1]) &&
                (strRGB_i[`YC] > pos_y) && (strRGB_i[`YC] < pos_y+wseg) &&
                (strRGB_i[`XC] > pos_x) && (strRGB_i[`XC] < pos_x+hseg)
                ) || (
                // Draw segment "g".
                (segments[0]) &&
                (strRGB_i[`YC] > pos_y+wseg-hseg) && (strRGB_i[`YC] < pos_y+wseg) &&
                (strRGB_i[`XC] > pos_x) && (strRGB_i[`XC] < pos_x+wseg)
                ) ? color : strRGB_i[`RGB];
    end

endmodule
