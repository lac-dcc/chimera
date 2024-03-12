/*
 * alu -- ALU for the 65C02
 *
 * (C) Arlet Ottens <arlet@c-scape.nl> 
 *
 * This ALU is divided into 2 stages. The first stage ('adder') 
 * does the logic/arithmetic operations. The second stage ('shifter')
 * optionally shifts the result from the adder by 1 bit position.
 *
 */
module alu( 
    input clk,              // clk
    input rdy,              // RDY input
    input sync,             // opcode sync
    input [7:0] R,          // input from register file
    input [7:0] DB,         // data bus
    input [8:0] op,         // 9-bit operation select
    input [9:0] flag_op,    // 10-bit flag operation select
    input B,                // BRK flag
    output mask_irq,        // one cycle early I flag notification 
    output [7:0] P,         // flags register
    output reg cond,        // condition code 
    output reg [7:0] OUT    // data out
);

reg CO, CO1;
reg N = 0, V = 0, D = 0, I = 0, Z = 0, C = 0;                   // processor status flags 
assign P = { N, V, 1'b1, B, D, I, Z, C };

reg [7:0] M;
reg CI, SI;

wire ld_m = op[8];
wire adj_m = op[7];

/*
 * distinguish ADC/SBC, not valid when doing
 * other operations.
 */
wire SBC = op[4];

/* 
 * are we using BCD style carry ?
 */
reg bcd_carry;

always @(posedge clk)
    if( rdy )
        bcd_carry <= !sync & adj_m;

/*
 * ALU carry in and shift in
 */
always @(*)
    case( op[1:0] )
        2'b00:      {SI, CI} = 2'b00;
        2'b01:      {SI, CI} = 2'b01;
        2'b10:      {SI, CI} = {C, 1'b0};
        2'b11:      {SI, CI} = {1'b0, (C & !bcd_carry) | (bcd_carry & SBC) };
    endcase

/*   
 * 1st stage, calculate adder result from the two operands:
 *
 * The 'R' input comes from source register in register file.
 * The 'M' input comes from memory register, holding previous
 * memory read result. This inputs are hard wired, meaning there
 * is no mux on the ALU inputs. 
 *
 * This layer can be optimized to single LUT6 per bit
 * on Spartan6, but that most likely requires manual
 * instantiation. 
 *
 *   op      function
 * ===============================
 * --000  |  AI | BI     OR 
 * --001  |  AI & BI     AND
 * --010  |  AI ^ BI     EOR
 * --011  |  AI + BI     ADC (also INC/DEC with suitable R)
 * --100  |  AI + 0      pass R or INC depending on CI
 * --101  |  AI - 1      DEC
 * --110  |  AI - BI     SBC/CMP
 * --111  | ~AI & BI     TRB
 *
 * NOTE: Carry input is always added to each function. This
 * is necessary to make it fit in a single LUT. If this is
 * not desired, make sure to set CI=0.
 *
 * Because CI is always added, we need a separate SI input
 * for the 2nd stage shifter, to make sure we can always 
 * set CI=0 while rotating with set carry bit.
 */ 

reg [8:0] adder;

/*
 * 8 bit inverted version of M and R (to avoid creating
 * 9 bit expressions)(when ~M is used in the expression, 
 */
wire [7:0] AI = R;
reg [7:0] BI;
wire [7:0] NB = ~BI;
wire [7:0] NA = ~AI;

always @(*)
    case( op[4:2] )
        3'b000: adder = (AI | BI)    + CI;
        3'b001: adder = (AI & BI)    + CI;
        3'b010: adder = (AI ^ BI)    + CI;
        3'b011: adder = (AI + BI)    + CI;
        3'b100: adder = (AI + 8'h00) + CI;
        3'b101: adder = (AI + 8'hff) + CI; 
        3'b110: adder = (AI + NB)    + CI;
        3'b111: adder = (BI & NA)    + CI;
    endcase

/*
 * intermediate borrow/carry bits. The number indicates 
 * which bit position the borrow or carry goes into.
 */
wire BC4 = adder[4] ^ AI[4] ^ BI[4];
wire BC7 = adder[7] ^ AI[7] ^ BI[7];
wire BC8 = SBC ^ adder[8];

/* 
 * BCD adjust for each of the 2 nibbles
 */
wire adjl;
wire adjh;
assign adjl = BC4 | adder[3:1] >= 5;
assign adjh = BC8 | adder[7:5] >= 5 | ((adder[7:4] == 9) & (adder[3:1] >= 5));

/*
 * partial zero flag signals. The z0 signal checks the middle 6 bits, the
 * z1 signal checks the outer 2 bits.
 */
wire z0 = ~|adder[6:1];
reg z1;

always @(*)
    casez( op[6:5] )
        2'b0?:  z1 = ~(adder[0] | adder[7]);
        2'b10:  z1 = ~(SI | adder[0]);
        2'b11:  z1 = ~(SI | adder[7]);
    endcase

