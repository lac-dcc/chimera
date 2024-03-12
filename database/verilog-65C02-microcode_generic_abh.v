/*
 * abh -- calculates next value of ABH (Address Bus High)
 *
 * (C) Arlet Ottens <arlet@c-scape.nl> 
 */
module abh( 
    input clk,
    input rdy,
    input CI,               // carry input from ABL module
    input [7:0] DB,         // Data Bus
    input [3:0] op,         // operation
    input ld_pc,            // load PC 
    input inc_pc,           // increment PC
    output reg [7:0] PCH,   // Program Counter high
    output reg [7:0] ADH    // unregistered version of ABH
);

reg [7:0] ABH;
reg [7:0] base;

/*   
 *  op  |  base
 * =====|========= 
 * 00-- |  00
 * 01-- |  ABH
 * 10-- |  PCH
 * 11-- |  DB
 */ 
always @(*)
    case( op[3:2] )
        2'b00: base = 8'h0; 
        2'b01: base = ABH; 
        2'b10: base = PCH;
        2'b11: base = DB;
    endcase

 
/*
 * ADH adder
 *
 *  op  | value added to base
 * =====|====================
 * --00 | +0 
 * --01 | +1 
 * --10 | +CI 
 * --11 | -1 + CI 
 */

always @(*)
    casez( {CI, op[1:0]} )
        3'b?00: ADH = base + 8'h00;
        3'b?01: ADH = base + 8'h01;
        3'b010: ADH = base + 8'h00;
        3'b110: ADH = base + 8'h01;
        3'b011: ADH = base + 8'hff;
        3'b111: ADH = base + 8'h00;
    endcase

/*
 * register the new value
 */
always @(posedge clk)
    if( rdy )
        ABH <= ADH;

/*
 * update Program Counter High
 */
always @(posedge clk)
    if( ld_pc & rdy )
        PCH <= ABH + inc_pc;

endmodule
