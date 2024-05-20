// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the load and store Unit for a cpu core
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

module lsu (
    input                   clk,
    input                   rst_n,
//interface with dcache
    //read addr channel
    output                  lsu_arvalid,
    input                   lsu_arready,
    output                  lsu_arlock,
    output  [2:0]           lsu_arsize,
    output  [63:0]          lsu_araddr,
    //read data channel
    input                   lsu_rvalid,
    output                  lsu_rready,
    input  [1:0]            lsu_rresp,
    input  [63:0]           lsu_rdata,
    //write addr channel
    output                  lsu_awvalid,
    input                   lsu_awready,
    output                  lsu_awlock,
    output  [2:0]           lsu_awsize,
    output  [63:0]          lsu_awaddr,
    //write data channel
    output                  lsu_wvalid,
    input                   lsu_wready,
    output [7:0]            lsu_wstrob,
    output [63:0]           lsu_wdata,
    //write resp channel
    input                   lsu_bvalid,
    output                  lsu_bready,
    input  [1:0]            lsu_bresp,
//interface with exu
    //common sign:
    output                  LS_EX_flush_flag,
    output                  LS_EX_execute_ready,
    input                   EX_LS_reg_execute_valid,
    input [63:0]            EX_LS_reg_PC,
    input [63:0]            EX_LS_reg_next_PC,
    input [31:0]            EX_LS_reg_inst,
    input [4 :0]            EX_LS_reg_rd,
    input                   EX_LS_reg_dest_wen,
    //load_sign:
    input                   EX_LS_reg_load_valid,
    input                   EX_LS_reg_load_signed,
    input                   EX_LS_reg_load_byte,
    input                   EX_LS_reg_load_half,
    input                   EX_LS_reg_load_word,
    input                   EX_LS_reg_load_double,
    //store_sign:
    input                   EX_LS_reg_store_valid,
    input                   EX_LS_reg_store_byte,
    input                   EX_LS_reg_store_half,
    input                   EX_LS_reg_store_word,
    input                   EX_LS_reg_store_double,
    input  [63:0]           EX_LS_reg_store_data,
    //Zicsr:
    input                   EX_LS_reg_csr_wen,
    input                   EX_LS_reg_csr_ren,
    input  [11:0]           EX_LS_reg_csr_addr,
    //atomic:
    input                   EX_LS_reg_atomic_valid,
    input                   EX_LS_reg_atomic_word,
    input                   EX_LS_reg_atomic_lr,
    input                   EX_LS_reg_atomic_sc,
    input                   EX_LS_reg_atomic_swap,
    input                   EX_LS_reg_atomic_add,
    input                   EX_LS_reg_atomic_xor,
    input                   EX_LS_reg_atomic_and,
    input                   EX_LS_reg_atomic_or,
    input                   EX_LS_reg_atomic_min,
    input                   EX_LS_reg_atomic_max,
    input                   EX_LS_reg_atomic_signed,
    //trap:
    input                   EX_LS_reg_trap_valid,
    input                   EX_LS_reg_mret_valid,
    input                   EX_LS_reg_sret_valid,
    input  [63:0]           EX_LS_reg_trap_cause,
    input  [63:0]           EX_LS_reg_trap_tval,
    //operand
    input  [63:0]           EX_LS_reg_operand,   //addr when atomic or store, data when other
//interface with wbu
    //common
    output                  LS_WB_reg_ls_valid,
    input                   WB_LS_ls_ready,
    input                   WB_LS_flush_flag,
    output [63:0]           LS_WB_reg_PC,
    output [63:0]           LS_WB_reg_next_PC,
    output [31:0]           LS_WB_reg_inst,
    //trap:
    output                  LS_WB_reg_trap_valid,
    output                  LS_WB_reg_mret_valid,
    output                  LS_WB_reg_sret_valid,
    output [63:0]           LS_WB_reg_trap_cause,
    output [63:0]           LS_WB_reg_trap_tval,
    //csr
    output                  LS_WB_reg_csr_wen,
    output                  LS_WB_reg_csr_ren,
    output [11:0]           LS_WB_reg_csr_addr,
    //gpr
    output [4:0]            LS_WB_reg_rd,
    output                  LS_WB_reg_dest_wen,
    output [63:0]           LS_WB_reg_data
);

