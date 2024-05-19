// This program was cloned from: https://github.com/pmezydlo/BeagleWire
// License: GNU General Public License v2.0

module fifo(input                       clk, 
            input                       rst, 
            input  [BUF_DATA_WIDTH-1:0] in,
            output [BUF_DATA_WIDTH-1:0] out, 
            input                       wr_en_in, 
            input                       rd_en_in,
            output                      empty,
            output                      full,
            output [BUF_WIDTH:0]        counter);

parameter  BUF_WIDTH      = 5;
parameter  BUF_DATA_WIDTH = 16;
localparam BUF_SIZE       = 1 << BUF_WIDTH; 
        
reg [BUF_DATA_WIDTH-1:0] out;
reg                      empty;
reg                      full;
reg [BUF_WIDTH:0]        counter;
reg [BUF_WIDTH-1:0]      rd_ptr;
reg [BUF_WIDTH-1:0]      wr_ptr;
reg [BUF_DATA_WIDTH-1:0] buf_mem [0:BUF_SIZE-1];
reg                      rd_en_in_d;
reg                      wr_en_in_d;
reg                      rd_en;
reg                      wr_en;

always @(fifo_counter)
begin
    empty = (counter == 0);
    full  = (counter == BUF_SIZE);
end


always @(posedge clk) 
begin
    rd_en_in_d <= rd_en_in;
    wr_en_in_d <= wr_en_in;

    rd_en = (rd_en_in && !rd_en_in_d);
    wr_en = (wr_en_in && !wr_en_in_d);
end

always @(posedge clk or posedge rst)
begin
    if (rst)
        counter <= 0;
    else if ((!full && wr_en) && (!empty && rd_en))
        counter <= counter;
    else if (!full && wr_en)
        counter <= counter + 1;
    else if( !empty && rd_en)
        counter <= counter - 1;
    else
        counter <= counter;
end

always @( posedge clk or posedge rst)
begin
    if (rst) begin
        out <= 0;
    end else begin
        if (rd_en && !empty) begin
            out <= buf_mem[rd_ptr];
        end else begin
            out <= out;
        end
    end
end

always @(posedge clk)
begin
    if (wr_en && !full) begin
        buf_mem[wr_ptr] <= in;
    end else begin
        buf_mem[wr_ptr] <= buf_mem[wr_ptr];
    end
end

always@(posedge clk or posedge rst)
begin
    if (rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
    end else begin
        if (!full && wr_en) begin
            wr_ptr <= wr_ptr + 1;
        end else begin
            wr_ptr <= wr_ptr;
        end

        if (!empty && rd_en) begin
           rd_ptr <= rd_ptr + 1;
        end else begin 
           rd_ptr <= rd_ptr;
        end
    end
end

endmodule
