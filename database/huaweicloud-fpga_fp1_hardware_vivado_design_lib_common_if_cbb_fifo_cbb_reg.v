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


module  fifo_cbb_reg #(
    parameter   FIFO_ATTR       = "normal"          ,   //"normal" or "ahead"
                FIFO_WIDTH      = 8                     //

    )(
        input                           clk_sys         ,   //i1: clock
        input                           reset           ,   //i1: reset,active high
        input                           ren             ,   //i1: user input fifo read enable.1-enable
        input                           fifo_empty      ,   //i1: fifo_cbb output empty signal.1-empty,0-no empty
        input       [FIFO_WIDTH - 1:0]  fifo_rdata      ,   //i[FIFO_WIDTH]: fifo_cbb output read data      
        output  reg [FIFO_WIDTH - 1:0]  reg_fifo_rdata  ,   //o[FIFO_WIDTH]: fifo_cbb_reg output read data
        output  wire                    reg_fifo_ren    ,   //o1: fifo_cbb_reg output to read fifo_cbb signal.1-enable
        output  wire                    empty               //o1: fifo_cbb_reg empty signal
        
    );    

//--------------------------
//  parameters
//--------------------------

//--------------------------
//  signals
//--------------------------
reg                     ren_reg_tmp;
reg                     ren_reg_tmp_1dly;
reg                     reg_tmp_flag;    
reg                     empty_tmp;
wire                    rdata_dly_vld;
wire                    empty_vld;
//------------------------
//  process
//-----------------------
assign  reg_fifo_ren    = ((ren == 1'b1) && (empty == 1'b0)) || (ren_reg_tmp == 1'b1);
assign  empty           = empty_tmp;

//generate normal and ahead
generate
if(FIFO_ATTR == "normal") begin : reg_normal_sig

assign  rdata_dly_vld   =   (ren == 1'b1) && (empty == 1'b0);
assign  empty_vld       =   ren_reg_tmp_1dly;
    
end
else if(FIFO_ATTR == "ahead") begin : reg_ahead_sig

assign  rdata_dly_vld   =   reg_fifo_ren;
assign  empty_vld       =   ren_reg_tmp;

end
else ;
endgenerate

//--read fifo data into register
always@(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
       ren_reg_tmp      <=  1'b0;
       reg_tmp_flag     <=  1'b0; 
    end
    else if((fifo_empty == 1'b0) && (reg_tmp_flag == 1'b0)) begin
        ren_reg_tmp     <=  1'b1;
        reg_tmp_flag    <=  1'b1;
    end
    else if((fifo_empty == 1'b1) && (ren == 1'b1)) begin
        ren_reg_tmp     <=  1'b0;
        reg_tmp_flag    <=  1'b0;
    end
    else begin
        ren_reg_tmp     <=  1'b0;
    end
end

always@(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        ren_reg_tmp_1dly    <=  1'b0;
    end
    else begin
        ren_reg_tmp_1dly    <=  ren_reg_tmp;
    end
end

//---empty and dataout
always@(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        empty_tmp   <=  1'b1;
    end
    else if(empty_vld == 1'b1) begin
        empty_tmp   <=  1'b0;
    end
    else if((fifo_empty == 1'b1) && (ren == 1'b1)) begin
        empty_tmp   <=  1'b1;
    end
    else ;
end

always@(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        reg_fifo_rdata   <=  {FIFO_WIDTH{1'b0}};
    end
    else if(rdata_dly_vld == 1'b1)begin
        reg_fifo_rdata   <=  fifo_rdata;
    end
    else ;
end    
    
endmodule
