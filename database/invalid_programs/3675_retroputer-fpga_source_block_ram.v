// This program was cloned from: https://github.com/kerrishotts/retroputer-fpga
// License: MIT License

module block_ram #( 
  parameter MEMORY_DEPTH = 65536 
)(
    input clk,              // clock
    input write_en,         // write enable
    input write_data,       // data to write
    input [$clog(MEMORY_DEPTH)-1:0] addr,      // address
    output reg [7:0] data   // data out
  );
  
  (* ram_style = "block" *) reg [7:0] mem [MEMORY_DEPTH-1:0];
  
  reg [7:0] p1;
  
  always @(posedge clk) begin
    if (write_en)
      mem[addr] <= write_data;
  end

  always @(posedge clk) begin
    p1 <= mem[addr];
    data <= p1;
  end
  
endmodule