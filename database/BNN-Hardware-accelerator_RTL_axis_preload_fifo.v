// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： axis_preload_fifo

	input  ： AXIS from AXIS_FIFO、Control Signal

	output ： ALU 1280bit輸入格式 

	FIFO模組，接收前級AXIS FIFO並將資料整形成ALU所需格式
    
    AXIS以32bit且channel first的方式輸入，此模組將前級AXIS整形成ALU所需格式並存於FIFO

    此FIFO為3D FIFO，將一個channel完成填入後再填完整個column，共1280bit，故有
    以kernel size = 3 input channel = 35為例，每個channel需2筆AXIS而每個column有3筆資料，因此需6次AXIS輸入填完FIFO資料，如下圖所示，fifo[0]的資料即整形完成。

    [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
                                                                                            
    [ ][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]        [*][ ][ ][ ]
    [ ][ ][ ][ ]   ->   [ ][ ][ ][ ]   ->   [ ][ ][ ][ ]   ->   [ ][ ][ ][ ]   ->   [ ][ ][ ][ ]   ->   [*][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
                                                                                            
    ...             ...             ...             ...             ...             ...     
                                                                                            
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]
    [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]        [ ][ ][ ][ ]


    [3:0] FIFO [1280-1:0]
    FIFO[ 256-1:   0]->第一個row
    FIFO[ 512-1: 256]->第二個row
    FIFO[ 768-1: 512]->第三個row
    FIFO[1024-1: 768]->第四個row
    FIFO[1280-1:1024]->第五個row

*/
`timescale  10ns / 10ns
module axis_preload_fifo #(
    parameter integer C_S_AXIS_TDATA_WIDTH	= 32,
    parameter integer MAC_NUM = 256,
    parameter integer AXIS_PRELOAD_FIFO_DEPTH = 4,
    parameter integer bit_num  = 2
)
(
    //global
    input wire clk,
    input wire rst_n,

    //data
    input wire [C_S_AXIS_TDATA_WIDTH-1:0] ifmaps_from_axis,
    output wire [5*MAC_NUM-1:0] ifmaps_out,

    //control in
    input wire [11:0] input_channel_size,
    input wire load_axis_preload,
    input wire fifo_read,
    input wire axis_clear,
    input wire [4:0]kernel_size,

    //control out
    output reg [bit_num:0] fifo_cnt,
    output wire fifo_empty,
    output wire fifo_full,

    output wire wait_input_from_preload
);
    //由axis進入的32bit將他擺放成MAC要使用的5*MAC_NUM寬度
    function integer clogb2 (input integer bit_depth);
	  begin
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
	      bit_depth = bit_depth >> 1;
	  end
	endfunction
    
    integer idx;

    parameter LOAD_HEIGHT_0 = 4'd1 ,LOAD_HEIGHT_1 = 4'd2, LOAD_HEIGHT_2 = 4'd3, LOAD_HEIGHT_3 = 4'd4, LOAD_HEIGHT_4 = 4'd5;

    /////////////////////////////FSM///////////////////////////////
    reg [3:0] state;

    /////////////////////////////fifo//////////////////////////////
    reg [5*MAC_NUM-1:0] preload_fifo [0:AXIS_PRELOAD_FIFO_DEPTH-1];

    reg [bit_num-1:0] fifo_write_ptr;
    reg [5:0] fifo_write_cnt; //計數channel用
    reg [bit_num-1:0] fifo_read_ptr;

    wire write_en;
    wire read_en;
    wire write_ptr_add;
    wire load_next_height;
    wire [8:0] next_fifo_write_cnt;

    assign write_ptr_add = load_next_height &
                           ((kernel_size[0] & state==LOAD_HEIGHT_0) || (kernel_size[1] & state==LOAD_HEIGHT_1) || (kernel_size[2] & state==LOAD_HEIGHT_2) || (kernel_size[3] & state==LOAD_HEIGHT_3) || (kernel_size[4] & state==LOAD_HEIGHT_4));
    assign next_fifo_write_cnt = ({({1'd0,fifo_write_cnt[2:0]}+4'd1),5'd0});//一次輸入為32bit故<<5
    assign load_next_height = (next_fifo_write_cnt >= input_channel_size);
    assign wait_input_from_preload = ~fifo_empty;

    assign fifo_empty = (fifo_cnt==0);
    assign fifo_full = (fifo_cnt==AXIS_PRELOAD_FIFO_DEPTH);

	assign write_en = load_axis_preload & ((~fifo_full) | read_en);
    assign read_en = ~fifo_empty & fifo_read;

    /////////////////////////////ifmaps_out////////////////////////
    
    wire [255:0] preload_fifo_h0;
    wire [255:0] preload_fifo_h1;
    wire [255:0] preload_fifo_h2;
    wire [255:0] preload_fifo_h3;
    wire [255:0] preload_fifo_h4;

    assign preload_fifo_h0 = preload_fifo[fifo_read_ptr][255:0];
    assign preload_fifo_h1 = preload_fifo[fifo_read_ptr][511:256];
    assign preload_fifo_h2 = preload_fifo[fifo_read_ptr][767:512];
    assign preload_fifo_h3 = preload_fifo[fifo_read_ptr][1023:768];
    assign preload_fifo_h4 = preload_fifo[fifo_read_ptr][1279:1024];

    genvar i;
    generate
        for(i=0;i<256;i=i+1) begin : ifmaps_out_loop
            assign ifmaps_out[i*5+0] = preload_fifo_h0[i];
            assign ifmaps_out[i*5+1] = preload_fifo_h1[i];
            assign ifmaps_out[i*5+2] = preload_fifo_h2[i];
            assign ifmaps_out[i*5+3] = preload_fifo_h3[i];
            assign ifmaps_out[i*5+4] = preload_fifo_h4[i];
        end
    endgenerate

    /////////////////////////////FSM///////////////////////////////
    //以FSM去計算需輸入幾輪的channel才會完成一次FIFO所需資料
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= LOAD_HEIGHT_0;
        end
        else begin
            if(write_en) begin
                case(state)
                    LOAD_HEIGHT_0   : state <= load_next_height ? (kernel_size[0] ? LOAD_HEIGHT_0 : LOAD_HEIGHT_1)
                                                                : LOAD_HEIGHT_0;

                    LOAD_HEIGHT_1   : state <= load_next_height ? (kernel_size[1] ? LOAD_HEIGHT_0 : LOAD_HEIGHT_2) 
                                                                : LOAD_HEIGHT_1;

                    LOAD_HEIGHT_2   : state <= load_next_height ? (kernel_size[2] ? LOAD_HEIGHT_0 : LOAD_HEIGHT_3) 
                                                                : LOAD_HEIGHT_2;

                    LOAD_HEIGHT_3   : state <= load_next_height ? (kernel_size[3] ? LOAD_HEIGHT_0 : LOAD_HEIGHT_4) 
                                                                : LOAD_HEIGHT_3;

                    LOAD_HEIGHT_4   : state <= load_next_height ? LOAD_HEIGHT_0 : LOAD_HEIGHT_4;

                    default         : state <= LOAD_HEIGHT_0;
                endcase
            end
        end
    end


    /////////////////////////////fifo//////////////////////////////

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            for(idx=0;idx<AXIS_PRELOAD_FIFO_DEPTH;idx=idx+1) begin
                preload_fifo[idx]<=0;
            end
        end
        else begin
            if(axis_clear) begin
                for(idx=0;idx<AXIS_PRELOAD_FIFO_DEPTH;idx=idx+1) begin
                    preload_fifo[idx]<=0;
                end
            end
            if(write_en) begin
                preload_fifo[fifo_write_ptr][({fifo_write_cnt,5'd0})+31 -:32]<=ifmaps_from_axis;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fifo_write_ptr<=0;
        end
        else begin
            if(axis_clear) begin
                fifo_write_ptr<=0;
            end
            else if(write_en && write_ptr_add) begin
                fifo_write_ptr<=fifo_write_ptr+1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fifo_write_cnt <= 6'd0;
        end
        else begin
            if(axis_clear | write_ptr_add) begin
                fifo_write_cnt <= 6'd0;
            end
            else if(write_en) begin
                fifo_write_cnt <= load_next_height ? {(fifo_write_cnt[5:3]+3'd1),3'd0} : fifo_write_cnt+1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fifo_read_ptr<=0;
        end
        else begin
            if(axis_clear) begin
                fifo_read_ptr<=0;
            end
            else if(read_en) begin
                fifo_read_ptr<=fifo_read_ptr+1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            fifo_cnt<=0;
        end
        else begin
            if(axis_clear) begin
                fifo_cnt<=0;
            end
			else if(read_en & write_en && write_ptr_add) begin
				fifo_cnt<=fifo_cnt;
			end
			else if(write_en && write_ptr_add) begin
				fifo_cnt<=fifo_cnt+1;
			end
			else if(read_en) begin
				fifo_cnt<=fifo_cnt-1;
			end 
			else begin
				fifo_cnt<=fifo_cnt;
			end
		end
    end

endmodule