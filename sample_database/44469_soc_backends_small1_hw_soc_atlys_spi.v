// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

// Wrapper around UART to simulate LogiPi SPI behaviour (because I'm lazy
//   and do not want to invent a new, half-duplex protocol).

module spi_mock(
                input             clk100mhz,
                input             reset,
                   
                   // UART signals
                input             uart_rxd,
                output            uart_txd,

                   // Input stream
                input [31:0]      data_in,
                output reg        data_in_rdy, // When ready to send data
                output reg        data_in_ack, // data_in was consumed
                input             data_in_rq, // Data send requested        

                   // Output stream
                output reg [31:0] data_out,
                output reg        data_out_rdy, // Word received
                input             data_out_ack // consumed  
                );

   reg [7:0]                      uart_tx_axis_tdata;
   reg                            uart_tx_axis_tvalid;
   wire                           uart_tx_axis_tready;
   
   wire [7:0]                     uart_rx_axis_tdata;
   wire                           uart_rx_axis_tvalid;
   reg                            uart_rx_axis_tready;
   
   uart
     uart_inst (
                .clk(clk100mhz),
                .rst(~reset),
                // axi input
                .input_axis_tdata(uart_tx_axis_tdata),
                .input_axis_tvalid(uart_tx_axis_tvalid),
                .input_axis_tready(uart_tx_axis_tready),
                // axi output
                .output_axis_tdata(uart_rx_axis_tdata),
                .output_axis_tvalid(uart_rx_axis_tvalid),
                .output_axis_tready(uart_rx_axis_tready),
                // uart
                .rxd(uart_rxd),
                .txd(uart_txd),
                // status
                .tx_busy(),
                .rx_busy(),
                .rx_overrun_error(),
                .rx_frame_error(),
                // configuration
                .prescale(100000000/(115200*8))
                );


   reg [2:0]                      uart_state;
   reg [31:0]                     uart_send_bytes;
   reg [1:0]                      bytecount;
   reg [31:0]                     data_out_tmp;
   reg [31:0]                     data_in_tmp;
   
   

   parameter S_RECV = 0;
   parameter S_SND = 1;
   parameter S_RECV_TICK = 2;
   parameter S_SND_TICK = 3;
   
   
   always @(posedge clk100mhz) begin
      if (!reset) begin
         uart_tx_axis_tdata <= 0;
         uart_tx_axis_tvalid <= 0;
         uart_rx_axis_tready <= 1;

         data_out_rdy <= 0;

         data_out <= 0;

         bytecount <= 0;

         uart_state <= S_RECV;

         uart_send_bytes <= 0;
         data_in_ack <= 0;
         data_out_tmp <= 0;
         data_in_tmp <= 0;
         
      end else begin
         case(uart_state)
           S_RECV: begin // wait for an input from the Master
              data_in_ack <= 0;
              if (bytecount == 0) begin
                 data_in_tmp <= data_in;
              end
              if (uart_rx_axis_tvalid) begin // Master has something to say
                 if (bytecount == 3) begin
                    data_out_tmp <= 0;
                    data_out <= {uart_rx_axis_tdata, data_out_tmp[31:8]};
                    data_out_rdy <= 1;
                    uart_state <= S_SND;
                    bytecount <= 0;
                    uart_rx_axis_tready <= 0;
                    uart_send_bytes <= {8'hff,data_in_tmp[31:8]};
                    uart_tx_axis_tdata <= data_in_tmp[7:0];
                    uart_tx_axis_tvalid <= 1;
                 end else begin
                    data_out_tmp <= {uart_rx_axis_tdata, data_out_tmp[31:8]}; // Shift into data output register
                    bytecount <= bytecount + 1;
                    uart_state <= S_RECV_TICK;
                    uart_rx_axis_tready <= 0;
                 end
              end
           end // case: S_RECV
           S_RECV_TICK: begin
              uart_state <= S_RECV;
              uart_rx_axis_tready <= 1;
           end
           S_SND: begin
              data_out_rdy <= 0; // enough 
              // if (data_out_ack) data_out_rdy <= 0; // receipt acknowledged
              if (uart_tx_axis_tready) begin // just sent
                 bytecount <= bytecount + 1;
                 uart_tx_axis_tdata <= uart_send_bytes[7:0];
                 uart_send_bytes <= {8'hff,uart_send_bytes[31:8]};
                 if (bytecount == 3) begin // done sending, enough is enough
                    uart_tx_axis_tvalid <= 0;
                    uart_rx_axis_tready <= 1;
                    uart_state <= S_RECV;
                    data_in_ack <= 1;
                    bytecount <= 0;
                 end else begin
                    uart_tx_axis_tvalid <= 0;
                    uart_state <= S_SND_TICK;
                 end
              end
           end // case: S_SND
           S_SND_TICK: begin
              uart_tx_axis_tvalid <= 1;
              uart_state <= S_SND;
           end
         endcase // case (uart_state)
      end // else: !if(!reset)
   end // always @ (posedge clk)
   

endmodule
