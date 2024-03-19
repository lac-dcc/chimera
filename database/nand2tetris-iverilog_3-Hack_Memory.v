/*
 * The module mem provides access to memory RAM 
 * and memory mapped IO
 * In our Minimal-Hack-Project we will use 4Kx16 Bit RAM
 * 
 * address | memory
 * ----------------
 * 0-4047  | RAM
 * 8192    | but
 * 8193    | led
 *
 * WRITE:
 * When load is set to 1, 16 bit dataW are stored to Memory address
 * at next clock cycle. M[address] <= dataW
 * READ:
 * dataR provides data stored in Memory at address.
 * dataR = M[address]
 *
 */

module Memory(
    input  wire clk,
    input  wire [15:0] address,
    input  wire [15:0] dataW,
    output wire [15:0] dataR,
    input  wire load,
    input  wire [1:0] but,
    output wire [1:0] led
);

    // your implementation comes here:

    // Read Memory    
    assign dataR =  (address[13]==0)? regRAM[address[11:0]] : memGPIO;
    wire [15:0] memGPIO;
    assign memGPIO =  (address[0]==0)? regLED : but;

    // Write to RAM
    reg [15:0] regRAM [0:8191];
    always @(posedge clk) begin
        if (load & (address[13]==0)) regRAM[address[11:0]] <= dataW;
    end

    // leds
    assign led = regLED[1:0];
    reg [15:0] regLED = 0;
    always @(posedge clk) begin
        if (load & (address==8192)) regLED <= dataW;
        else regLED <= regLED;
    end

endmodule
