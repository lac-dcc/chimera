/*
 * generate control signals for 65C02 core.
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
    output reg WE,
    output [9:0] flag_op,
    output reg [8:0] alu_op,
    output reg [6:0] reg_op,
    output reg [1:0] do_op,
    output ld_m,
    input I,
    input D,
    output B,
    output reg [11:0] ab_op );

reg [29:0] control;

/*
 * The NMI signal is edge sensitive. Detect edge,
 * register it in 'take_nmi', and clear it at 
 * the next sync pulse, when the NMI is actually
 * taken.
 */
reg nmi1;
reg take_nmi;

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

assign B = 1;

reg [3:0] mode;

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
 * 0101 |   AB   |  DB  | {01, SP + 1}
 * 0111 |   AB   |  DB  | AB + { FF, DB } + 1   (if backward branch taken) 
 * 0111 |   AB   |  DB  | AB + { 00, DB } + 1   (if forward branch taken)
 * 0111 |   AB   |  DB  | AB + { 00, 00 } + 1   (if branch not taken)
 * 1000 |  keep  | keep | {01, SP} 
 * 1001 | AB + 1 |  DB  | {01, SP}
 * 1010 |  keep  |  DB  | {DB, AHL + XYZ}
 * 1011 |   AB   | keep | {01, SP}
 * 1100 |  keep  |  DB  | AB + 1
 * 1110 |  keep  |  DB  | {DB, AHL + XYZ} + 1
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
        4'b1110:                ab_op = { 7'b001_1110, abl_sel, 2'b01, abl_ci };  // {DB, AHL+REG} + 1, keep PC
        4'b1111:                ab_op = { 7'b000_0011, abl_sel, 2'b00, abl_ci };  // {FF, REG} + 1
        default:                ab_op = { 7'bxxx_xxxx, abl_sel, 2'bxx, abl_ci };  // avoid latches
    endcase

/*
 * control state machine
 */
parameter
    BRK0  = 5'b00000,           // DEC
    JSR0  = 5'b00001,           // DEC
    RTI0  = 5'b00010,           // DEC
    RTS0  = 5'b00011,           // DEC
    IDX1  = 5'b00100,
    IDX2  = 5'b00101,
    RDWR  = 5'b00110,
    RTS1  = 5'b00111,

    ZERO  = 5'b01000,           // DEC  RMW
    ABS0  = 5'b01001,           // DEC
    JMP0  = 5'b01010,           // DEC
    IND0  = 5'b01011,           // DEC
    ABS1  = 5'b01100,           //      RMW
    JSR1  = 5'b01101,
    JSR2  = 5'b01110,
    BRK1  = 5'b01111,

    IMM0  = 5'b10000,           // DEC  BCD
    RTI2  = 5'b10001,           // 
    PULL  = 5'b10010,           // DEC
    PUSH  = 5'b10011,           // DEC
    DATA  = 5'b10100,           //      BCD 
    BRK2  = 5'b10101,
    BRK3  = 5'b10110,
    RTI1  = 5'b10111,

    SYNC  = 5'b11000,           // DEC
    COND  = 5'b11001,           // DEC
    IDX0  = 5'b11010,           // DEC
    RTI3  = 5'b11011,
    ABCD  = 5'b11100,
    JMP1  = 5'b11101,
    IND1  = 5'b11110,
    RTS2  = 5'b11111;             

reg [4:0] state = SYNC;

assign sync = (state == SYNC);

/* 
 * loose state flops
 */
wire [3:0] src = control[3:0];
wire [1:0] dst = control[5:4];
wire ld = control[6];
wire [6:0] alu = control[13:7];
wire st = control[14];
wire rmw = control[15];
wire add_x = control[16];
wire add_y = control[17];
assign flag_op = control[27:18];
wire php = control[28];
wire bcd = control[29] & D;

/*
 * write enable 
 */
always @(posedge clk)
    case( state )
        BRK0:    WE <= 1;
        BRK1:    WE <= 1;
        BRK2:    WE <= 1;
        JSR0:    WE <= 1;
        JSR1:    WE <= 1;
        PUSH:    WE <= 1;
        RDWR:    WE <= 1;
        ABS1:    WE <= st;
        ZERO:    WE <= st;
        IDX2:    WE <= st;
        default: WE <= 0;
    endcase

/*
 * data output select
 * 
 * 00 ALU
 * 01 P
 * 10 PCL
 * 11 PCH
 */
