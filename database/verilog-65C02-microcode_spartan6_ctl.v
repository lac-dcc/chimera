/*
 * generate control signals for 65C02 core.
 *
 * This module is organized around a 512x36 bit memory. Half of the
 * memory is used for instruction decoding. The opcode is used as the
 * address (with top bit set to 0). The output is a control word that
 * controls both address and ALU logic, as well as the register file
 * addressing, and flag updates. The sequencer has no conditional
 * branches and no internal register file. It simply follows a fixed
 * sequence of micro-instructions. Each word contains the address of the next.
 *
 * The other half of the memory is used as a sequencer for multi-cycle
 * instructions.
 *
 * Most instructions that operate on memory are divided into two
 * phases. The first phase determines the effective memory address, the
 * second (and final) phase performs the operation.
 *
 * In order to save space, the ROM has a separate area for the 2nd
 * phase, called the 'finishing code'. The first cycle of the control
 * word optionally contains the address of the 'finisher', stored in
 * 5 bit register 'finish'. After the memory has been addressed, the
 * controller jumps to the finish code to do the operations. This allows
 * for a compact representation.
 *
 * So, for example, the code for LDA ZP points to a finisher that loads ALU
 * into A register. The code for LDX ZP points to a finisher that loads X
 * register instead. Both instructions then follow the same sequence to read
 * zeropage, and then the respective finisher is called.
 *
 * In the last cycle of an instruction, we no longer need the next location,
 * so the 8 address bits are used to select how the processor status flags
 * are updated.
 *
 * (C) Arlet Ottens <arlet@c-scape.nl>
 */

module ctl(
    input clk,
    input irq,
    input rdy,
    input nmi,
    input reset,
    output sync,
    input cond,
    input [7:0] DB,
    output WE,
    output [9:0] flag_op,
    output [6:0] alu_op,
    output [6:0] reg_op,
    output [1:0] do_op,
    output ld_m,
    input I,
    input D,
    output B,
    output [11:0] ab_op );

wire [31:0] control;

assign do_op = control[30:29];
assign flag_op = {control[30:29], control[7:0]};
assign reg_op = control[21:15];
assign alu_op = control[14:8];

/* 
 * ld_m = control[31] & rdy
 */
LUT2 #(.INIT(4'b1000)) lut_ld_m( .O(ld_m), .I0(control[31]), .I1(rdy) );

/*
 * take B from CI control bits. We only care about the 'B'
 * bit when pushing the status bits to the stack. At that
 * time we don't use the ALU carry bits.
 */
assign B = control[8];

wire [8:0] pc;
wire [4:0] finish_q;   // finishing code
wire [4:0] finish_d;   // finishing code

microcode rom(
    .clk(clk),
    .enable(rdy),
    .reset(reset),
    .addr(pc),
    .data(control) );

wire nmi1;          // delayed nmi signal
wire take_irq;
wire take_nmi;
wire take_nmi_d;

reg nmi2;

always @(posedge clk)
    nmi2 <= nmi;

/*
 * sync indicates when new instruction is decoded
 *
 * sync = ~control[23] & ~control[22] & rdy;
 */
LUT3 #(.INIT(8'b00010000)) lut_sync( .O(sync), .I0(control[22]), .I1(control[23]), .I2(rdy) );

/*
 * nmi logic
 */
FDRE ff_nmi1( .C(clk), .CE(1'b1), .R(1'b0), .D(nmi), .Q(nmi1) );

/*
 * take_nmi_d = !sync & (take_nmi | (!nmi1 & nmi))
 */
LUT4 #(.INIT(16'h0f22)) lut_take_nmi( .O(take_nmi_d), .I0(nmi), .I1(nmi1), .I2(sync), .I3(take_nmi) );
FDRE ff_take_nmi( .C(clk), .CE(1'b1), .R(1'b0), .D(take_nmi_d), .Q(take_nmi) );

