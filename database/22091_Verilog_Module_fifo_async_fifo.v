// This program was cloned from: https://github.com/sspku-mzj/Verilog_Module
// License: Apache License 2.0

// 异步fifo
// 写控制端, 读控制端, fifo memory, 时钟同步
module async_fifo #(
    parameter WIDTH = 16,
    parameter DEPTH = 8
) (
    input               i_wclk,
    input               i_rclk,
    input               i_wrst_n,
    input               i_rrst_n,
    input   [WIDTH-1:0] i_wdata,
    input               i_push,
    input               i_pop,
    output              o_full,
    output              o_empty,
    output  reg [WIDTH-1:0] o_rdata
);
    localparam          AW = ((DEPTH <= 2) ? 1 : 
                              (DEPTH <= 4) ? 2 :
                              (DEPTH <= 8) ? 3 :
                              (DEPTH <= 16) ? 4 :
                              (DEPTH <= 32) ? 5 :
                              (DEPTH <= 64) ? 6 :
                              (DEPTH <= 128) ? 7 :
                              (DEPTH <= 256) ? 8 :
                              (DEPTH <= 512) ? 9 :
                              (DEPTH <= 1024) ? 10 :
                              (DEPTH <= 2048) ? 11 :
                              (DEPTH <= 4096) ? 12 : 13);

    localparam  [AW-1:0]    MAX_ADDR = DEPTH - 1; 
    
    reg     [WIDTH-1:0] mem[DEPTH-1:0];

    reg     [AW:0]      wptr;
    reg     [AW:0]      rptr;

    wire    [AW:0]      next_wptr;
    wire    [AW:0]      next_rptr;

    reg     [WIDTH-1:0] r_rdata;

    reg     [AW:0]      wptr_gc;
    reg     [AW:0]      rptr_gc;

    reg     [AW-1:0]        i;
    
    

    // write and read operation
    assign next_wptr = wptr + 1'b1; 
    always @(posedge i_wclk or negedge i_wrst_n) begin
        if(!i_wrst_n) begin
            for (i = 0; i < DEPTH; i=i+1) begin
                mem[i[AW-1:0]] <= {WIDTH{1'b0}};
            end
            wptr <= {(AW+1){1'b0}};
            wptr_gc <= {(AW+1){1'b0}};
        end 
        else if(i_push && !o_full) begin
            mem[wptr[AW-1:0]] <= i_wdata;
            wptr <= next_wptr;
            wptr_gc <= next_wptr ^ {1'b0, next_wptr[AW:1]};                 // 这样操作保证了写指针格雷码在写时钟同步一次
        end 
    end

    assign next_rptr = rptr + 1'b1;
    always @(posedge i_rclk or negedge i_rrst_n) begin
        if(!i_rrst_n) begin
            rptr <= {(AW+1){1'b0}};
            rptr_gc <= {(AW+1){1'b0}};
        end
        else if(i_pop && !o_empty) begin
            o_rdata <= mem[rptr[AW-1:0]];
            rptr <= next_rptr;
            rptr_gc <= next_rptr ^ {1'b0, next_rptr[AW:1]};
        end
    end
    // ----------------------------------------------------------------------------------------------------
    // ------------------------------------假空,假满--------------------------------------------------------
    // -----------------------------------快时钟域采样慢时钟域-----------------------------------------------
    // ----------------------------------------------------------------------------------------------------
    // gray code 
    // 这里格雷码同步采用两级寄存器方式同步
    // 对于打两拍同步存在快时钟采样慢时钟和慢时钟采样快时钟两种方式
    // 慢时钟采样快时钟数据存在数据漏采的情况,但是对于FIFO而言,不会出现错误的判断,会降低FIFO的效率
    // 例如写时钟 > 读时钟的情况
    // 满判断: 写时钟与经过cdc的读时钟进行判断,快采慢,没有影响
    // 空判断: 读时钟与经过cdc的写时钟进行判断,慢采快,有影响
    // 本身写时钟经过cdc,所以实际写时钟 > 进行判断的写时钟,同时如果发生漏采情况也会出现实际写时钟 > 进行判断的写时钟
    // 所以此时如果判断为空,实际FIFO内部仍然存在数据,但是已经禁止读出数据,属于假空,假满同理
    // ----------------------------------同步器失效--------------------------------------------------------
    // 最糟糕的情况时同步器失效,传输错误的数据,由于是格雷码所以地址不变即为错误数据,此时依旧不影响判断空满,同样产生假空假满现象
    reg     [AW:0]      wptr_gc_d1, wptr_gc_d2;
    reg     [AW:0]      rptr_gc_d1, rptr_gc_d2;

    always@(posedge i_wclk or negedge i_wrst_n) begin
        if(!i_wrst_n) begin
            rptr_gc_d1 <= {(AW+1){1'b0}};    
            rptr_gc_d2 <= {(AW+1){1'b0}};
        end else begin
            rptr_gc_d1 <= rptr_gc;
            rptr_gc_d2 <= rptr_gc_d1;
        end
    end 

    always @(posedge i_rclk or negedge i_rrst_n) begin
        if(!i_rrst_n) begin
            wptr_gc_d1 <= {(AW+1){1'b0}};
            wptr_gc_d2 <= {(AW+1){1'b0}};
        end else begin
            wptr_gc_d1 <= wptr_gc;
            wptr_gc_d2 <= wptr_gc_d1;
        end
    end

    // full and empty flag
    wire  full, empty;
    //always @(posedge i_wclk or negedge i_wrst_n) begin
    //    if(!i_wrst_n)
    //        full <= 1'b0;
    //    else if((wptr_gc[AW] != rptr_gc_d2[AW]) && (wptr_gc[AW-1] != rptr_gc_d2[AW-1]) && (wptr_gc[AW-2:0] == rptr_gc_d2[AW-2:0]))
    //        full <= 1'b1;
    //    else 
    //        full <= 1'b0;
    //end

    //always @(posedge i_rclk or negedge i_rrst_n) begin
    //   if(!i_rrst_n)
    //       empty <= 1'b0;
    //    else if(rptr_gc[AW:0] == wptr_gc_d2[AW:0])
    //        empty <= 1'b1;
    //    else 
    //        empty <= 1'b0;
    //end

    assign full = (wptr_gc[AW] != rptr_gc_d2[AW]) && (wptr_gc[AW-1] != rptr_gc_d2[AW-1]) && (wptr_gc[AW-2:0] == rptr_gc_d2[AW-2:0]);

    assign empty = rptr_gc[AW:0] == wptr_gc_d2[AW:0];

    assign o_full = full;
    assign o_empty = empty;
endmodule