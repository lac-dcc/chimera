//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------


module  fifo_cbb_parity #(
    parameter   FIFO_WIDTH      = 8                 ,   //
                FIFO_ATTR       = "normal"          ,   //"normal" or "ahead"
                PARITY_DLY      = "FALSE"               //

    )(
        input                           clk_wr          ,   //i1: write clock
        input                           wr_reset        ,   //i1: reset,active high
        input                           clk_rd          ,   //i1: read clock
        input                           rd_reset        ,   //i1: reset,active high
        input                           wen             ,   //i1: user input fifo write enable.1-enable
        input       [FIFO_WIDTH - 1:0]  wdata           ,   //i[FIFO_WIDTH]: user write fifo data.
        output  wire                    fifo_wen        ,   //o1: fifo_cbb write enable after parity.1-enable
        output  wire[FIFO_WIDTH : 0]    fifo_wdata      ,   //o[FIFO_WIDTH+1]: fifo_cbb write enable after parity.
        
        input                           fifo_ren        ,   //i1: fifo read enable
        input       [FIFO_WIDTH :0]     fifo_rdata      ,   //i[FIFO_WIDTH+1]: fifo_cbb output read data      
        output  wire                    parity_err      ,   //o1: reg_fifo_cbb output to read fifo_cbb signal.1-enable
        output  reg                     parity_err_flag     //o1: reg_fifo_cbb empty signal
        
    );    

//--------------------------
//  parameters
//--------------------------

//--------------------------
//  signals
//--------------------------
reg                     wen_1dly;
reg [FIFO_WIDTH - 1:0]  wdata_1dly;
wire[FIFO_WIDTH:0]      rdata_tmp;
wire                    fifo_ren_tmp;       //add by xiangjianbo,2014.09.30
wire                    par_fifo_ren;       //add by xiangjianbo,2014.09.30
//------------------------
//  process
//-----------------------
//in
assign  fifo_wen    = wen_1dly;
assign  fifo_wdata  = {^wdata_1dly,wdata_1dly};

always @(posedge clk_wr or posedge wr_reset)
begin
    if(wr_reset == 1'b1) begin
        wen_1dly    <=  1'b0;
        wdata_1dly  <=  {FIFO_WIDTH{1'b0}};
    end
    else begin
        wen_1dly    <=  wen;
        wdata_1dly  <=  wdata;
    end
end

//out
generate
if(PARITY_DLY == "TRUE") begin : parity_dly_en

reg [FIFO_WIDTH:0]      fifo_rdata_1dly;
reg                     fifo_ren_1dly;

assign  rdata_tmp       = fifo_rdata_1dly;
assign  fifo_ren_tmp    = fifo_ren_1dly;        //add by xiangjianbo,2014.09.30

always @(posedge clk_rd or posedge rd_reset)
begin
    if(rd_reset == 1'b1) begin
        fifo_rdata_1dly <= {1'b0,{FIFO_WIDTH{1'b0}}};
        fifo_ren_1dly   <= 1'b0;
    end
    else begin
        fifo_rdata_1dly <= fifo_rdata;
        fifo_ren_1dly   <= fifo_ren;
    end
end

end
else begin : no_parity_dly

assign  rdata_tmp       = fifo_rdata;
assign  fifo_ren_tmp    = fifo_ren;

end
endgenerate

//for parity_err add "fifo_ren" condition, normal or ahead. add by xiangjianbo,2014.09.30
generate
if(FIFO_ATTR == "normal") begin : normal_read_par

reg     fifo_ren_temp_1dly;

assign  par_fifo_ren    = fifo_ren_temp_1dly;

always @(posedge clk_rd or posedge rd_reset)
begin
    if(rd_reset == 1'b1) begin
        fifo_ren_temp_1dly  <= 1'b0;
    end
    else begin
        fifo_ren_temp_1dly  <= fifo_ren_tmp;
    end
end


end
else begin : ahead_read_par

assign  par_fifo_ren    = fifo_ren_tmp;

end
endgenerate

//--parity
assign  parity_err      = (^rdata_tmp) && (par_fifo_ren == 1'b1);   //add by xiangjianbo,2014.09.30

always @(posedge clk_rd or posedge rd_reset)
begin
    if(rd_reset == 1'b1) begin
        parity_err_flag <= 1'b0;
    end
    else if(parity_err == 1'b1) begin
        parity_err_flag <= 1'b1;
    end
    else ;
end

endmodule
