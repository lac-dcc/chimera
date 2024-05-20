// This program was cloned from: https://github.com/kerrishotts/retroputer-fpga
// License: MIT License

module block_ram_dual #( 
  parameter MEMORY_DEPTH = 65536 
)(
    input rclk,             // read clock
    input [$clog(MEMORY_DEPTH)-1:0] rd_addr, // read address
    output reg [7:0] rd_data,  // data out
    
    input wclk,             // write clock
    input write_en,         // write enable
    input [$clog(MEMORY_DEPTH)-1:0] wr_addr,      // address
    input [7:0] write_data
  );
  
  (* ram_style = "block" *) reg [7:0] mem [MEMORY_DEPTH-1:0];
  
  reg [7:0] p1;
  
  always @(posedge wclk) begin
    if (write_en)
      mem[wr_addr] <= write_data;
  end

  always @(posedge rclk) begin
    p1 <= mem[rd_addr];
    rd_data <= p1;
  end
  
endmodule