// lsu_alu outports wire
wire [63:0] 	atomic_read_memory_data;
wire [63:0] 	atomic_read_gpr_data;
wire [63:0] 	atomic_wirte_memory_data;

wire [63:0]     load_pre_data;
wire [63:0]     store_pre_data;
wire [63:0]     load_data;
wire [63:0]     store_data;
wire            load_byte_sign;
wire            load_half_sign;
wire            load_word_sign;
wire            load_double_sign;
wire            load_signed_sign;
wire            store_byte_sign;
wire            store_half_sign;
wire            store_word_sign;
wire            store_double_sign;

//trap:
wire            trap_valid;
wire [63:0]     trap_cause;
wire [63:0]     trap_tval;
//gpr
wire [63:0]     gpr_data;

localparam READ_IDLE                    = 2'h0;
localparam READ_WAIT_ARREADY            = 2'h1;
localparam READ_WAIT_RVALID             = 2'h3;
localparam READ_WAIT_OUT_READY          = 2'h2;
reg  [1:0]      read_state;
reg             read_finish;
//read addr channel
reg             read_arvalid_reg;
//read data channel
reg  [63:0]     read_data_reg;
//trap:
wire            read_misaligned;
reg             read_page_error;
reg             read_access_error;
localparam WRITE_IDLE                   = 3'h0;
localparam WRITE_WAIT_AWREADY_WREADY    = 3'h1;
localparam WRITE_WAIT_AWREADY           = 3'h3;
localparam WRITE_WAIT_WREADY            = 3'h5;
localparam WRITE_WAIT_BVALID            = 3'h7;
localparam WRITE_WAIT_OUT_READY         = 3'h6;
reg  [2:0]      write_state;
reg             write_finish;
//write addr channel
reg             write_awvalid_reg;
//write data channel
reg             write_wvalid_reg;
//trap:
wire            write_misaligned;
reg             write_page_error;
reg             write_access_error;
localparam ATOMIC_IDLE                   = 3'h0;
localparam ATOMIC_WAIT_ARREADY           = 3'h1;
localparam ATOMIC_WAIT_RVALID            = 3'h3;
localparam ATOMIC_WAIT_AWREADY_WREADY    = 3'h7;
localparam ATOMIC_WAIT_AWREADY           = 3'h5;
localparam ATOMIC_WAIT_WREADY            = 3'h6;
localparam ATOMIC_WAIT_BVALID            = 3'h4;
localparam ATOMIC_WAIT_OUT_READY         = 3'h2;
reg  [2:0]      atomic_state;
reg             atomic_finish;
//atomic read addr channel
reg             atomic_arvalid_reg;
//atomic data channel
reg  [63:0]     atomic_data_reg;
//atomic write addr channel
reg             atomic_awvalid_reg;
//atomic write data channel
reg             atomic_wvalid_reg;
//trap:
reg             atomic_load_misaligned;
reg             atomic_store_misaligned;
reg             atomic_load_page_error;
reg             atomic_store_page_error;
reg             atomic_load_access_error;
reg             atomic_store_access_error;

//get wstrb by control sign 
reg [7:0] byte_wstrob,half_wstrob,word_wstrob,double_store;
always @(*) begin
    case (EX_LS_reg_operand[2:0])
        3'b000: byte_wstrob=8'b00000001;
        3'b001: byte_wstrob=8'b00000010;
        3'b010: byte_wstrob=8'b00000100;
        3'b011: byte_wstrob=8'b00001000;
        3'b100: byte_wstrob=8'b00010000;
        3'b101: byte_wstrob=8'b00100000;
        3'b110: byte_wstrob=8'b01000000;
        3'b111: byte_wstrob=8'b10000000;
        default: byte_wstrob=8'b00000000;
    endcase
