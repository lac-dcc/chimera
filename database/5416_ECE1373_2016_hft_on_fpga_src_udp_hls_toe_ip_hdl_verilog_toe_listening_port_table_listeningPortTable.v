// This program was cloned from: https://github.com/mustafabbas/ECE1373_2016_hft_on_fpga
// License: MIT License

// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
module toe_listening_port_table_listeningPortTable_ram (addr0, ce0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 1;
parameter AWIDTH = 15;
parameter MEM_SIZE = 32768;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
input we1;
output reg[DWIDTH-1:0] q1;
input clk;

(* ram_style = "block" *)reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];

initial begin
    $readmemh("./toe_listening_port_table_listeningPortTable_ram.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
            q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) 
    begin
        if (we1) 
        begin 
            ram[addr1] <= d1; 
            q1 <= d1;
        end 
        else 
            q1 <= ram[addr1];
    end
end


endmodule


`timescale 1 ns / 1 ps
module toe_listening_port_table_listeningPortTable(
    reset,
    clk,
    address0,
    ce0,
    q0,
    address1,
    ce1,
    we1,
    d1,
    q1);

parameter DataWidth = 32'd1;
parameter AddressRange = 32'd32768;
parameter AddressWidth = 32'd15;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



toe_listening_port_table_listeningPortTable_ram toe_listening_port_table_listeningPortTable_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .d1( d1 ),
    .we1( we1 ),
    .q1( q1 ));

endmodule

