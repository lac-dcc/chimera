module mc6850(
  input clk,
  input reset,
  input addr,
  input [7:0] data_in,
  input rd,
  input we,
  output reg [7:0] data_out,
  input ce,
  input rx,
  output tx
);
  wire valid;
  wire tdre;
  wire [7:0] uart_out;
  wire dat_wait;
  
  simpleuart uart(
	.clk(clk),
	.resetn(~reset),

	.ser_tx(tx),
	.ser_rx(rx),

	.cfg_divider(25000000/9600),

	.reg_dat_we(we && (addr==1'b1)),
	.reg_dat_re(rd && (addr==1'b1)),
	.reg_dat_di(data_in & 8'h7f),
	.reg_dat_do(uart_out),
	.reg_dat_wait(dat_wait),
	.recv_buf_valid(valid),
	.tdre(tdre)
);

  always @(posedge clk)
  begin
		if (rd)
		begin
			if (addr==1'b0)
				data_out <= { 2'b00,valid, 1'b0,   2'b00, tdre, valid };
			else 
				data_out <= uart_out;
		end
  end
endmodule
