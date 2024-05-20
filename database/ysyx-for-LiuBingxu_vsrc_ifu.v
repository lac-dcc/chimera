// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the inst fetch Unit for a cpu core
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

module ifu#(parameter RST_PC=64'h0)(
    //clock and reset
    input                   clk,
    input                   rst_n,

    //jump interface
    // input                   flush_flag,
    input                   jump_flag,
    input  [63:0]           jump_addr,

    //axi-lite clock and resetn
    // input                   aclk,
    // input                   aresetn,

    //read addr channel
    input                   ifu_arready,
    output                  ifu_arvalid,
    output [63:0]           ifu_araddr,

    //read data channel
    input                   ifu_rvalid,
    output                  ifu_rready,
    input  [1:0]            ifu_rresp,
    input  [31:0]           ifu_rdata,

    //ifu - idu interface
    output                  IF_ID_reg_inst_valid,
    input                   ID_IF_inst_ready,
    input                   ID_IF_flush_flag,
    output                  IF_ID_reg_inst_compress_flag,
    output [1:0]            IF_ID_reg_rresp,
    output [15:0]           IF_ID_reg_inst_compress,
    output [31:0]           IF_ID_reg_inst,
    output [63:0]           IF_ID_reg_PC
);

//仍未接收inst计数器
reg  [2:0]          inst_cnt;
wire [2:0]          inst_cnt_more;
wire [2:0]          inst_cnt_less;

//有效已发未取pc计数器
reg  [2:0]          pc_cnt;

//已发未收pc计数器
reg  [2:0]          pc_all_cnt;

//无效数据握手计数器
reg  [3:0]          invalid_cnt;

//ifu_arvalid实际寄存器
reg                 ifu_arvalid_reg;

//fifo读使能
wire                fifo_ren;

//fifo写使能
wire                fifo_wen;

//fifo 指令读出数据
wire [31:0]         inst_rdata;

//fifo 回应数据
wire [1:0]          rresp_rdata;

//inst fifo空标志
wire                inst_empty;

reg [63:0]          my_reg_PC_reg;
reg [31:0]          inst_rdata_reg;
reg [1:0]           rresp_rdata_reg;
wire                inst_my_reg_valid;

reg  [31:0]         inst_rdata_reg_get;
wire [31:0]         inst_rdata_reg_tran;
wire [31:0]         inst_to_idu;
reg  [1:0]          rresp_to_idu;

wire                inst_compress_flag;

wire                status1_can_conver_flag;
wire                status2_can_conver_flag;
wire                status3_can_conver_flag;
wire                status2_after_jump_flag;
wire                reg_can_cover_flag;
wire                reg_can_change_flag;
wire                flush_flag;

reg [1:0]           status;
localparam STATUS1 = 2'h0;
localparam STATUS2 = 2'h1;
localparam STATUS3 = 2'h2;

//pc part
reg [63:0]          pc;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        pc <= RST_PC;
    end
    else begin
        if(jump_flag)begin
            pc <= jump_addr;
        end
        else if(ifu_arvalid & ifu_arready)begin
            pc <= pc + 4;
        end
    end
end

