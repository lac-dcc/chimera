`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:05 12/12/2018 
// Design Name: 
// Module Name:    DEV1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DEV1(
    input clk,
    input reset,
    input [31:0] Addr,
    input WE,
    input [31:0] DataIn,
    output [31:0] DataOut,
    output IRQ
    );

	`define Idle 2'b00 
	`define Load 2'b01
	`define Counting 2'b10
	`define Interrupt 2'b11
	
	reg[1:0] state;
	reg[31:0] PRESET;
	reg[31:0] COUNT;
	reg IM;//中断屏蔽
	reg[2:1] Mode;//模式选择
	reg Enable;//计数器使能
	reg irq;
	
	initial begin
		COUNT<=0;
		PRESET<=0;
		IM<=1'b0;
		Mode<=2'b0;
		Enable<=1'b0;
		state<=`Idle;
		irq<=0;
	end
	
	assign IRQ = IM && irq;
	
	assign DataOut = (Addr[3:2]==2'b00) ? {28'b0,IM,Mode,Enable} :
						  (Addr[3:2]==2'b01) ? PRESET :
						  (Addr[3:2]==2'b10) ? COUNT : 0;
						  
	always@(posedge clk) begin
		if(reset) begin
			COUNT<=0;
			PRESET<=0;
			IM<=1'b0;
			Mode<=2'b0;
			Enable<=1'b0;
			state<=`Idle;
			irq<=0;
		end
		if(WE) begin
			case(Addr) 
				32'h0000_7f10: begin //ctrl
					{IM,Mode,Enable} <= DataIn[3:0];
				end
				32'h0000_7f14: begin //
					PRESET<=DataIn;
				end
				32'h0000_7f18: begin //
					//啥都不做
				end
				default: begin
					//什么都不做
				end
			endcase
		end
		else begin
			case(state) 
				`Idle: begin
					if(Enable==1'b1) begin
						state<=`Load;
						irq<=0;
					end
					else begin
						state<=`Idle;
					end
				end
				
				`Load: begin
					COUNT<=PRESET;
					state<=`Counting;
				end
				
				`Counting: begin
					if(Enable==1'b0) begin
						state<=`Idle;
					end
					else if(Enable==1'b1&&COUNT<=1) begin
						state<=`Interrupt;
						irq<=1;
					end
					else if(Enable==1'b1) begin
						state<=`Counting;
						COUNT<=COUNT-1;
						irq<=0;
					end
				end
				
				`Interrupt: begin
					if(Mode==2'b00) begin
						Enable<=0;
						state<=`Idle;
					end
					else if(Mode==2'b01) begin
						state<=`Idle;
						irq<=0;
					end
					else begin
						
					end
				end
			endcase
		end
	end
endmodule
