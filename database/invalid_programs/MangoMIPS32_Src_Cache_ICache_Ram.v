/********************MangoMIPS32*******************
Filename:   ICache_Ram.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module ICache_Ram
(
    input  wire             clk,
    input  wire             wen,
    input  wire [`I_ramad]  adw,
    input  wire [`I_ramad]  adr,
    input  wire [`DataBus]  din,
    output wire [`DataBus]  dout
);

    ICache_Ram_IP icache_ram (
        .clk    (clk            ),
        .we     (wen            ),
        .a      (adw            ),
        .d      (din            ),
        .dpra   (adr            ),
        .dpo    (dout           )
    );
    
endmodule