`default_nettype none

module PC_tb;

    reg clk  = 0;
    reg rst = 0;
    reg branch = 0;
    reg ijump = 0;
    reg aluFlag = 0;
    reg wPC = 0;

    reg  [7:0] jmpAddr = 8'b00;
    wire [7:0] PC;

    // Instanciate DUT
    PC PC0 (
        .clk(clk),
        .rst(rst),
        .jmpAddr(jmpAddr),
        .branch(branch),
        .ijump(ijump),
        .aluFlag(aluFlag),
        .wPC(wPC),
        .PC(PC)
    );

    // Simulate clock
    always #4 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile("PC_tb.vcd");
        $dumpvars(0, PC_tb);

        #2 

        #1  rst = 1;
        #2  rst = 0;
        
        #6  wPC = 1;
        #2  wPC = 0;

    // JUMP
        #4  branch=1;
            ijump=1;
            aluFlag = 0;    // should jump to B0
            jmpAddr = 8'hB2;

        #2  wPC = 1;
        #2  wPC = 0;            


    // INCRPC
        #4  branch=0;
            ijump=0;
            aluFlag = 0;
            jmpAddr = 8'h00; // doesn't matter...

        #2  wPC = 1;
        #2  wPC = 0;            

    // INCRPC
        #4  branch=0;
            ijump=0;
            aluFlag = 0;
            jmpAddr = 8'h00; // doesn't matter...

        #2  wPC = 1;
        #2  wPC = 0;            

    // JUMPZ/N
        #4  branch=1;
            ijump=0;
            aluFlag = 1;    // should jump to A0
            jmpAddr = 8'hA0;

        #2  wPC = 1;
        #2  wPC = 0;            

    // JUMPZ/N
        #4  branch=1;
            ijump=0;
            aluFlag = 0;    // should NOT jump to A0 --> A0 +1 => A1
            jmpAddr = 8'hA0;

        #2  wPC = 1;
        #2  wPC = 0;            

        #10 $finish;
    end


endmodule
