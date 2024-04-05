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



`include "cbb_define.v"

module  sfifo_cbb #(
    parameter   VENDER_ID       = `VENDER_ID    ,       //Altera or Xilinx or Lattice
                DEVICE_ID       = `DEVICE_ID    ,       //
                BRAM_TYPE       = `BRAM_TYPE    ,       //
                RAM_DO_REG      = 0             ,       //0-rdata output no reg,1-use blockram inter_reg of 1 delay.
                FIFO_ATTR       = "normal"      ,       //normal or ahead
                FIFO_WIDTH      = 8             ,       //
                FIFO_DEEP       = 10                    //2**M

    )(
        input                               clk_sys     ,   //i1:
        input                               reset   ,   //i1:
        input                               wen     ,   //i1:
        input           [FIFO_WIDTH - 1:0]  wdata   ,   //i[FIFO_WIDTH]:
        input                               ren     ,   //i1:
        output  wire    [FIFO_WIDTH - 1:0]  rdata   ,   //o[FIFO_WIDTH]:
        output  wire                        full    ,   //o1:
        output  reg                         empty   ,   //o1:
        output  wire    [FIFO_DEEP  - 1:0]  usedw       //o[FIFO_DEEP]:
    );

//--------------------------
//  parameters
//--------------------------

//--------------------------
//  signals
//--------------------------
reg[FIFO_DEEP - 1:0]    wr_addr;
reg[FIFO_DEEP - 1:0]    rd_addr;
reg[FIFO_DEEP:0]        fifo_used;
wire                    rd_en;
wire                    wr_en;
//-------------------------------------------------------------
//  process
//-------------------------------------------------------------
assign  full    = fifo_used[FIFO_DEEP];
assign  usedw   = fifo_used[FIFO_DEEP - 1:0];
assign  wr_en   = (wen == 1'b1) && (full == 1'b0);

//usedw--
always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        fifo_used   <=  {1'b0,{FIFO_DEEP{1'b0}}};
    end
    else if((wen == 1'b1) && (full == 1'b0) && ((empty == 1'b1) || (ren == 1'b0))) begin
        fifo_used   <=  fifo_used + 1'b1;
    end
    else if((ren == 1'b1) && (empty == 1'b0) && ((full == 1'b1) || (wen == 1'b0))) begin
        fifo_used   <=  fifo_used - 1'b1;
    end
    else ;
end

//empty
generate
if(FIFO_ATTR == "ahead") begin : ahead_fifo

reg     wen_1dly;

assign  rd_en   = ((wen_1dly == 1'b1) && (empty == 1'b1)) || ((ren == 1'b1) && (wr_addr != rd_addr));

always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        wen_1dly    <=  1'b0;
    end
    else begin
        wen_1dly    <=  wr_en;
    end
end

always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        empty   <=  1'b1;
    end
    else if(wen_1dly == 1'b1) begin
        empty   <=  1'b0;
    end
    else if((fifo_used == {{FIFO_DEEP{1'b0}},1'b1}) && (ren == 1'b1)) begin
        empty   <=  1'b1;
    end
    else ;
end
end

else begin : normal_fifo

assign  rd_en   = (ren == 1'b1) && (empty == 1'b0);

always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        empty   <=  1'b1;
    end
    else if(wen == 1'b1) begin
        empty   <=  1'b0;
    end
    else if((fifo_used == {{FIFO_DEEP{1'b0}},1'b1}) && (ren == 1'b1)) begin
        empty   <=  1'b1;
    end
    else ;
end

end
endgenerate

//write address
always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        wr_addr <=  {FIFO_DEEP{1'b0}};
    end
    else if(wr_en == 1'b1) begin
        wr_addr <=  wr_addr + 1'b1;
    end
    else ;
end

//read address
always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1) begin
        rd_addr <=  {FIFO_DEEP{1'b0}};
    end
    else if(rd_en == 1'b1) begin
        rd_addr <=  rd_addr + 1'b1;
    end
    else ;
end

//instance
generate
if(VENDER_ID == "Altera") begin :altera_ram
defparam    u_sfifo_dpram.DEVICE_ID     = DEVICE_ID     ,
            u_sfifo_dpram.CALLED_MODE   = "FIFO"        ,
            u_sfifo_dpram.BRAM_TYPE     = BRAM_TYPE     ,
            u_sfifo_dpram.RAM_DO_REG    = RAM_DO_REG    ,
            u_sfifo_dpram.RAM_WIDTH     = FIFO_WIDTH    ,
            u_sfifo_dpram.RAM_DEEP      = FIFO_DEEP     ;
altera_sdpram   u_sfifo_dpram (
                .rd_reset   (reset      ),  //i1:
                .wrclock    (clk_sys    ),
                .wren       (wr_en      ),
                .wraddress  (wr_addr    ),
                .data       (wdata      ),
                .rdclock    (clk_sys    ),
                .rden       (rd_en      ),
                .rdaddress  (rd_addr    ),
                .q          (rdata      )
                );
end
else begin :Xilinx_ram
defparam    u_sfifo_dpram.DEVICE_ID     = DEVICE_ID     ,
            u_sfifo_dpram.BRAM_TYPE     = BRAM_TYPE     ,
            u_sfifo_dpram.RAM_CLK       = "SYNC"        ,
            u_sfifo_dpram.RAM_DO_REG    = RAM_DO_REG    ,
            u_sfifo_dpram.RAM_WIDTH     = FIFO_WIDTH    ,
            u_sfifo_dpram.RAM_DEEP      = FIFO_DEEP     ;

xilinx_sdpram   u_sfifo_dpram(
                .reset      (reset      ),  //i1:
                .clk_wr     (clk_sys    ),  //i1:
                .clk_rd     (clk_sys    ),  //i1:
                .wren       (wr_en      ),  //i1:
                .wraddress  (wr_addr    ),  //col_index[FIFO_WIDTH]:
                .data       (wdata      ),  //col_index[FIFO_WIDTH]:
                .rden       (rd_en      ),  //i1:
                .rdaddress  (rd_addr    ),  //col_index[FIFO_WIDTH]:
                .q          (rdata      )   //o[FIFO_WIDTH]:
                );

end
endgenerate

endmodule
