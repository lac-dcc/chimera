// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230426

`default_nettype none
module VGA #(
	parameter	CLOCK_HZ	= 10_000_000
)(
	input  wire Clock,
	input  wire Reset,
	output reg  Red_o,
	output reg  Green_o,
	output reg  Blue_o,
	output reg  HSync_o,
	output reg  VSync_o
);
	
	localparam ACTIVE = 0;
	localparam FRONT = 1;
	localparam SYNC = 2;
	localparam BACK = 3;
	
	// Horizontal
	localparam HCounter_max = 10'd799;
	reg [9:0]  HCounter_r;
	reg [1:0]  HState_r;
	
	// Vertical
	localparam VCounter_max = 10'd524;
	reg [9:0]  VCounter_r;
	reg [1:0]  VState_r;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			HCounter_r <= 0;
			VCounter_r <= 0;
		end else begin
			if(HCounter_r != HCounter_max)
				HCounter_r <= HCounter_r + 1'b1;
			else begin
				HCounter_r <= 0;
				if(VCounter_r == VCounter_max)
					VCounter_r <= 0;
				else
					VCounter_r <= VCounter_r + 1'b1;
			end
		end
	end
	
	reg [2:0] TestData;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			TestData <= 3'b001;
		else //if(HState_r == ACTIVE)
			TestData <= {TestData[1:0], TestData[2]};
	end
	
	// Horizontal state machine
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Red_o 		<= 1'b0;
			Green_o		<= 1'b0;
			Blue_o		<= 1'b0;
			HSync_o		<= 1'b1;
			HState_r	<= ACTIVE;
			
		end else begin
			case(HState_r)
				ACTIVE: begin
					if(VState_r == ACTIVE) begin
						Red_o   <= TestData[0];
						Green_o <= TestData[1];
						Blue_o  <= TestData[2];
						
						//Red_o   <= TestData[5];
						//Green_o <= TestData[6];
						//Blue_o  <= TestData[7];
						
						//Red_o   <= 1'b1;
						//Green_o <= 1'b1;
						//Blue_o  <= 1'b1;
						
						//{Red_o, Green_o, Blue_o} <= TestData + VCounter_r[2:0];
						
						
					end else begin
						Red_o   <= 1'b0;
						Green_o <= 1'b0;
						Blue_o  <= 1'b0;
					end
					HSync_o <= 1'b1;
					if(HCounter_r == 10'd639)
						HState_r <= FRONT;
				end
					
				FRONT: begin
					Red_o   <= 0;
					Green_o <= 0;
					Blue_o  <= 0;
					HSync_o <= 1'b1;
					if(HCounter_r == 10'd655)
						HState_r <= SYNC;
				end
				
				SYNC: begin
					Red_o   <= 0;
					Green_o <= 0;
					Blue_o  <= 0;
					HSync_o <= 1'b0;
					if(HCounter_r == 10'd751)
						HState_r <= BACK;
				end
				
				BACK: begin
					Red_o   <= 0;
					Green_o <= 0;
					Blue_o  <= 0;
					HSync_o <= 1'b1;
					if(HCounter_r == 10'd799)
						HState_r <= ACTIVE;
				end
			endcase
		end	
	end
	
	// Vertical state machine
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			VSync_o  	<= 1'b1;
			VState_r	<= ACTIVE;
		end else begin
			case(VState_r)
				ACTIVE: begin
					VSync_o <= 1'b1;
					if(VCounter_r == 10'd479 && HCounter_r == 10'd799)
						VState_r <= FRONT;
				end
				
				FRONT: begin
					VSync_o <= 1'b1;
					if(VCounter_r == 10'd489 && HCounter_r == 10'd799)
						VState_r <= SYNC;
				end
				
				SYNC: begin
					VSync_o <= 1'b0;
					if(VCounter_r == 10'd491 && HCounter_r == 10'd799)
						VState_r <= BACK;
				end
				
				BACK: begin
					VSync_o <= 1'b1;
					if(VCounter_r == 10'd524 && HCounter_r == 10'd799)
						VState_r <= ACTIVE;
				end
			
			endcase
		end
	end
	
endmodule
`default_nettype wire