//ar part
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        ifu_arvalid_reg <= 1'b0;
    end
    else begin
        if(flush_flag)begin
            ifu_arvalid_reg <= 1'b0;
        end
        else if(ifu_arvalid_reg)begin
            if(ifu_arvalid & ifu_arready & (((pc_cnt == 3'h3) & (!fifo_ren))|((pc_all_cnt == 3'h3) & (!(ifu_rvalid&ifu_rready)))))begin
                ifu_arvalid_reg <= 1'b0;
            end
        end
        else begin
            if((pc_cnt!=3'h4) & (pc_all_cnt != 3'h4)) begin
                ifu_arvalid_reg <= 1'b1;
            end
        end
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        pc_cnt<=3'h0;
    end
    else begin
        if(flush_flag)begin
            pc_cnt<=3'h0;
        end
        else if(ifu_arvalid&ifu_arready&fifo_ren)begin
            pc_cnt<=pc_cnt;
        end
        else if(fifo_ren)begin
            pc_cnt<=pc_cnt+3'h7;
        end
        else if(ifu_arvalid&ifu_arready)begin
            pc_cnt<=pc_cnt+1;
        end
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        pc_all_cnt<=3'h0;
    end
    else begin
        if(ifu_arvalid&ifu_arready&ifu_rvalid&ifu_rready)begin
            pc_all_cnt<=pc_all_cnt;
        end
        else if(ifu_rvalid&ifu_rready)begin
            pc_all_cnt<=pc_all_cnt+3'h7;
        end
        else if(ifu_arvalid&ifu_arready)begin
            pc_all_cnt<=pc_all_cnt+1;
        end
    end
