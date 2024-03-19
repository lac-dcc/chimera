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

module  xilinx_sdpram #(
    parameter   DEVICE_ID       = "7SERIES"     ,   //"7SERIES" or "SPARTAN6"
                BRAM_TYPE       = "18Kb"        ,   //"9Kb" or "18Kb" or "36Kb"
                RAM_CLK         = "SYNC"        ,   //"SYNC" or "ASYNC"
                RAM_DO_REG      = 0             ,   //0-rdata output no reg,1-reg1
                RAM_WIDTH       = 8             ,   //
                //FIFO_NUMWORDS = 1024          ,   //words number,address width
                RAM_DEEP        = 10                //
    )(
        input                               clk_wr      ,   //i1:
        input                               clk_rd      ,   //i1:
        input                               reset       ,   //i1:
        input                               wren        ,   //i1:
        input           [RAM_DEEP - 1:0]    wraddress   ,   //col_index[RAM_WIDTH]:
        input           [RAM_WIDTH - 1:0]   data        ,   //col_index[RAM_WIDTH]:
        input                               rden        ,   //i1:
        input           [RAM_DEEP - 1:0]    rdaddress   ,   //col_index[RAM_WIDTH]:
        output  wire    [RAM_WIDTH - 1:0]   q               //o[RAM_WIDTH]:
    );

//--------------------------
//  parameters
//--------------------------

//--------------------------
//  signals
//--------------------------
wire[RAM_WIDTH - 1:0]               ram_dout;
//-------------------------------------------------------------
//  process
//-------------------------------------------------------------

generate
if(BRAM_TYPE == "MLAB") begin : SDP_MLAB

//instance
defparam    u_sdp_lutram.DEVICE_ID     = DEVICE_ID     ,
            u_sdp_lutram.BRAM_TYPE     = BRAM_TYPE     ,
            u_sdp_lutram.RAM_WIDTH     = RAM_WIDTH     ,
            u_sdp_lutram.RAM_DEEP      = RAM_DEEP      ;

xilinx_lutram   u_sdp_lutram(
                .reset      (reset      ),  //i1:
                .clk_wr     (clk_wr     ),  //i1:
                .clk_rd     (clk_rd     ),  //i1:
                .wren       (wren       ),  //i1:
                .wraddress  (wraddress  ),  //col_index[FIFO_WIDTH]:
                .data       (data       ),  //col_index[FIFO_WIDTH]:
                .rden       (rden       ),  //i1:
                .rdaddress  (rdaddress  ),  //col_index[FIFO_WIDTH]:
                .q          (ram_dout   )   //o[FIFO_WIDTH]:
                );

end
else begin : SDP_BRAM

defparam    u_sdp_bram.DEVICE_ID     = DEVICE_ID     ,
            u_sdp_bram.BRAM_TYPE     = BRAM_TYPE     ,
            u_sdp_bram.RAM_CLK       = RAM_CLK       ,
            u_sdp_bram.RAM_DO_REG    = RAM_DO_REG    ,
            u_sdp_bram.RAM_WIDTH     = RAM_WIDTH     ,
            u_sdp_bram.RAM_DEEP      = RAM_DEEP      ;

xilinx_bram   u_sdp_bram(
                .reset      (reset      ),  //i1:
                .clk_wr     (clk_wr     ),  //i1:
                .clk_rd     (clk_rd     ),  //i1:
                .wren       (wren       ),  //i1:
                .wraddress  (wraddress  ),  //col_index[FIFO_WIDTH]:
                .data       (data       ),  //col_index[FIFO_WIDTH]:
                .rden       (rden       ),  //i1:
                .rdaddress  (rdaddress  ),  //col_index[FIFO_WIDTH]:
                .q          (ram_dout   )   //o[FIFO_WIDTH]:
                );

end
endgenerate

//for generate the BLOCK_RAM and LUT/RAM_DO_REG 
generate
if((BRAM_TYPE == "MLAB") && (RAM_DO_REG == 0)) begin : LUT_NO_REG

reg [RAM_WIDTH - 1:0]               ram_dout_tmp;

//make MLAB timing same to BRAM
always@(posedge clk_rd or posedge reset)
begin
    if(reset == 1'b1) begin
        ram_dout_tmp    <=  {RAM_WIDTH{1'b0}};
    end
    else if(rden == 1'b1) begin
        ram_dout_tmp  <=  ram_dout;
    end
    else ;
end

assign  q = ram_dout_tmp;
end
else if(BRAM_TYPE == "MLAB") begin : LUT_REG

reg [RAM_WIDTH - 1:0]               ram_dout_tmp;
reg [RAM_WIDTH - 1:0]               ram_dout_tmp_1dly;
reg                                 rden_1dly;

//make MLAB timing same to BRAM
always@(posedge clk_rd or posedge reset)
begin
    if(reset == 1'b1) begin
        rden_1dly   <=  1'b0;
    end
    else begin
        rden_1dly   <= rden;
    end
end

always@(posedge clk_rd or posedge reset)
begin
    if(reset == 1'b1) begin
        ram_dout_tmp    <=  {RAM_WIDTH{1'b0}};
    end
    else if(rden == 1'b1) begin
        ram_dout_tmp    <=  ram_dout;
    end
    else ;
end

always@(posedge clk_rd or posedge reset)
begin
    if(reset == 1'b1) begin
        ram_dout_tmp_1dly   <=  {RAM_WIDTH{1'b0}};
    end
    else if(rden_1dly == 1'b1) begin
        ram_dout_tmp_1dly   <=  ram_dout_tmp;
    end
    else ;
end

assign  q = ram_dout_tmp_1dly;  

end
else begin : BLOCK_RAM
    
assign  q = ram_dout; 
    
end
endgenerate

endmodule
