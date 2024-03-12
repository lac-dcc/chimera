////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: endframeVGA.v
//
// Description: Check for an 'endframe' signal in a VGA stream.
//
// Dependencies:
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module endframeVGA (
    input wire  [22:0] strVGA,      // Stream VGA input.
    output wire        endframe     // End frame signal.
);

    // Dimensions.
    localparam width_screen = 800;
    localparam height_screen = 600;

    // Alias address in stream.
    `define XC 22:13
    `define YC 12:3

    // Check endframe.
    assign  endframe = ((strVGA[`XC]==width_screen-1) && (strVGA[`YC]==height_screen-1)) ? 1'b1 : 1'b0;

endmodule