/*
 * The microcontrol 'program counter'.
 *
 * The bits in control[23:22] tell what to do:
 *
 * when 00 -> decode next instruction, form address in bottom 256 words.
 * when 01 -> jump to next microcode instruction in area 9'h100-9'h17F
 * when 10 -> jump to finishing code in area 9'h140-9'h15F.
 * when 11 -> jump to next, but also save pointer to finishing code
 */

/*
 * take_irq = irq & ~I
 */
LUT2 #(.INIT(4'b0010)) lut_take_irq( .O(take_irq), .I0(irq), .I1(I) );

/* 
 * 9 bit address in microcode ROM (the 'pc')
 *
 * sel   8   7   6   5   4   3   2   1   0
 *     +---+---+---+---+---+---+---+---+---+
 * 00: | 0 |           opcode (DB)         |   opcode lookup
 *     +---+---+---+---+---+---+---+---+---+
 * 01: | 1 | D |        jmp next           |   next instruction 
 *     +---+---+---+---+---+---+---+---+---+
 * 10: | 1 | D | 1   0 |      finish       |   finish handler 
 *     +---+---+---+---+---+---+---+---+---+
 * 11: | 1 |N/I| 1   1   0   0   0   0   0 |   IRQ/NMI handler @160
 *     +---+---+---+---+---+---+---+---+---+
 *
 */

wire [1:0] sel_pc;

/*
 * 00 fetch
 * 01 next
 * 10 finish
 * 11 IRQ/NMI
 */

/*
 * address select for microcode ROM
 */
LUT4 #(.INIT(16'h5554)) lut_sel1( .O(sel_pc[1]), .I0(control[22]), .I1(control[23]), .I2(take_irq), .I3(take_nmi) );
LUT4 #(.INIT(16'hbbba)) lut_sel0( .O(sel_pc[0]), .I0(control[22]), .I1(control[23]), .I2(take_irq), .I3(take_nmi) );

wire [6:0] N = control[6:0];
wire [4:0] F = finish_q;
wire N_I = take_nmi;

/*
 * address mux
 */
LUT2 #(.INIT(4'b1110))      pc8( .O(pc[8]),                                   .I0(sel_pc[0]), .I1(sel_pc[1]) );
LUT5 #(.INIT(32'hf0ccccaa)) pc7( .O(pc[7]), .I0(DB[7]), .I1(D),    .I2(N_I),  .I3(sel_pc[0]), .I4(sel_pc[1]) );
LUT4 #(.INIT(16'hffca))     pc6( .O(pc[6]), .I0(DB[6]), .I1(N[6]),            .I2(sel_pc[0]), .I3(sel_pc[1]) );
LUT4 #(.INIT(16'hf0ca))     pc5( .O(pc[5]), .I0(DB[5]), .I1(N[5]),            .I2(sel_pc[0]), .I3(sel_pc[1]) );
LUT5 #(.INIT(32'h00f0ccaa)) pc4( .O(pc[4]), .I0(DB[4]), .I1(N[4]), .I2(F[4]), .I3(sel_pc[0]), .I4(sel_pc[1]) );
LUT5 #(.INIT(32'h00f0ccaa)) pc3( .O(pc[3]), .I0(DB[3]), .I1(N[3]), .I2(F[3]), .I3(sel_pc[0]), .I4(sel_pc[1]) );
LUT5 #(.INIT(32'h00f0ccaa)) pc2( .O(pc[2]), .I0(DB[2]), .I1(N[2]), .I2(F[2]), .I3(sel_pc[0]), .I4(sel_pc[1]) );
LUT5 #(.INIT(32'h00f0ccaa)) pc1( .O(pc[1]), .I0(DB[1]), .I1(N[1]), .I2(F[1]), .I3(sel_pc[0]), .I4(sel_pc[1]) );
LUT5 #(.INIT(32'h00f0ccaa)) pc0( .O(pc[0]), .I0(DB[0]), .I1(N[0]), .I2(F[0]), .I3(sel_pc[0]), .I4(sel_pc[1]) );

