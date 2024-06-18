// This program was cloned from: https://github.com/faramire/TT07-simple-stopwatch
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Fabio Ramirez Stern
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_faramire_stopwatch (
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // will go high when the design is enabled
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
 );
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uo_out[7:5]  = 0;

  wire dividedClock; // 100 Hz clock
  wire counter_enable;
  wire display_enable;
  wire reset_either; // an OR of the input reset and the chip wide reset, for those that shall be affected by both
  wire reset_either_async;
  //wire clock_enabled; // and AND of the clock with the counter enable,
                     // so that the clock divider doesn't advance when the counters are halted

  assign reset_either = rst_n | (~ui_in[2]);
  assign reset_either_async = rst_n | (~ui_in[2]);
  //assign clock_enabled = counter_enable && clk;

  wire [2:0] w_min_X0; // all the results of the counter chain
  wire [3:0] w_min_0X;
  wire [2:0] w_sec_X0;
  wire [3:0] w_sec_0X;
  wire [3:0] w_ces_X0;
  wire [3:0] w_ces_0X;

  clockDivider clockDivider1 ( // divides the 1 MHz clock to 100 Hz
    .clk_in  (clk),
    .ena     (counter_enable),
    .res     (reset_either),
    .clk_out (dividedClock)
  );

  controller controller1 ( // two latches for starting/stopping and lap times
    .res        (rst_n),
    .clk        (clk),
    .start_stop (ui_in[0]),
    .lap_time   (ui_in[1]),
    .counter_enable (counter_enable),
    .display_enable (display_enable)
  );

  assign uo_out[3] = counter_enable; // output the internal state
  assign uo_out[4] = display_enable;

  counter_chain counter_chain1 ( // a chain of 6 counters that count from 00:00:00 to 59:59:99
    .clk (dividedClock),
    .ena (counter_enable),
    .res (reset_either_async),
    .min_X0 (w_min_X0),
    .min_0X (w_min_0X),
    .sec_X0 (w_sec_X0),
    .sec_0X (w_sec_0X),
    .ces_X0 (w_ces_X0),
    .ces_0X (w_ces_0X)
  );

  SPI_wrapper SPI_wrapper1 (
    .clk (clk),
    .clk_div(dividedClock),
    .res (rst_n),
    .ena (display_enable),
    .min_X0 (w_min_X0),
    .min_0X (w_min_0X),
    .sec_X0 (w_sec_X0),
    .sec_0X (w_sec_0X),
    .ces_X0 (w_ces_X0),
    .ces_0X (w_ces_0X),
    .Mosi    (uo_out[0]), // MOSI on out 0
    .Cs      (uo_out[1]), //  CS  on out 1
    .Clk_SPI (uo_out[2])  //  CLK on out 3
  );

endmodule // tt_um_faramire_stopwatch

module clockDivider (
  input wire clk_in, // input clock 1 MHz
  input wire ena,
  input wire res,    // reset, active low
  output reg clk_out // output clock 100 Hz
);

  reg[13:0] counter;
  parameter div     = 5000; // 1 MHz / 10'000 = 100 Hz, 50% duty cycle => 1/2 of that


  always @(posedge clk_in) begin
    if (!res) begin // reset
      counter <= 14'b0;
      clk_out <= 1'b0;
    end else if (ena) begin
      if (counter < (div-1)) begin    // count up
        counter <= counter + 1;
      end else begin                  // reset counter and invert output
        counter <= 14'b0;
        clk_out <= ~clk_out; 
      end
    end
  end

endmodule //clockDivider

module controller (
  input  wire res,            // reset, active low
  input  wire clk,
  input  wire start_stop,     // impulse toggles counter_enable
  input  wire lap_time,       // impulse toggles display_enable
  output reg  counter_enable, // 
  output reg  display_enable  //
);

  always @(posedge start_stop) begin
    if (!res) begin
      counter_enable <= 1'b0;
    end else begin
      counter_enable <= ~counter_enable;
    end
  end

  always @(posedge lap_time) begin
    if (!res) begin
      display_enable <= 1'b1;
    end else begin
        display_enable <= ~display_enable;
    end
  end
  
