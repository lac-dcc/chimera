module w_gen(
    input                       clk_200M,
    input                       rst_n,
    input                       clk_100M,
    
    input                       w_in_vld,
    input [127:0]               w_in,
    input                       data_vld_in,
    
    output [32*9*16-1:0]        w_out
);

wire [15:0]                     ram_w_wr_en;
wire [7:0]                      ram_w_wr_addr;
wire [32*9*16-1:0]              ram_w_wr_data_all;
wire [10:0]                     w_change_ctrl;

w_ctrl w_ctrl(
    .clk_200M                   (clk_200M         ),
    .rst_n                      (rst_n            ),
    .w_in_vld                   (w_in_vld         ),
    .w_in                       (w_in             ),
    .ram_w_wr_en                (ram_w_wr_en      ),
    .ram_w_wr_addr              (ram_w_wr_addr    ),
    .ram_w_wr_data_all          (ram_w_wr_data_all),
    .w_change_ctrl              (w_change_ctrl    )
);

genvar i;
// wire [287:0]                    ram_w_wr_data_part[15:0];
// generate
    // for(i = 0; i < 16; i = i + 1) begin : ram
        // assign ram_w_wr_data_part[i] = ram_w_wr_data_all[288*i+287 : 288*i];
    // end
// endgenerate

wire [7:0]                      ram_w_rd_addr;

generate
    for(i = 0; i < 16; i = i + 1) begin : ram_w_gen
        ram_w ram_w (
            .wrclock            ( clk_200M                  ),
            .wren               ( ram_w_wr_en[i]            ),
            .wraddress          ( ram_w_wr_addr             ),
            .data               ( ram_w_wr_data_all[288*i+287 : 288*i]),
            
            .rdclock            ( clk_100M                  ),
            .rdaddress          ( ram_w_rd_addr             ),
            .q                  ( w_out[288*i+287 : 288*i]  )
        );
    end
endgenerate

wire [10:0]                     w_change_ctrl_rd;

ram_w_ctrlsig	ram_w_ctrlsig (
    .wrclock                    ( clk_200M          ),
    .wren                       ( 1'b1              ),
    .wraddress                  ( 4'b0              ),
    .data                       ( w_change_ctrl     ),
    .rdclock                    ( clk_100M          ),
    .rdaddress                  ( 4'b0              ),
    .q                          ( w_change_ctrl_rd  )
);

reg [10:0]                      rd_cnt_cur;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        rd_cnt_cur <= 11'd0;
    end
    else if (rd_cnt_cur >= w_change_ctrl_rd) begin
        rd_cnt_cur <= 1'b0;
    end
    else if (data_vld_in == 1'b1) begin
        rd_cnt_cur <= rd_cnt_cur + 1'b1;
    end
end

assign ram_w_rd_addr = rd_cnt_cur[7:0];



endmodule