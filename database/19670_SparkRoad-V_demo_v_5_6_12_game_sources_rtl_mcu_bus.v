// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: bus
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bus
(
    input   wire		clk,
    
	// write bus
	input	wire		bus_wen,
	input	wire [7:0]	bus_waddr,
	input	wire [7:0]	bus_wdata,
	
	// read bus
	input	wire		bus_ren,
	input	wire [7:0]	bus_raddr,
	output	reg  [7:0]	bus_rdata,
    
    // user port
	// vram
	output	reg			vram_wen,
	output	reg			vram_wdata,
	output	reg			vram_ren,
	input	wire		vram_rdata,
	output	reg [7:0]	vram_addr,
	
	// key & led
	input	wire [5:0]	key,
	output	reg			clear,
    output  reg			led
);

// 总线写数据
always@(posedge clk)
begin
    if(bus_wen)
    begin
        case(bus_waddr)
         0: led <= bus_wdata;
		 1: vram_addr <= bus_wdata;
		 2: vram_wdata <= bus_wdata;
		
        endcase
    end
end

// 总线读数据
always@(posedge clk)
begin
    if(bus_ren)
    begin
        case(bus_raddr)
         0: bus_rdata <= led;
		 1: bus_rdata <= key;
		 2: bus_rdata <= vram_rdata;
		 
		 
         default: bus_rdata <= 0;
        endcase
    end
end

// 控制信号
always@(posedge clk)
begin
	clear <= bus_ren && (bus_raddr == 1);
	vram_ren <= bus_wen && (bus_waddr == 1);
	vram_wen <= bus_wen && (bus_waddr == 2);
end

endmodule
