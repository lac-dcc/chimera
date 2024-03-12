/*
 * abl -- outputs ABL (Address Bus Low)
 *
 * (C) Arlet Ottens <arlet@c-scape.nl> 
 *
 */

module abl( 
    input clk,
    input rdy, 
    input CI,               // carry input
    input cond,             // condition code input
    output CO,              // carry output
    input [7:0] DB,         // Data Bus 
    input [7:0] REG,        // output from register file
    input [3:0] op,         // operation
    input ld_ahl,           // indicates whether AHL should be loaded
    input ld_pc,            // indicates whether PCL should be loaded
    input inc_pc,           // indicates whether PCL should be incremented
    output pcl_co,          // Carry out from PCL
    output [7:0] PCL,       // Program Counter low
    output [7:0] ADL        // unregistered version of output
);

wire [7:0] AHL;
wire [7:0] ABL;
wire [7:0] base;

/*
 * AHL register. The AHL (Address Hold Low register) is a temporary
 * storage for DB input, most notably for use in 16 bit address
 * fetches, such as in the absolute addressing modes.
 *
 * Sometimes the DB has to be held over multiple cycles, such as
 * for JSR which fetches first operand byte before pushing old
 * PC to the stack, and then fetches 2nd operand byte.
 */

reg8 ahl( 
    .clk(clk),
    .EN(ld_ahl),
    .RST(1'b0),
    .D(DB),
    .Q(AHL) );

/*
 * ABL logic has 2 stages. First stage selects a base register, 
 * 2nd stage adds an offset.
 *
 * There are a total of 6 useful combinations. 
 *
 * operation  | op[1:0] | application
 * ===========|=========|================================
 * PCL + 00   |   00    | PC restore
 * REG + 00   |   01    | stack access or vector pull 
 * ABL + DB   |   10    | take branch 
 * ABL + 00   |   01    | stay at current or move to next
 * REG + DB   |   10    | zeropage + index
 * REG + AHL  |   11    | abs + index
 * ======================================================
 * 
 */

/*   
 * First stage. Select base value. 
 *
 *  casez( {cond, op[3:2]} )
 *      3'b?00: base = 8'h00;
 *      3'b?01: base = PCL;
 *      3'b?10: base = AHL;
 *      3'b011: base = 8'h00; 
 *      3'b111: base = DB;
 *  endcase
 */ 

mux8_3 #(.INIT(64'haaccf000_00ccf000)) adl_base_mux(
    .O(base),
    .I0(DB),
    .I1(AHL),
    .I2(PCL),
    .op({cond, op[3:2]}) );

/*   
 * Second stage. Add offset.
 *
 *  case( op[1:0] )
 *      2'b00: {CO, ADL} = REG + CI;
 *      2'b01: {CO, ADL} = base + REG + CI;
 *      2'b10: {CO, ADL} = base + CI;
 *      2'b11: {CO, ADL} = base + ABL + CI;
 *  endcase
 */
add8_3 #(.INIT(64'h5aaa66cc_a0008800)) abl_add( 
    .CI(CI),
    .CO(CO),
    .I0(base),
    .I1(REG),
    .I2(ABL),
    .op(op[1:0]),
    .O(ADL) );

/* 
 * ABL register
 *
 * if( RDY )
 *    ABL <= ADL
 */ 
reg8 abl( 
    .clk(clk),
    .EN(rdy),
    .RST(1'b0),
    .D(ADL),
    .Q(ABL) );

/*
 * update PCL (program counter low)
 *
 * if( ld_pc )
 *     PCL <= ABL + inc_pc
 * 
 */
wire [7:0] PCL1;

inc8 pcl_inc( 
    .I(ABL),
    .CI(inc_pc),
    .O(PCL1),
    .CO(pcl_co) );

/* 
 * PCL register
 */
reg8 pcl( 
    .clk(clk),
    .EN(ld_pc),
    .RST(1'b0),
    .D(PCL1),
    .Q(PCL) );

endmodule
