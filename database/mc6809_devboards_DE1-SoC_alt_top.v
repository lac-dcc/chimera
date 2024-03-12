module alt_top(
            input OSCCLK,
            output hsync,
            output vsync,
            output [7:0] red,
            output [7:0] green,
            output [7:0] blue,
            output       vgablank,
            output       vgasync,
            output       vga_clk,
            
            output [6:0] sseg1,
            output [6:0] sseg2,
            output [6:0] sseg3,
            output [6:0] sseg4,
            
            input ps2_clk,
            input ps2_data
    );


    wire led1_led2;
    wire led3;
    
    assign vgablank=1'b1;
    assign vgasync=1'b0;
    
    wire [3:0] an;
    wire [7:0] sseg;
    
    reg [6:0] seg1;
    reg [6:0] seg2;
    reg [6:0] seg3;
    reg [6:0] seg4;
    assign sseg1 = seg1;
    assign sseg2 = seg2;
    assign sseg3 = seg3;
    assign sseg4 = seg4;    
    
    wire [7:0] sseg_in;
    
    demo_root alt_map(
                .OSCCLK(OSCCLK),
                .hsync(hsync),
                .vsync(vsync),
                .red(red),
                .green(green),
                .blue(blue),
                .sseg(sseg_in),
                .an(an),
                .ps2_clk(ps2_clk),
                .ps2_data(ps2_data),
                .vga_clk(vga_clk)
                );
    always @(*)
    begin
        if (~an[0])
            seg1 = sseg_in[6:0];
        if (~an[1])
            seg2 = sseg_in[6:0];
        if (~an[2])
            seg3 = sseg_in[6:0];
        if (~an[3])
            seg4 = sseg_in[6:0];
    end

endmodule

