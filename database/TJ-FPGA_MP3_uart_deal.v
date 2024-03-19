//--------------- uart data receiver for 9600bps  ----------------
//------------------------- author : Dino ------------------------
module uart_deal(
	input CLK,
	input RST,
	input UART_RX,
	output uart_state,
	output reg [7: 0] RXD_DATA
);
	parameter bps = 10417;
	reg UART_RX_sync, UART_RX_sync1, UART_RX_sync2;
	reg data_in_dly0, data_in_dly1, data_in_dly2;
	wire posedge_out;
	reg uart_state;
	reg [15: 0] cnt1;
	reg [3:0] cnt2;
	
	// asynchronous data in 
	always @ (posedge CLK) begin
		if(!RST) begin 
			data_in_dly0 <= 1'b1;
			data_in_dly1 <= 1'b1;
			data_in_dly2 <= 1'b1;
		end
		else begin 
			data_in_dly0 <= UART_RX;
			data_in_dly1 <= data_in_dly0;
			data_in_dly2 <= data_in_dly1;
		end
	end
	
	// detect posedge
	assign posedge_out = ~data_in_dly1 & data_in_dly2;
	
	// bps cycle count
	always @ (posedge CLK) begin 
		if(!RST) begin 
			cnt1 <= 0;
		end 
		else if(uart_state) begin 
			if(cnt1 == bps-1) begin 
				cnt1 <= 0;
			end
			else begin 
				cnt1 <= cnt1+1;
			end
		end
	end
	
	// receive data bits count
	always @ (posedge CLK) begin 
		if(!RST) begin 
			cnt2 <= 0;
		end
		else if(uart_state && cnt1==bps-1) begin
			if(cnt2 == 8) begin 
				cnt2 <= 0;
			end
			else begin 
				cnt2 <= cnt2+1;
			end
		end
	end
	
	// uart_state sign generate
	always @ (posedge CLK) begin 
		if(!RST) begin 
			uart_state <= 0;
		end
		else if(posedge_out) begin 
			uart_state <= 1;
		end
		else if(uart_state && cnt2==8 && cnt1==bps-1) begin
			uart_state <= 0;
		end
	end
	
	// data in 
	always @ (posedge CLK) begin 
		if(!RST) begin 
			RXD_DATA <= 0;
		end
		if(uart_state && cnt1==bps/2-1 && cnt2!=0) begin
			RXD_DATA[cnt2-1] <= UART_RX;
		end
	end
	
endmodule
