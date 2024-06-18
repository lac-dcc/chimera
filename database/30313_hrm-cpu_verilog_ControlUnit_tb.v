// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

module ControlUnit_tb;

    // input signals
    reg  [7:0] INSTR    = 0;
    reg        inEmpty  = 0;
    reg        outFull  = 0;
    reg        debug    = 0;
    reg        nxtInstr = 0;
    // output signals
    wire       wIR;
    wire [1:0] muxR;
    wire       wR;
    wire       srcA;
    wire       wM;
    wire       wAR;
    wire [2:0] aluCtl;
    wire       wPC;
    wire       rIn;
    wire       wO;
    wire       ijump;
    wire       branch;
    wire       rst;
    wire       halt;
    // generic signals
    reg        clk     = 0;
    reg        i_rst   = 0;

    localparam
    o_INBOX    = 4'b 0000,
    o_OUTBOX   = 4'b 0001,
    o_COPYFROM = 4'b 0010,
    o_COPYTO   = 4'b 0011,
    o_ADD      = 4'b 0100,
    o_SUB      = 4'b 0101,
    o_BUMPP    = 4'b 0110,
    o_BUMPN    = 4'b 0111,
    o_JUMP     = 4'b 1000,
    o_JUMPZ    = 4'b 1001,
    o_JUMPN    = 4'b 1010,
    // o_NOP1     = 4'b 1011,
    // o_NOP2     = 4'b 1100,
    // o_NOP3     = 4'b 1101,
    // o_SET      = 4'b 1110,
    o_HALT     = 4'b 1111;

    // Instanciate DUT
    ControlUnit ControlUnit0 (
        .INSTR(INSTR),
        .inEmpty(inEmpty),
        .outFull(outFull),
        .debug(debug),
        .nxtInstr(nxtInstr),
        .wIR(wIR),
        .muxR(muxR),
        .wR(wR),
        .srcA(srcA),
        .wM(wM),
        .wAR(wAR),
        .aluCtl(aluCtl),
        .wPC(wPC),
        .rIn(rIn),
        .wO(wO),
        .ijump(ijump),
        .branch(branch),
        .rst(rst),
        .halt(halt),
        .clk(clk),
        .i_rst(i_rst)
    );

    // Simulate clock
    always #1 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile(  "ControlUnit_tb.vcd");
        $dumpvars(0, ControlUnit_tb);

        #0  i_rst = 0;
            inEmpty = 1;
        #2 i_rst = 0;
         
        #15 inEmpty = 0;

        #30 INSTR = o_HALT<<4;

        #1000 $finish;
    end


endmodule