always @(*)
    case( state )
        BRK1:             do_op = 2'b11;
        BRK2:             do_op = 2'b10;
        BRK3:             do_op = 2'b01;
        JSR1:             do_op = 2'b11;
        JSR2:             do_op = 2'b10;
        DATA:   if( php ) do_op = 2'b01; 
                else      do_op = 2'b00;
     default:             do_op = 2'bxx;
    endcase

/*
 * register operation
 *
 *   6   5   4   3   2   1   0
 * +---+---+---+---+---+---+---+
 * | W |  dst  |      src      |
 * +---+---+---+---+---+---+---+
 */
always @(*)
    case( state )
        BRK0:                  reg_op = 7'b1_11_0011;       // S
        BRK1:                  reg_op = 7'b1_11_0011;       // S
        BRK2:                  reg_op = 7'b1_11_0011;       // S
        BRK3: if( reset )      reg_op = 7'b0_xx_1001;       // RST vector
              else             reg_op = 7'b0_xx_1010;       // BRK vector
        JSR0:                  reg_op = 7'b1_11_0011;       // S
        JSR1:                  reg_op = 7'b1_11_0011;       // S
        RTS0:                  reg_op = 7'b1_11_0011;       // S
        RTS1:                  reg_op = 7'b1_11_0011;       // S
        RTS2:                  reg_op = 7'b0_xx_0111;       // Z
        RTI0:                  reg_op = 7'b1_11_0011;       // S
        RTI1:                  reg_op = 7'b1_11_0011;       // S
        RTI2:                  reg_op = 7'b1_11_0011;       // S
        RTI3:                  reg_op = 7'b0_xx_0111;       // Z
        PUSH:                  reg_op = 7'b1_11_0011;       // S
        PULL:                  reg_op = 7'b1_11_0011;       // S
        IDX0: if( add_x )      reg_op = 7'b0_xx_0000;       // X
              else             reg_op = 7'b0_xx_0111;       // Z
        IDX2: if( add_y )      reg_op = 7'b0_xx_0001;       // Y
              else             reg_op = 7'b0_xx_0111;       // Z
        ZERO: if( add_x )      reg_op = 7'b0_xx_0000;       // X
              else if( add_y ) reg_op = 7'b0_xx_0001;       // Y
              else             reg_op = 7'b0_xx_0111;       // Z
        JMP1:                  reg_op = 7'b0_xx_0111;       // Z
        IND1,
        ABS1: if( add_x )      reg_op = 7'b0_xx_0000;       // X
              else if( add_y ) reg_op = 7'b0_xx_0001;       // Y
              else             reg_op = 7'b0_xx_0111;       // Z
        SYNC:                  reg_op = { ld, dst, src };   // dst <= src <op> M
        ABCD:                  reg_op = { ld, dst, src };   // 
        DATA:                  reg_op = { 1'b0, dst, src }; // store
     default:                  reg_op = 7'bx_xx_xxxx;       // 
    endcase

/*
 * ALU operation
 *
 * shift           add
 * -----         --------
 *  10 left      000 OR 
 *  11 right     001 AND
 *               010 XOR
 * carry         011 ADD
 * -----         100 INC
 *  01 1         101 DEC
 *  10 ROT       110 SUB
 *  11 ADC       111 TRB
 *
 *   8   7   6   5   4   3   2   1   0
 * +---+---+---+---+---+---+---+---+---+
 * |ldm|bcd| shift |    add    | carry |
 * +---+---+---+---+---+---+---+---+---+
 */
always @(*)
    case( state )
        BRK0:                   alu_op = 9'b00_00_101_00;           // - 1 
        BRK1:                   alu_op = 9'b00_00_101_00;           // - 1 
        BRK2:                   alu_op = 9'b00_00_101_00;           // - 1 
        JSR0:                   alu_op = 9'b00_00_101_00;           // - 1 
        JSR1:                   alu_op = 9'b00_00_101_00;           // - 1 
        PUSH:                   alu_op = 9'b00_00_101_00;           // - 1
        RTS0:                   alu_op = 9'b00_00_100_01;           // + 1 
        RTS1:                   alu_op = 9'b00_00_100_01;           // + 1 
        RTI0:                   alu_op = 9'b00_00_100_01;           // + 1
        RTI1:                   alu_op = 9'b10_00_100_01;           // + 1
        RTI2:                   alu_op = 9'b00_00_100_01;           // + 1
        PULL:                   alu_op = 9'b00_00_100_01;           // + 1
        IMM0:                   alu_op = 9'b10_00_000_00;           // load M
        RDWR:                   alu_op = 9'b10_00_000_00;           //   
        ABCD:                   alu_op = { 9'b11, alu };            // load BCD adjust 
        SYNC:                   alu_op = { 2'b10, alu };            // perform ALU operation
        DATA:    if( st )       alu_op = 9'b00_00_100_00;           // store to M 
                 else if( rmw ) alu_op = { 2'b00, alu };            // RMW
                 else           alu_op = { 2'b10, alu };            // load
        default:                alu_op = 9'bxx_xx_xxx_xx;   
    endcase

always @(*)
    case( state )
        ABCD:   mode = 0;
        ABS0:   mode = 4;
        ABS1:   mode = 2;
        BRK0:   mode = 9;
        BRK1:   mode = 8;
        BRK2:   mode = 8;
        BRK3:   mode = 15;
        COND:   mode = 7;
        DATA:   mode = 1;
        IDX0:   mode = 3;
        IDX1:   mode = 12;
        IDX2:   mode = 10;
        IMM0:   mode = 4;
        IND0:   mode = 4;
        IND1:   mode = 2;
        JMP0:   mode = 4;
        JMP1:   mode = 2;
        JSR0:   mode = 9;
        JSR1:   mode = 8;
        JSR2:   mode = 1;
        PULL:   mode = 5;
        PUSH:   mode = 11;
        RDWR:   mode = 0;
        RTI0:   mode = 5;
        RTI1:   mode = 5;
        RTI2:   mode = 5;
        RTI3:   mode = 2;
        RTS0:   mode = 5;
        RTS1:   mode = 5;
        RTS2:   mode = 14;
        SYNC:   mode = 4;
        ZERO:   mode = 3;
    endcase

/*
 * B    = BCD adjust
 * P    = PHP
 * YX   = Y or X index used
 * M    = Read-Modify-Write
 * <>   = left/right shift
 * ADD  = ALU adder operation
 * CI   = ALU carry in
 * W    = write ALU to register
 * DR   = destination register
 * SRCR = source register
 */

always @(posedge clk)
    if( sync )
        case( DB )
                               //  BP flags ops  YX MS <> ADD CI W DR SRCR
             8'h00: control <= 30'bx0_0001100000_00_x0_xx_xxx_xx_0_xx_xxxx; // BRK
             8'h01: control <= 30'b00_1000011000_01_x0_00_000_00_1_10_0010; // ORA (ZP,X)
             8'h04: control <= 30'bx0_1000000000_00_10_00_000_00_0_xx_0010; // TSB ZP
             8'h05: control <= 30'b00_1000011000_00_00_00_000_00_1_10_0010; // ORA ZP
             8'h06: control <= 30'bx0_1000011011_00_10_10_000_00_0_xx_0111; // ASL ZP
             8'h08: control <= 30'bx1_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // PHP
             8'h09: control <= 30'b00_1000011000_xx_x0_00_000_00_1_10_0010; // ORA #IMM
             8'h0A: control <= 30'bx0_1000011011_xx_x0_10_100_00_1_10_0010; // ASL A
             8'h0C: control <= 30'b00_1000000000_00_10_00_000_00_0_xx_0010; // TSB ABS
             8'h0D: control <= 30'b00_1000011000_00_00_00_000_00_1_10_0010; // ORA ABS
             8'h0E: control <= 30'b00_1000011011_00_10_10_000_00_0_xx_0111; // ASL ABS
             8'h10: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BPL
             8'h11: control <= 30'b00_1000011000_10_x0_00_000_00_1_10_0010; // ORA (ZP),Y
             8'h12: control <= 30'b00_1000011000_00_x0_00_000_00_1_10_0010; // ORA (ZP)
             8'h14: control <= 30'b00_1000000000_00_10_00_111_00_0_xx_0010; // TRB ZP
             8'h15: control <= 30'b00_1000011000_01_00_00_000_00_1_10_0010; // ORA ZP,X
             8'h16: control <= 30'b00_1000011011_01_10_10_000_00_0_xx_0111; // ASL ZP,X
             8'h18: control <= 30'bx0_0000000011_xx_x0_00_000_00_0_xx_0111; // CLC
             8'h19: control <= 30'b00_1000011000_10_00_00_000_00_1_10_0010; // ORA ABS,Y
             8'h1A: control <= 30'bx0_1000011000_xx_x0_00_100_01_1_10_0010; // INC A
             8'h1C: control <= 30'b00_1000000000_00_10_00_111_00_0_xx_0010; // TRB ABS
             8'h1D: control <= 30'b00_1000011000_01_00_00_000_00_1_10_0010; // ORA ABS,X
             8'h1E: control <= 30'b00_1000011011_01_10_10_000_00_0_xx_0111; // ASL ABS,X
             8'h20: control <= 30'bx0_0000000000_xx_00_xx_xxx_xx_0_xx_xxxx; // JSR
             8'h21: control <= 30'b00_1000011000_01_x0_00_001_00_1_10_0010; // AND (ZP,X)
             8'h24: control <= 30'b00_1110001000_00_00_00_001_00_0_xx_0010; // BIT ZP
             8'h25: control <= 30'b00_1000011000_00_00_00_001_00_1_10_0010; // AND ZP
             8'h26: control <= 30'b00_1000011011_00_10_10_000_10_0_xx_0111; // ROL ZP
             8'h28: control <= 30'bx0_0110010111_xx_x0_11_011_00_0_xx_0111; // PLP
             8'h29: control <= 30'b00_1000011000_xx_x0_00_001_00_1_10_0010; // AND #IMM
             8'h2A: control <= 30'bx0_1000011011_xx_x0_10_100_10_1_10_0010; // ROL A
             8'h2C: control <= 30'b00_1110001000_00_00_00_001_00_0_xx_0010; // BIT ABS
             8'h2D: control <= 30'b00_1000011000_00_00_00_001_00_1_10_0010; // AND ABS
             8'h2E: control <= 30'b00_1000011011_00_10_10_000_10_0_xx_0111; // ROL ABS
             8'h30: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BMI
             8'h31: control <= 30'b00_1000011000_10_x0_00_001_00_1_10_0010; // AND (ZP),Y
             8'h32: control <= 30'b00_1000011000_00_x0_00_001_00_1_10_0010; // AND (ZP)
             8'h34: control <= 30'b00_1110001000_01_00_00_001_00_0_xx_0010; // BIT ZP,X
             8'h35: control <= 30'b00_1000011000_01_00_00_001_00_1_10_0010; // AND ZP,X
             8'h36: control <= 30'b00_1000011011_01_10_10_000_10_0_xx_0111; // ROL ZP,X
             8'h38: control <= 30'bx0_0000000011_xx_x0_00_101_01_0_xx_0111; // SEC
             8'h39: control <= 30'b00_1000011000_10_00_00_001_00_1_10_0010; // AND ABS,Y
             8'h3A: control <= 30'bx0_1000011000_xx_x0_00_101_00_1_10_0010; // DEC A
             8'h3C: control <= 30'b00_1110001000_01_00_00_001_00_0_xx_0010; // BIT ABS,X
             8'h3D: control <= 30'b00_1000011000_01_00_00_001_00_1_10_0010; // AND ABS,X
             8'h3E: control <= 30'b00_1000011011_01_10_10_000_10_0_xx_0111; // ROL ABS,X
             8'h40: control <= 30'bx0_0110010111_xx_x0_11_011_00_0_xx_0111; // RTI
             8'h41: control <= 30'b00_1000011000_01_x0_00_010_00_1_10_0010; // EOR (ZP,X)
             8'h45: control <= 30'b00_1000011000_00_00_00_010_00_1_10_0010; // EOR ZP
             8'h46: control <= 30'b00_1000011011_00_10_11_000_00_0_xx_0111; // LSR ZP
             8'h48: control <= 30'bx0_0000000000_xx_x0_00_100_00_0_xx_0010; // PHA
             8'h49: control <= 30'b00_1000011000_xx_x0_00_010_00_1_10_0010; // EOR #IMM
             8'h4A: control <= 30'bx0_1000011011_xx_00_11_100_00_1_10_0010; // LSR A
             8'h4C: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // JMP
             8'h4D: control <= 30'b00_1000011000_00_00_00_010_00_1_10_0010; // EOR ABS
             8'h4E: control <= 30'b00_1000011011_00_10_11_000_00_0_xx_0111; // LSR ABS
             8'h50: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BVC
             8'h51: control <= 30'b00_1000011000_10_x0_00_010_00_1_10_0010; // EOR (ZP),Y
             8'h52: control <= 30'b00_1000011000_00_x0_00_010_00_1_10_0010; // EOR (ZP)
             8'h55: control <= 30'b00_1000011000_01_00_00_010_00_1_10_0010; // EOR ZP,X
             8'h56: control <= 30'b00_1000011011_01_10_11_000_00_0_xx_0111; // LSR ZP,X
             8'h58: control <= 30'bx0_0000100000_xx_x0_00_000_00_0_xx_xxxx; // CLI
             8'h59: control <= 30'b00_1000011000_10_00_00_010_00_1_10_0010; // EOR ABS,Y
             8'h5A: control <= 30'bx0_0000000000_xx_x0_00_100_00_0_xx_0001; // PHY
             8'h5D: control <= 30'b00_1000011000_01_00_00_010_00_1_10_0010; // EOR ABS,X
             8'h5E: control <= 30'b00_1000011011_01_10_11_000_00_0_xx_0111; // LSR ABS,X
             8'h60: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // RTS
             8'h61: control <= 30'b10_1010011011_01_x0_00_011_11_1_10_0010; // ADC (ZP,X)
             8'h64: control <= 30'b00_0000000000_00_01_00_000_00_0_xx_0111; // STZ ZP
             8'h65: control <= 30'b10_1010011011_00_00_00_011_11_1_10_0010; // ADC ZP
             8'h66: control <= 30'b00_1000011011_00_10_11_000_10_0_xx_0111; // ROR ZP
             8'h68: control <= 30'bx0_1000011000_xx_x0_00_000_00_1_10_0111; // PLA
             8'h69: control <= 30'b10_1010011011_xx_x0_00_011_11_1_10_0010; // ADC #IMM
             8'h6A: control <= 30'b00_1000011011_xx_x0_11_100_10_1_10_0010; // ROR A
             8'h6C: control <= 30'bx0_0000000000_xx_x0_00_xxx_xx_0_xx_xxxx; // JMP (IDX)
             8'h6D: control <= 30'b10_1010011011_00_00_00_011_11_1_10_0010; // ADC ABS
             8'h6E: control <= 30'b00_1000011011_00_10_11_000_10_0_xx_0111; // ROR ABS
             8'h70: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BVS
             8'h71: control <= 30'b10_1010011011_10_x0_00_011_11_1_10_0010; // ADC (ZP),Y
             8'h72: control <= 30'b10_1010011011_00_x0_00_011_11_1_10_0010; // ADC (ZP)
             8'h74: control <= 30'b00_0000000000_01_01_00_000_00_0_xx_0111; // STZ ZP,X
             8'h75: control <= 30'b10_1010011011_01_00_00_011_11_1_10_0010; // ADC ZP,X
             8'h76: control <= 30'b00_1000011011_01_10_11_000_10_0_xx_0111; // ROR ZP,X
             8'h78: control <= 30'bx0_0000100000_xx_x0_xx_xxx_xx_0_xx_xxxx; // SEI
             8'h79: control <= 30'b10_1010011011_10_00_00_011_11_1_10_0010; // ADC ABS,Y
             8'h7A: control <= 30'bx0_1000011000_xx_x0_00_000_00_1_01_0111; // PLY
             8'h7C: control <= 30'bx0_0000000000_01_x0_01_xxx_xx_0_xx_xxxx; // JMP (IDX,X)
             8'h7D: control <= 30'b10_1010011011_01_00_00_011_11_1_10_0010; // ADC ABS,X
             8'h7E: control <= 30'b00_1000011011_01_10_11_000_10_0_xx_0111; // ROR ABS,X
             8'h80: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BRA
             8'h81: control <= 30'b00_0000000000_01_x1_00_100_00_0_xx_0010; // STA (ZP,X)
             8'h84: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0001; // STY ZP
             8'h85: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0010; // STA ZP
             8'h86: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0000; // STX ZP
             8'h88: control <= 30'bx0_1000011000_xx_x0_00_101_00_1_01_0001; // DEY
             8'h89: control <= 30'b00_1100000000_xx_x0_00_001_00_0_xx_0010; // BIT #IMM
             8'h8A: control <= 30'bx0_1000011000_xx_x0_00_100_00_1_10_0000; // TXA
             8'h8C: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0001; // STY ABS
             8'h8D: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0010; // STA ABS
             8'h8E: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0000; // STX ABS
             8'h90: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BCC
             8'h91: control <= 30'b00_0000000000_10_x1_00_100_00_0_xx_0010; // STA (ZP),Y
             8'h92: control <= 30'b00_0000000000_00_x1_00_100_00_0_xx_0010; // STA (ZP)
             8'h94: control <= 30'b00_0000000000_01_01_00_100_00_0_xx_0001; // STY ZP,X
             8'h95: control <= 30'b00_0000000000_01_01_00_100_00_0_xx_0010; // STA ZP,X
             8'h96: control <= 30'b00_0000000000_10_01_00_100_00_0_xx_0000; // STX ZP,Y
             8'h98: control <= 30'bx0_1000011000_xx_x0_00_100_00_1_10_0001; // TYA
             8'h99: control <= 30'b00_0000000000_10_01_00_100_00_0_xx_0010; // STA ABS,Y
             8'h9A: control <= 30'bx0_0000000000_xx_x0_00_100_00_1_11_0000; // TXS
             8'h9C: control <= 30'b00_0000000000_00_01_00_100_00_0_xx_0111; // STZ ABS
             8'h9D: control <= 30'b00_0000000000_01_01_00_100_00_0_xx_0010; // STA ABS,X
             8'h9E: control <= 30'b00_0000000000_01_01_00_100_00_0_xx_0111; // STZ ABS,X
             8'hA0: control <= 30'b00_1000011000_xx_x0_00_000_00_1_01_0111; // LDY #IMM
             8'hA1: control <= 30'b00_1000011000_01_x0_00_000_00_1_10_0111; // LDA (ZP,X)
             8'hA2: control <= 30'bx0_1000011000_xx_x0_00_000_00_1_00_0111; // LDX #IMM
             8'hA4: control <= 30'bx0_1000011000_00_00_00_000_00_1_01_0111; // LDY ZP
             8'hA5: control <= 30'b00_1000011000_00_00_00_000_00_1_10_0111; // LDA ZP
             8'hA6: control <= 30'b00_1000011000_00_00_00_000_00_1_00_0111; // LDX ZP
             8'hA8: control <= 30'bx0_1000011000_xx_x0_00_100_00_1_01_0010; // TAY
             8'hA9: control <= 30'b00_1000011000_xx_x0_00_000_00_1_10_0111; // LDA #IMM
             8'hAA: control <= 30'bx0_1000011000_xx_x0_00_100_00_1_00_0010; // TAX
             8'hAC: control <= 30'b00_1000011000_00_00_00_000_00_1_01_0111; // LDY ABS
             8'hAD: control <= 30'b00_1000011000_00_00_00_000_00_1_10_0111; // LDA ABS
             8'hAE: control <= 30'b00_1000011000_00_00_00_000_00_1_00_0111; // LDX ABS
             8'hB0: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BCS
             8'hB1: control <= 30'b00_1000011000_10_x0_00_000_00_1_10_0111; // LDA (ZP),Y
             8'hB2: control <= 30'b00_1000011000_00_x0_00_000_00_1_10_0111; // LDA (ZP)
             8'hB4: control <= 30'b00_1000011000_01_00_00_000_00_1_01_0111; // LDY ZP,X
             8'hB5: control <= 30'b00_1000011000_01_00_00_000_00_1_10_0111; // LDA ZP,X
             8'hB6: control <= 30'b00_1000011000_10_00_00_000_00_1_00_0111; // LDX ZP,Y
             8'hB8: control <= 30'bx0_0010000000_xx_x0_00_000_00_0_xx_0111; // CLV
             8'hB9: control <= 30'b00_1000011000_10_00_00_000_00_1_10_0111; // LDA ABS,Y
             8'hBA: control <= 30'bx0_1000011000_xx_x0_00_100_00_1_00_0011; // TSX
             8'hBC: control <= 30'b00_1000011000_01_00_00_000_00_1_01_0111; // LDY ABS,X
             8'hBD: control <= 30'b00_1000011000_01_00_00_000_00_1_10_0111; // LDA ABS,X
             8'hBE: control <= 30'b00_1000011000_10_00_00_000_00_1_00_0111; // LDX ABS,Y
             8'hC0: control <= 30'b00_1000011011_xx_x0_00_110_01_0_xx_0001; // CPY #IMM
             8'hC1: control <= 30'b00_1000011011_01_x0_00_110_01_0_xx_0010; // CMP (ZP,X)
             8'hC4: control <= 30'b00_1000011011_00_00_00_110_01_0_xx_0001; // CPY ZP
             8'hC5: control <= 30'b00_1000011011_00_00_00_110_01_0_xx_0010; // CMP ZP
             8'hC6: control <= 30'b00_1000011000_00_10_00_011_00_0_xx_0110; // DEC ZP
             8'hC8: control <= 30'bx0_1000011000_xx_x0_00_100_01_1_01_0001; // INY
             8'hC9: control <= 30'b00_1000011011_xx_x0_00_110_01_0_xx_0010; // CMP #IMM
             8'hCA: control <= 30'bx0_1000011000_xx_x0_00_101_00_1_00_0000; // DEX
             8'hCC: control <= 30'b00_1000011011_00_00_00_110_01_0_xx_0001; // CPY ABS
             8'hCD: control <= 30'b00_1000011011_00_00_00_110_01_0_xx_0010; // CMP ABS
             8'hCE: control <= 30'b00_1000011000_00_10_00_011_00_0_xx_0110; // DEC ABS
             8'hD0: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BNE
             8'hD1: control <= 30'b00_1000011011_10_x0_00_110_01_0_xx_0010; // CMP (ZP),Y
             8'hD2: control <= 30'b00_1000011011_00_x0_00_110_01_0_xx_0010; // CMP (ZP)
             8'hD5: control <= 30'b00_1000011011_01_00_00_110_01_0_xx_0010; // CMP ZP,X
             8'hD6: control <= 30'b00_1000011000_01_10_00_011_00_0_xx_0110; // DEC ZP,X
             8'hD8: control <= 30'bx0_0001000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // CLD
             8'hD9: control <= 30'b00_1000011011_10_00_00_110_01_0_xx_0010; // CMP ABS,Y
             8'hDA: control <= 30'bx0_0000000000_xx_x0_00_100_00_0_xx_0000; // PHX
             8'hDD: control <= 30'b00_1000011011_01_00_00_110_01_0_xx_0010; // CMP ABS,X
             8'hDE: control <= 30'b00_1000011000_01_10_00_011_00_0_xx_0110; // DEC ABS,X
             8'hE0: control <= 30'b00_1000011011_xx_x0_00_110_01_0_xx_0000; // CPX #IMM
             8'hE1: control <= 30'b10_1010011011_01_x0_00_110_11_1_10_0010; // SBC (ZP,X)
             8'hE4: control <= 30'b00_1000011011_00_00_00_110_01_0_xx_0000; // CPX ZP
             8'hE5: control <= 30'b10_1010011011_00_00_00_110_11_1_10_0010; // SBC ZP
             8'hE6: control <= 30'b00_1000011000_00_10_00_011_01_0_xx_0111; // INC ZP
             8'hE8: control <= 30'bx0_1000011000_xx_x0_00_100_01_1_00_0000; // INX
             8'hE9: control <= 30'b10_1010011011_xx_x0_00_110_11_1_10_0010; // SBC #IMM
             8'hEA: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // NOP
             8'hEC: control <= 30'b00_1000011011_00_00_00_110_01_0_xx_0000; // CPX ABS
             8'hED: control <= 30'b10_1010011011_00_00_00_110_11_1_10_0010; // SBC ABS
             8'hEE: control <= 30'b00_1000011000_00_10_00_011_01_0_xx_0111; // INC ABS
             8'hF0: control <= 30'bx0_0000000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // BEQ
             8'hF1: control <= 30'b10_1010011011_10_x0_00_110_11_1_10_0010; // SBC (ZP),Y
             8'hF2: control <= 30'b10_1010011011_00_x0_00_110_11_1_10_0010; // SBC (ZP)
             8'hF5: control <= 30'b10_1010011011_01_00_00_110_11_1_10_0010; // SBC ZP,X
             8'hF6: control <= 30'bx0_1000011000_01_10_00_011_01_0_xx_0111; // INC ZP,X
             8'hF8: control <= 30'bx0_0001000000_xx_x0_xx_xxx_xx_0_xx_xxxx; // SED
             8'hF9: control <= 30'b10_1010011011_10_00_00_110_11_1_10_0010; // SBC ABS,Y
             8'hFA: control <= 30'bx0_1000011000_xx_x0_00_000_00_1_00_0111; // PLX
             8'hFD: control <= 30'b10_1010011011_01_00_00_110_11_1_10_0010; // SBC ABS,X
             8'hFE: control <= 30'b00_1000011000_01_10_00_011_01_0_xx_0111; // INC ABS,X
           default: control <= 30'bxx_xxxxxxxxxx_xx_xx_xx_xxx_xx_x_xx_xxxx;
        endcase

always @(posedge clk)
    case( state )
        SYNC:   
            if( reset )        state <= BRK0;   // RST 
            else casez( DB )
                8'b0000_0000:  state <= BRK0;   // BRK
                8'b0010_0000:  state <= JSR0;   // JSR
                8'b0100_0000:  state <= RTI0;   // RTI
                8'b0110_0000:  state <= RTS0;   // RTS
                8'b0?10_1000:  state <= PULL;   // PLA/PLP
                8'b?111_1010:  state <= PULL;   // PLX/PLY
                8'b0?00_1000:  state <= PUSH;   // PHA/PHP
                8'b?101_1010:  state <= PUSH;   // PHY/PHX
                8'b1000_0000:  state <= COND;   // BRA
                8'b???1_0000:  state <= COND;   // other branches
                8'b????_0001:  state <= IDX0;   // col 1 (ZP,X)/(ZP),Y
                8'b???1_0010:  state <= IDX0;   // col 2 odd (ZP)
                8'b1010_00?0:  state <= IMM0;   // LDY#/LDX# 
                8'b11?0_00?0:  state <= IMM0;   // CPX#/CPY# 
                8'b???0_1001:  state <= IMM0;   // col 9 even 
                8'b011?_1100:  state <= IND0;   // JMP (IND) 
                8'b0100_1100:  state <= JMP0;   // JMP ABS
                8'b???1_1001:  state <= ABS0;   // col 9 odd 
                8'b????_11??:  state <= ABS0;   // col c,d,e,f
                8'b????_01??:  state <= ZERO;   // col 4,5,6,7
            endcase
        ABS0:   state <= ABS1;
        ABS1:   state <= rmw ? RDWR : DATA;
        ABCD:   state <= SYNC;
        BRK0:   state <= BRK1;
        BRK1:   state <= BRK2;
        BRK2:   state <= BRK3;
        BRK3:   state <= JMP0;
        COND:   state <= SYNC;
        DATA:   state <= bcd ? ABCD : SYNC;
        IDX0:   state <= IDX1;
        IDX1:   state <= IDX2;      
        IDX2:   state <= DATA;
        IMM0:   state <= bcd ? ABCD : SYNC;
        IND0:   state <= IND1;
        IND1:   state <= JMP0;
        JMP0:   state <= JMP1;
        JMP1:   state <= SYNC;
        JSR0:   state <= JSR1;
        JSR1:   state <= JSR2;
        JSR2:   state <= JMP1;
        PULL:   state <= DATA;
        PUSH:   state <= DATA;
        RDWR:   state <= DATA;
        RTI0:   state <= RTI1;
        RTI1:   state <= RTI2;
        RTI2:   state <= RTI3;
        RTI3:   state <= SYNC;
        RTS0:   state <= RTS1;
        RTS1:   state <= RTS2;
        RTS2:   state <= SYNC; 
        ZERO:   state <= rmw ? RDWR : DATA;
    endcase

`ifdef SIM
reg [31:0] statename;

always @(*)
    case( state )
        SYNC: statename = "SYNC";
        DATA: statename = "DATA";
        IMM0: statename = "IMM0";
        DATA: statename = "DATA";
        IDX0: statename = "IDX0";
        IDX1: statename = "IDX1";
        IDX2: statename = "IDX2";
        IND0: statename = "IND0";
        IND1: statename = "IND1";
        ABS0: statename = "ABS0";
        ABS1: statename = "ABS1";
        PULL: statename = "PULL";
        PUSH: statename = "PUSH";
        ZERO: statename = "ZERO";
        RDWR: statename = "RDWR";
        RTS0: statename = "RTS0";
        RTS1: statename = "RTS1";
        RTS2: statename = "RTS2";
        JSR0: statename = "JSR0";
        JSR1: statename = "JSR1";
        JSR2: statename = "JSR2";
        JMP0: statename = "JMP0";
        JMP1: statename = "JMP1";
        BRK0: statename = "BRK0";
        BRK1: statename = "BRK1";
        BRK2: statename = "BRK2";
        BRK3: statename = "BRK3";
        RTI0: statename = "RTI0";
        RTI1: statename = "RTI1";
        RTI2: statename = "RTI2";
        RTI3: statename = "RTI3";
        COND: statename = "COND";
        ABCD: statename = "ABCD";
    endcase
`endif

endmodule
