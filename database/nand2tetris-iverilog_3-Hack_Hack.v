/** 
 * The module hack is our top-level module
 * It connects the external pins of our fpga (hack.pcf)
 * to the internal components (cpu,mem,clk,rst,rom)
 *
 */

`default_nettype none
module hack(                        // top level module 
    input  wire clk,                
    input  wire [1:0] but,          // buttons  (0 if pressed, 1 if released)
    output wire [1:0] led           // leds     (0 off, 1 on)
);

    // your implementation comes here:

    // reset logic
    wire reset;
    Reset Reset_0(.clk(clk),.reset(reset));

    // hack cpu (nand2tetris)
    wire [15:0] pc;
    wire [15:0] instruction;
    wire [15:0] addressM;
    wire [15:0] inM;
    wire loadM;
    wire [15:0] outM;
    CPU CPU_0(                        
        .clk(clk),
        .inM(inM),                  // M value input  (M = contents of RAM[A])
        .instruction(instruction),  // Instruction for execution
        .reset(reset),              // Signals whether to re-start the current
                                    // program (rstn==0) or continue executing
                                    // the current program (rstn==1).
        .outM(outM),                // M value output
        .loadM(loadM),              // Write to M? 
        .addressM(addressM),        // Address in data memory to Read(of M)
        .pc(pc)                     // address of next instruction
    );

    // rom stores hack code
    ROM ROM_0(
        .address(pc),
        .data(instruction)
    );

    // mem gives access to ram and io    
    Memory Memory_0(
        .clk(clk),
        .address(addressM),
        .dataR(inM),
        .dataW(outM),
        .load(loadM),
        .but(but),
        .led(led)
    );

endmodule
