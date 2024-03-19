// Simulation UART receiver
// Outputs printable characters to the simulator console; uses Linux-style line breaks
// Character data is also returned to the top entity for further processing

// by Stephan Nolting, BSD 3-Clause License
// https://github.com/stnolting/neorv32-verilog

module uart_sim_receiver
#(
  parameter CLOCK_FREQ = 100000000, // clock frequency of <clk_i> in Hz
  parameter BAUD_RATE  = 19200      // target baud rate
)
(
  input  wire       clk_i,  // clock input, triggering on rising edge
  input  wire       txd_i,  // UART transmit data
  output wire [7:0] data_o, // character data
  output wire       valid_o // character data valid when set
);

  // duration of a single bit
  localparam UART_BAUD_VAL = CLOCK_FREQ / BAUD_RATE;

  reg     [4:0] uart_rx_sync; // synchronizer shift register
  reg           uart_rx_busy; // busy flag
  reg     [8:0] uart_rx_sreg; // de-serializer
  integer       uart_rx_baud_cnt; // bit-sample counter for baud rate
  integer       uart_rx_bitcnt; // bit counter: 8 data bits, 1 start bit
  wire    [7:0] char = uart_rx_sreg[8:1]; // character data

  // initialize because we don't have a real reset
  initial begin
    uart_rx_sync = 5'b11111;
    uart_rx_busy = 1'b0;
    uart_rx_sreg = 9'b000000000;
    uart_rx_baud_cnt = UART_BAUD_VAL / 2;
    uart_rx_bitcnt = 0;
  end

  // UART receiver
  always @(posedge clk_i) begin
    // synchronizer
    uart_rx_sync <= {uart_rx_sync[3:0], txd_i};
    // arbiter
    if (!uart_rx_busy) begin // idle
      uart_rx_busy     <= 0;
      uart_rx_baud_cnt <= UART_BAUD_VAL / 2;
      uart_rx_bitcnt   <= 9;
      if (uart_rx_sync[4:1] == 4'b1100) begin // start bit (falling edge)?
        uart_rx_busy <= 1;
      end
    end else begin
      if (uart_rx_baud_cnt == 0) begin
        if (uart_rx_bitcnt == 1) begin
          uart_rx_baud_cnt <= UART_BAUD_VAL / 2;
        end else begin
          uart_rx_baud_cnt <= UART_BAUD_VAL;
        end
        // sample 8 data bits and 1 start bit
        if (uart_rx_bitcnt == 0) begin
          uart_rx_busy <= 1'b0; // done
          if ((char >= 32) && (char <= 127)) begin // is a printable char?
            $write ("%c", char);
          end else if (char == 10) begin // Linux line break?
            $display (""); // force terminal line break
          end
        end else begin
          uart_rx_sreg   <= {uart_rx_sync[4], uart_rx_sreg[8:1]};
          uart_rx_bitcnt <= uart_rx_bitcnt - 1;
        end
      end else begin
        uart_rx_baud_cnt <= uart_rx_baud_cnt - 1;
      end
    end
  end

  // character output
  assign data_o = char; // character data
  assign valid_o = ((uart_rx_baud_cnt == 0) && (uart_rx_bitcnt == 0)) ? 1'b1 : 1'b0; // character valid

endmodule // uart_sim_receiver