end
assign ifu_araddr = {pc[63:2],2'h0};
assign ifu_arvalid = ifu_arvalid_reg;

//read data part
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        inst_cnt<=3'h0;
    end
    else begin
        if(flush_flag)begin
            inst_cnt <= 3'h0;
        end
        else if(ifu_arvalid&ifu_arready&ifu_rvalid&ifu_rready&(invalid_cnt==4'h0))begin
            inst_cnt<=inst_cnt;
        end
        else if(ifu_arvalid&ifu_arready)begin
            inst_cnt<=inst_cnt+1;
        end
        else if(ifu_rvalid&ifu_rready&(invalid_cnt==4'h0))begin
            inst_cnt<=inst_cnt+3'h7;
        end
    end
end
assign inst_cnt_more = inst_cnt + 1;
assign inst_cnt_less = inst_cnt + 3'h7;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        invalid_cnt <= 4'h0;
    end
    else begin
        if(invalid_cnt[3])begin
            if(flush_flag)begin
                if(ifu_arvalid&ifu_arready&ifu_rvalid&ifu_rready)begin
                    invalid_cnt[2:0]<=invalid_cnt[2:0] + inst_cnt;
                end
                else if(ifu_arvalid&ifu_arready)begin
                    invalid_cnt[2:0]<=invalid_cnt[2:0] + inst_cnt + 1;
                end
                else if(ifu_rvalid&ifu_rready)begin
                    invalid_cnt[2:0]<=invalid_cnt[2:0] + inst_cnt +3'h7;
                    if((invalid_cnt[2:0] == 3'h1) & (inst_cnt == 3'h0))begin
                        invalid_cnt[3]<=1'b0;
                    end
                end
                else begin
                    invalid_cnt[2:0]<=invalid_cnt[2:0] + inst_cnt;
                end
            end
            else if(ifu_rvalid&ifu_rready)begin
                invalid_cnt[2:0]<=invalid_cnt[2:0]+3'h7;
                if(invalid_cnt[2:0]==3'h1)begin
                    invalid_cnt[3]<=1'b0;
                end
            end
        end
        else begin
            if(flush_flag)begin
                if(ifu_arvalid&ifu_arready&ifu_rvalid&ifu_rready)begin
                    invalid_cnt <= {1'b1,inst_cnt};
                end
                else if(ifu_arvalid&ifu_arready)begin
                    invalid_cnt <= {1'b1,inst_cnt_more};
                end
                else if(ifu_rvalid&ifu_rready)begin
                    invalid_cnt <= {1'b1,inst_cnt_less};
                end
                else begin
                    invalid_cnt <= {1'b1,inst_cnt};
                end
            end
        end
    end
end

ifu_fifo #(
    .DATA_LEN   	( 34  ),
    .AddR_Width 	( 2   )
) u_ifu_fifo
(
    .clk    	( clk                       ),
    .rst_n  	( rst_n                     ),
    .Wready 	( fifo_wen                  ),
    .empty      ( inst_empty                ),
    .Rready 	( fifo_ren                  ),
    .flush  	( flush_flag          ),
    .wdata  	( {ifu_rresp,ifu_rdata}     ),
    .rdata  	( {rresp_rdata,inst_rdata}  )
);

assign fifo_wen = ifu_rvalid&ifu_rready&(invalid_cnt==4'h0);
assign fifo_ren = status1_can_conver_flag | status2_can_conver_flag | status2_after_jump_flag | (status3_can_conver_flag & (inst_rdata_reg_get[1:0] == 2'b11));
assign ifu_rready   = 1;


//ifu - idu interface part

//使用fifo输出输出     使用fifo的前半段和reg的后半段输出      使用reg输出输出    
//status1           ->status2                           ->status3

inst16_to_32 u_inst16_to_32(
    .input_inst 	( inst_rdata_reg_get[15:0]  ),
    .output_inst 	( inst_rdata_reg_tran       )
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        status <= STATUS1;
        my_reg_PC_reg <= RST_PC;
        // inst_my_reg_valid <= 1'b0;
    end
    else if(jump_flag)begin
        my_reg_PC_reg <= jump_addr;
        // inst_my_reg_valid <= 1'b0;
        if(jump_addr[1])begin
            status <= STATUS2;
        end
        else begin
            status <= STATUS1;
        end
    end
    // else if(flush_flag)begin
        // inst_my_reg_valid <= 1'b0;
    // end
    else begin
        case (status)
            STATUS1: begin
                if(reg_can_cover_flag&(!inst_empty)&(inst_rdata_reg_get[1:0]!=2'b11))begin
                    status <= STATUS2;
                    my_reg_PC_reg <= my_reg_PC_reg + 2;
                end
                else if(reg_can_cover_flag&(!inst_empty))begin
                    status <= STATUS1;
                    my_reg_PC_reg <= my_reg_PC_reg + 4;
                end
            end
            STATUS2: begin
                if(reg_can_cover_flag&(!inst_empty)&(inst_my_reg_valid)&(inst_rdata_reg_get[1:0]!=2'b11))begin
                    status <= STATUS3;
                    my_reg_PC_reg <= my_reg_PC_reg + 2;
                end
                else if(reg_can_cover_flag&(!inst_empty)&(inst_my_reg_valid))begin
                    status <= STATUS2;
                    my_reg_PC_reg <= my_reg_PC_reg + 4;
                end
            end
            STATUS3: begin
                if(reg_can_cover_flag&(inst_my_reg_valid)&(inst_rdata_reg_get[1:0]!=2'b11))begin
                    status <= STATUS2;
                    my_reg_PC_reg <= my_reg_PC_reg + 2;
                end
                else if(reg_can_cover_flag&(inst_my_reg_valid))begin
                    status <= STATUS3;
                    my_reg_PC_reg <= my_reg_PC_reg + 4;
                end
            end
            default: begin
                status <= STATUS1;
                my_reg_PC_reg <= 64'h0;
            end
        endcase
    end
end

//+---------------+-----------------+
//|inst_rdata     |inst_rdata_reg   |
//|_______________|_________________|
//|31|30|29|....|0|31|30|29|28|...|0|
//|               |                 |
//+---------------|-----------------|
always @(*) begin
    case (status)
        STATUS1: begin
            inst_rdata_reg_get = inst_rdata;
        end
        STATUS2: begin
            inst_rdata_reg_get = {inst_rdata[15:0], inst_rdata_reg[31:16]};
        end
        STATUS3: begin
            inst_rdata_reg_get = inst_rdata_reg;
        end
        default: begin
            inst_rdata_reg_get = 32'h0;
        end
    endcase
end

FF_D_with_syn_rst_without_asyn #(
    .DATA_LEN 	( 1  ),
    .RST_DATA 	( 0  )
)u_inst_my_reg_valid
(
    .clk      	( clk               ),
    .syn_rst  	( flush_flag  ),
    .wen      	( fifo_ren          ),
    .data_in  	( 1'b1              ),
    .data_out 	( inst_my_reg_valid )
);


FF_D_without_asyn_rst #(
    .DATA_LEN 	( 32  )
)u_inst_rdata_reg
(
    .clk      	( clk               ),
    .wen    	( fifo_ren          ),
    .data_in  	( inst_rdata        ),
    .data_out 	( inst_rdata_reg    )
);

FF_D_without_asyn_rst #(
    .DATA_LEN 	(  2  )
)u_rresp_rdata_reg
(
    .clk      	( clk               ),
    .wen    	( fifo_ren          ),
    .data_in  	( rresp_rdata       ),
    .data_out 	( rresp_rdata_reg   )
);


FF_D_with_syn_rst #(
    .DATA_LEN 	( 1  ),
    .RST_DATA 	( 0  )
)u_inst_valid
(
    .clk      	( clk                   ),
    .rst_n    	( rst_n                 ),
    .syn_rst    ( flush_flag      ),
    .wen        ( reg_can_cover_flag    ),
    .data_in  	( reg_can_change_flag   ),
    .data_out 	( IF_ID_reg_inst_valid  )
);

FF_D_without_asyn_rst #(2)u_rresp(.clk(clk),.wen(reg_can_change_flag),.data_in(rresp_to_idu),.data_out(IF_ID_reg_rresp));
FF_D_without_asyn_rst #(32)u_inst(.clk(clk),.wen(reg_can_change_flag),.data_in(inst_to_idu),.data_out(IF_ID_reg_inst));
FF_D_without_asyn_rst #(16)u_inst_compress(.clk(clk),.wen(reg_can_change_flag),.data_in(inst_rdata_reg_get[15:0]),.data_out(IF_ID_reg_inst_compress));
FF_D_without_asyn_rst #(64)u_PC(.clk(clk),.wen(reg_can_change_flag),.data_in(my_reg_PC_reg),.data_out(IF_ID_reg_PC));
FF_D_without_asyn_rst #(1)u_inst_compress_flag(.clk(clk),.wen(reg_can_change_flag),.data_in(inst_compress_flag),.data_out(IF_ID_reg_inst_compress_flag));


assign status1_can_conver_flag              =   (status == STATUS1) & (reg_can_cover_flag) & (!inst_empty);
assign status2_can_conver_flag              =   (status == STATUS2) & (reg_can_cover_flag) & (!inst_empty) & (inst_my_reg_valid);
assign status3_can_conver_flag              =   (status == STATUS3) & (reg_can_cover_flag) & (inst_my_reg_valid);
assign status2_after_jump_flag              =   (status == STATUS2) & (reg_can_cover_flag) & (!inst_empty) & (!inst_my_reg_valid);
assign reg_can_cover_flag                   =   ((!IF_ID_reg_inst_valid) | (ID_IF_inst_ready)) & (!flush_flag);
assign reg_can_change_flag                  =   status1_can_conver_flag | status2_can_conver_flag | status3_can_conver_flag;
assign flush_flag                           =   ID_IF_flush_flag | jump_flag;

assign inst_to_idu = (inst_rdata_reg_get[1:0] == 2'b11) ? inst_rdata_reg_get : inst_rdata_reg_tran;
assign inst_compress_flag = (inst_rdata_reg_get[1:0] != 2'b11) ? 1'b1 : 1'b0;

always @(*) begin
    case (status)
        STATUS1: begin
            rresp_to_idu = rresp_rdata;
        end
        STATUS2: begin
            if(inst_rdata_reg_get[1:0] != 2'b11)begin
                rresp_to_idu = rresp_rdata_reg;
            end
            else begin
                rresp_to_idu = (rresp_rdata_reg != 2'b00) ? rresp_rdata_reg : rresp_rdata;
            end
        end
        STATUS3: begin
            rresp_to_idu = rresp_rdata_reg;
        end
        default: begin
            rresp_to_idu = 2'h0;
        end
    endcase
end

endmodule //ifu
