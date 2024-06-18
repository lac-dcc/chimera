// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module simple_dual_ram #(
    parameter SIZE = 8,                // size of each entry
    parameter DEPTH = 8                // number of entries
  )(
    // write interface
    input wclk,                        // write clock
    input [$clog2(DEPTH)-1:0] waddr,   // write address
    input [SIZE-1:0] write_data,       // write data
    input write_en,                    // write enable (1 = write)
    
    // read interface
    input rclk,                        // read clock
    input [$clog2(DEPTH)-1:0] raddr,   // read address
    output reg [SIZE-1:0] read_data    // read data
  );
  
  reg [SIZE-1:0] mem [DEPTH-1:0];      // memory array
  
  // write clock domain
  always @(posedge wclk) begin
    if (write_en)                      // if write enable
      mem[waddr] <= write_data;        // write memory
  end
  
  // read clock domain
  always @(posedge rclk) begin
    read_data <= mem[raddr];           // read memory
  end
  
endmodule