endmodule // controller

module counter6 (
  input  wire      clk, // clock
  input  wire      ena, // enable
  input  wire      res, // reset, active low
  output reg       max, // high when max value (6) reached
  output reg [2:0] cnt  // 3 bit counter output
);

parameter max_count = 6;

  always @(posedge clk  or negedge res) begin
    if (!res) begin
      cnt <= 3'b0;
      max <= 1'b0;
    end else if (ena) begin
      if (cnt < (max_count-1)) begin
        cnt <= cnt + 1;
      end else begin
        cnt <= 3'b0;
      end

    if (cnt == max_count-2) begin
        max <= 1'b1;
      end else begin
        max <= 1'b0;
      end
    end
  end

endmodule // counter6

module counter10 (
  input  wire      clk, // clock
  input  wire      ena, // enable
  input  wire      res, // reset, active low
  output reg       max, // high when max value (10) reached
  output reg [3:0] cnt  // 3 bit counter output
);

  parameter max_count = 10;

  always @(posedge clk or negedge res) begin
    if (!res) begin
      cnt <= 4'b0;
      max <= 1'b0;
  end else if (ena) begin
      if (cnt < (max_count-1)) begin
        cnt <= cnt + 1;
      end else begin
        cnt <= 4'b0;
      end

    if (cnt == max_count-2) begin
        max <= 1'b1;
      end else begin
        max <= 1'b0;
      end
    end
  end

endmodule // counter10

module counter_chain (
  input wire clk,
  input wire ena,
  input wire res,
  // the X denotes which digit the counter drives
  output wire [3:0] ces_0X, // centiseconds (100th)
  output wire [3:0] ces_X0,
  output wire [3:0] sec_0X, // seconds
  output wire [2:0] sec_X0,
  output wire [3:0] min_0X, // minutes
  output wire [2:0] min_X0
);

  wire ces_X0_ena;
  wire sec_0X_ena;
  wire sec_X0_ena;
  wire min_0X_ena;
  wire min_X0_ena;

  wire max; // just something to connect the unused max pin of the last counter to something

  counter10 inst_ces_0X ( // counts first digit centiseconds
    .clk (clk), // clock in
    .ena (ena), // enable
    .res (res),  // reset
    .max (ces_X0_ena), // reached max value, used as enable for the next counter
    .cnt (ces_0X) // output value
  );

  counter10 inst_ces_X0 ( // counts second digit centiseconds
    .clk (clk),
    .ena (ena & ces_X0_ena),
    .res (res),
    .max (sec_0X_ena),
    .cnt (ces_X0)
  );

  counter10 inst_sec_0X ( // counts first digit seconds
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena),
    .res (res),
    .max (sec_X0_ena),
    .cnt (sec_0X)
  );

  counter6 inst_sec_X0 ( // counts second digit seconds
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena & sec_X0_ena),
    .res (res),
    .max (min_0X_ena),
    .cnt (sec_X0)
  );

  counter10 inst_min_0X ( // counts single digit minutes
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena & sec_X0_ena & min_0X_ena),
    .res (res),
    .max (min_X0_ena),
    .cnt (min_0X)
  );

  counter6 inst_min_X0 ( // counts second digit minutes
    .clk (clk),
    .ena (ena & ces_X0_ena & sec_0X_ena & sec_X0_ena & min_0X_ena & min_X0_ena),
    .res (res),
    .max (max),
    .cnt (min_X0)
  );

endmodule // counter_chain

