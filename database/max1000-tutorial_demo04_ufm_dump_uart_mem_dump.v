module uart_mem_dump
(
	input clk,
	input nreset,
	
	output reg [ADDR_W-1:0] mem_addr,
	input wire [DATA_W-1:0] mem_data,
	
	output reg mem_read,	// Read request
	input wire mem_waitrequest,
	input wire mem_readdatavalid,
	
	output reg [7:0] uart_data,
	output reg uart_valid,
	input wire uart_ready
);
	
parameter ADDR_W = 17;
parameter DATA_W = 32;

// From Altera User Flash generated IP
parameter ADDR_MIN = 17'h0;
parameter ADDR_MAX = 17'd79871;

// register mem data
reg [DATA_W-1:0] mem_data_q;

// Number of bytes required to represent address and data
localparam ADDR_BYTES = (ADDR_W + 7) / 8;
localparam DATA_BYTES = (DATA_W + 7) / 8;

wire [ADDR_BYTES*8-1:0] addr_ex = { {(ADDR_BYTES*8-ADDR_W) {1'b0}}, mem_addr};
wire [DATA_BYTES*8-1:0] data_ex = { {(DATA_BYTES*8-DATA_W) {1'b0}}, mem_data_q};

// Convert 4 bits to ASCII hex number
function [7:0] Nibble_to_Char;
	input [3:0] in;
begin
	case (in)
		4'b0000: Nibble_to_Char =  "0";
		4'b0001: Nibble_to_Char =  "1";
		4'b0010: Nibble_to_Char =  "2";
		4'b0011: Nibble_to_Char =  "3";
		4'b0100: Nibble_to_Char =  "4";
		4'b0101: Nibble_to_Char =  "5";
		4'b0110: Nibble_to_Char =  "6";
		4'b0111: Nibble_to_Char =  "7";
		4'b1000: Nibble_to_Char =  "8";
		4'b1001: Nibble_to_Char =  "9";
		4'b1010: Nibble_to_Char =  "A";
		4'b1011: Nibble_to_Char =  "B";
		4'b1100: Nibble_to_Char =  "C";
		4'b1101: Nibble_to_Char =  "D";
		4'b1110: Nibble_to_Char =  "E";
		4'b1111: Nibble_to_Char =  "F";
	endcase
end
endfunction

// State Machine
localparam S_W 		= 4;
localparam S_IDLE 	= 4'd0;
localparam S_NEWLINE	= 4'd1;
localparam S_ADDR		= 4'd2;
localparam S_SEP		= 4'd3;
localparam S_READ		= 4'd4;
localparam S_SPACE	= 4'd5;
localparam S_NIBBLE	= 4'd6;
localparam S_DONE		= 4'd7;

reg [S_W-1:0] state;

reg [3:0] cnt; // counter for intra-element nibbles
reg [3:0] word_cnt; // counter for elements per line

task Goto_State;
	input [S_W-1:0] next;
begin
	state <= next;
	case (next)
		S_NEWLINE: begin
			uart_data <= 8'h0D;
			uart_valid <= 1'b1;
		end
		
		S_ADDR: begin
			uart_data <= Nibble_to_Char(
				addr_ex[((ADDR_BYTES*2-cnt)*4-1) -: 4]
			);
			uart_valid <= 1'b1;
			cnt <= cnt + 1'b1;
		end
		
		S_SEP: begin
			uart_data <= ":";
			uart_valid <= 1'b1;
		end
		
		S_SPACE: begin
			uart_data <= " ";
			uart_valid <= 1'b1;
		end
		
		S_READ: begin
			mem_read <= 1'b1;
		end
		
		S_NIBBLE: begin
			uart_data <= Nibble_to_Char(
				data_ex[(cnt^1'b1)*4+3 -: 4]
			);
			uart_valid <= 1'b1;
			cnt <= cnt + 1'b1;
		end
		
		S_DONE: begin
		
		end
		
	endcase
end
endtask

always @(posedge clk or negedge nreset)
	if (~nreset) begin
		mem_addr 	<= ADDR_MIN;
		mem_read 	<= 1'b0;
		uart_data 	<= 8'b0;
		uart_valid 	<= 1'b0;
		cnt			<= 4'b0;
		word_cnt		<= 4'b0;
		mem_data_q	<= {DATA_W{1'b0}};
		state 		<= S_IDLE;
	end else begin
		if (uart_valid) begin
			uart_valid <= 1'b0;
		end else
		if (mem_read) begin
			mem_read <= 1'b0;
		end else
		case (state)
			S_IDLE:
				Goto_State(S_NEWLINE);
		
			S_NEWLINE:
				if (uart_ready) begin
					Goto_State(S_ADDR);
				end
			
			S_ADDR:
				if (uart_ready) begin
					if (cnt == ADDR_BYTES*2) begin
						cnt <= 4'b0;
						Goto_State(S_SEP);
					end else begin
						Goto_State(S_ADDR);
					end
				end
			
			S_SEP:
				if (uart_ready) begin
					if (!mem_waitrequest) begin
						Goto_State(S_READ);
					end
				end
				
			S_READ:
				if (mem_readdatavalid) begin
					mem_data_q <= mem_data;
					mem_addr <= mem_addr + 1'b1;
					Goto_State(S_SPACE);
				end
			
			S_SPACE:
				if (uart_ready) begin
					Goto_State(S_NIBBLE);
				end
			
			S_NIBBLE:
				if (uart_ready) begin
					if (cnt == DATA_BYTES*2) begin
						cnt <= 4'b0;
						if (mem_addr == ADDR_MAX) begin
							Goto_State(S_DONE);
						end else begin
							if (word_cnt == 4'b11) begin
								word_cnt <= 4'b0;
								Goto_State(S_NEWLINE);
							end else begin
								word_cnt <= word_cnt + 4'b1;
								Goto_State(S_READ);
							end
						end
					end else begin
						if (cnt & 1'b1) begin
							Goto_State(S_NIBBLE);
						end else begin
							Goto_State(S_SPACE);
						end
					end
				end
			
			S_DONE: begin
			
			end
			
		endcase
	end



endmodule
