//------------ BlueTooth control module ----------------
//------------- author : Dino --------------------------
module BlueTooth(
	input CLK,
	input RST,
	input RXD,
	output reg [15: 0] vol,
	output reg [2: 0] CURRENT
);

	parameter DELAY_TIME = 5000000;
	integer cnt = 0;
	wire flag;
	wire [7: 0] data;
	uart_deal ud(.CLK(CLK), .RST(RST), .UART_RX(RXD), .uart_state(flag), .RXD_DATA(data));
	// the phone actually send message like B100 to let data keep 00 after change the sign.
	always @ (posedge CLK) begin
		if(cnt==DELAY_TIME)
			case(data) 
				8'hB1: begin 
						CURRENT <= (CURRENT==0) ? 3: CURRENT-1;
						cnt <= 0;
					end
				8'hB2: begin 
						CURRENT <= (CURRENT==3) ? 0: CURRENT+1;
						cnt <= 0;
					end
				8'hB3: begin 
						vol <= (vol==0) ? 0: (vol - 16'h1010);
						cnt <= 0;
					end
				8'hB4: begin 
						vol <= (vol==16'hF0F0) ? 16'hF0F0 : (vol + 16'h1010);
						cnt <= 0;
					end
				8'hA1: begin
						CURRENT <= 0;
						cnt <= 0;
					end 
				8'hA2: begin
						CURRENT <= 1;
						cnt <= 0;
					end 
				8'hA3: begin
						CURRENT <= 2;
						cnt <= 0;
					end 
				8'hA4: begin
						CURRENT <= 3;
						cnt <= 0;
					end
				default: ;
			endcase
		else cnt <= cnt+1;
	end
endmodule
