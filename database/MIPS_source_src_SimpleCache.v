// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/11 15:07:12
// Design Name: 
// Module Name: SimpleCache
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SimpleCache(
input wire              clk,
input wire              rst,
input wire              CPU_read_en,
output wire [31:0]      CPU_read_dout,
input wire              CPU_write_en,
input wire [31:0]       CPU_write_din,
input wire [31:0]       CPU_addr,
output wire             isCacheStall,
input wire              mem_b_we,
input wire [12:0]       mem_b_addr,
input wire [31:0]       mem_b_din,
output wire [31:0]      mem_b_dout
    );
    
    wire            mem_a_we;
    wire [12:0]     mem_a_addr;
    wire [31:0]     mem_a_din;
    wire [31:0]     mem_a_dout;
    
    wire [5:0]      cache_tag_addr;
    wire [22:0]      cache_tag_din;
    wire [22:0]     cache_tag_dout;
    wire             cache_tag_we;
    wire [20:0]     cache_tag_dout_tag;
    wire            cache_tag_dout_valid;
    wire            cache_tag_dout_overwrite;
    
    wire [8:0]      cache_data_addr;
    wire [31:0]     cache_data_din;
    wire            cache_data_we;
    wire [31:0]     cache_data_dout;
    
    
    wire [31:0]     allocate_main_mem_dout;
    wire [12:0]     allocate_main_mem_addr;
    wire [8:0]      allocate_cache_data_addr;
    wire [31:0]     allocate_cache_data_din;
    wire            allocate_cache_data_we;
    reg             allocate_start;
    wire            allocate_done;
    
    wire [8:0]      hit_cache_data_addr;
    wire            hit_cache_data_we;
    wire [31:0]     hit_cache_data_din;
    
    //instantiate of the ALLOCATE controller
    assign allocate_main_mem_dout = mem_a_dout;
    allocate allocate_i(
        .clk( clk ),
        .rst( rst ),
        .CPU_addr( CPU_addr ),
        .main_mem_dout( allocate_main_mem_dout ),
        .main_mem_addr( allocate_main_mem_addr ),
        .cache_data_addr( allocate_cache_data_addr ),
        .cache_data_din( allocate_cache_data_din ),
        .cache_data_we( allocate_cache_data_we ),
        .start( allocate_start ),
        .done( allocate_done )
    );
    
    wire [31:0]         wb_main_mem_din;
    wire                wb_main_mem_we;
    wire [12:0]         wb_main_mem_addr;
    wire [31:0]         wb_cache_data_dout;
    wire [8:0]          wb_cache_data_addr;
    reg                 wb_start;
    wire                wb_done;
    wire [31:0]         wb_CPU_addr;
    
    //instantiate of the WRITEBACK controller 
    assign wb_cache_data_dout = cache_data_dout;
    assign wb_CPU_addr = {cache_tag_dout_tag, CPU_addr_index, CPU_addr_offset, 2'b00};
    wback wback_i(
        .clk( clk ),
        .rst( rst ),
        .CPU_addr( wb_CPU_addr ),
        .main_mem_din( wb_main_mem_din ),
        .main_mem_we( wb_main_mem_we ),
        .main_mem_addr( wb_main_mem_addr ),
        .cache_data_dout( wb_cache_data_dout ),
        .cache_data_addr( wb_cache_data_addr ),
        .start( wb_start ),
        .done( wb_done )
    );
    
    //instantiate of the main memory implemented with BRAM
    assign mem_a_we = wb_main_mem_we;
    assign mem_a_din = wb_main_mem_din;
    assign mem_a_addr = (current_state == WBACK) ? wb_main_mem_addr : allocate_main_mem_addr;
    main_mem main_mem_i(
        .clka( clk ),
        .wea( mem_a_we ),
        .addra( mem_a_addr ),
        .dina( mem_a_din ),
        .douta( mem_a_dout ),
        .clkb( clk ),
        .web( mem_b_we ),
        .addrb( mem_b_addr ),
        .dinb( mem_b_din ),
        .doutb( mem_b_dout )
    );
    
    //instantiate of the cache_tag implemented with LUT
    assign cache_tag_dout_tag = cache_tag_dout[20:0];
    assign cache_tag_dout_valid = cache_tag_dout[21];
    assign cache_tag_dout_overwrite = cache_tag_dout[22];
  
    cache_tag cache_tag_i(
        .a( cache_tag_addr ),
        .d( cache_tag_din ),
        .clk( clk ),
        .we( cache_tag_we),
        .spo( cache_tag_dout )
    );
    
    //instantiate of the cache_data implemented with LUT
    assign cache_data_addr = CACHE_DATA_ADDR(current_state, hit_cache_data_addr, allocate_cache_data_addr, wb_cache_data_addr);
    
    /* function of the CACHE_DATA_ADDR*/
    function [8:0] CACHE_DATA_ADDR;
    input [1:0] state;
    input [8:0] hit_cache_data_addr;
    input [8:0] allocate_cache_data_addr;
    input [8:0] wb_cache_data_addr;
    case(state)
    IDLE:       CACHE_DATA_ADDR = hit_cache_data_addr;
    COMPARE:    CACHE_DATA_ADDR = hit_cache_data_addr;
    ALLOCATE:   CACHE_DATA_ADDR = allocate_cache_data_addr;
    WBACK:      CACHE_DATA_ADDR = wb_cache_data_addr;
    default:    CACHE_DATA_ADDR = hit_cache_data_addr;
    endcase
    endfunction
    
    assign cache_data_we = CACHE_DATA_WE(current_state, hit_cache_data_we, allocate_cache_data_we);
    /* function of the CACHE_DATA_WE */
    function CACHE_DATA_WE;
    input [1:0] state;
    input   hit_cache_data_we;
    input   allocate_cache_data_we;
    case( state )
    IDLE:       CACHE_DATA_WE = hit_cache_data_we;
    COMPARE:    CACHE_DATA_WE = hit_cache_data_we;
    ALLOCATE:   CACHE_DATA_WE = allocate_cache_data_we;
    default:    CACHE_DATA_WE = hit_cache_data_we;
    endcase
    endfunction
    
    assign cache_data_din = CACHE_DATA_DIN( current_state, hit_cache_data_din, allocate_cache_data_din);
    /* function of the CACHE_DATA_DIN */
    function [31:0] CACHE_DATA_DIN;
    input [1:0] state;
    input [31:0]    hit_cache_data_din;
    input [31:0]    allocate_cache_data_din;
    case( state )
    IDLE:       CACHE_DATA_DIN = hit_cache_data_din;
    COMPARE:    CACHE_DATA_DIN = hit_cache_data_din;
    ALLOCATE:   CACHE_DATA_DIN = allocate_cache_data_din;
    default:    CACHE_DATA_DIN = hit_cache_data_din;
    endcase
    endfunction
    
    //instantiate of the cache_data implemented with LUT
    cache_data cache_data_i(
        .a( cache_data_addr ),
        .d( cache_data_din ),
        .clk( clk ),
        .we( cache_data_we ),
        .spo( cache_data_dout )
    );
    

    
    // the extra logic
    wire [20:0]     CPU_addr_tag;
    wire [5:0]      CPU_addr_index;
    wire [2:0]      CPU_addr_offset;
    wire            isCacheHit;
    
    assign CPU_addr_tag = CPU_addr[31:11];
    assign CPU_addr_index = CPU_addr[10:5];
    assign CPU_addr_offset = CPU_addr[4:2];
    
    /* check whether cache hit */
    assign isCacheHit = (CPU_addr_tag == cache_tag_dout_tag) & cache_tag_dout_valid;
    
    assign CPU_read_dout = cache_data_dout;

    /* hit_cache_data */
    assign hit_cache_data_addr = (CPU_addr_index << 3) + CPU_addr_offset;
    assign hit_cache_data_din = CPU_write_din;
    assign hit_cache_data_we = (current_state == IDLE) && CPU_write_en && isCacheHit;
    
    /* cache_tag */
    assign cache_tag_addr = CPU_addr_index;
    assign cache_tag_we = CACHE_TAG_WE(current_state, CPU_write_en, isCacheHit );
    assign cache_tag_din = CACHE_TAG_DIN(current_state, CPU_write_en, isCacheHit, CPU_addr_tag);
    
    function CACHE_TAG_WE;
    input [1:0] state;
    input       CPU_write_en;
    input       isCacheHit;
        if( state == IDLE && CPU_write_en && isCacheHit )
            CACHE_TAG_WE = 1;
        else if( state == ALLOCATE)
            CACHE_TAG_WE = 1;
        else
            CACHE_TAG_WE = 0;
    endfunction
    
    function [22:0] CACHE_TAG_DIN;
    input [1:0]     state;
    input           CPU_write_en;
    input           isCacheHit;
    input [20:0]    CPU_addr_tag; 
        if( state == IDLE && CPU_write_en && isCacheHit )
            CACHE_TAG_DIN = {1'b1, 1'b1, CPU_addr_tag};
        else if( state == ALLOCATE)
            CACHE_TAG_DIN = {1'b0, 1'b1, CPU_addr_tag};
        else
            CACHE_TAG_DIN = 0;
    endfunction
    
    /* the cache done */
//    assign cache_done = ( current_state == IDLE) && isCacheHit && (CPU_read_en | CPU_write_en);
//    assign cache_done = ( current_state == IDLE) && (CPU_read_en | CPU_write_en) && ((CPU_addr_tag == cache_tag_dout_tag) & cache_tag_dout_valid);
    assign isCacheStall = ISCACHESTALL( current_state, CPU_read_en, CPU_write_en, CPU_addr_tag, cache_tag_dout_tag, cache_tag_dout_valid);

    function ISCACHESTALL;
    input [1:0]     current_state;
    input           CPU_read_en;
    input           CPU_write_en;
    input [20:0]    CPU_addr_tag;
    input [20:0]    cache_tag_dout_tag;
    input           cache_tag_dout_valid;
        if( (CPU_write_en | CPU_read_en) == 0 )
            ISCACHESTALL = 0;
        else if( ( current_state == IDLE) && ((CPU_addr_tag == cache_tag_dout_tag) & cache_tag_dout_valid) )
            ISCACHESTALL = 0;
        else
            ISCACHESTALL = 1;
    endfunction
    
    /* the cache controller */
    reg [1:0]       current_state;
    reg [1:0]       next_state;
    
    localparam      IDLE = 2'h0, COMPARE = 2'd1, ALLOCATE = 2'd2, WBACK = 2'd3;
    
    /* the first FSM stage */
    always @(posedge clk)
    begin
        if( rst )
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
    /* the second FSM stage */
    always @(*)
    begin
        next_state = IDLE;
        case( current_state )
        IDLE:   begin
                    if( (CPU_read_en | CPU_write_en) && (~isCacheHit) )
                        next_state = COMPARE;
                    else
                        next_state = IDLE;
                end
        COMPARE:begin
                    if( (~isCacheHit) && (~cache_tag_dout_overwrite))
                        next_state = ALLOCATE;
                    else if( (~isCacheHit) &&  cache_tag_dout_overwrite)
                        next_state = WBACK;
                    else
                        next_state = IDLE;
                end
        ALLOCATE:   begin
                        if( allocate_done )
                            next_state = IDLE;
                        else
                            next_state = ALLOCATE;
                    end
        WBACK:  begin
                    if( wb_done )
                        next_state = ALLOCATE;
                    else
                        next_state = WBACK;
                end
            
        endcase
    end
    
    /* the third FSM stage */
    always @(posedge clk)
    begin
        if( rst )
        begin
            allocate_start <= 0;
            wb_start <= 0;
        end
        else
        begin
            case( current_state )
            IDLE:   begin
                        allocate_start <= 0;
                        wb_start <= 0;
                    end
            COMPARE:begin
                        if( (~isCacheHit) && (~cache_tag_dout_overwrite))
                        begin
                            wb_start <= 0;
                            allocate_start <= 1;
                        end
                        else if( (~isCacheHit) && cache_tag_dout_overwrite)
                        begin
                            wb_start <= 1;
                            allocate_start <= 0;
                        end
                        else
                        begin
                            wb_start <= 0;
                            allocate_start <= 0;
                        end
                    end
                ALLOCATE:   begin
                                wb_start <= 0;
                                allocate_start <= 0;
                            end
                WBACK:  begin
                            wb_start <= 0;
                            /* jump to ALLOCATE state */
                            if( wb_done )
                                allocate_start <= 1;
                            else
                                allocate_start <= 0;
                        end
                        
            endcase
        end
    end
    
endmodule
