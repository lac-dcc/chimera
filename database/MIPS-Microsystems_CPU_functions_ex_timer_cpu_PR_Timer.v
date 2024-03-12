`timescale 1ns / 1ps

`define IDLE 2'b00			//define 4 states
`define LOAD 2'b01
`define CNT  2'b10
`define INT  2'b11

`define ctrl   mem[0]		//define 3 registers
`define preset mem[1]
`define count  mem[2]

module Timer(clk,reset,ADDR,TimerWe,Din,Dout,IRQ);
//input
    input clk;
    input reset;

    input TimerWe;
    
	input [31:0] ADDR;
    input [31:0] Din;

//output
    output [31:0] Dout;
    output IRQ;				//request for interruption

//sequential logic
	integer i;

	reg [1:0] state;
	reg [31:0] mem [2:0];
	reg _IRQ;
	
	wire [3:2] addr;
	wire [31:0] load;

	assign addr=ADDR[3:2];		//PA to LA
	assign load = addr == 0 ? {28'h0, Din[3:0]} : Din;	//CTRL[31:4] need reservation
	
	assign IRQ = (`ctrl[3] && _IRQ);	//CTRL[IM]==1 and _IRQ==1 
	assign Dout = mem[addr];		
	
	always @(posedge clk) 
		begin
			if(reset) 
				begin
					state <= `IDLE; 
					for(i = 0; i < 3; i = i+1) mem[i] <= 0;
					_IRQ <= 0;
				end
			else if(TimerWe)	//extern write is prior to self-modify
				begin
					// $display("%d@: *%h <= %h", $time, {ADDR, 2'b00}, load);
					mem[addr] <= load;
				end
			else 
				begin
					case(state)
						`IDLE :	//keep _IRQ unchanged
							if(`ctrl[0])
								begin
									state <= `LOAD;
									_IRQ <= 1'b0;
								end
						`LOAD : //set val of count_down
							begin
								`count <= `preset;
								state <= `CNT;
							end
						`CNT  : //count
							if(`ctrl[0])
								begin
									if(`count > 1) `count <= `count-1;
									else
										begin
											`count <= 0;
											state <= `INT;	//set _IRQ 1
											_IRQ <= 1'b1;
										end
								end
							else state <= `IDLE;	//counting is interrupted by manul changing CTRL[enable]
						default : 
							begin
								state <= `IDLE;
								if(`ctrl[2:1] == 2'b00) `ctrl[0] <= 1'b0;	//mode 0
								else _IRQ <= 1'b0;
							end
					endcase
				end
		end

endmodule
