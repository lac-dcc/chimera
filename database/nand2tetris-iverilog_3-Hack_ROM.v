/**
 * The module rom provides access to the instruction memory
 * of hack. The instruction memory is read only (ROM) and
 * preloaded with 4Kx16bit of Hackcode.
 * 
 * The signal data (16bit) provides the instruction at memory address
 * data = ROM[address]
 */

module ROM(
    input  wire [15:0] address,
    output wire [15:0] data        
);

    // your implementation comes here:

    // ROM file of hack
    parameter ROMFILE = "./blinky.hack";
    
    reg [15:0] regROM [0:1023];
    assign data = regROM[address];
    initial begin
        $readmemb(ROMFILE,regROM);
    end

endmodule
