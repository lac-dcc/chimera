// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module draw(
    input               CLK,
    input               ACTIVE,
    input               VSYNC,
    input       [12:0]  h,
    input       [12:0]  v,
    input       [7:0]   colour,
    output wire [7:0]   rgb
);

    localparam H_ACTIVE = 1600;     // Horizontal active pixels
    localparam V_ACTIVE = 1200;     // Vertical active pixels
    localparam I_WIDTH  = 256;      // Image horizontal size
    localparam I_HEIGHT = 114;      // Image vertical size

    reg [14:0] rom_addr;
    wire [7:0] rom_data;
    rom img_rom (
        .clka(CLK),
        .addra(rom_addr),
        .douta(rom_data)
    );

    // Image starts top left (0, 0) heading down-right
    reg [7:0]  rgb_out;     // RRRGGGBB pixel data
    reg [12:0]  o_x = 2;    // Image horizontal origin
    reg [12:0]  o_y = 2;    // Image vertical origin
    reg         d_x = 1;    // Image horizontal direction
    reg         d_y = 1;    // Image vertical direction
    reg         top, left;  // Frame quadrant flags
    //reg [12:0]  o_x = (H_ACTIVE / 2) - (I_WIDTH / 2);   // Image horizontal origin (centered)
    //reg [12:0]  o_y = (V_ACTIVE / 2) - (I_HEIGHT / 2);  // Image vertical origin (centered)

    always @(posedge CLK) begin
        // Check if within image bounds
        if (h >= o_x && h < (o_x + I_WIDTH) && v >= o_y && v < (o_y + I_HEIGHT))
            begin
                rom_addr <= ((v - o_y) * I_WIDTH) + (h - o_x);
                //rgb_out[7:0] <= rom_data == 8'hFF ? colour : 8'b0;
                rgb_out[7:0] <= rom_data;
            end
        else
            begin
                rgb_out[7:0] <= 8'b0;
            end

        // RGBW Quadrants
        //top <= h < (H_ACTIVE / 2);
        //left <= v < (V_ACTIVE / 2);
        //rgb_out[7:5] <= (top && left)  || (~top && ~left) ? 7 : 0;
        //rgb_out[4:2] <= (top && ~left) || (~top && ~left) ? 7 : 0;
        //rgb_out[1:0] <= (~top && left) || (~top && ~left) ? 3 : 0;
    end

    // Update image position and direction on new frame
    always @(negedge VSYNC) begin
        // Increment or decrement image origin based on direction flags
        o_x <= d_x ? o_x + 1 : o_x - 1;
        o_y <= d_y ? o_y + 1 : o_y - 1;

        // If image has hit far right of frame, change direction
        if (o_x + I_WIDTH == H_ACTIVE)
            begin
                d_x <= 0;
            end
        
        // If image has hit far left of frame, change direction
        if (o_x == 1)
            begin
                d_x <= 1;
            end
        
        // If image has hit bottom of frame, change direction
        if (o_y + I_HEIGHT == V_ACTIVE)
            begin
                d_y <= 0;
            end
        
        // If image has hit top of frame, change direction
        if (o_y == 1)
            begin
                d_y <= 1;
            end
    end

    assign rgb = ACTIVE ? rgb_out : 8'b00000000;
endmodule
