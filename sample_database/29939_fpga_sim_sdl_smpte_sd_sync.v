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

    // 576p SD Timing Parameters
    localparam H_ACTIVE = 720;
    localparam H_FPORCH = 12;
    localparam H_SYNC_S = 732;
    localparam H_SYNC_L = 64;
    localparam H_SYNC_E = 796;
    localparam H_BPORCH = 68;
    localparam H_TOTAL  = 864;
    localparam V_ACTIVE = 576;
    localparam V_FPORCH = 5;
    localparam V_SYNC_S = 581;
    localparam V_SYNC_L = 5;
    localparam V_SYNC_E = 586;
    localparam V_BPORCH = 39;
    localparam V_TOTAL  = 625;
    localparam PIX_FREQ = 27e6;

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
