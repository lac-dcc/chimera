// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module sync(
    input               CLK,        // Pixel clock
    output              HSYNC,      // Horizontal sync pulse
    output              VSYNC,      // Vertical sync pulse
    output              ACTIVE,     // Active picture flag
    output reg [12:0]   h,          // Current horizontal position
    output reg [12:0]   v           // Current vertical position
);

    // 1080p HD Timing Parameters
    localparam H_ACTIVE = 1920;
    localparam H_FPORCH = 88;
    localparam H_SYNC_S = 2008;
    localparam H_SYNC_L = 44;
    localparam H_SYNC_E = 2052;
    localparam H_BPORCH = 148;
    localparam H_TOTAL  = 2200;
    localparam V_ACTIVE = 1080;
    localparam V_FPORCH = 4;
    localparam V_SYNC_S = 1084;
    localparam V_SYNC_L = 5;
    localparam V_SYNC_E = 1089;
    localparam V_BPORCH = 36;
    localparam V_TOTAL  = 1125;
    localparam PIX_FREQ = 148.5e6;

    // Update pixel position
    always @(posedge CLK) begin
        // Increment horizontal position
        // or reset if at last column in frame
        h <= h == H_TOTAL ? 0 : h + 1;

        // Increment vertical position after horizontal position reset
        // or reset if at last row in frame
        v = h == 0 ? (
            v == V_TOTAL ? 0 : v + 1
        ) : v;
    end


    // Generate horizontal and vertical sync pulses
    assign HSYNC  = ~( h >= H_SYNC_S && h <= H_SYNC_E );
    assign VSYNC  = ~( v >= V_SYNC_S && v <= V_SYNC_E );
    assign ACTIVE = h < H_ACTIVE && v < V_ACTIVE;

endmodule
