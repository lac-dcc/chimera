/*
 * generate control signals for 65C02 core.
 *
 * This module is organized around a 512x32 bit memory. Half of the
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
    input clk,                          // global clock
    input irq,                          // top level IRQ input
    input rdy,                          // top level RDY input
    input nmi,                          // top level NMI input
    input reset,                        // top level RESET input
    output sync,                        // asserted at first cycle of instruction
    input cond,                         // branch condition code status 
    input [7:0] DB,                     // Data Bus
    output reg WE,                      // Write Enable signal
    output [9:0] flag_op,               // operation select for flags
    output [8:0] alu_op,                // operation select for ALU 
    output [6:0] reg_op,                // operation select for register file
    output [1:0] do_op,                 // operation select for data bus output
    output ld_m,                        // load enable for M register
    input I,                            // IRQ enable flag
    input D,                            // Decimal flag 
    output B,                           // BRK flag
    output reg [11:0] ab_op );          // operation select for address bus output 

/*
 * 'control' is a 32 bit vector from the microcode memory
 */
wire [31:0] control;

/*
 * pick apart control word for individual module control signals. Note that some
 * bits can be used for different purposes, depending on context
 */
assign do_op = control[30:29];
assign flag_op = {control[30:29], control[7:0]};
assign alu_op = {control[31:30], control[14:8]};
assign reg_op = control[21:15];

reg [8:0] pc;                           // microcode program counter
reg [4:0] finish;                       // address of finishing code for current instruction

microcode rom(
    .clk(clk),
    .enable(rdy),
    .reset(reset),
    .addr(pc),
    .data(control) );

/*
 * The NMI signal is edge sensitive. Detect edge,
 * register it in 'take_nmi', and clear it at 
 * the next sync pulse, when the NMI is actually
 * taken.
 */
reg nmi1;
reg take_nmi = 0;

always @(posedge clk)
    nmi1 <= nmi;

always @(posedge clk)
    if( nmi & ~nmi1 )
        take_nmi <= 1;
    else if( sync & rdy )
        take_nmi <= 0;

/*
 * take irq when 'irq' is present and not disabled.
 * (priority of irq/nmi will be decided in 'sel_pc' mux)
 */
wire take_irq = irq & ~I;

/*
 * The microcontrol 'program counter'.
 *
 * The bits in control[23:22] tell what to do:
 *
 * when 00 -> sync: decode next instruction, form address in bottom 256 words.
 *            or jump to IRQ/NMI handler if necessary.
 * when 01 -> jump to next microcode instruction in area 9'h100-9'h17F
 * when 10 -> jump to finishing code in area 9'h140-9'h15F.
 * when 11 -> jump to next, but also save pointer to finishing code
 */

assign sync = (control[23:22] == 2'b00);

/*
 * First, form a 2 bit select signal from the interrupt signals
 * and control bits.
 * 
 * sel_pc 
 * ------
 * 00 fetch
 * 01 next
 * 10 finish
 * 11 IRQ/NMI
 */
reg [1:0] sel_pc;

always @(*)
    casez( {take_nmi, take_irq, control[23:22]} )
        4'b???1:    sel_pc = 2'b01;                 // next
        4'b??10:    sel_pc = 2'b10;                 // finish 
        4'b1?00:    sel_pc = 2'b11;                 // take NMI
        4'b0100:    sel_pc = 2'b11;                 // take IRQ
        4'b0000:    sel_pc = 2'b00;                 // fetch
    endcase

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
 * 11: | 1 |N/I| 1   1   0   0   0   0   0 |   NMI/IRQ handler @160
 *     +---+---+---+---+---+---+---+---+---+
 */
always @(*)
    case( sel_pc )
        2'b00:      pc = {1'b0, DB};                    // look up next instruction at @000-@0FF
        2'b01:      pc = {1'b1, D, control[6:0]};       // microcode at @100/@180
        2'b10:      pc = {1'b1, D, 2'b10, finish };     // finish code at @140/@1C0
        2'b11:      pc = {1'b1, take_nmi, 7'b1100000 }; // take NMI/IRQ at @1E0/160
    endcase

/*
 * bit 28 contains WE signal for next cycle
 */
always @(posedge clk)
    if( rdy )
        WE <= control[28];

/*
 * if bit 23 is set, the ALU is not needed in this cycle
 * so the same bits are used to store location of finisher code
 */
always @(posedge clk)
    if( rdy & control[23] )
        finish <= control[14:10];

/*
 * take B from CI control bits. We only care about the 'B'
 * bit when pushing the status bits to the stack. At that
 * time we don't use the ALU carry bits.
 */