module SPI_wrapper (
  input wire clk, // 1 MHz clock to run the FSM and other loops
  input wire clk_div, // 100 Hz clock to trigger a time to be send out
  input wire res, // reset, active low
  input wire ena,

  input wire [2:0] min_X0, // minutes
  input wire [3:0] min_0X,
  input wire [2:0] sec_X0, // seconds
  input wire [3:0] sec_0X,
  input wire [3:0] ces_X0, // centiseconds (100th)
  input wire [3:0] ces_0X,

  output wire Mosi,
  output reg  Cs,
  output wire Clk_SPI
);

  // FSM
  reg [2:0] state;
  localparam SETUP_ON  = 3'b000;
  localparam SETUP_BCD = 3'b001;
  localparam SETUP_SCN = 3'b010;
  localparam IDLE      = 3'b011;
  localparam CS_PAUSE  = 3'b100;
  localparam TRANSFER  = 3'b101;
  localparam WAIT      = 3'b110;
  localparam DONE      = 3'b111;

  reg [15:0] word_out;
  reg [2:0] digit_count;
  reg [3:0] wait_count;
  wire send_reported;
  wire ready_reported;
  reg reset_master;
  reg sent_ON;
  reg sent_BCD;
  reg sent_SCN;

  always @(posedge clk) begin  // controlling FSM
    if (!res) begin // active low reset
      Cs <= 1;
      reset_master <= 0;
      word_out <= 16'b0;
      digit_count <= 3'b0;
      sent_ON <= 0;
      sent_BCD <= 0;
      sent_SCN <= 0;
      state <= SETUP_ON;
    end
    case(state)

      SETUP_ON: begin // send a setup packet enabling BCD
        if (res) begin
          reset_master <= 1;
          if (ready_reported == 1) begin
            word_out <= 16'b0000_1100_0000_0001; // address = shutdown mode, data = device on
            digit_count <= 3'b000;
            Cs <= 0;
            sent_ON <= 1;
          end
          else if (send_reported == 1 && sent_ON) begin // data send, Cs can be pulled high again
            Cs <= 1;
            state <= SETUP_BCD;
          end
        end
      end // SETUP

      SETUP_BCD: begin // send a setup packet enabling BCD
        if (ready_reported == 1) begin
          word_out <= 16'b0000_1001_0011_1111; // address = decode mode, data = BCD for all
          digit_count <= 3'b000;
          Cs <= 0;
          sent_BCD <= 1;
        end
        else if (send_reported == 1 && sent_BCD == 1) begin // data send, Cs can be pulled high again
          Cs <= 1;
          state <= SETUP_SCN;
        end
      end // SETUP

      SETUP_SCN: begin // send a setup packet enabling 6 digits
        if (ready_reported == 1) begin
          word_out <= 16'b0000_1011_0000_1110; // address = scan limit, data = BCD for all
          digit_count <= 3'b000;
          Cs <= 0;
          sent_SCN <= 1;
        end
        else if (send_reported == 1 && sent_SCN == 1) begin // data send, Cs can be pulled high again
          Cs <= 1;
          state <= IDLE;
        end
      end // SETUP

      IDLE: begin
        if (clk_div & ena) begin // wait for the 100Hz clock to get high
          digit_count <= 3'b000;
          wait_count <= 4'b0000;
          state <= TRANSFER;
        end
      end // IDLE

      TRANSFER: begin
        if (ready_reported == 1) begin // wait for TX ready
          case(digit_count)

            3'b000: begin // ces_0X
              word_out <= {8'b0000_0001, 8'b0000_0000 | {4'b0000, ces_0X}}; // send the 16-bit word
              Cs <= 0; // pull CS low to initiate send
              digit_count <= 3'b001; // advance the position counter
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b001: begin // ces_X0
              word_out <= {8'b0000_0010, 8'b0000_0000 | {4'b0000, ces_X0}};
              Cs <= 0;
              digit_count <= 3'b010;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b010: begin // sec_0X
              word_out <= {8'b0000_0011, 8'b1000_0000 | {4'b0000, sec_0X}};
              Cs <= 0;
              digit_count <= 3'b011;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b011: begin // sec_X0
              word_out <= {8'b0000_0100, 8'b0000_0000 | {5'b00000, sec_X0}};
              Cs <= 0;
              digit_count <= 3'b100;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b100: begin // min_0X
              word_out <= {8'b0000_0101, 8'b1000_0000 | {4'b0000, min_0X}};
              Cs <= 0;
              digit_count <= 3'b101;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b101: begin // min_X0
              word_out <= {8'b0000_0110, 8'b0000_0000 | {5'b00000, min_X0}};
              Cs <= 0;
              digit_count <= 3'b110;
              wait_count <= 4'b0000;
              state <= WAIT;
            end

            3'b110: begin // once send has been complete and CS is high again, switch state
              state <= DONE;
            end

            default:digit_count <= 3'b000;
          endcase

        end else if (send_reported == 1) begin // once data has been send, pull CS high
          Cs <= 1;
        end
      end // TRANSFER

      WAIT: begin
        if (wait_count == 4'b1111) begin
          state <= CS_PAUSE;
          wait_count <= 4'b0;
          Cs <= 1;
        end else if (send_reported == 1'b1 || ready_reported) begin
          wait_count <= wait_count + 1'b1;
        end
      end

      CS_PAUSE: begin
        if (wait_count == 4'b1111) begin
          state <= TRANSFER;
          wait_count <= 4'b0;
        end else begin
          wait_count <= wait_count + 1'b1;
        end
      end

      DONE: begin // wait for the 100 Hz clock to go low again
        if (!clk_div) begin
          state <= IDLE;
        end
      end // DONE

      default:state <= SETUP_ON;
    endcase    
  end

  SPI_Master SPI_Master1 (
    .clk(clk),
    .res(reset_master),
    .cs_in(Cs),
    .word_in(word_out),

    .report_send(send_reported),
    .report_ready(ready_reported),

    .sck(Clk_SPI),
    .mosi(Mosi)
  );

endmodule // SPI_wrapper

module SPI_Master (
  input wire clk,
  input wire res,
  input wire cs_in,         // CS input
  input wire [15:0] word_in,   // word to be sent

  output reg sck,           // serial clock
  output reg mosi,          // MOSI
  output reg report_send,   // data has been sent, CS can be pulled high
  output reg report_ready   // ready for next transmission
);

  // FSM states
  localparam IDLE     = 2'b00;
  localparam TRANSFER = 2'b01;
  localparam DONE     = 2'b10;

  reg  [1:0] state;
  reg  [1:0] count_bit; // count through the clock cylce: 00 pull low (set), 01 hold low, 10 pull high (sample), 11 hold high
  reg  [3:0] count_word; // count through the bits of the word
  reg [15:0] word_out;


  always @(posedge clk) begin
    if (!res) begin // reset, active low
      sck <= 0;
      mosi <= 0;
      report_send <= 0; // goes high when all data has been send and CS is still low
      report_ready <= 0; // goes high when CS is high and reset is complete
      state <= IDLE;
    end else begin

      case(state) // FSM

        IDLE: begin
          if (cs_in == 1) begin
            report_send <= 0;
            report_ready <= 1;
          end
          else begin // CS low: order to send the word
            count_bit <= 0;
            count_word <= 15;
            word_out <= word_in;
            report_send <= 0;
            report_ready <= 0;
            state <= TRANSFER;
          end
        end // IDLE

        TRANSFER: begin
          case(count_bit)

            2'b00: begin // pull low
              sck <= 1'b0;
              count_bit <= 2'b01;

              mosi <= word_out[15];
              word_out <= word_out << 1;

              // alternative:
              /* mosi <= word_out[count_word];
              count_word <= count_word - 1; */
            end

            2'b01: begin // hold low
              sck <= 1'b0;
              count_bit <= 2'b10;
            end

            2'b10: begin // pull high
              sck <= 1'b1;
              count_bit <= 2'b11;
            end

            2'b11: begin // hold high
              sck <= 1'b1;
              count_bit <= 2'b00;

              if (count_word == 0) begin // end of word? exit
                state <= DONE;
              end else begin
                count_word <= count_word - 1; // this is here so that once it goes 0, one clock cylce is still executed
              end
            end

            default:;
          endcase
        end // TRANSFER

        DONE: begin
          sck <= 0; // pull everything low
          mosi <= 0;
          report_send <= 1; // send! CS can be pulled high now
          if (cs_in == 1) begin // once wrapper reacted to report_send, go ready
            state <= IDLE;
          end
        end // DONE

        default:;
      endcase
    end
  end

endmodule
