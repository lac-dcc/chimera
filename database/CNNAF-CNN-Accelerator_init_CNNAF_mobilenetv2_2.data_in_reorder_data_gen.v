module data_gen(
    input                       clk_200M,
    input                       clk_100M,
    input                       rst_n,
    input [127:0]               data_in,
    input                       data_in_vld,
    
    output reg                  data_out_vld,
    output                      data_vld_for_w,
    output reg                  data_acc_s,
    output reg [7:0]            data_acc_para,
    output [32*9*16-1:0]        data_out
);
//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
parameter L_CONV  = 3'd0;
parameter L_DW    = 3'd1;
parameter L_PW    = 3'd2;
parameter L_AVGPL = 3'd3;
parameter L_PW_SC = 3'd4;

//-------------------------------------------
// Instantiation
//-------------------------------------------
wire                            fifo_wr_en;
wire [768+7+1+1+8-1:0]            fifo_wr_all;

data_in_reorder data_in_reorder(
    .clk_200M                   (clk_200M   ),
    .rst_n                      (rst_n      ),
    .data_in                    (data_in    ),
    .data_in_vld                (data_in_vld),
    .fifo_wr_en                 (fifo_wr_en ),
    .fifo_wr_all                (fifo_wr_all)   
    //assign fifo_wr_all = {fifo_wr_layer_type_cur, fifo_wr_calc_en, fifo_wr_acc_s, fifo_wr_acc_para, fifo_wr_data};
);

reg                             fifo_rd_en;
wire                            fifo_empty;
wire                            fifo_full;
wire [7:0]                      fifo_rdusedw;
wire [768+7+1+1+8-1:0]            fifo_rd_data;

fifo_data	fifo_data_inst (
    .wrclk                      ( clk_200M ),
    .wrreq                      ( fifo_wr_en ),
    .wrfull                     ( fifo_full ),
    .data                       ( fifo_wr_all ),
    .rdclk                      ( clk_100M ),
    .rdreq                      ( fifo_rd_en ),
    .rdempty                    ( fifo_empty ),
    .rdusedw                    ( fifo_rdusedw   ),
    .q                          ( fifo_rd_data )
);
//-------------------------------------------
// Read data processing
//-------------------------------------------
wire [6:0]                      fifo_rd_layer_type;
wire                            fifo_rd_calc_en;
wire [767:0]                    fifo_rd_data_part;
wire                            fifo_rd_acc_s;
wire [7:0]                      fifo_rd_acc_para;

assign {fifo_rd_layer_type, fifo_rd_calc_en, fifo_rd_acc_s, fifo_rd_acc_para, fifo_rd_data_part} = fifo_rd_data;

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

always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        data_acc_s <= 1'b0;
    end
    else begin
        data_acc_s <= fifo_rd_acc_s;
    end
end

always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        data_acc_para <= 8'b0;
    end
    else begin
        data_acc_para <= fifo_rd_acc_para;
    end
end

reg [95:0]                      calc_data_d3d1[15:0];
reg [95:0]                      calc_data_d6d4[15:0];
reg [95:0]                      calc_data_d9d7[15:0];
integer j;
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        for (j = 0; j < 16; j = j + 1) begin
            calc_data_d3d1[j] <= 96'b0;
            calc_data_d6d4[j] <= 96'b0;
            calc_data_d9d7[j] <= 96'b0;
        end
    end
    else if (fifo_empty == 1'b0 && fifo_rd_layer_type == L_CONV) begin
        for (j = 0; j < 16; j = j + 1) begin
            {calc_data_d9d7[j], calc_data_d6d4[j], calc_data_d3d1[j]} <= fifo_rd_data_part[287:0];
        end
    end
    else begin
        for (j = 0; j < 16; j = j + 1) begin
            calc_data_d3d1[j] <= 96'b0;
            calc_data_d6d4[j] <= 96'b0;
            calc_data_d9d7[j] <= 96'b0;
        end
    end
end

reg                             data_out_vld_temp;

always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        data_out_vld_temp <= 1'b0;
    end
    else if (fifo_empty == 1'b0 && fifo_rd_calc_en == 1'b1) begin
        data_out_vld_temp <= 1'b1; 
    end
    else begin
        data_out_vld_temp <= 1'b0; 
    end
end

assign data_vld_for_w = data_out_vld_temp;

always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n) begin
        data_out_vld <= 1'b0;
    end
    else begin
        data_out_vld <= data_out_vld_temp; 
    end
end

genvar i;
generate
    for(i = 0; i < 16; i = i + 1) begin : data_out_comb
        assign data_out[288*i+287:288*i] = {calc_data_d9d7[i], calc_data_d6d4[i], calc_data_d3d1[i]};
    end
endgenerate



endmodule