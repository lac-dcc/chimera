// Code your design here
// Synchronous FIFO
module fifo_queue ( 
  input logic clk, 
  input logic nrst,
  input logic write, 
  input logic read,
  input logic[31:0] wdata,
  output logic[31:0] rdata,
  output logic full,
  output logic empty
 );
  
  logic[5:0] fifo_cnt; 
  logic[31:0] fifo_mem [63:0] ; // Actual fifo block
  
  logic [5:0] rd_ptr;
  logic [5:0] wr_ptr;
  
  //Actual code
  
  //Comb logic for full and empty
  always_comb begin
    full = (fifo_cnt == 'd64);
    empty = (fifo_cnt == 'd0);
  end
  
  
  // Sequential logic for FIFO RD/WR and pointers
  // for FIFO ptr
  always @(posedge clk, negedge nrst) begin
    if(!nrst)
      fifo_cnt <= 'd0;
    else if(!full && write && !read)
      fifo_cnt <= fifo_cnt + 1'b1;
    else if(!empty && read && !write)
      fifo_cnt <= fifo_cnt - 1'b1;
    else
      fifo_cnt <= fifo_cnt;
  end
  
  // for FIFO Rest
  always @(posedge clk, negedge nrst) begin
    if(!nrst) begin
      rd_ptr <= 'd0;
      wr_ptr <= 'd0;
      rdata <= 'hdead;
    end
    
    else if(!read && write) begin
      fifo_mem[wr_ptr] <= wdata;
      wr_ptr <= wr_ptr + 1'b1;
    end
    
    else if(!write && read) begin
      rdata <= fifo_mem[rd_ptr];
      rd_ptr <= rd_ptr + 1'b1;
    end
    
    else if (read && write) begin
      fifo_mem[wr_ptr] <= wdata;
      rdata <= fifo_mem[rd_ptr];
      rd_ptr	<= rd_ptr + 1;
      wr_ptr	<= wr_ptr + 1;
    end
    
    else begin
      rd_ptr <= rd_ptr;
      wr_ptr <= wr_ptr;
      rdata <= 'hdead;
    end
  end
  
endmodule

  
  