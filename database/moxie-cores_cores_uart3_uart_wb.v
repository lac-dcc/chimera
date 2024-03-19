module uart_wb (input         rst_i,
		input 	      clk_i,
		input [31:0]  wb_adr_i,
		output reg [15:0] wb_dat_o,
		input [15:0]  wb_dat_i,
		input [1:0]   wb_sel_i,
		input 	      wb_we_i,
		input 	      wb_cyc_i,
		input 	      wb_stb_i,
		output reg    wb_ack_o,
		input 	      rx_i,
		output 	      tx_o);

  wire 			      uart_received;
  wire 			      uart_is_transmitting /*verilator public*/;
  wire [7:0] 		      tx_uart_byte;
  wire [7:0] 		      rx_uart_byte;
  wire [7:0] 		      rx_fifo_dout;

  wire 			      wtf /* verilator public */;
  assign wtf = (wb_stb_i & wb_cyc_i & ~wb_we_i);
  
   always @(posedge clk_i)
     begin
	if (rst_i)
	  wb_dat_o <= 16'b0;
	else if (wb_stb_i & wb_cyc_i & ~wb_we_i) 
	  case (wb_adr_i[2:0])
	    3'b000:
	      wb_dat_o[7:0] <= {7'b0, uart_received};
	    3'b010:
	      wb_dat_o[7:0] <= {7'b0, ~uart_is_transmitting};
	    3'b100:
	      wb_dat_o[7:0] <= rx_uart_byte;
	    3'b110:
	      wb_dat_o[7:0] <= wb_dat_o[7:0];
	    default:
	      wb_dat_o[7:0] <= 8'b0;
	  endcase // case (wb_adr_i[1:0])
     end // always @ (posedge clk_i)

   always @(posedge clk_i)
     begin
	wb_ack_o <= rst_i ? 1'b0 : wb_stb_i & wb_cyc_i;
     end
	  
   uart 
#(
  /* (/ 50000000 115200) */
    .UART_DIVISOR(434)
) 
uart_instance (.clk_i (clk_i),
		       .rst_i (rst_i),
		       .rxd_i (rx_i),
		       .txd_o (tx_o),
		       .wr_i (wb_stb_i & wb_cyc_i & wb_we_i & (wb_adr_i[2:0] == 3'b110)),
		       .data_i (wb_dat_i[7:0]),
		       .rx_ready_o (uart_received),
		       .data_o (rx_uart_byte),
		       .rd_i (wb_stb_i & wb_cyc_i & ~wb_we_i & (wb_adr_i[2:0] == 3'b100)),
		       .tx_busy_o (uart_is_transmitting));
  
endmodule // uart_wb
