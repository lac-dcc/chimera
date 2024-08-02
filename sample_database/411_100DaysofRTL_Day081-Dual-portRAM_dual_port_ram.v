// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module dual_port_ram 
     #(parameter data_width=8,
	   parameter addr_width=4,
	   parameter depth=16)
	   
      ( input clk,
        input wr_en, 
        input [data_width-1:0] data_in,
        input [addr_width-1:0] addr_in_0,   //address for port 0
        input [addr_width-1:0] addr_in_1,   //address for port 1
        input  port_en_0,                   //enable port 0.
        input  port_en_1,                   //enable port 1.
        output [data_width-1:0] data_out_0, //output data from port 0.
        output [data_width-1:0] data_out_1  //output data from port 1.
    );

reg [data_width-1:0] ram [0:depth-1];

always@(posedge clk)
begin
    if(port_en_0 == 1 && wr_en == 1)    
        ram[addr_in_0] <= data_in;
        
end

assign data_out_0 = port_en_0 ? ram[addr_in_0] : 'dZ;   
assign data_out_1 = port_en_1 ? ram[addr_in_1] : 'dZ;   

endmodule 
