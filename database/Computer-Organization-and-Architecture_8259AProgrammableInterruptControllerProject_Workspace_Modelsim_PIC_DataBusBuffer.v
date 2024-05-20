// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module DataBusBuffer (
  inout wire [7:0] data_inside,
  inout wire [7:0] data_outside,
  input wire rd,
  input wire wr
);
    reg [7:0] outDataTemp;
    reg [7:0] inDataTemp;
    reg [7:0] internal_data_from_input;
    reg [7:0] internal_data_from_output;
    reg wrFlag = 0;
    reg rdFlag = 0;
    
  // Read operation  inside to outside
  assign data_outside = (rdFlag == 1) ? internal_data_from_input : 8'bz;
  // Write operation  outside to inside
  assign data_inside = (wrFlag == 1) ? internal_data_from_output : 8'bz;
  

  // Write operation
  always @(posedge wr) begin
      //  wr is active high
      if (wr)
        internal_data_from_output <= data_outside;
      wrFlag <= wr;
  end
 
   // Read operation
  always @(posedge rd) begin
      // rd is active high
      if (rd)
        internal_data_from_input <= data_inside;
      rdFlag <= rd;
  end

  always @(negedge wr) begin
   wrFlag <= 0;
  end
  always @(negedge rd) begin
    rdFlag <= 0;
  end
endmodule
