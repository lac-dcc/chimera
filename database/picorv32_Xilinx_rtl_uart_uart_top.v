	
module uart_top #(
	parameter CLOCK_DIVIDE = 271)
(
	input clk, resetn,

	input             mem_valid,
	output reg        mem_ready,
	input      [31:0] mem_addr,
	input      [31:0] mem_wdata,
	input      [ 3:0] mem_wstrb,
	output reg [31:0] mem_rdata,

	output            tx,
	input             rx
   ) ;

   reg  [7:0] tx_byte;
   reg        transmit;
   wire       tx_fifo_full;

   wire [7:0] rx_byte;
   reg        rx_fifo_pop = 0;
   wire       rx_fifo_empty;
   
   wire       irq;
   wire       busy;

   reg        mem_ready_r;
   

	always @(posedge clk) begin
		if (!resetn) begin
			mem_ready <= 0;
			mem_rdata <= 0;
			
			tx_byte <= 8'hf;
			transmit <= 0;

			mem_ready_r <= 0;
		end else begin

			if ((mem_valid == 1) && (tx_fifo_full == 0) && (mem_ready_r == 0)) begin
				mem_ready_r <= 1;		
				mem_ready <= 1;
			end

			if (mem_ready)
				mem_ready <= 0;

			if (mem_valid == 0)
				mem_ready_r <= 0;	

			transmit <= 0;
			if ((mem_valid == 1) && (tx_fifo_full == 0) && (mem_ready_r == 0)) begin
				// mem_ready <= tx_fifo_full ? 0 : 1;
				transmit <= 1;
				// rx_BD_adr
				if (mem_addr[7:2] == {6'd1}) begin
					mem_rdata <= tx_byte;
					if (mem_wstrb==4'hF) tx_byte <= mem_wdata;
				end
				if (mem_addr[7:2] == {6'd2}) begin
					mem_rdata <= rx_byte;
					if (mem_wstrb==4'hF) tx_byte <= mem_wdata;
				end
			end
		end
	end


	uart_fifo #(
			.CLOCK_DIVIDE(CLOCK_DIVIDE),
			.DATA_WIDTH(8),
			.ADDR_EXP(12),
      		.ADDR_DEPTH(4096)
		) 
	_uart_fifo(
			.rx_byte       (rx_byte),
			.tx            (tx),
			.irq           (irq),
			.busy          (busy),
			.tx_fifo_full  (tx_fifo_full),
			.rx_fifo_empty (rx_fifo_empty),
			.tx_byte       (tx_byte),
			.clk           (clk),
			.rstn          (resetn),
			.rx            (rx),
			.transmit      (transmit),
			.rx_fifo_pop   (rx_fifo_pop)
		);

endmodule