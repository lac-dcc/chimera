// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module fifo_1(
  clk,
  rst_n,

  write,
  read,
  
  write_data,
  read_data,

  empty,
  full
);

  parameter FIFO_PTR_WIDTH   = 3;
  parameter FIFO_DATA_WIDTH  = 8;
  parameter FIFO_DEPTH       = 2**(FIFO_PTR_WIDTH - 1);

  input                            clk;
  input                            rst_n;

  input                            write;
  input                            read;

  input      [FIFO_DATA_WIDTH-1:0] write_data;
  output reg [FIFO_DATA_WIDTH-1:0] read_data;

  output                           empty;
  output                           full;

  reg [FIFO_DATA_WIDTH-1:0] fifo_array [FIFO_DEPTH-1:0];

  reg [FIFO_PTR_WIDTH-1:0]  rd_ptr;
  reg [FIFO_PTR_WIDTH-1:0]  wr_ptr;

  //------------------------------------------------
  // Write Pointer Logic
  //------------------------------------------------
  always @(posedge clk or negedge rst_n)
  begin: p_wr_ptr
    if (!rst_n)
      wr_ptr <= {FIFO_PTR_WIDTH{1'b0}};
    else if (write & !full)
      wr_ptr <= wr_ptr + 1'b1;
  end

  //------------------------------------------------
  // Read Pointer Logic
  //------------------------------------------------
  always @(posedge clk or negedge rst_n)
  begin: p_rd_ptr
    if (!rst_n)
      rd_ptr <= {FIFO_PTR_WIDTH{1'b0}};
    else if (read & !empty)
      rd_ptr <= rd_ptr + 1'b1;
  end

  //------------------------------------------------
  // Full and Empty flags
  //------------------------------------------------
  assign full = (wr_ptr[FIFO_PTR_WIDTH-1] ^ rd_ptr[FIFO_PTR_WIDTH-1]) & (wr_ptr[FIFO_PTR_WIDTH-2:0] == rd_ptr[FIFO_PTR_WIDTH-2:0]);
  assign empty = (wr_ptr == rd_ptr);

  //-----------------------------------------------
  // FIFO Write
  //-----------------------------------------------
  always @(posedge clk or negedge rst_n)
  begin: p_fifo_write
  integer int_i;
    if (!rst_n)
      for (int_i = 0; int_i < FIFO_DEPTH - 1; int_i = int_i + 1)
        fifo_array[int_i] <= {FIFO_DATA_WIDTH{1'b0}};
    else if (write & !full)
      fifo_array[wr_ptr] <= write_data;
  end

  //-----------------------------------------------
  // FIFO Read
  //-----------------------------------------------
  always @(posedge clk or negedge rst_n)
  begin: p_fifo_read
    if (!rst_n)
      read_data <= {FIFO_DATA_WIDTH{1'b0}};
    else if (read & !empty)
      read_data <= fifo_array[rd_ptr];
  end

endmodule