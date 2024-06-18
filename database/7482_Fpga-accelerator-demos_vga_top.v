// This program was cloned from: https://github.com/YutongChenVictor/Fpga-accelerator-demos
// License: MIT License

module vga_top(
    input           sys_clk     ,
    input           sys_rst_n   ,

    output          hs          ,
    output          vs          ,
	 output			  clk_25MHz	  ,
    output  [23:0]  color_rgb
);

wire    [ 9:0]  x_pix       ;
wire    [ 9:0]  y_pix       ;

wire    [23:0]  data        ;


vga vga_inst(
    .clk        (clk_25MHz      ),
    .rst_n      (sys_rst_n      ),

    .data       (data           ),

    .hs         (hs             ),
    .vs         (vs             ),

    .x_pix      (x_pix          ),
    .y_pix      (y_pix          ),

    .color_rgb  (color_rgb      )
);

rainbow_generate inst(
    .clk        (clk_25MHz      ),
    .rst_n      (sys_rst_n      ),

    .x_pix      (x_pix          ),
    .y_pix      (y_pix          ),

    .data       (data           )
);

PLL_25MHz clk_25MHz_generate(
    .refclk     (sys_clk        ),
    .rst        (~sys_rst_n     ),
    .outclk_0   (clk_25MHz      ),
    .locked     (locked         )
);
endmodule
