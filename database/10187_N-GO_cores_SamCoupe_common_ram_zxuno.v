// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Miguel Angel Rodriguez Jodar
// 
// Create Date:    03:34:47 07/25/2015 
// Design Name:    SAM Coupé clone
// Module Name:    ram 
// Project Name:   SAM Coupé clone
// Target Devices: Spartan 6
// Tool versions:  ISE 12.4
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram_dual_port_turnos2 (
    input wire clk,
    input wire whichturn,
    input wire [18:0] vramaddr,
    input wire [18:0] cpuramaddr,
    input wire cpu_we_n,
    input wire [7:0] data_from_cpu,
    output reg [7:0] data_to_asic,
    output reg [7:0] data_to_cpu,
    // Actual interface with SRAM
    output reg [18:0] sram_a,
    output reg sram_we_n,
    inout wire [7:0] sram_d,
    // bootrom
    input wire[7:0] romwrite_data,
    input wire romwrite_wr,
    input wire[18:0] romwrite_addr,
    // rom
    input wire[14:0] romaddr,
    output reg[7:0] data_from_rom,
    input wire rom_oe_n
    ,
    input wire rom_initialised
    );
    
    wire romwrite_wr_safe = romwrite_wr == 1'b1 && rom_initialised == 1'b0;
    assign sram_d = romwrite_wr_safe == 1'b1 ? romwrite_data :
                    (cpu_we_n == 1'b0 && whichturn == 1'b0) ? data_from_cpu :
                    8'hZZ;
                    
    always @* begin
        data_to_cpu = 8'hFF;
        data_to_asic = 8'hFF;
        if (whichturn && rom_initialised) begin // ASIC
            sram_a = vramaddr;
            sram_we_n = 1'b1;
            data_to_asic = sram_d;
        end
        else begin
            sram_a = romwrite_wr_safe ? romwrite_addr :
                     !rom_oe_n ? {4'b1000, romaddr} :
                     cpuramaddr;
            sram_we_n = cpu_we_n && !romwrite_wr_safe;
            data_to_cpu = cpuramaddr[18] ? 8'hFF : sram_d;
            data_from_rom = rom_oe_n ? 8'hFF : sram_d;
        end
    end
endmodule