/*
 * 2nd stage takes previous result, and
 * optionally shifts to left/right, or discards
 * it entirely and replaces it by 'M' input.
 *
 * Note: the adder carry out will be replaced by
 * the shifter carry out when a shift option is 
 * selected.
 * 
 * op       function
 * ===============================
 * 00---  | unmodified adder result
 * 10---  | adder shift left
 * 11---  | adder shift right
 */

always @(*)
    casez( op[6:5] )
        2'b0?: {CO, OUT} = adder;
        2'b10: {CO, OUT} = { adder[7:0], SI };
        2'b11: {OUT, CO} = { SI, adder[7:0] };
    endcase

/*
 * M register update. The M register holds the most
 * recent data on the bus. It feeds into the ALU, 
 * and also into flag updates.
 */

wire l = adjl;
wire h = adjh;

always @(posedge clk)
    if( ld_m & rdy )
        M <= DB;

/*
 * BI (B Input of the ALU) register update
 */
always @(posedge clk)
    if( ld_m & rdy )
        BI <= adj_m ? {1'b0, h, h, 2'b0, l, l, 1'b0 } : DB;

/*
 * update C(arry) flag
 */
wire plp = flag_op[2];

/*
 * the CO1 signal is the ALU carry out, delayed
 * by one cycle. This is because the BCD instructions
 * can generate a carry in the main cycle or the adjust
 * cycle.
 */

always @(posedge clk)
    if( rdy )
        CO1 <= CO;

always @(posedge clk)
    if( sync & rdy )
        if( flag_op[1] )
            if( bcd_carry )
                C <= (CO & !SBC) | CO1;  
            else
                C <= CO;  

/*
 * update N(egative) flag and Z(ero) flag
 *
 * The N/Z flags share two control bits in flags[4:3]
 *
 * 00 - do nothing
 * 01 - BIT (N <= M7, Z <= alu_out)
 * 10 - PLP
 * 11 - N/Z <= alu_out
 */
always @(posedge clk)
    if( sync & rdy )
        casez( flag_op[4:3] )
            2'b01 : N <= M[7];          // BIT (bit 7) 
            2'b10 : N <= M[7];          // PLP
            2'b11 : N <= OUT[7];        // ALU N flag 
        endcase

/*
 * update Z(ero) flag
 */
always @(posedge clk)
    if( sync & rdy )
        casez( {flag_op[9], flag_op[2]} )
            2'b01 : Z <= M[1];          // PLP
            2'b10 : Z <= z0 & z1;       // ALU == 0 
        endcase

/*
 * update (o)V(erflow) flag
 *
 */
always @(posedge clk)
    if( sync & rdy )
        case( flag_op[8:7] )
            2'b01 : V <= BC7 ^ BC8;     // ALU overflow 
            2'b11 : V <= M[6];          // BIT/PLP
        endcase

/*
 * update I(nterrupt) flag and D(ecimal) flags
 *
 * The I/D flags share two control bits in flag_op[6:5]
 *
 * 00 - do nothing
 * 01 - CLI/SEI
 * 10 - CLD/SED
 * 11 - BRK
 */

/* 
 * Interrupt handling needs to know the I flag on the
 * 'sync' cycle, so we produce an early result in 'next_I'
 * and export that as the 'mask_irq' signal.
 */
reg next_I;
assign mask_irq = next_I;

always @(*) begin
    next_I = I;
    if( sync )
        casez( {plp, flag_op[6:5]} )
            3'b001 : next_I = M[5];     // CLI/SEI 
            3'b011 : next_I = 1;        // BRK
            3'b1?? : next_I = M[2];     // PLP
        endcase
end

always @(posedge clk)
    if( rdy )
        I <= next_I;

always @(posedge clk)
    if( sync & rdy )
        casez( {plp, flag_op[6:5]} )
            3'b010 : D <= M[5];         // CLD/SED 
            3'b011 : D <= 0;            // clear D in BRK
            3'b1?0 : D <= M[3];         // PLP
        endcase


/*
 * branch condition. 
 */
reg flag_set;

always @(*)
    case( M[7:6] )
        2'b00:  flag_set = N;                   // BPL or BMI
        2'b01:  flag_set = V;                   // BVC or BVS
        2'b10:  flag_set = C;                   // BCC or BCS
        2'b11:  flag_set = Z;                   // BNE or BEQ
    endcase

/*
 * only odd column 0 has conditional instructions, the rest 
 * is unconditional
 */
wire uncond = ~M[4] | M[3] | M[2] | M[1] | M[0];

always @(*)
    if( uncond )        cond = 1;               // unconditional instruction
    else if( M[5] )     cond = flag_set;        // BMI, BVS, BCS, BEQ
    else                cond = ~flag_set;       // BPL, BVC, BCC, BNE

endmodule
