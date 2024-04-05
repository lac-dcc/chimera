// UART transmitter and receiver
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

module uart_tx(
  input clk, reset,
  input baudclk16,
  output tx,
  input [7:0] data,
  output reg ready,
  input write
);

  localparam
    IDLE = 1'b0,
    XMIT = 1'b1;

  reg [9:0] bits;
  reg [3:0] sb;
  reg [3:0] bit;
  reg state;

  always @(posedge clk)
    if (reset) begin
      state <= IDLE;
      ready <= 1;
      bits <= 10'b1111111111;
    end else
      case (state)
        IDLE:
          if (write) begin
            ready <= 0;
            bits <= {1'b1,data,1'b0};
            bit <= 4'd0;
            sb <= 4'd0;
            state <= XMIT;
          end
        XMIT:
          if (baudclk16) begin
            sb <= sb + 1;
            if (sb==4'd15) begin
              bits <= {1'b1,bits[9:1]};
              bit <= bit + 1;
              if (bit==4'd9) begin
                ready <= 1;
                state <= IDLE;
              end
            end
          end
      endcase

  assign tx = bits[0];

endmodule

module uart_rx(
  input clk, reset,
  input baudclk16,
  input rx,
  output reg [7:0] data,
  output reg ready,
  input read
);

  localparam [1:0]
    IDLE =  2'd0,
    START = 2'd1,
    RX =    2'd2,
    STOP =  2'd3;

  reg [7:0] bits;
  reg [3:0] sb;
  reg [3:0] bit;
  reg [1:0] state;

  always @(posedge clk)
    if (reset) begin
      state <= IDLE;
      ready <= 0;
    end else begin
      if (read)
        ready <= 0;
      case (state)
        IDLE:
          if (!rx) begin
            sb <= 3'd0;
            state <= START;
          end
        START:
          if (baudclk16) begin
            if (sb==4'd7) begin
              bit <= 4'd0;
              sb <= 4'd0;
              state <= RX;
            end else
              sb <= sb + 1;
          end
        RX:
          if (baudclk16) begin
            sb <= sb + 1;
            if (sb==4'd15) begin
              bits <= {rx,bits[7:1]};
              bit <= bit + 1;
              if (bit==4'd7)
                state <= STOP;
            end
          end
        STOP:
          if (baudclk16) begin
            sb <= sb + 1;
            if (sb==4'd15) begin
              data <= bits;
              ready <= 1;
              state <= IDLE;
            end
          end
      endcase
    end

endmodule