assign B = control[8];

wire [3:0] mode = control[27:24];

/*
 * The 4 'mode' bits control the AB datapath. The AB datapath (ABL+ABH) 
 * require a total of 12 control signals, but there are only 15 unique
 * and useful combinations, listed in the table below.
 *
 * The "PC" (consisting of PCH and PCL) is not really the "Program Counter"
 * but simply a holding register for when AB needs to access data. It can
 * either keep the old value, or load it with AB, optionally incremented.
 *
 * The "AHL" is the hold register that stores DB for the next cycle, to be
 * used whenever a 16 bit address appears on the bus. 
 *
 * In case of a branch (mode 0111), the ABL module chooses between DB/00 
 * offset based on its own condition code inputs. The choice for FF/00 
 * for ABH is done here.
 *
 * mode |   PC   | AHL  | AB
 * -----+--------+------+------
 * 0000 |  keep  |  DB  | keep
 * 0001 |  keep  | keep | PC
 * 0010 | AB + 1 |  DB  | {DB, AHL + XYZ} 
 * 0011 | AB + 1 |  DB  | {00, DB  + XYZ} 
 * 0100 |   AB   |  DB  | AB + 1 
 * 0101 |   AB   |  DB  | {01, SP  + 1}
 * 0111 |   AB   |  DB  | AB + { FF, DB } + 1   (if backward branch taken) 
 * 0111 |   AB   |  DB  | AB + { 00, DB } + 1   (if forward branch taken)
 * 0111 |   AB   |  DB  | AB + { 00, 00 } + 1   (if branch not taken)
 * 1000 |  keep  | keep | {01, SP} 
 * 1001 | AB + 1 |  DB  | {01, SP}
 * 1010 |  keep  |  DB  | {DB, AHL + XYZ} + 1
 * 1011 |   AB   | keep | {01, SP}
 * 1100 |  keep  |  DB  | AB + 1
 * 1110 | AB + 1 |  DB  | {DB, AHL + XYZ} + 1
 * 1111 |  keep  | keep | { FF, VECTOR } + 1
 *  |||
 *  |++----> mode bits [1:0] go directly into ABL mux selection
 *  |
 *  +------> mode bit [2] goes directly into ABL carry input
 */

wire abl_ci = mode[2];
wire [1:0] abl_sel = mode[1:0];
wire back = cond & DB[7];     // doing backwards branch 

always @(*)
    case( mode )              //             IPH_ABH____________ABL OP
        4'b0000:                ab_op = { 7'b001_0110, abl_sel, 2'b11, abl_ci };  // AB + 0
        4'b0001:                ab_op = { 7'b000_1010, abl_sel, 2'b10, abl_ci };  // PC
        4'b0010:                ab_op = { 7'b111_1110, abl_sel, 2'b01, abl_ci };  // {DB, AHL+REG}, store PC
        4'b0011:                ab_op = { 7'b111_0000, abl_sel, 2'b01, abl_ci };  // {00, DB+REG}
        4'b0100:                ab_op = { 7'b011_0110, abl_sel, 2'b11, abl_ci };  // AB + 1, store PC
        4'b0101:                ab_op = { 7'b011_0001, abl_sel, 2'b00, abl_ci };  // {01, SP+1}
        4'b0111: if( back )     ab_op = { 7'b011_0111, abl_sel, 2'b11, abl_ci };  // {AB-1, AB} + DB + 1
                 else           ab_op = { 7'b011_0110, abl_sel, 2'b11, abl_ci };  // AB + 1
        4'b1000:                ab_op = { 7'b000_0001, abl_sel, 2'b00, abl_ci };  // {01, SP}, keep PC
        4'b1001:                ab_op = { 7'b111_0001, abl_sel, 2'b00, abl_ci };  // {01, SP}, store PC+1
        4'b1010:                ab_op = { 7'b001_1110, abl_sel, 2'b01, abl_ci };  // {DB, AHL+REG}, keep PC
        4'b1011:                ab_op = { 7'b010_0001, abl_sel, 2'b00, abl_ci };  // {01, SP}
        4'b1100:                ab_op = { 7'b001_0110, abl_sel, 2'b11, abl_ci };  // AB+1, keep PC
        4'b1110:                ab_op = { 7'b111_1110, abl_sel, 2'b01, abl_ci };  // {DB, AHL+REG} + 1, store PC
        4'b1111:                ab_op = { 7'b000_0011, abl_sel, 2'b00, abl_ci };  // {FF, REG} + 1
        default:                ab_op = { 7'bxxx_xxxx, abl_sel, 2'bxx, abl_ci };  // avoid latches
    endcase

endmodule
