module MIDI_ShiftReg(Clk, Rst_n, Rx, RxData, RxDone, State);
	input Clk, Rst_n, Rx;
	output reg [23:0] RxData;
	output reg RxDone;
	output State;

	wire [7:0] Rx_in; //Rx Data from MIDI_rx
	wire read_enable;
	reg [23:0] RxDataBuf;

	always @ (posedge Clk)
	begin
		RxDone <= read_enable;
	end

	//byte shift register
	always @ (negedge read_enable)
	begin
		RxDataBuf <= {RxDataBuf[15:0], Rx_in};
	end 
	
	//make sure complete message passes through:
	// 1NNNCCCC 0PPPPPPP 0VVVVVVV
	always @ (posedge Clk)
	begin
		if ((RxDataBuf[23] == 1'b1) & (RxDataBuf[15] == 1'b0) & (RxDataBuf[7] == 1'b0))
		begin
			RxData <= RxDataBuf;
		end
	end

	MIDI_rx MRX1(Clk, Rst_n, Rx_in, read_enable, Rx, State);	

endmodule
