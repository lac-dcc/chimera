module debug #(parameter text_len = 20) (
  input clk,
  input reset,
  input text_req,
  output reg text_done,
  input [8*text_len-1:0] debug_text,
  output uart_tx);

  reg [3:0]       text_cntr;

  reg             tx_req;
  reg [7:0]       tx_data;
  wire            tx_ready;

  uart_tx u_uart_tx (
          .clk (clk),
          .reset (reset),
          .tx_req(tx_req),
          .tx_ready(tx_ready),
          .tx_data(tx_data),
          .uart_tx(uart_tx)
  );

  // Output the text
  always @(posedge clk) begin
     if (text_req && text_cntr == 0 && !tx_req) begin
       text_cntr <= text_len;
       text_done <= 1'b1;
     end

     if (text_cntr == text_len || (text_cntr > 0 && tx_ready)) begin
        tx_data = debug_text[(text_cntr-1)*8 +: 8]; 
        text_cntr <= text_cntr - 1;
        tx_req <= 1'b1;
     end else if (tx_ready) tx_req <= 1'b0;
  end

endmodule
