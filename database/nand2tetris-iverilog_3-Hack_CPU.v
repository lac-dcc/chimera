/**
 * The Hack CPU (Central Processing unit), consisting of an ALU,
 * two registers named A and D, and a program counter named PC.
 * The CPU is designed to fetch and execute instructions written in 
 * the Hack machine language. In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM==0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time step. If reset==1 then the 
 * CPU jumps to address 0 (i.e. pc is set to 0 in next time step) rather 
 * than to the address resulting from executing the current instruction. 
 */

module CPU(
    input wire clk,
    input wire [15:0] inM,          // M value input  (M = contents of RAM[A])
    input wire [15:0] instruction,  // Instruction for execution
    input wire reset,               // Signals whether to re-start the current
                                    // program (rstn==1) or continue executing
                                    // the current program (rstn==0).

    output wire [15:0] outM,        // M value output
    output wire loadM,              // Write to M? 
    output wire [15:0] addressM,    // Address in data memory (of M) to read
    output reg [15:0] pc            // address of next instruction
);

    // your implementation comes here:

    assign addressM = regA;
    wire loadI;
    wire loadA;
    wire loadD;
    assign outM = outALU;    
    wire [15:0] am;
    assign am = (instruction[12]) ? inM : regA;
    wire lt;
    wire eq;
    wire jmp;
    wire inc;
    wire [15:0] outALU;
        
    reg [15:0] regA;
    reg [15:0] regD;
    ALU ALU_0(
        .x(regD),
        .y(am),
        .zx(instruction[11]),
        .nx(instruction[10]),
        .zy(instruction[9]),
        .ny(instruction[8]),
        .f(instruction[7]),
        .no(instruction[6]),
        .out(outALU),
        .zr(eq),
        .ng(lt)
    );
    assign loadI = ~instruction[15];
    assign loadA = instruction[15] & instruction[5];
    assign loadD = instruction[15] & instruction[4];
    assign loadM = instruction[15] & instruction[3];
    assign jmp = instruction[15] & ((lt & instruction[2]) | (eq & instruction[1]) | ((!(lt|eq)) & instruction[0]));
    
    always @(posedge clk)
        if (reset) pc <= 0;
        else if (jmp) pc <= regA;
        else pc <= pc+1;

    always @(posedge clk)
        if (reset) regA <= 0;
        else if (loadI) regA <= instruction;
        else if (loadA) regA <= outALU;
        else regA <= regA;
    
    always @(posedge clk)
        if (reset) regD <= 0;
        else if (loadD) regD <= outALU;
        else regD <= regD;
    
endmodule
