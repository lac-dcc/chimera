// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module color_square
# (
    parameter HPOS_WIDTH          = 10,
              VPOS_WIDTH          = 10,

              // Display constants
              H_DISPLAY           = 640,  // Horizontal display width
              V_DISPLAY           = 480   // Vertical display height
)

(
    input                          clk,
    input                          reset,
    input                          display_on,
    input                    [3:0] key_sw,
    input       [HPOS_WIDTH - 1:0] hpos,
    input       [VPOS_WIDTH - 1:0] vpos,
    output reg  [2:0]              rgb
);

    always @ (posedge clk or posedge reset)
        if (reset)
            rgb <= 3'b000;
        else if (! display_on)
            rgb <= 3'b000;
            else if (key_sw[3])
                rgb <= 3'b100;
            else if (key_sw[2])
                rgb <= 3'b010;
            else if (key_sw[1])
                rgb <= 3'b001;
            else
                if  (key_sw[0]) 
                    if (vpos < V_DISPLAY/3)
                        if (hpos < H_DISPLAY/3)
                            rgb <= 3'b100;
                        else if (hpos < H_DISPLAY*2/3)
                            rgb <= 3'b010;
                        else
                            rgb <= 3'b001;
                            
                    else if (vpos < V_DISPLAY*2/3)
                        if (hpos < H_DISPLAY/3)
                            rgb <= 3'b110;
                        else if (hpos < H_DISPLAY*2/3)
                            rgb <= 3'b011;
                        else
                            rgb <= 3'b101;
                            
                    else
                        if (hpos < H_DISPLAY/3)
                            rgb <= 3'b000;
                        else if (hpos < H_DISPLAY*2/3)
                            rgb <= 3'b111;
                        else
                            rgb <= 3'b000;
            else 
                rgb <= 3'b000;

endmodule
