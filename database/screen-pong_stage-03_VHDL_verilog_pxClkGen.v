////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: pxClkGen
//
// Description: Genera, utilizando el bloque PLL interno de Lattice y el reloj
//              del sistema, la frecuencia de pixel de 50.0Mhz necesaria para
//              un modo 800x600@72Hz.
//
// Dependencies:
//      SB_PLL40_CORE
//
// Revisions: 
//     0.01 - Fichero creado.
//
// Additional Comments:
//            Se deja como parámetro el "Feedback divider" para poder adaptar
//            el bloque según la frecuencia de entrada del reloj de cada
//            tarjeta.
//
////////////////////////////////////////////////////////////////////////////////
module pxClkGen #(
        parameter FDivider = 7'd49      // Feedback divider default for 16Mhz->50Mhz.
)
(
        input wire       sys_clk,       // System clock (16Mhz)
        output wire      px_clk         // Pixel clock.
);
 
// Generated values for pixel clock of 50.0Mhz for 800x600@72Hz.
// $ ./icepll -i 16 -o 50
// F_PLLIN:    16.000 MHz (given)
// F_PLLOUT:   50.000 MHz (requested)
// F_PLLOUT:   50.000 MHz (achieved)
//
// FEEDBACK: SIMPLE
// F_PFD:   16.000 MHz
// F_VCO:  800.000 MHz
// 
// DIVR:  0 (4'b0000)
// DIVF: 49 (7'b0110001)
// DIVQ:  4 (3'b100)
//
//FILTER_RANGE: 1 (3'b001)
//
SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                .PLLOUT_SELECT("GENCLK"),
                .DIVR(4'd0),
                .DIVF(FDivider),
                .DIVQ(3'd4),
                .FILTER_RANGE(3'b001)
        )
        uut
        (
                .REFERENCECLK(sys_clk),
                .PLLOUTCORE(px_clk),
                .RESETB(1'b1),
                .BYPASS(1'b0)
        );

endmodule
