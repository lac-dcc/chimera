// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module fifo_simple
#(
  parameter   FIFO_DEPTH      = 4,
              FIFO_DATA_WIDTH = 8
)
(
  input                            clk,
  input                            clk_enable,
  input                            reset,

  input                            write,
  input                            read,

  input      [FIFO_DATA_WIDTH-1:0] write_data,
  output reg [FIFO_DATA_WIDTH-1:0] read_data,

  output                           empty,
  output                           full
);

  localparam  FIFO_PTR_WIDTH  = $clog2(FIFO_DEPTH) + 1;
  
  reg [FIFO_DATA_WIDTH-1:0] fifo_array [FIFO_DEPTH-1:0];

  reg [FIFO_PTR_WIDTH-1:0]  rd_ptr;
  reg [FIFO_PTR_WIDTH-1:0]  wr_ptr;

  //------------------------------------------------
  // Write Pointer Logic
  //------------------------------------------------
  always @ (posedge clk)
  begin
    if (reset)
      wr_ptr <= {FIFO_PTR_WIDTH{1'b0}};
    else if (clk_enable)
      if (write & !full)
        wr_ptr <= wr_ptr + 1'b1;
  end

  //------------------------------------------------
  // Read Pointer Logic
  //------------------------------------------------
  always @ (posedge clk)
  begin
    if (reset)
      rd_ptr <= {FIFO_PTR_WIDTH{1'b0}};
    else if (clk_enable)
      if (read & !empty)
        rd_ptr <= rd_ptr + 1'b1;
  end

  //------------------------------------------------
  // Full and Empty flags
  //------------------------------------------------
  assign full = (wr_ptr[FIFO_PTR_WIDTH-1] ^ rd_ptr[FIFO_PTR_WIDTH-1]) & 
                (wr_ptr[FIFO_PTR_WIDTH-2:0] == rd_ptr[FIFO_PTR_WIDTH-2:0]);
  assign empty = (wr_ptr == rd_ptr);

  //-----------------------------------------------
  // FIFO Write
  //-----------------------------------------------
  always @ (posedge clk)
  begin
    if (reset)
      fifo_array[wr_ptr] <= {FIFO_DATA_WIDTH{1'b0}};
    else if (clk_enable)
      if (write & !full)
        fifo_array[wr_ptr] <= write_data;
  end

  //-----------------------------------------------
  // FIFO Read
  //-----------------------------------------------
  always @ (posedge clk)
  begin
    if (reset)
      read_data <= {FIFO_DATA_WIDTH{1'b0}};
    else if (clk_enable)
      if (read & !empty)
        read_data <= fifo_array[rd_ptr];
  end

endmodule