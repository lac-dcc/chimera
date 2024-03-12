module alt_top(
            input OSCCLK,
            output hsync,
            output vsync,
            output [2:0] red,
            output [2:0] green,
            output [1:0] blue,
            
            output [7:0] sseg,
            output [3:0] an,
            
            input ps2_clk,
            input ps2_data
    );

    wire [7:0] wr;
    wire [7:0] wg;
    wire [7:0] wb;

    assign red = wr[7:5];
    assign green = wg[7:5];
    assign blue = wb[7:6];

    demo_root alt_map(
                .OSCCLK(OSCCLK),
                .hsync(hsync),
                .vsync(vsync),
                .red(wr),
                .green(wg),
                .blue(wb),
                .sseg(sseg),
                .an(an),
                .ps2_clk(ps2_clk),
                .ps2_data(ps2_data)
                );


endmodule

