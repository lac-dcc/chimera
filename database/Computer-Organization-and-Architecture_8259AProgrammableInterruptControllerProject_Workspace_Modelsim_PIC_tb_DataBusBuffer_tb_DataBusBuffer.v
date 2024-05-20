// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module DataBusBuffer (
  inout wire [7:0] data_inside,
  inout wire [7:0] data_outside,
  input wire rd,
  input wire wr
);

    reg [7:0] internal_data_from_input;
    reg [7:0] internal_data_from_output;
    
  // Read operation  inside to outside
  assign data_outside = (!rd) ? internal_data_from_input : 8'bZ;
  // Write operation  outside to inside
  assign data_inside = (!wr) ? internal_data_from_output : 8'bZ;

  // Write operation
  always @(negedge wr) begin
      //  wr is active low
      internal_data_from_output <= data_outside;
  end
 
   // Read operation
  always @(negedge rd) begin
      // rd is active low
      internal_data_from_input <= data_inside;
  end

endmodule
