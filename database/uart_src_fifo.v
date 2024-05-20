// This program was cloned from: https://github.com/Revenantx86/uart
// License: MIT License

module fifo #
(
    parameter D_W = 8,
    parameter DEPTH = 64
)
(
    input clk,                          // Clock input
    input rst,                          // Reset input
    input wr_en,                        // Write enable
    input rd_en,                        // Read enable
    input [D_W-1:0] data_in,            // Data input
    output reg [D_W-1:0] data_out,      // Data output
    output reg full,                    // FIFO full flag
    output reg empty                    // FIFO empty flag
);

// FIFO memory array
reg [D_W-1:0] fifo_mem[DEPTH-1:0];

// Read and write pointers
reg [$clog2(DEPTH)-1:0] write_pointer, read_pointer;

// Counter to keep track of the number of items in the FIFO
reg [$clog2(DEPTH):0] count;

// Write operation
//
always @(posedge clk) begin
    //
    if (rst) begin
        write_pointer <= 0;
        read_pointer <= 0;
        count <= 0;
    end 
    //
    else if (wr_en && !full) begin
        fifo_mem[write_pointer] <= data_in;
        write_pointer <= write_pointer + 1;
    end 
    //
    else if (rd_en && !empty) begin
        data_out <= fifo_mem[read_pointer];
        read_pointer <= read_pointer + 1;
    end
    //
    if (wr_en && !full) begin
        count <= count + 1;
    end
    //
    if (rd_en && !empty) begin
        count <= count - 1;
    end
    //
end
//
// FIFO full and empty logic
always @(*) begin
    if(rst) begin
        full = 0;
        empty = 1;
    end
    else begin
        full = (count == DEPTH);
        empty = (count == 0);
    end
end
//
endmodule
