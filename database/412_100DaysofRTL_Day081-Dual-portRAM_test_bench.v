// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

parameter data_width = 8;
parameter addr_width = 4;
parameter depth = 16;
integer i;

	reg clk;
	reg wr_en;
	reg [data_width-1:0] data_in;
	reg [addr_width-1:0] addr_in_0;
	reg [addr_width-1:0] addr_in_1;
	reg port_en_0;
	reg port_en_1;
	wire [data_width-1:0] data_out_0;
	wire [data_width-1:0] data_out_1;

	dual_port_ram dut(clk, wr_en, data_in, addr_in_0, addr_in_1, port_en_0, port_en_1, data_out_0, data_out_1);

 initial begin
    clk= 1'b1;
    forever #5 clk = ~clk;
 end

initial begin
    addr_in_1 = 0;
    port_en_0 = 0;
    port_en_1 = 0;
    wr_en = 0;
    data_in = 0;
    addr_in_0 = 0;  
    #20;
        
    port_en_0 = 1;  
    wr_en = 1;
        
      for(i=1; i <= 16; i = i + 1) begin
            data_in = i;
            addr_in_0 = i-1;
            #10;
        end
        
    wr_en = 0;
    port_en_0 = 0;  
    port_en_1 = 1;  
        
        for(i=1; i <= 16; i = i + 1) begin
            addr_in_1 = i-1;
            #10;
            
        end
        port_en_1 = 0;
    end
initial begin
$monitor("write enable: %d  input data: %d  address 0: %d  address 1: %d  output 0: %d  output 1: %d", wr_en, data_in, addr_in_0, addr_in_1, data_out_0, data_out_1);
#340 $finish;
end
endmodule
