// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

`define WORD_SIZE 16
`define LATENCY 4
/*************************************************
* DMA module (DMA.v)
* input: clock (CLK), bus request (BR) signal, 
*        data from the device (edata), and DMA command (cmd)
* output: bus grant (BG) signal 
*         READ signal
*         memory address (addr) to be written by the device, 
*         offset device offset (0 - 2)
*         data that will be written to the memory
*         interrupt to notify DMA is end
* You should NOT change the name of the I/O ports and the module name
* You can (or may have to) change the type and length of I/O ports 
* (e.g., wire -> reg) if you want 
* Do not add more ports! 
*************************************************/

module DMA (
    input CLK, BG,
    input [4 * `WORD_SIZE - 1 : 0] edata,
    input cmd,
    output reg BR, WR,
    output reg [`WORD_SIZE - 3 : 0] addr, // block address is used
    output reg [4 * `WORD_SIZE - 1 : 0] data,
    output [1:0] offset,
    output reg interrupt);

    reg cycle_stolen;   // DMA not done yet, but cycle stolen by CPU.
    reg [1:0] block;    // data is written to block address (0x1F4>>2 + block)
    reg [2:0] counter;  // counts cycles left until data write to memory completes
    
    assign offset = BG ? block : 2'bz;
    
    always @(posedge CLK) begin
        // Received DMA request. Send out bus request.
        if (cmd && !interrupt) BR <= 1;
        else BR <= 0;
        
        // Bus granted. Execute writes.
        if (BG && !interrupt) begin
            addr <= 14'h7d + block;
            data <= edata;
            if (counter == 0) begin
                counter <= `LATENCY;
                WR <= 1;
            end else begin
                counter <= counter - 1;
            end
        end else begin
            addr <= 14'bz;
            data <= 64'bz;
            WR <= 1'bz;
            interrupt <= 0;
            counter <= 0;
            // While DMA cycle is stolen, do not reset block number.
            if (cycle_stolen==0 || cycle_stolen===1'bx) begin
                block <= 0;
            end
        end
    end
    
    // Writes are done at clock negative edge.
    always @(negedge CLK) begin
        if (BG && !interrupt && counter==1) begin
            counter <= 0;
            BR <= 0;
            WR <= 0;
            if (block == 2) begin
                cycle_stolen <= 0;
                block <= 0;
                interrupt <= 1;
            end else begin
                cycle_stolen <= 1;
                block <= block + 1;
            end
        end
    end

endmodule