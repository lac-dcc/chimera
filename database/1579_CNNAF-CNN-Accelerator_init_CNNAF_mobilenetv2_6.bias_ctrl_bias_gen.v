// This program was cloned from: https://github.com/eda-lab/CNNAF-CNN-Accelerator_init
// License: MIT License

module bias_gen(
    input                       clk_200M,
    input                       rst_n,
    input                       clk_100M,
    
    input                       bias_in_vld,
    input [127:0]               bias_in,
    
    output [511:0]              bias_out
);

wire                            fifo_wr_en;
wire  [511:0]                   fifo_wr_data;

bias_ctrl bias_ctrl(
    .clk_200M                   (clk_200M    ),
    .rst_n                      (rst_n       ),
    .bias_in_vld                (bias_in_vld ),
    .bias_in                    (bias_in     ),
    .fifo_wr_en                 (fifo_wr_en  ),
    .fifo_wr_data               (fifo_wr_data)
);

wire                            fifo_empty;
reg                             fifo_rd_en;
// wire [511:0]                    fifo_rd_data;

fifo_bias_gen	fifo_bias_gen_inst (
    .wrclk                      ( clk_200M ),
    .wrreq                      ( fifo_wr_en ),
    .wrfull                     (  ),
    .data                       ( fifo_wr_data ),
    .rdclk                      ( clk_100M ),
    .rdreq                      ( fifo_rd_en ),
    .rdempty                    ( fifo_empty ),
    .q                          ( bias_out )
);

always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_rd_en <= 1'b0;
    end
    else if (fifo_empty == 1'b0) begin
        fifo_rd_en <= 1'b1;
    end
    else begin
        fifo_rd_en <= 1'b0;
    end
end






endmodule