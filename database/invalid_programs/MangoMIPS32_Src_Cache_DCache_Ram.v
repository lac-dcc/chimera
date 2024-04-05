/********************MangoMIPS32*******************
Filename:   DCache_Ram.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module DCache_Ram
(
    input  wire             clk,
    input  wire             enb,
    input  wire [`ByteWEn]  wea,  web,
    input  wire [`D_ramad]  ada,  adb,
    input  wire [`DataBus]  dina, dinb,
    output wire [`DataBus]  dout
);
    
    wire [`D_ramad] addr = enb ? adb  : ada;
    wire [`ByteWEn] wen  = enb ? web  : wea;
    wire [`DataBus] din  = enb ? dinb : dina;
    
    DCache_Ram_IP unit0 (
        .clk    (clk            ),
        .we     (wen [0]        ),
        .a      (addr           ),
        .d      (din [`Byte0]   ),
        .spo    (dout[`Byte0]   )
    );

    DCache_Ram_IP unit1 (
        .clk    (clk            ),
        .we     (wen [1]        ),
        .a      (addr           ),
        .d      (din [`Byte1]   ),
        .spo    (dout[`Byte1]   )
    );

    DCache_Ram_IP unit2 (
        .clk    (clk            ),
        .we     (wen [2]        ),
        .a      (addr           ),
        .d      (din [`Byte2]   ),
        .spo    (dout[`Byte2]   )
    );
    
    DCache_Ram_IP unit3 (
        .clk    (clk            ),
        .we     (wen [3]        ),
        .a      (addr           ),
        .d      (din [`Byte3]   ),
        .spo    (dout[`Byte3]   )
    );

endmodule