/*
 * bit 28 contains WE signal for next cycle
 */
FDRE ff_we( .C(clk), .CE(rdy), .R(1'b0), .D(control[28]), .Q(WE) );

/*
 * if bit 23 is set, the ALU is not needed in this cycle
 * so the same bits are used to store location of finisher code
 */
/*
always @(posedge clk)
    if( control[23] )
        finish <= control[14:10];
*/

LUT5 #(.INIT(32'hf0f0aaaa)) fin0( .O(finish_d[0]), .I0(finish_q[0]), .I1(finish_q[1]), .I2(control[10]), .I3(control[11]), .I4(control[23]) );
LUT5 #(.INIT(32'hff00cccc)) fin1( .O(finish_d[1]), .I0(finish_q[0]), .I1(finish_q[1]), .I2(control[10]), .I3(control[11]), .I4(control[23]) );
LUT5 #(.INIT(32'hf0f0aaaa)) fin2( .O(finish_d[2]), .I0(finish_q[2]), .I1(finish_q[3]), .I2(control[12]), .I3(control[13]), .I4(control[23]) );
LUT5 #(.INIT(32'hff00cccc)) fin3( .O(finish_d[3]), .I0(finish_q[2]), .I1(finish_q[3]), .I2(control[12]), .I3(control[13]), .I4(control[23]) );
LUT5 #(.INIT(32'hf0f0aaaa)) fin4( .O(finish_d[4]), .I0(finish_q[4]), .I1(finish_q[4]), .I2(control[14]), .I3(control[14]), .I4(control[23]) );

FDRE ff_fin0( .C(clk), .CE(rdy), .R(1'b0), .D(finish_d[0]), .Q(finish_q[0]) );
FDRE ff_fin1( .C(clk), .CE(rdy), .R(1'b0), .D(finish_d[1]), .Q(finish_q[1]) );
FDRE ff_fin2( .C(clk), .CE(rdy), .R(1'b0), .D(finish_d[2]), .Q(finish_q[2]) );
FDRE ff_fin3( .C(clk), .CE(rdy), .R(1'b0), .D(finish_d[3]), .Q(finish_q[3]) );
FDRE ff_fin4( .C(clk), .CE(rdy), .R(1'b0), .D(finish_d[4]), .Q(finish_q[4]) );

/*
 * In order to compress those in the control word, the code below expands
 * the 4 control bits into 9, optionally taking into account the output
 * of the conditional branches, and the branch direction (DB[7])
 */

wire [1:0] abl_sel = control[25:24];
wire abl_ci = control[26];

// encoded address bus signal
wire [3:0] ab = control[27:24];

wire inc_pc;
wire ld_pc;
wire ld_ahl;
wire [1:0] abl_op;
wire [3:0] abh_sel;

// all same inputs for packing 
LUT5 #(.INIT(32'h020c0000)) inc_pc_dec( .O(inc_pc), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'h0afc0000)) ld_pc_dec( .O(ld_pc), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'h12300000)) ld_ahl_dec( .O(ld_ahl), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'h70d30000)) abl_op1( .O(abl_op[1]), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'h74dd0000)) abl_op0( .O(abl_op[0]), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'h04060000)) abh_sel3( .O(abh_sel[3]), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'h74d50000)) abh_sel2( .O(abh_sel[2]), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );
LUT5 #(.INIT(32'hf4d70000)) abh_sel1( .O(abh_sel[1]), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(rdy) );

// abh_sel0 depends on backwards branches
LUT6 #(.INIT(64'h8be08b608b608b60)) abh_sel0( .O(abh_sel[0]), .I0(ab[0]), .I1(ab[1]), .I2(ab[2]), .I3(ab[3]), .I4(cond), .I5(DB[7]) );

assign ab_op = { inc_pc, ld_pc, ld_ahl, abh_sel, abl_sel, abl_op, abl_ci };

endmodule
