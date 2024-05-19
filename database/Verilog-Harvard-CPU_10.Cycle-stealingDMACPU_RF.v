// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: RF
// Project Name: Computer organization Project 2-2
//////////////////////////////////////////////////////////////////////////////////

module RF(
    input write,
    input clk,
    input reset_n,
    input [1:0] addr1,
    input [1:0] addr2,
    input [1:0] addr3,
    output [15:0] data1,
    output [15:0] data2,
    input [15:0] data3
    );
    
    reg [63:0] register;
    /*
    register[63:48] == register[16*3+: 16] (addr is 2'b11)
    register[47:32] == register[16*2+: 16] (addr is 2'b10)
    register[31:16] == register[16*1+: 16] (addr is 2'b01)
    register[15: 0] == register[16*0+: 16] (addr is 2'b00)
    */
    
    always @(posedge clk) begin
        // Synchronous active low reset
    	if (!reset_n) register <= 64'b0;
    	// Synchronous data write
    	else if (write) register[16*addr3+: 16] <= data3;
    end
    
    // Asynchronous data read
    assign data1 = register[16*addr1+: 16];
    assign data2 = register[16*addr2+: 16];
    
endmodule