end
always @(*) begin
    case (EX_LS_reg_operand[2:0])
        3'b000: half_wstrob=8'b00000011;
        3'b010: half_wstrob=8'b00001100;
        3'b100: half_wstrob=8'b00110000;
        3'b110: half_wstrob=8'b11000000;
        default: half_wstrob=8'b00000000;
    endcase
end
always @(*) begin
    case (EX_LS_reg_operand[2:0])
        3'b000: word_wstrob=8'b00001111;
        3'b100: word_wstrob=8'b11110000;
        default: word_wstrob=8'b00000000;
    endcase
end
always @(*) begin
    case (EX_LS_reg_operand[2:0])
        3'b000: double_store=8'b11111111;
        default: double_store=8'b00000000;
    endcase
end

lsu_alu u_lsu_alu(
    .atomic_read_memory_data  	( atomic_read_memory_data   ),
    .atomic_read_gpr_data     	( atomic_read_gpr_data      ),
    .EX_LS_reg_atomic_swap    	( EX_LS_reg_atomic_swap     ),
    .EX_LS_reg_atomic_add     	( EX_LS_reg_atomic_add      ),
    .EX_LS_reg_atomic_xor     	( EX_LS_reg_atomic_xor      ),
    .EX_LS_reg_atomic_and     	( EX_LS_reg_atomic_and      ),
    .EX_LS_reg_atomic_or      	( EX_LS_reg_atomic_or       ),
    .EX_LS_reg_atomic_min     	( EX_LS_reg_atomic_min      ),
    .EX_LS_reg_atomic_max     	( EX_LS_reg_atomic_max      ),
    .EX_LS_reg_atomic_signed  	( EX_LS_reg_atomic_signed   ),
    .atomic_wirte_memory_data 	( atomic_wirte_memory_data  )
);

memory_load_move u_memory_load_move(
    .pre_data    	( load_pre_data             ),
    .data_offset 	( EX_LS_reg_operand[2:0]    ),
    .is_byte     	( load_byte_sign            ),
    .is_half     	( load_half_sign            ),
    .is_word     	( load_word_sign            ),
    .is_double   	( load_double_sign          ),
    .is_sign     	( load_signed_sign          ),
    .data        	( load_data                 )
);

memory_store_move u_memory_store_move(
    .pre_data    	( store_pre_data            ),
    .data_offset 	( EX_LS_reg_operand[2:0]    ),
    .data        	( store_data                )
);

