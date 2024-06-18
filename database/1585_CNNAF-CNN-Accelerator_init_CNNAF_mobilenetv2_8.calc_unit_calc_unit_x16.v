// This program was cloned from: https://github.com/eda-lab/CNNAF-CNN-Accelerator_init
// License: MIT License

module calc_unit_x16(
    input                       clk_100M,
    input                       rst_n,
    
    input [32*9*16-1:0]         w_in,
    input                       data_in_vld,
    input [32*9*16-1:0]         data_in,
    
    input [7:0]                 acc_para,
    input                       new_start,
    
    output                      data_out_vld,
    output [32*16-1:0]          data_out
);


genvar i;
generate
    for(i = 0; i < 16; i = i + 1) begin : calc_unit_gen
        calc_unit_single calc_unit_single(
            .clk_100M           (clk_100M),
            .rst_n              (rst_n),
            .w_in               (w_in[i*288+287:i*288]),
            .data_in_vld        (data_in_vld),
            .data_in            (data_in[i*288+287:i*288]),
            .new_start          (new_start),
            .data_out           (data_out[i*32+31:i*32])
        );
    end
endgenerate

reg [7:0]                      acc_cnt_cur;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        acc_cnt_cur <= 8'b0;
    end
    else if (acc_cnt_cur >= acc_para) begin
        acc_cnt_cur <= 8'b0;
    end
    else if (data_in_vld == 1'b1) begin
        acc_cnt_cur <= acc_cnt_cur + 1'b1;
    end
end

wire                            data_out_vld_cur;
assign data_out_vld_cur = (acc_cnt_cur == acc_para) && (data_in_vld == 1'b1);

reg  [31:0]                     data_out_vld_reg;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        data_out_vld_reg <= 31'b0;
    end
    else begin
        data_out_vld_reg <= {data_out_vld_reg[30:0], data_out_vld_cur};
    end
end

assign data_out_vld = data_out_vld_reg[31];

endmodule