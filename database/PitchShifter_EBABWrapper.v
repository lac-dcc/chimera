// This program was cloned from: https://github.com/jmt329/PitchShifter
// License: MIT License

// EBABWrapper.v
// Audio controller for AVALON bus-master

module EBABWrapper
  (
   /*AUTOARG*/
   // Outputs
   bus_byte_enable, bus_read, bus_write, bus_write_data, bus_addr,
   // Inputs
   clk, rst, out_sel, delta_mode_left, delta_mode_right, bus_ack,
   bus_read_data, delta_left, delta_right, triangle_wave_max_left,
   triangle_wave_max_right
   );

   input clk, rst, out_sel, delta_mode_left, delta_mode_right;
   input bus_ack;              //  Avalon bus raises this when done
   input [31:0] bus_read_data; // data from Avalon bus
   input [31:0] delta_left, delta_right;
   input [9:0]  triangle_wave_max_left, triangle_wave_max_right;

   output reg [3:0] bus_byte_enable; // four bit byte read/write mask
   output reg       bus_read;        // high when requesting data
   output reg       bus_write;       //  high when writing data
   output reg [31:0] bus_write_data; //  data to send to Avalog bus
   output reg [31:0] bus_addr;       // Avalon address

   wire [31:0]       audio_base_address       = 32'h00003040; // Avalon address
   wire [31:0]       audio_fifo_address       = 32'h00003044; // Avalon address +4
   wire [31:0]       audio_data_left_address  = 32'h00003048; // Avalon address +8
   wire [31:0]       audio_data_right_address = 32'h0000304c; // Avalon address +12

   reg [3:0]         state;
   reg [7:0]         fifo_space; // current free words in audio interface

   // audio input/output from audio module FIFO
   reg [31:0]        right_audio_input, left_audio_input;
   reg               audio_input_valid;
   wire [31:0]       right_audio_output, left_audio_output, pitch_shift_out[0:1], filter_out[0:1];
   wire              pitch_shift_val[0:1], audio_out_val[0:1];

   assign left_audio_output  = (audio_out_val[0]) ? filter_out[0] : left_audio_output;
   assign right_audio_output = (audio_out_val[1]) ? filter_out[1] : right_audio_output;

   buffer #(1024) left_buffer
     (
      // inputs
      .clk(clk),
      .rst(rst),
      .delta(delta_left),
      .new_sample_val(audio_input_valid),
      .new_sample_data(right_audio_input),
      .out_sel(1'b1),
      .delta_mode(delta_mode_left),
      .triangle_wave_max(triangle_wave_max_left),
      // outputs
      .pitch_shift_out(pitch_shift_out[0]),
      .pitch_shift_val(pitch_shift_val[0])
      );

   buffer #(1024) right_buffer
     (
      // inputs
      .clk(clk),
      .rst(rst),
      .delta(delta_right),
      .new_sample_val(audio_input_valid),
      .new_sample_data(right_audio_input),
      .out_sel(1'b1),
      .delta_mode(delta_mode_right),
      .triangle_wave_max(triangle_wave_max_right),
      // outputs
      .pitch_shift_out(pitch_shift_out[1]),
      .pitch_shift_val(pitch_shift_val[1])
      );

   IIR6_32bit_fixed filter_left(
                                .audio_out (filter_out[0]),
                                .audio_in (pitch_shift_out[0]),
                                .scale (3'd3),
                                .b1 (32'h226C),
                                .b2 (32'hCE8B),
                                .b3 (32'h2045B),
                                .b4 (32'h2B07A),
                                .b5 (32'h2045B),
                                .b6 (32'hCE8B),
                                .b7 (32'h226C),
                                .a2 (32'h21DC9D38),
                                .a3 (32'hC2BABD8C),
                                .a4 (32'h3C58991F),
                                .a5 (32'hDDFDB62D),
                                .a6 (32'hA5FA11C),
                                .a7 (32'hFEAA19B2),
                                .clk(clk),
                                .data_val(pitch_shift_val[0]),
                                .rst(rst),
                                .audio_out_val(audio_out_val[0])
                                ) ; //end filter

   IIR6_32bit_fixed filter_right(
                                 .audio_out (filter_out[1]),
                                 .audio_in (pitch_shift_out[1]),
                                 .scale (3'd3),
                                 .b1 (32'h226C),
                                 .b2 (32'hCE8B),
                                 .b3 (32'h2045B),
                                 .b4 (32'h2B07A),
                                 .b5 (32'h2045B),
                                 .b6 (32'hCE8B),
                                 .b7 (32'h226C),
                                 .a2 (32'h21DC9D38),
                                 .a3 (32'hC2BABD8C),
                                 .a4 (32'h3C58991F),
                                 .a5 (32'hDDFDB62D),
                                 .a6 (32'hA5FA11C),
                                 .a7 (32'hFEAA19B2),
                                 .clk(clk),
                                 .data_val(pitch_shift_val[1]),
                                 .rst(rst),
                                 .audio_out_val(audio_out_val[1])
                                 ) ; //end filter


   always @(posedge clk) begin //CLOCK_50
      // reset state machine and read/write controls
      if (rst) begin
         state     <= 0;
         bus_read  <= 0; // set to one if a read opeation from bus
         bus_write <= 0; // set to one if a write operation to bus
      end

      // === writing stereo to the audio FIFO ==========
      // set up read FIFO available space
      if (state==4'd0) begin
         bus_addr        <= audio_fifo_address;
         bus_read        <= 1'b1;
         bus_byte_enable <= 4'b1111;
         state           <= 4'd1; // wait for read ACK
      end

      // wait for read ACK and read the fifo available
      // bus ACK is high when data is available
      if (state==4'd1 && bus_ack==1) begin
         state      <= 4'd2; //4'd2
         // FIFO write space is in high byte
         fifo_space <= (bus_read_data>>24);
         // end the read
         bus_read   <= 1'b0;
      end

      // When there is room in the FIFO
      // -- start write to fifo for each channel
      // -- first the left channel
      if (state==4'd2 && fifo_space>8'd2) begin //
         state           <= 4'd3;
         bus_write_data  <= left_audio_output;
         bus_addr        <= audio_data_left_address;
         bus_byte_enable <= 4'b1111;
         bus_write       <= 1'b1;
      end
      // if no space, try again later
      else if (state==4'd2 && fifo_space<=8'd2) begin
         state <= 4'b0;
      end

      // detect bus-transaction-complete ACK
      // for left channel write
      // You MUST do this check
      if (state==4'd3 && bus_ack==1) begin
         state     <= 4'd4; // include right channel
         //state   <= 4'd0; // left channel only, write only.
         //state   <= 4'd6; // read/write left channel only
         bus_write <= 0;
      end

      // -- now the right channel
      if (state==4'd4) begin //
         state          <= 4'd5;
         // loop back audio input data
         bus_write_data <= right_audio_output;
         bus_addr       <= audio_data_right_address;
         bus_write      <= 1'b1;
      end

      // detect bus-transaction-complete ACK
      // for right channel write
      // You MUST do this check
      if (state==4'd5 && bus_ack==1) begin
         // state  <= 4'd0; // for write only function
         state     <= 4'd6; // for read/write  function
         bus_write <= 0;
      end

      // === reading stereo from the audio FIFO ==========
      // set up read FIFO for available read values
      if (state==4'd6 ) begin
         bus_addr        <= audio_fifo_address;
         bus_read        <= 1'b1;
         bus_byte_enable <= 4'b1111;
         state           <= 4'd7; // wait for read ACK
      end

      // wait for read ACK and read the fifo available
      // bus ACK is high when data is available
      if (state==4'd7 && bus_ack==1) begin
         state      <= 4'd8; //4'dxx
         // FIFO read space is in low byte
         // which is zero when empty
         fifo_space <= bus_read_data & 8'hff;
         // end the read
         bus_read   <= 1'b0;
      end

      // When there is data in the read FIFO
      // -- read it from both channels
      // -- first the left channel
      if (state==4'd8 && fifo_space>8'd0) begin //
         state           <= 4'd9;
         bus_addr        <= audio_data_left_address;
         bus_byte_enable <= 4'b1111;
         bus_read        <= 1'b1;
      end
      // if no data, try again later
      else if (state==4'd8 && fifo_space<=8'd0) begin
         state <= 4'b0;
      end

      // detect bus-transaction-complete ACK
      // for left channel read
      // You MUST do this check
      if (state==4'd9 && bus_ack==1) begin
         state            <= 4'd10; // include right channel
         left_audio_input <= bus_read_data;
         bus_read         <= 0;
      end

      // When there is data in the read FIFO
      // -- read it from both channels
      // -- now right channel
      if (state==4'd10) begin //
         state           <= 4'd11;
         bus_addr        <= audio_data_right_address;
         bus_byte_enable <= 4'b1111;
         bus_read        <= 1'b1;
      end

      // detect bus-transaction-complete ACK
      // for right channel read
      // You MUST do this check
      if (state==4'd11 && bus_ack==1) begin
         state             <= 4'd12; // back to beginning
         right_audio_input <= bus_read_data;
         // set the data-ready strobe
         audio_input_valid <= 1'b1;
         bus_read          <= 0;
      end

      // end data-ready strobe
      if (state==4'd12) begin
         state             <= 4'd0; // back to beginning
         audio_input_valid <= 1'b0;
      end
   end // always @(posedge state_clock)

endmodule // EBABWrapper
