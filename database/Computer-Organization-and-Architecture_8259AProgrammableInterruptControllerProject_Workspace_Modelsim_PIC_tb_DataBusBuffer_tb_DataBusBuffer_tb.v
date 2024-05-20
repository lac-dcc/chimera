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
    
    #100;  // Wait for 100 time units
    
    // Provide data to simulate module output
    output_from_inside = 8'h66;
    
    rd = 0;  // Activate read
    #100;   // Wait for 100 time units
    rd = 1;  // Deactivate read

    // ------------------------------
    // Test Write Operation
    // ------------------------------
    
    #100;  // Wait for 100 time units
    
    // Receive data from external source
    input_from_outside = 8'h55;
    
    wr = 0;  // Activate write
    
    // Optional: Set data_in if needed
    
    #100;  // Wait for 100 time units
    wr = 1;  // Deactivate write

    // End simulation
    #100;  // Wait for 100 time units
    $finish;
  end

endmodule
// -----------------------------------------------------------------------------
