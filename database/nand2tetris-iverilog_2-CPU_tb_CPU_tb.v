`default_nettype none
module CPU_tb();

    integer file;
    reg clk=0;    
    reg [15:0] inM=0;
    reg [15:0] instruction=0;
    reg reset=1;
    wire [15:0] outM;
    wire loadM;
    wire [15:0] addressM;
    wire [15:0] pc;
    CPU CPU(
        .clk(clk),
        .inM(inM),
        .instruction(instruction),
        .reset(reset),
        .outM(outM),
        .loadM(loadM),
        .addressM(addressM),
        .pc(pc)
    );

    always #1 clk = ~clk;

    task display;
        #1 $fwrite(file, "| %16b | %16b | %16b | %1b | %16b | %1b | %16b |\n",pc,inM,instruction,reset,outM,loadM,addressM);
    endtask

    initial begin
        $dumpfile("CPU_tb.vcd");
        $dumpvars(0, CPU_tb);
        file = $fopen("CPU.out","w");
        $fwrite(file, "|       pc         |       inM        |    instruction   |rst|       outM       |wM |    addressM      |\n");

        #1 reset = 1;
        display();
        #1 reset = 0;
        display();
        #2 instruction = 16'b0011000000111001; // @12345
        display();

        #2 instruction = 16'b1110110000010000; // D=A
        display();

        #2 instruction = 16'b0101101110100000; // @23456
        display();

        #2 instruction = 16'b1110000111010000; // D=A-D
        display();

        #2 instruction = 16'b0000001111101000; // @1000
        display();

        #2 instruction = 16'b1110001100001000; // M=D
        display();

        #2 instruction = 16'b0000001111101001; // @1001
        display();

        #2 instruction = 16'b1110001110011000; // MD=D-1
        display();

        #2 instruction = 16'b0000001111101000; // @1000
        display();

        #2 instruction = 16'b1111010011010000; // D=D-M
        #2 inM=11111;
        display();

        #2 instruction = 16'b0000000000001110; // @14
        display();

        #2 instruction = 16'b1110001100000100; // D;jlt
        display();

        #2 instruction = 16'b0000001111100111; // @999
        display();

        #2 instruction = 16'b1110110111100000; // A=A+1
        display();

        #2 instruction = 16'b1110001100001000; // M=D
        display();

        #2 instruction = 16'b0000000000010101; // @21
        display();

        #2 instruction = 16'b1110011111000010; // D+1;jeq
        display();

        #2 instruction = 16'b0000000000000010; // @2
        display();

        #2 instruction = 16'b1110000010010000; // D=D+A
        display();

        #2 instruction = 16'b0000001111101000; // @1000
        display();

        #2 instruction = 16'b1110111010010000; // D=-1
        display();

        #2 instruction = 16'b1110001100000001; // D;JGT
        display();

        #2 instruction = 16'b1110001100000010; // D;JEQ
        display();

        #2 instruction = 16'b1110001100000011; // D;JGE
        display();

        #2 instruction = 16'b1110001100000100; // D;JLT
        display();

        #2 instruction = 16'b1110001100000101; // D;JNE
        display();

        #2 instruction = 16'b1110001100000110; // D;JLE
        display();

        #2 instruction = 16'b1110001100000111; // D;JMP
        display();

        #2 instruction = 16'b1110101010010000; // D=0
        display();

        #2 instruction = 16'b1110001100000001; // D;JGT
        display();

        #2 instruction = 16'b1110001100000010; // D;JEQ
        display();

        #2 instruction = 16'b1110001100000011; // D;JGE
        display();

        #2 instruction = 16'b1110001100000100; // D;JLT
        display();

        #2 instruction = 16'b1110001100000101; // D;JNE
        display();

        #2 instruction = 16'b1110001100000110; // D;JLE
        display();

        #2 instruction = 16'b1110001100000111; // D;JMP
        display();

        #2 instruction = 16'b1110111111010000; // D=1
        display();

        #2 instruction = 16'b1110001100000001; // D;JGT
        display();

        #2 instruction = 16'b1110001100000010; // D;JEQ
        display();

        #2 instruction = 16'b1110001100000011; // D;JGE
        display();

        #2 instruction = 16'b1110001100000100; // D;JLT
        display();

        #2 instruction = 16'b1110001100000101; // D;JNE
        display();

        #2 instruction = 16'b1110001100000110; // D;JLE
        display();

        #2 instruction = 16'b1110001100000111; // D;JMP
        display();

        #2 reset=1;
        display();

        #2 instruction = 16'b0111111111111111; // @32767
        #2 reset=0;
        display();

        $finish;
	end

endmodule