//read fsm
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        read_state          <= READ_IDLE;
        read_arvalid_reg    <= 1'b0;
        read_page_error     <= 1'b0;
        read_access_error   <= 1'b0;
        read_data_reg       <= 64'h0;
        read_finish         <= 1'b0;
    end
    else begin
        case (read_state)
            READ_IDLE: begin
                if(EX_LS_reg_execute_valid & (!trap_valid) & EX_LS_reg_load_valid)begin
                    read_state          <= READ_WAIT_ARREADY;
                    read_arvalid_reg    <= 1'b1;
                end
            end
            READ_WAIT_ARREADY: begin
                if(lsu_arready & lsu_arvalid)begin
                    read_state          <= READ_WAIT_RVALID;
                    read_arvalid_reg    <= 1'b0;
                end
            end
            READ_WAIT_RVALID: begin
                if(lsu_rready & lsu_rvalid)begin
                    read_state          <= READ_WAIT_OUT_READY;
                    read_data_reg       <= load_data;
                    read_finish         <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & (lsu_rresp == 2'h2))begin
                    read_page_error     <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & (lsu_rresp == 2'h3))begin
                    read_access_error   <= 1'b1;
                end
            end
            READ_WAIT_OUT_READY: begin
                if(LS_EX_execute_ready)begin
                    read_state          <= READ_IDLE;
                    read_page_error     <= 1'b0;
                    read_access_error   <= 1'b0;
                    read_finish         <= 1'b0;
                end
            end
            default: begin
                read_state          <= READ_IDLE;
                read_arvalid_reg    <= 1'b0;
                read_page_error     <= 1'b0;
                read_access_error   <= 1'b0;
                read_finish         <= 1'b0;
            end
        endcase
    end
end

//write fsm
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        write_state         <= WRITE_IDLE;
        write_awvalid_reg   <= 1'b0;
        write_wvalid_reg    <= 1'b0;
        write_page_error    <= 1'b0;
        write_access_error  <= 1'b0;
        write_finish        <= 1'b0;
    end
    else begin
        case (write_state)
            WRITE_IDLE: begin
                if(EX_LS_reg_execute_valid & (!trap_valid) & EX_LS_reg_store_valid)begin
                    write_state         <= WRITE_WAIT_AWREADY_WREADY;
                    write_awvalid_reg   <= 1'b1;
                    write_wvalid_reg    <= 1'b1;
                end
            end
            WRITE_WAIT_AWREADY_WREADY: begin
                if(lsu_awvalid & lsu_awready & lsu_wvalid & lsu_wready)begin
                    write_state         <= WRITE_WAIT_BVALID;
                    write_awvalid_reg   <= 1'b0;
                    write_wvalid_reg    <= 1'b0;
                end
                else if(lsu_wvalid & lsu_wready)begin
                    write_state         <= WRITE_WAIT_AWREADY;
                    write_wvalid_reg    <= 1'b0;
                end
                else if(lsu_awvalid & lsu_awready)begin
                    write_state         <= WRITE_WAIT_WREADY;
                    write_awvalid_reg   <= 1'b0;
                end
            end
            WRITE_WAIT_AWREADY: begin
                if(lsu_awvalid & lsu_awready)begin
                    write_state         <= WRITE_WAIT_BVALID;
                    write_awvalid_reg   <= 1'b0;
                end
            end
            WRITE_WAIT_WREADY: begin
                if(lsu_wvalid & lsu_wready)begin
                    write_state         <= WRITE_WAIT_BVALID;
                    write_wvalid_reg    <= 1'b0;
                end
            end
            WRITE_WAIT_BVALID: begin
                if(lsu_bready & lsu_bvalid)begin
                    write_state         <= WRITE_WAIT_OUT_READY;
                    write_finish        <= 1'b1;
                end
                if(lsu_bready & lsu_bvalid & (lsu_bresp == 2'h2))begin
                    write_page_error    <= 1'b1;
                end
                if(lsu_bready & lsu_bvalid & (lsu_bresp == 2'h3))begin
                    write_access_error  <= 1'b1;
                end
            end
            WRITE_WAIT_OUT_READY: begin
                if(LS_EX_execute_ready)begin
                    write_state         <= WRITE_IDLE;
                    write_page_error    <= 1'b0;
                    write_access_error  <= 1'b0;
                    write_finish        <= 1'b0;
                end
            end
            default: begin
                write_state         <= WRITE_IDLE;
                write_awvalid_reg   <= 1'b0;
                write_wvalid_reg    <= 1'b0;
                write_page_error    <= 1'b0;
                write_access_error  <= 1'b0;
                write_finish        <= 1'b0;
            end
        endcase
    end
end

//atomic fsm
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        atomic_state                <= ATOMIC_IDLE;
        atomic_arvalid_reg          <= 1'b0;
        atomic_awvalid_reg          <= 1'b0;
        atomic_wvalid_reg           <= 1'b0;
        atomic_load_access_error    <= 1'b0;
        atomic_load_page_error      <= 1'b0;
        atomic_store_access_error   <= 1'b0;
        atomic_store_page_error     <= 1'b0;
        atomic_data_reg             <= 64'h0;
        atomic_finish               <= 1'b0;
    end
    else begin
        case (atomic_state)
            ATOMIC_IDLE: begin
                if(EX_LS_reg_execute_valid & (!trap_valid) & EX_LS_reg_atomic_valid & EX_LS_reg_atomic_sc)begin
                    atomic_state         <= WRITE_WAIT_AWREADY_WREADY;
                    atomic_awvalid_reg   <= 1'b1;
                    atomic_wvalid_reg    <= 1'b1;
                end
                if(EX_LS_reg_execute_valid & (!trap_valid) & EX_LS_reg_atomic_valid & (!EX_LS_reg_atomic_sc))begin
                    atomic_state         <= ATOMIC_WAIT_ARREADY;
                    atomic_arvalid_reg   <= 1'b1;
                end
            end
            ATOMIC_WAIT_ARREADY: begin
                if(lsu_arready & lsu_arvalid)begin
                    atomic_state          <= ATOMIC_WAIT_RVALID;
                    atomic_arvalid_reg    <= 1'b0;
                end
            end
            ATOMIC_WAIT_RVALID: begin
                if(lsu_rready & lsu_rvalid & (lsu_rresp == 2'h1) & (EX_LS_reg_atomic_lr))begin
                    atomic_state          <= ATOMIC_WAIT_OUT_READY;
                    atomic_data_reg       <= load_data;
                    atomic_finish         <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & (lsu_rresp == 2'h1) & (!EX_LS_reg_atomic_lr))begin
                    atomic_state          <= ATOMIC_WAIT_AWREADY_WREADY;
                    atomic_data_reg       <= load_data;
                    atomic_awvalid_reg    <= 1'b1;
                    atomic_wvalid_reg     <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & (lsu_rresp == 2'h2) & (EX_LS_reg_atomic_lr))begin
                    atomic_state          <= ATOMIC_WAIT_OUT_READY;
                    atomic_load_page_error<= 1'b1;
                    atomic_finish         <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & (lsu_rresp == 2'h2) & (!EX_LS_reg_atomic_lr))begin
                    atomic_state            <= ATOMIC_WAIT_OUT_READY;
                    atomic_store_page_error <= 1'b1;
                    atomic_finish           <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & ((lsu_rresp == 2'h3) | (lsu_rresp == 2'h0)) & (EX_LS_reg_atomic_lr))begin
                    atomic_state            <= ATOMIC_WAIT_OUT_READY;
                    atomic_load_access_error<= 1'b1;
                    atomic_finish           <= 1'b1;
                end
                if(lsu_rready & lsu_rvalid & ((lsu_rresp == 2'h3) | (lsu_rresp == 2'h0)) & (!EX_LS_reg_atomic_lr))begin
                    atomic_state                <= ATOMIC_WAIT_OUT_READY;
                    atomic_store_access_error   <= 1'b1;
                    atomic_finish               <= 1'b1;
                end
            end
            ATOMIC_WAIT_AWREADY_WREADY: begin
                if(lsu_awvalid & lsu_awready & lsu_wvalid & lsu_wready)begin
                    atomic_state         <= ATOMIC_WAIT_BVALID;
                    atomic_awvalid_reg   <= 1'b0;
                    atomic_wvalid_reg    <= 1'b0;
                end
                else if(lsu_wvalid & lsu_wready)begin
                    atomic_state         <= ATOMIC_WAIT_AWREADY;
                    atomic_wvalid_reg    <= 1'b0;
                end
                else if(lsu_awvalid & lsu_awready)begin
                    atomic_state         <= ATOMIC_WAIT_WREADY;
                    atomic_awvalid_reg   <= 1'b0;
                end
            end
            ATOMIC_WAIT_AWREADY: begin
                if(lsu_awvalid & lsu_awready)begin
                    atomic_state         <= ATOMIC_WAIT_BVALID;
                    atomic_awvalid_reg   <= 1'b0;
                end
            end
            ATOMIC_WAIT_WREADY: begin
                if(lsu_wvalid & lsu_wready)begin
                    atomic_state         <= ATOMIC_WAIT_BVALID;
                    atomic_wvalid_reg    <= 1'b0;
                end
            end
            ATOMIC_WAIT_BVALID: begin
                if(lsu_bready & lsu_bvalid)begin
                    atomic_state         <= ATOMIC_WAIT_OUT_READY;
                    atomic_finish        <= 1'b1;
                end
                if(lsu_bready & lsu_bvalid & (lsu_bresp == 2'h0) & EX_LS_reg_atomic_sc)begin
                    atomic_data_reg       <= 64'h1;
                end
                if(lsu_bready & lsu_bvalid & (lsu_bresp == 2'h1) & EX_LS_reg_atomic_sc)begin
                    atomic_data_reg       <= 64'h0;
                end
                if(lsu_bready & lsu_bvalid & (lsu_bresp == 2'h2))begin
                    atomic_store_page_error    <= 1'b1;
                end
                if(lsu_bready & lsu_bvalid & ((lsu_bresp == 2'h3) | ((lsu_bresp == 2'h0) & (!EX_LS_reg_atomic_sc))))begin
                    atomic_store_access_error  <= 1'b1;
                end
            end
            ATOMIC_WAIT_OUT_READY: begin
                if(LS_EX_execute_ready)begin
                    atomic_state                <= ATOMIC_IDLE;
                    atomic_load_page_error      <= 1'b0;
                    atomic_load_access_error    <= 1'b0;
                    atomic_store_page_error     <= 1'b0;
                    atomic_store_access_error   <= 1'b0;
                    atomic_finish               <= 1'b0;
                end
            end
            default: begin
                atomic_state                <= ATOMIC_IDLE;
                atomic_arvalid_reg          <= 1'b0;
                atomic_awvalid_reg          <= 1'b0;
                atomic_wvalid_reg           <= 1'b0;
                atomic_load_access_error    <= 1'b0;
                atomic_load_page_error      <= 1'b0;
                atomic_store_access_error   <= 1'b0;
                atomic_store_page_error     <= 1'b0;
                atomic_data_reg             <= 64'h0;
                atomic_finish               <= 1'b0;
            end
        endcase
    end
end

//**********************************************************************
assign atomic_read_memory_data  = atomic_data_reg;
assign atomic_read_gpr_data     = (!EX_LS_reg_atomic_word) ? EX_LS_reg_store_data : ((EX_LS_reg_atomic_signed) ? 
                                {{32{EX_LS_reg_store_data[31]}}, EX_LS_reg_store_data[31:0]} : {32'h0, EX_LS_reg_store_data[31:0]});
assign load_pre_data            = lsu_rdata;
assign store_pre_data           = (EX_LS_reg_store_data & {64{(EX_LS_reg_store_valid | (EX_LS_reg_atomic_valid & EX_LS_reg_atomic_sc))}}) | 
                                    (atomic_wirte_memory_data & {64{EX_LS_reg_atomic_valid & (!EX_LS_reg_atomic_sc)}});
assign load_byte_sign           = EX_LS_reg_load_byte;
assign load_half_sign           = EX_LS_reg_load_half;
assign load_word_sign           = EX_LS_reg_load_word | EX_LS_reg_atomic_word;
assign load_double_sign         = EX_LS_reg_load_double | (EX_LS_reg_atomic_valid & (!EX_LS_reg_atomic_word));
assign load_signed_sign         = EX_LS_reg_load_signed | (EX_LS_reg_atomic_valid & EX_LS_reg_atomic_signed);
assign store_byte_sign          = EX_LS_reg_store_byte;
assign store_half_sign          = EX_LS_reg_store_half;
assign store_word_sign          = EX_LS_reg_store_word | EX_LS_reg_atomic_word;
assign store_double_sign        = EX_LS_reg_store_double | (EX_LS_reg_atomic_valid & (!EX_LS_reg_atomic_word));
assign read_misaligned          = (EX_LS_reg_load_valid) & (
                                    (EX_LS_reg_load_half   & (EX_LS_reg_operand[0]   != 1'b0)) |   
                                    (EX_LS_reg_load_word   & (EX_LS_reg_operand[1:0] != 2'b0)) |   
                                    (EX_LS_reg_load_double & (EX_LS_reg_operand[2:0] != 3'b0))  
                                );
assign write_misaligned         = (EX_LS_reg_store_valid) & (
                                    (EX_LS_reg_store_half   & (EX_LS_reg_operand[0]   != 1'b0)) |   
                                    (EX_LS_reg_store_word   & (EX_LS_reg_operand[1:0] != 2'b0)) |   
                                    (EX_LS_reg_store_double & (EX_LS_reg_operand[2:0] != 3'b0))  
                                );
assign atomic_load_misaligned   = (EX_LS_reg_atomic_valid & EX_LS_reg_atomic_lr) & ( 
                                    (EX_LS_reg_atomic_word    & (EX_LS_reg_operand[1:0] != 2'b0)) |   
                                    ((!EX_LS_reg_atomic_word) & (EX_LS_reg_operand[2:0] != 3'b0))  
                                );
assign atomic_store_misaligned  = (EX_LS_reg_atomic_valid & (!EX_LS_reg_atomic_lr)) & ( 
                                    (EX_LS_reg_atomic_word    & (EX_LS_reg_operand[1:0] != 2'b0)) |   
                                    ((!EX_LS_reg_atomic_word) & (EX_LS_reg_operand[2:0] != 3'b0))  
                                );
assign trap_valid               = EX_LS_reg_trap_valid | read_access_error | read_misaligned | read_page_error |
                                    write_access_error | write_misaligned | write_page_error | 
                                    atomic_load_access_error | atomic_load_misaligned | atomic_load_page_error | 
                                    atomic_store_access_error | atomic_store_misaligned | atomic_store_page_error;
assign trap_cause               = (EX_LS_reg_trap_valid) ? EX_LS_reg_trap_cause : (
                                    (read_misaligned | atomic_load_misaligned) ? 64'h4 : (
                                        (read_page_error | atomic_load_page_error) ? 64'hD : (
                                            (read_access_error | atomic_load_access_error) ? 64'h5 : (
                                                (write_misaligned | atomic_store_misaligned) ? 64'h6 : (
                                                    (write_access_error | atomic_store_access_error) ? 64'h7 : (
                                                        (write_page_error | atomic_store_page_error) ? 64'hF : 64'h0
                                                    )
                                                )
                                            )
                                        )
                                    )
                                );
assign trap_tval                = (EX_LS_reg_trap_valid) ? EX_LS_reg_trap_tval : ((trap_valid) ? EX_LS_reg_operand : 64'h0);
assign gpr_data                 = (EX_LS_reg_operand & {64{(!(EX_LS_reg_load_valid | EX_LS_reg_atomic_valid))}}) | 
                                    (read_data_reg & {64{EX_LS_reg_load_valid}}) | 
                                    (atomic_data_reg & {64{EX_LS_reg_atomic_valid}});
//**********************************************************************
//read addr channel
assign lsu_arvalid          = (!EX_LS_reg_atomic_valid) ? read_arvalid_reg : atomic_arvalid_reg;
assign lsu_arlock           = EX_LS_reg_atomic_valid;
assign lsu_arsize           = (load_byte_sign) ? 3'h0 : (
                                (load_half_sign) ? 3'h1 : (
                                    (load_word_sign) ? 3'h2 : (
                                        (load_double_sign) ? 3'h3 : 3'h0)));
assign lsu_araddr           = EX_LS_reg_operand;
//read data channel
assign lsu_rready           = 1'b1;
//write addr channel
assign lsu_awvalid          = (!EX_LS_reg_atomic_valid) ? write_awvalid_reg : atomic_awvalid_reg;
assign lsu_awlock           = EX_LS_reg_atomic_valid;
assign lsu_awsize           = (store_byte_sign) ? 3'h0 : (
                                (store_half_sign) ? 3'h1 : (
                                    (store_word_sign) ? 3'h2 : (
                                        (store_double_sign) ? 3'h3 : 3'h0)));
assign lsu_awaddr           = EX_LS_reg_operand;
//write data channel
assign lsu_wvalid           = (!EX_LS_reg_atomic_valid) ? write_wvalid_reg : atomic_wvalid_reg;
assign lsu_wstrob           = (store_byte_sign) ? byte_wstrob : (
                                (store_half_sign) ? half_wstrob : (
                                    (store_word_sign) ? word_wstrob : (
                                        (store_double_sign) ? double_store : 8'h0)));
assign lsu_wdata            = store_data;
//write resp channel
assign lsu_bready           = 1'b1;
//commom
assign LS_EX_execute_ready  = (EX_LS_reg_execute_valid & ((!LS_WB_reg_ls_valid) | WB_LS_ls_ready) & 
                                ((((!EX_LS_reg_load_valid) | read_finish) & ((!EX_LS_reg_store_valid) | write_finish) & 
                                ((!EX_LS_reg_atomic_valid) | atomic_finish)) | trap_valid | EX_LS_reg_mret_valid | EX_LS_reg_sret_valid) & 
                                (!WB_LS_flush_flag) & (!(LS_WB_reg_ls_valid & (LS_WB_reg_trap_valid | LS_WB_reg_mret_valid | LS_WB_reg_sret_valid))));
assign LS_EX_flush_flag     = (WB_LS_flush_flag | (LS_WB_reg_ls_valid & (LS_WB_reg_trap_valid | LS_WB_reg_mret_valid | LS_WB_reg_sret_valid)));
FF_D_with_syn_rst #(
    .DATA_LEN 	( 1  ),
    .RST_DATA 	( 0  )
)u_ls_valid
(
    .clk      	( clk                                       ),
    .rst_n    	( rst_n                                     ),
    .syn_rst    ( WB_LS_flush_flag                          ),
    .wen        ( ((!LS_WB_reg_ls_valid) | WB_LS_ls_ready)  ),
    .data_in  	( LS_EX_execute_ready                       ),
    .data_out 	( LS_WB_reg_ls_valid                        )
);
FF_D_without_asyn_rst #(32) u_inst          (clk,LS_EX_execute_ready,EX_LS_reg_inst,    LS_WB_reg_inst);
FF_D_without_asyn_rst #(64) u_PC            (clk,LS_EX_execute_ready,EX_LS_reg_PC,      LS_WB_reg_PC);
FF_D_without_asyn_rst #(64) u_next_PC       (clk,LS_EX_execute_ready,EX_LS_reg_next_PC, LS_WB_reg_next_PC);
//trap:
FF_D_without_asyn_rst #(1)  u_trap_valid    (clk,LS_EX_execute_ready,          trap_valid,LS_WB_reg_trap_valid);
FF_D_without_asyn_rst #(1)  u_mret_valid    (clk,LS_EX_execute_ready,EX_LS_reg_mret_valid,LS_WB_reg_mret_valid);
FF_D_without_asyn_rst #(1)  u_sret_valid    (clk,LS_EX_execute_ready,EX_LS_reg_sret_valid,LS_WB_reg_sret_valid);
FF_D_without_asyn_rst #(64) u_trap_cause    (clk,LS_EX_execute_ready,          trap_cause,LS_WB_reg_trap_cause);
FF_D_without_asyn_rst #(64) u_trap_tval     (clk,LS_EX_execute_ready,           trap_tval,LS_WB_reg_trap_tval);
//Zicsr:
FF_D_without_asyn_rst #(1)  u_csr_wen       (clk,LS_EX_execute_ready,EX_LS_reg_csr_wen, LS_WB_reg_csr_wen);
FF_D_without_asyn_rst #(1)  u_csr_ren       (clk,LS_EX_execute_ready,EX_LS_reg_csr_ren, LS_WB_reg_csr_ren);
FF_D_without_asyn_rst #(12) u_csr_addr      (clk,LS_EX_execute_ready,EX_LS_reg_csr_addr,LS_WB_reg_csr_addr);
//gpr
FF_D_without_asyn_rst #(5)  u_rd            (clk,LS_EX_execute_ready,EX_LS_reg_rd,       LS_WB_reg_rd);
FF_D_without_asyn_rst #(1)  u_dest_wen      (clk,LS_EX_execute_ready,EX_LS_reg_dest_wen, LS_WB_reg_dest_wen);
FF_D_without_asyn_rst #(64) u_gpr_data      (clk,LS_EX_execute_ready,gpr_data,           LS_WB_reg_data);
//**********************************************************************

endmodule //lsu
