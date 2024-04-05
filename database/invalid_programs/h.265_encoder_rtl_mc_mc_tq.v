//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
//
//  Filename      : mc_tq.v
//  Author        : Yufeng Bai
//  Email         : byfchina@gmail.com	
//  Created On    : 2015-01-15 
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module mc_tq (
	clk		,
	rstn		,
	tq_start_i		,
	tq_sel_i		,
	tq_done_o		,
        partition_i             ,

	ipre_start_o		,
	ipre_en_o		,
	ipre_sel_o		,
	ipre_size_o		,
	ipre_4x4_x_o		,
	ipre_4x4_y_o		,
        ipre_data_o             ,
	rec_val_i		,
	rec_idx_i		,

	pred_ren_o		,
	pred_size_o		,
	pred_4x4_x_o		,
	pred_4x4_y_o		,
	pred_4x4_idx_o		,
	pred_rdata_i		
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input 	 [1-1:0] 	        clk 	 ; // clk signal 
input 	 [1-1:0] 	        rstn 	 ; // asynchronous reset 
input 	 [1-1:0] 	        tq_start_i 	 ; // tq start // one at LCU 
input 	 [2-1:0] 	        tq_sel_i 	 ; // 00:luma  10:cb, 11:cr
output 	 [1-1:0] 	        tq_done_o 	 ; // tq done 
input    [42-1:0]               partition_i      ; // partition info
output 	 [1-1:0] 	        ipre_start_o 	 ; // predicted pixel transmission start 
output 	 [1-1:0] 	        ipre_en_o 	 ; // TQ predicted pixel valid 
output 	 [2-1:0] 	        ipre_sel_o 	 ; // "TQ predicted pixel sel: 00: luma  
output 	 [2-1:0] 	        ipre_size_o 	 ; // "TU size: 00:4x4 
output 	 [4-1:0] 	        ipre_4x4_x_o 	 ; // TU data 4x4 block x  in LCU 
output 	 [4-1:0] 	        ipre_4x4_y_o 	 ; // TU data 4x4 block y  in LCU 
output 	 [16*`PIXEL_WIDTH-1:0] 	ipre_data_o 	 ; // TU data 
input 	 [1-1:0] 	        rec_val_i 	 ; // TQ reconstructed parallel data valid 
input 	 [5-1:0] 	        rec_idx_i 	 ; // TQ reconstructed parallel data index 
output 	 [1-1:0] 	        pred_ren_o 	 ; // predicted pixel read request 
output 	 [2-1:0] 	        pred_size_o 	 ; // predicted pixel read mode 
output 	 [4-1:0] 	        pred_4x4_x_o 	 ; // predicted data 4x4 block x in LCU 
output 	 [4-1:0] 	        pred_4x4_y_o 	 ; // predicted data 4x4 block y in LCU 
output 	 [5-1:0] 	        pred_4x4_idx_o 	 ; // predicted data index 
input 	 [32*`PIXEL_WIDTH-1:0] 	pred_rdata_i 	 ; // predicted pixel 

// ********************************************
//
//    PARAMETER DECLARATION
//
// ********************************************

parameter                       IDLE = 'd0;
parameter                       PRE  = 'd1;
parameter                       TQ32 = 'd2;
parameter                       TQ16 = 'd3;
parameter                       TQ8  = 'd4;
parameter                       TQ4  = 'd5;
parameter                       WAIT = 'd6;


parameter                       TU32 = 2'd3;
parameter                       TU16 = 2'd2;
parameter                       TU8  = 2'd1;
parameter                       TU4  = 2'd0;

// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************

reg      [3-1:0]                current_state, next_state;

reg      [2-1:0]                mode32, mode16;
wire     [2-1:0]                mode64;

reg      [5-1:0]                rec_idx_cnt;
wire                            clear32_chroma, clear32_luma,
                                clear16_chroma, clear16_luma,
                                clear08_chroma, clear08_luma;

reg      [2-1:0]                cnt32, cnt16, cnt08;

reg      [3-1:0]                ipre_cnt_x,ipre_cnt_y;

wire                            tq_luma_done, tq_chroma_done;


//io
reg 	 [1-1:0] 	        ipre_en_o 	 ; 
reg 	 [2-1:0] 	        ipre_size_o 	 ; 
reg 	 [4-1:0] 	        ipre_4x4_x_o 	 ; 
reg 	 [4-1:0] 	        ipre_4x4_y_o 	 ; 
wire 	 [16*`PIXEL_WIDTH-1:0] 	ipre_data_o 	 ; // TU data 



// ********************************************
//
//    Combinational Logic
//
// ********************************************

assign mode64 = partition_i[1:0];

always @ (*) begin
    case(cnt32)
	2'd0: mode32 = partition_i[3 : 2];
	2'd1: mode32 = partition_i[5 : 4];
	2'd2: mode32 = partition_i[7 : 6];
	2'd3: mode32 = partition_i[9 : 8];
    endcase
end

always @ (*) begin
    case({cnt32,cnt16})
	4'd00:mode16 = partition_i[11 : 10];
	4'd01:mode16 = partition_i[13 : 12];
	4'd02:mode16 = partition_i[15 : 14];
	4'd03:mode16 = partition_i[17 : 16];
	4'd04:mode16 = partition_i[19 : 18];
	4'd05:mode16 = partition_i[21 : 20];
	4'd06:mode16 = partition_i[23 : 22];
	4'd07:mode16 = partition_i[25 : 24];
	4'd08:mode16 = partition_i[27 : 26];
	4'd09:mode16 = partition_i[29 : 28];
	4'd10:mode16 = partition_i[31 : 30];
	4'd11:mode16 = partition_i[33 : 32];
	4'd12:mode16 = partition_i[35 : 34];
	4'd13:mode16 = partition_i[37 : 36];
	4'd14:mode16 = partition_i[39 : 38];
	4'd15:mode16 = partition_i[41 : 40];
    endcase
end

always @(*) begin
	next_state = IDLE;
    case(current_state) 
        IDLE : begin
            if ( tq_start_i)
                next_state = PRE;
            else
                next_state = IDLE;
        end
        PRE : begin
            if (mode64 == `PART_2NX2N || mode32 == `PART_2NX2N || mode32 == `PART_NX2N || mode32 == `PART_2NXN ) begin
                next_state = TQ32;
            end
            else if (mode16 == `PART_2NX2N || mode16 == `PART_2NXN || mode16 == `PART_NX2N) begin
                next_state = TQ16;
            end
            else begin
                next_state = TQ8;
            end
        end
        TQ32  : begin
            if ((ipre_cnt_x == 'd7  && ipre_cnt_y == 'd7 && ~tq_sel_i[1]) || (ipre_cnt_x == 'd3  && ipre_cnt_y == 'd3 && tq_sel_i[1]))
                next_state = WAIT;
            else
                next_state = TQ32;
        end
        TQ16  : begin
            if ((ipre_cnt_x == 'd3  && ipre_cnt_y == 'd3 && ~tq_sel_i[1]) || (ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1 && tq_sel_i[1]))
                next_state = WAIT;
            else
                next_state = TQ16;
        end
        TQ8  : begin
            if ((ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1 && ~tq_sel_i[1]) || tq_sel_i[1])
                next_state = WAIT;
            else
                next_state = TQ8;
        end
        WAIT : begin
            if(rec_val_i && (rec_idx_i == rec_idx_cnt)) begin
                if(cnt32 == 'd0 && cnt16 == 'd0 && cnt08 == 'd0) // all done 
                    next_state = IDLE;
                else
                    next_state = PRE;
            end
            else begin
                next_state = WAIT;
            end
        end
    endcase
end

// ********************************************
//
//    Sequential Logic
//
// ********************************************

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

//*********Begin of block processing count***********

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        cnt32 <= 'd0;
    end
    else if(tq_start_i) begin
        cnt32 <= 'd0;
    end
    else if ( clear32_luma || clear32_chroma) begin
        cnt32 <= cnt32 + 'd1;
    end
end

assign clear32_luma   = (!tq_sel_i[1]) & (
                                          (current_state == TQ32 && ipre_cnt_x == 'd7  && ipre_cnt_y == 'd7) ||
                                          (current_state == TQ16 && ipre_cnt_x == 'd3  && ipre_cnt_y == 'd3 && cnt16 == 'd3) ||
                                          (current_state == TQ8  && ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1 && cnt16 == 'd3 && cnt08 == 'd3)
                                         );
assign clear32_chroma = (tq_sel_i[1]) & (
                                          (current_state == TQ32 && ipre_cnt_x == 'd3  && ipre_cnt_y == 'd3)  ||
                                          (current_state == TQ16 && ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1 && cnt16 == 'd3) ||
                                          (current_state == TQ8  && cnt16 == 'd3 && cnt08 == 'd3) 
                                         );

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
       cnt16 <= 'd0;
    end
    else if(tq_start_i) begin
       cnt16 <= 'd0;
    end
    else if (clear16_luma || clear16_chroma )begin
       cnt16 <=cnt16 + 'd1;
    end
end

assign clear16_luma   = (!tq_sel_i[1]) & (
                                          (current_state == TQ16 && ipre_cnt_x == 'd3  && ipre_cnt_y == 'd3 ) ||
                                          (current_state == TQ8  && ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1  && cnt08 == 'd3)
                                         );
assign clear16_chroma = (tq_sel_i[1]) & (
                                          (current_state == TQ16 && ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1 ) ||
                                          (current_state == TQ8  && cnt08 == 'd3)
                                         );

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
       cnt08 <= 'd0;
    end
    else if(tq_start_i) begin
       cnt08 <= 'd0;
    end
    else if (clear08_luma || clear08_chroma)begin
       cnt08 <=cnt08 + 'd1;
    end
end

assign clear08_luma   = (!tq_sel_i[1]) & (current_state == TQ8  && ipre_cnt_x == 'd1  && ipre_cnt_y == 'd1);

assign clear08_chroma = (tq_sel_i[1])  & (current_state == TQ8);

//*********End of processing count***********

// pred mem read
always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
       ipre_cnt_x <= 'd0;
       ipre_cnt_y <= 'd0;
    end
    else if(tq_start_i || current_state == PRE) begin
       ipre_cnt_x <= 'd0;
       ipre_cnt_y <= 'd0;
    end
    else if(pred_ren_o) begin
	if(
		(~tq_sel_i[1] & ((current_state == TQ32 && ipre_cnt_x == 'd7 ) ||
				 (current_state == TQ16 && ipre_cnt_x == 'd3 ) ||
                		 (current_state == TQ8  && ipre_cnt_x == 'd1 ) ||
                		 (current_state == TQ4)))
	       	||

		(tq_sel_i[1] & ((current_state == TQ32 && ipre_cnt_x == 'd3 ) ||
				(current_state == TQ16 && ipre_cnt_x == 'd1 ) ||
				(current_state == TQ8 )))
	      ) begin
                ipre_cnt_x <= 'd0;
                ipre_cnt_y <= ipre_cnt_y + 'd1;
        end
        else begin
            ipre_cnt_x <= ipre_cnt_x + 'd1;
            ipre_cnt_y <= ipre_cnt_y;
        end
    end
end

assign pred_ren_o       =   current_state == TQ8  || 
                            current_state == TQ16 || 
                            current_state == TQ32;

assign pred_4x4_x_o		= {cnt32[0],cnt16[0],cnt08[0],1'b0} + (tq_sel_i[1] ? (ipre_cnt_x<<1) : (ipre_cnt_x));
assign pred_4x4_y_o		= {cnt32[1],cnt16[1],cnt08[1],1'b0} + (tq_sel_i[1] ? (ipre_cnt_y<<1) : (ipre_cnt_y));
assign pred_4x4_idx_o		= 'd0;
assign pred_size_o              = 2'b00;


// mem buf interface

assign ipre_start_o 	        = tq_start_i;
assign ipre_sel_o 	        = tq_sel_i; // "TQ predicted pixel sel: 00: luma  

assign ipre_data_o = { pred_rdata_i[255:224]
                      ,pred_rdata_i[191:160]
                      ,pred_rdata_i[127:096]
                      ,pred_rdata_i[063:032]
                     };

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        ipre_en_o    <= 'd0; 
        ipre_4x4_x_o <= 'd0;
        ipre_4x4_y_o <= 'd0;
    end
    else begin
        ipre_en_o    <= pred_ren_o; 
        ipre_4x4_x_o <= (tq_sel_i[1] ? ({1'b0,cnt32[0],cnt16[0],cnt08[0]}) : ({cnt32[0],cnt16[0],cnt08[0],1'b0})) + ipre_cnt_x;
        ipre_4x4_y_o <= (tq_sel_i[1] ? ({1'b0,cnt32[1],cnt16[1],cnt08[1]}) : ({cnt32[1],cnt16[1],cnt08[1],1'b0})) + ipre_cnt_y;
    end
end

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        ipre_size_o <= 'd0;
    end
    else if (pred_ren_o) begin
        case(current_state) 
        TQ8    :  ipre_size_o <= tq_sel_i[1] ? TU4 : TU8 ;
        TQ16   :  ipre_size_o <= tq_sel_i[1] ? TU8 : TU16;
        TQ32   :  ipre_size_o <= tq_sel_i[1] ? TU16: TU32;
        default:  ipre_size_o <= ipre_size_o;
        endcase
    end
end

always @ (*) begin
    case(ipre_size_o)
        TU4    :  rec_idx_cnt = 6'd0;
        TU8    :  rec_idx_cnt = 6'd4;
        TU16   :  rec_idx_cnt = 6'd14;
        TU32   :  rec_idx_cnt = 6'd31;
    endcase
end

assign tq_done_o = (current_state == WAIT) && (rec_val_i) && (rec_idx_i == rec_idx_cnt) && (cnt32 == 'd0 && cnt16 == 'd0 && cnt08 == 'd0);

endmodule

