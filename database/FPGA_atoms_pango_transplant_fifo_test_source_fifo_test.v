// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

module fifo_test(
    input   wr_clk,
    input   rst,
    input   rd_clk
   );

wire wr_full;
wire almost_full;
wire rd_empty;
wire almost_empty;
wire [11:0] rd_data;

reg [11:0] reg_rd_data;
reg [11:0] wr_data;
reg wr_en;
reg rd_en;

fifo_t u_fifo_t(
    .wr_clk(wr_clk),                // input
  .wr_rst(!rst),                // input
  .wr_en(wr_en),                  // input
  .wr_data(wr_data),              // input [7:0]
  .wr_full(wr_full),              // output
  .almost_full(almost_full),      // output
  .rd_clk(rd_clk),                // input
  .rd_rst(!rst),                // input
  .rd_en(rd_en),                  // input
  .rd_data(rd_data),              // output [7:0]
  .rd_empty(rd_empty),            // output
  .almost_empty(almost_empty)     // output
);

always @(posedge wr_clk or negedge rst) begin
    if(!rst) begin
        wr_data <= 'b0;
    end
    else if(wr_en == 1'b1) begin
        wr_data <= wr_data + 1'b1;
    end
    else begin
        wr_data <= wr_data;
    end
end

always @(posedge wr_clk or negedge rst) begin
    if(!rst) begin
        wr_en <= 'b0;
    end
    else if(wr_data >= 12'd2049) begin
        wr_en <= 1'b0;
    end
    else begin
        wr_en <= 1'b1;
    end
end

always @(posedge rd_clk or negedge rst) begin
    if(!rst) begin
        rd_en <= 'b0;
    end
    else if(wr_data == 'd2050) begin
        rd_en <= 1'b1;
    end
    else if(almost_empty == 1'b1) begin
        rd_en <= 1'b0;
    end
    else begin
        rd_en <= rd_en;
    end
end

        
always @(*) begin
    reg_rd_data <= rd_data;
end

endmodule