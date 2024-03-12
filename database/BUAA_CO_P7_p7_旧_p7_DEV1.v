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
    output reg [31:0] DataOut,
    output reg IRQ
    );

	`define Idle 2'b00 
	`define Counting 2'b01 
	`define Interrupt 2'b10
	
	reg[1:0] state;
	reg[31:0] PRESET;
	reg[31:0] COUNT;
	reg[2:1] Mode;
	reg IM;
	reg Enable;
	reg irq;
	
	always@(posedge clk) begin
		if(reset) begin
			PRESET<=0;
			COUNT<=0;
			state<=`Idle;
			IM<=0;
			Enable<=0;
			irq<=0;
		end
		if(WE) begin
			case(Addr) 
				32'h0000_7f10: begin //ctrl
					{IM,Mode,Enable} <= DataIn[3:0];
					//当计数器计数时，若计数器使能被 store 类指令修改为 0 则停止计数
					if(state == `Counting && DataIn[0]==1'b0) begin
						COUNT<=PRESET;
					end
				end
				32'h0000_7f14: begin
					PRESET<=DataIn;
				end
				32'h0000_7f18: begin
					
				end
				default: begin
				
				end
			endcase
		end
		else begin
			case(state) 
				`Idle: begin
					if(Enable==1'b1) begin
						state<=`Counting;
						COUNT<=PRESET;
						irq<=0;
					end
					else begin
						state<=`Idle;
					end
				end
				
				`Counting: begin
					if(Enable==1'b0) begin
						state<=`Idle;
					end
					else if(Enable==1'b1&&COUNT<=1) begin
						state<=`Interrupt;
						irq<=0;
					end
					else if(Enable==1'b1) begin
						state<=`Counting;
						COUNT<=COUNT-1;
						irq<=0;
					end
				end
				
				`Interrupt: begin
					if(Enable==1'b1) begin
						irq<=1;
						if(Mode==2'b00) begin
							Enable<=0;
							state<=`Idle;
						end
						else if(Mode==2'b01) begin
							state<=`Counting;
							COUNT<=PRESET;
						end
					end
				end
			endcase
		end
		IRQ<=irq&&IM;
		case({WE,Addr[3:2]})
			3'b000: begin
				DataOut<={28'b0,IM,Mode,Enable};
			end
			3'b001: begin
				DataOut<=PRESET;
			end
			3'b010: begin
				DataOut<=COUNT;
			end
			3'b011: begin
				DataOut<=0;
			end
		endcase
	end
endmodule
