// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

// -----------------------------------------------------------------------------
// Module: DataBusBuffer_tb
// Description: Testbench for the DataBusBuffer module.
// -----------------------------------------------------------------------------

module DataBusBuffer_tb;

  // Declare control signals for the testbench
  reg rd, wr;               // Read and write control signals
  wire [7:0] data_in, data_out;  // Data signals for the module interface

  // Instantiate the DataBusBuffer module
  DataBusBuffer dataBusBuffer (
    .data_inside(data_in),
    .data_outside(data_out),
    .rd(rd),
    .wr(wr)
  );
  
  // Declare internal registers for testing
  reg [7:0] input_from_outside;   // Data from external source
  reg [7:0] output_from_inside;   // Data from the module's output

  // Write operation simulation
  always @(negedge wr) begin
    // Check if wr is active low
    input_from_outside <= 8'hAB;  // Example data for testing
  end

  // Read operation simulation
  always @(negedge rd) begin
    // Check if rd is active low
    output_from_inside <= 8'hCD;  // Example data for testing
  end

  // Assign data_in and data_out based on control signals
  assign data_in = (rd) ? 8'bZ : output_from_inside;
  assign data_out = (wr) ? 8'bZ : input_from_outside;
  
  // Simulation end condition
  initial begin
    // Initialize control signals
    rd = 1;
    wr = 1;
    
    // ------------------------------
    // Test Read Operation
    // ------------------------------
    
    #10;  // Wait for 10 time units
    rd = 0;  // Activate read
    #10;  // Wait for 10 time units
    rd = 1;  // Deactivate read

    // ------------------------------
    // Test Write Operation
    // ------------------------------
    
    #10;  // Wait for 10 time units
    wr = 0;  // Activate write
    // Set data_in if needed
    #10;  // Wait for 10 time units
    wr = 1;  // Deactivate write

    // End simulation
    #10;  // Wait for 10 time units
    $finish;
  end

endmodule
// -----------------------------------------------------------------------------
