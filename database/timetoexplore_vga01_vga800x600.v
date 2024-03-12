// FPGA VGA Graphics Part 1: 800x600 60Hz VGA Driver
// (C)2018 Will Green - Licensed under the MIT License
// Learn more at https://timetoexplore.net/blog/arty-fpga-vga-verilog-01

// For 60 Hz VGA i_pix_stb must be 40 MHz
// Details in tutorial: https://timetoexplore.net/blog/arty-fpga-vga-verilog-01

`default_nettype none

module vga800x600(
    input wire i_clk,           // base clock
    input wire i_pix_stb,       // pixel clock strobe
    input wire i_rst,           // reset: restarts frame
    output wire o_hs,           // horizontal sync
    output wire o_vs,           // vertical sync
    output wire o_blanking,     // high during blanking interval
    output wire o_active,       // high during active pixel drawing
    output wire o_screenend,    // high for one tick at the end of screen
    output wire o_animate,      // high for one tick at end of active drawing
    output wire [10:0] o_x,     // current pixel x position
    output wire  [9:0] o_y      // current pixel y position
    );

    // VGA timings https://timetoexplore.net/blog/video-timings-vga-720p-1080p
    localparam HS_STA = 40;              // horizontal sync start
    localparam HS_END = 40 + 128;        // horizontal sync end
    localparam HA_STA = 40 + 128 + 88;   // horizontal active pixel start
    localparam VS_STA = 600 + 1;         // vertical sync start
    localparam VS_END = 600 + 1 + 4;     // vertical sync end
    localparam VA_END = 600;             // vertical active pixel end
    localparam LINE   = 1056;            // complete line (pixels)
    localparam SCREEN = 628;             // complete screen (lines)

    reg [10:0] h_count; // line position
    reg  [9:0] v_count; // screen position

    // generate sync signals (active high for 800x600)
    assign o_hs = ((h_count >= HS_STA) & (h_count < HS_END));
    assign o_vs = ((v_count >= VS_STA) & (v_count < VS_END));

    // keep x and y bound within the active pixels
    assign o_x = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
    assign o_y = (v_count >= VA_END) ? (VA_END - 1) : (v_count);

    // blanking: high within the blanking period
    assign o_blanking = ((h_count < HA_STA) | (v_count > VA_END - 1));

    // active: high during active pixel drawing
    assign o_active = ~((h_count < HA_STA) | (v_count > VA_END - 1)); 

    // screenend: high for one tick at the end of the screen
    assign o_screenend = ((v_count == SCREEN - 1) & (h_count == LINE));

    // animate: high for one tick at the end of the final active pixel line
    assign o_animate = ((v_count == VA_END - 1) & (h_count == LINE));

    always @ (posedge i_clk)
    begin
        if (i_rst)  // reset to start of frame
        begin
            h_count <= 0;
            v_count <= 0;
        end
        if (i_pix_stb)  // once per pixel
        begin
            if (h_count == LINE)  // end of line
            begin
                h_count <= 0;
                v_count <= v_count + 1;
            end
            else 
                h_count <= h_count + 1;

            if (v_count == SCREEN)  // end of screen
                v_count <= 0;
        end
    end
endmodule
