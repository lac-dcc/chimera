// simple testbench to check the default NEORV32 Verilog wrapper
// checks for the initial UART output of the bootloader ("NEORV32")

// (c) 2024 by Stephan Nolting, BSD 3-Clause License
// https://github.com/stnolting/neorv32-verilog

`timescale 1 ns/100 ps // time-unit = 1 ns, precision = 100 ps

module neorv32_verilog_tb;

  reg clk, nrst; // generators
  wire uart_txd; // serial TX line (default baud rate is 19200)
  wire [7:0] char_data; // character detected by the UART receiver
  wire char_valid; // valid character

  // generator setup
  initial begin
    $display ("neorv32-verilog verification testbench\n");
    clk = 0;
    nrst = 0;
    #100; // active reset for 100 * timescale = 100 ns
    nrst = 1;
    #15_000_000;
    // if we reach this the simulation has failed
    $display("Simulation terminated (time out)!");
    $finish; // terminate
  end

  // clock generator
  always begin
    #5 clk = !clk; // T = 2*5ns -> f = 100MHz
  end

  // unit under test: minimal NEORV32 Verilog wrapper
  // note that there are NO parameters available - the configuration has to be done
  // in the NEORV32 VHDL wrapper *before* synthesizing the Verilog netlist
  neorv32_verilog_wrapper neorv32_verilog_inst (
    .clk_i       (clk),
    .rstn_i      (nrst),
    .uart0_rxd_i (1'b0),
    .uart0_txd_o (uart_txd)
  );

  // simulation UART receiver - outputs all received characters to the simulator console
  uart_sim_receiver #(
    .CLOCK_FREQ (100000000), // clock frequency of the core
    .BAUD_RATE  (19200)      // default baud rate of the NEORV32 bootloader
  ) uart_sim_receiver_inst(
    .clk_i   (clk),
    .txd_i   (uart_txd),
    .data_o  (char_data),
    .valid_o (char_valid)
  );

  // buffer the processor's UART data in a small FIFO-like queue
  reg [7:0] char_buffer [0:6];
  integer i;

  always @(posedge clk) begin
    // update "FIFO"
    if (char_valid == 1'b1) begin
      // top-to-bottom shift
      for (i=6; i>0; i=i-1) begin
        char_buffer[i-1] <= char_buffer[i];
      end
      char_buffer[6] <= char_data;
    end
    // check for result string: "NEORV32" is sent by the default bootloader right after reset
    if ((char_buffer[0] == "N") &&
        (char_buffer[1] == "E") &&
        (char_buffer[2] == "O") &&
        (char_buffer[3] == "R") &&
        (char_buffer[4] == "V") &&
        (char_buffer[5] == "3") &&
        (char_buffer[6] == "2")) begin
      // simulation was successful
      $display (""); // force line break
      $display("Simulation successful!");
      $finish; // terminate
    end
  end

endmodule
