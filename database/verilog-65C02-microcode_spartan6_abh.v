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
    output [7:0] PCH,       // Program Counter high
    output [7:0] ADH        // unregistered version of ABH
);

wire [7:0] ABH;
wire [7:0] PCH1;
wire  [7:0] base;

/*
 * adh mux 
 *
 * op   | base
 * =====|========
 * 00-- | 00
 * 01-- | ABH 
 * 10-- | PCH 
 * 11-- | DB 
 *
 */

mux8_3 #(.INIT(32'hf0ccaa00)) adh_mux (
    .I0(ABH),
    .I1(PCH),
    .I2(DB),
    .op({1'b0,op[3:2]}),
    .O(base) );

/*
 * adh adder
 *
 *   op | value added to base
 * =====|====================
 * --00 | +0 
 * --01 | +1 
 * --10 | +CI 
 * --11 | -1 + CI 
 */

add8_2b #(.INIT0(64'h965a_965a_28a0_28a0),
          .INIT1(64'h9aaa_9aaa_2000_2000)) adh_add (
    .CI(0),
    .I0(base),
    .I1({8{CI}}),
    .op(op[1:0]),
    .O(ADH) );

/* 
 * ABH register
 *
 * ABH <= ADH
 */ 
reg8 abh( 
    .clk(clk),
    .EN(rdy),
    .RST(1'b0),
    .D(ADH),
    .Q(ABH) );

/*
 * update PCH (program counter high)
 * 
 * if( ld_pc )
 *     PCH <= ABH + inc_pc
 */

inc8 pch_inc(
    .CI(inc_pc),
    .I(ABH),
    .O(PCH1) );

/* 
 * PCL register
 */
reg8 pch( 
    .clk(clk),
    .EN(ld_pc),
    .RST(1'b0),
    .D(PCH1),
    .Q(PCH) );

endmodule
