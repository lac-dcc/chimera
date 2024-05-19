// This program was cloned from: https://github.com/jmt329/PitchShifter
// License: MIT License

// readStreamTest.v
// Testbench for integration of EBABReadStream and EBABWriteMaster

`timescale 1ns/1ns

module project_top();

   reg rst, clk;
   wire [31:0] bus_addr;        // Avalon address
   wire [3:0]  bus_byte_enable; // four bit byte read/write mask
   wire        bus_read;        // high when requesting data
   wire        bus_write;       //  high when writing data
   wire [31:0] bus_write_data;       //  data to send to Avalog bus
   reg         bus_ack;         //  Avalon bus raises this when done
   reg [31:0]  bus_read_data;   // data from Avalon bus
   reg [31:0]  counter;

   wire [31:0] audio_fifo_address  = 32'h00003044; // Avalon address +4
   wire [31:0] audio_left_address  = 32'h00003048; // Avalon address +8
   wire [31:0] audio_right_address = 32'h0000304c; // Avalon address +12

   // make reset
   initial begin
      bus_read_data = 32'b0;

      counter = 32'b0;
      clk = 1'b0;
      rst = 1'b0;
      #50
        rst = 1'b1;
      #100
        rst = 1'b0;
   end

   // make clock
   always begin
      #10
        clk = !clk;
   end

   always @(posedge clk) begin

      // fake bus acjs
      bus_ack <= bus_write | bus_read;

   end

   always @(posedge bus_read) begin

      // fake bus reads
      if (bus_addr == audio_fifo_address) begin
         bus_read_data <= (8'd3 << 24) | 8'd2; // allow reads and writes
      end
      else if ((bus_addr == audio_right_address)) begin
         counter <= counter + 1;
         bus_read_data <= counter;
      end

   end

   EBABWrapper ebab_wrapper
     (
      // Outputs
      .bus_byte_enable(bus_byte_enable),
      .bus_read(bus_read),
      .bus_write(bus_write),
      .bus_write_data(bus_write_data),
      .bus_addr(bus_addr),
      // Inputs
      .clk(clk),
      .rst(rst),
      .bus_ack(bus_ack),
      .bus_read_data(bus_read_data)
      );

endmodule
