`default_nettype none

module top (
    input  wire       clk    ,
    input  wire       reset_n,
    input  wire       adj_hrs,
    input  wire       adj_min,
    input  wire       adj_sec,
    output wire       hsync  ,
    output wire       vsync  ,
    output wire [5:0] rrggbb
);

    wire px_clk;

    // Generated values for pixel clock of 31.5Mhz and 72Hz frame frecuency.
    // # icepll -i12 -o31.5
    //
    // F_PLLIN:    12.000 MHz (given)
    // F_PLLOUT:   31.500 MHz (requested)
    // F_PLLOUT:   31.500 MHz (achieved)
    //
    // FEEDBACK: SIMPLE
    // F_PFD:   12.000 MHz
    // F_VCO: 1008.000 MHz
    //
    // DIVR:  0 (4'b0000)
    // DIVF: 83 (7'b1010011)
    // DIVQ:  5 (3'b101)
    //
    // FILTER_RANGE: 1 (3'b001)
    //
    `ifdef SYNTH
        SB_PLL40_PAD #(
            .FEEDBACK_PATH("SIMPLE"  ),
            .DIVR         (4'b0000   ),
            .DIVF         (7'b1010011),
            .DIVQ         (3'b101    ),
            .FILTER_RANGE (3'b001    )
        ) uut (
            .RESETB    (1'b1  ),
            .BYPASS    (1'b0  ),
            .PACKAGEPIN(clk   ),
            .PLLOUTCORE(px_clk)
        );
    `else
        assign px_clk = clk;
    `endif

    vga_clock i_vga_clock (
        .clk    (px_clk ),
        .reset_n(reset_n),
        .adj_hrs(adj_hrs),
        .adj_min(adj_min),
        .adj_sec(adj_sec),
        .hsync  (hsync  ),
        .vsync  (vsync  ),
        .rrggbb (rrggbb )
    );

endmodule
