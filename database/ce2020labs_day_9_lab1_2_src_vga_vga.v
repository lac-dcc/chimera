// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module vga
# (
    parameter N_MIXER_PIPE_STAGES = 0,

              HPOS_WIDTH=0,
              VPOS_WIDTH=0,

              // Horizontal constants

              H_DISPLAY=0,  // Horizontal display width
              H_FRONT=0,  // Horizontal right border (front porch)
              H_SYNC=0,  // Horizontal sync width
              H_BACK=0,  // Horizontal left border (back porch)

              // Vertical constants

              V_DISPLAY=0,  // Vertical display height
              V_BOTTOM=0,  // Vertical bottom border
              V_SYNC=0,  // Vertical sync # lines
              V_TOP=0  // Vertical top border
)
(
    input                         clk,
    input                         reset,
	 input								 enable,
    output reg                    hsync,
    output reg                    vsync,
    output reg                    display_on,
    output reg [HPOS_WIDTH - 1:0] hpos,
    output reg [VPOS_WIDTH - 1:0] vpos
);

    

    localparam H_SYNC_START  = H_DISPLAY    + H_FRONT + N_MIXER_PIPE_STAGES,
               H_SYNC_END    = H_SYNC_START + H_SYNC  - 1,
               H_MAX         = H_SYNC_END   + H_BACK,

               V_SYNC_START  = V_DISPLAY    + V_BOTTOM,
               V_SYNC_END    = V_SYNC_START + V_SYNC  - 1,
               V_MAX         = V_SYNC_END   + V_TOP;

    
    reg [HPOS_WIDTH - 1:0] d_hpos;
    reg [VPOS_WIDTH - 1:0] d_vpos;

    always @*
    begin
        if (hpos == H_MAX)
        begin
            d_hpos = 1'd0;

            if (vpos == V_MAX)
                d_vpos = 1'd0;
            else
                d_vpos = vpos + 1'd1;
        end
        else
        begin
          d_hpos = hpos + 1'd1;
          d_vpos = vpos;
        end
    end

	 //!!!I replaced the clock divider with pll.
	 
   

    always @ (posedge clk or posedge reset)
    begin
        if (reset)
        begin
            hsync       <= 1'b0;
            vsync       <= 1'b0;
            display_on  <= 1'b0;
            hpos        <= 1'b0;
            vpos        <= 1'b0;
        end
        else if (enable)
        begin
            hsync       <= ~ (    d_hpos >= H_SYNC_START
                               && d_hpos <= H_SYNC_END   );

            vsync       <= ~ (    d_vpos >= V_SYNC_START
                               && d_vpos <= V_SYNC_END   );

            display_on  <=   (    d_hpos <  H_DISPLAY
                               && d_vpos <  V_DISPLAY    );

            hpos        <= d_hpos;
            vpos        <= d_vpos;
        end
    end
	 
	 

endmodule
