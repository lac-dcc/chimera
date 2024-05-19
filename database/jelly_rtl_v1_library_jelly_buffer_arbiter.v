// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// バッファ割り当て調停
module jelly_buffer_arbiter
        #(
            parameter   BUFFER_NUM   = 3,
            parameter   READER_NUM   = 1,
            parameter   ADDR_WIDTH   = 32,
            parameter   REFCNT_WIDTH = 4,
            parameter   INDEX_WIDTH  = BUFFER_NUM < 2 ? 1 :
                                       BUFFER_NUM < 4 ? 2 :
                                       BUFFER_NUM < 8 ? 3 : 4
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire    [BUFFER_NUM*ADDR_WIDTH-1:0]     param_buf_addr,
            
            input   wire                                    writer_request,
            input   wire                                    writer_release,
            output  reg     [ADDR_WIDTH-1:0]                writer_addr,
            output  reg     [INDEX_WIDTH-1:0]               writer_index,
            
            input   wire    [READER_NUM-1:0]                reader_request,
            input   wire    [READER_NUM-1:0]                reader_release,
            output  reg     [READER_NUM*ADDR_WIDTH-1:0]     reader_addr,
            output  reg     [READER_NUM*INDEX_WIDTH-1:0]    reader_index,
            
            output  wire    [ADDR_WIDTH-1:0]                newest_addr,
            output  wire    [INDEX_WIDTH-1:0]               newest_index,
            
            output  wire    [BUFFER_NUM*REFCNT_WIDTH-1:0]   status_refcnt
        );
    
    
    // status
    integer     k;
    reg                         reg_writer_busy;
    reg     [READER_NUM-1:0]    reg_reader_busy;
        always @(posedge clk) begin
        if ( reset ) begin
            reg_writer_busy <= 0;
            reg_reader_busy  <= 0;
        end
        else if ( cke ) begin
            if ( writer_request ) begin
                reg_writer_busy <= 1'b1;
                if ( reg_writer_busy ) begin
                    $display("ERROR(buffer_allocator): illegal writer_request");
                end
            end
            if ( writer_release ) begin
                reg_writer_busy <= 1'b0;
    //          if ( !reg_writer_busy ) begin
    //              $display("ERROR(buffer_allocator): illegal writer_release");
    //          end
            end
            
            for ( k = 0; k < READER_NUM; k = k+1 ) begin
                if ( reader_request[k] ) begin
                    reg_reader_busy[k] <= 1'b1;
                    if ( reg_reader_busy[k] ) begin
                        $display("ERROR(buffer_allocator): illegal reader_request(%d)", k);
                    end
                end
                if ( reader_release[k] ) begin
                    reg_reader_busy[k] <= 1'b0;
    //              if ( !reg_reader_busy[k] ) begin
    //                  $display("ERROR(buffer_allocator): illegal reader_release(%d)", k);
    //              end
                end
            end
        end
    end
    
    
    // control
    reg     [INDEX_WIDTH-1:0]               reg_newest,  next_newest;
    reg     [BUFFER_NUM*REFCNT_WIDTH-1:0]   reg_refcnt,  next_refcnt;
    reg     [BUFFER_NUM-1:0]                reg_bufbusy, next_bufbusy;
    reg     [INDEX_WIDTH-1:0]               reg_writing, next_writing;
    reg     [READER_NUM*INDEX_WIDTH-1:0]    reg_reading, next_reading;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_newest  <= 0;
            reg_refcnt  <= 0;
            reg_bufbusy <= 0;
            reg_writing <= 0;
            reg_reading <= 0;
        end
        else if ( cke ) begin
            reg_newest  <= next_newest;
            reg_refcnt  <= next_refcnt;
            reg_bufbusy <= next_bufbusy;
            reg_writing <= next_writing;
            reg_reading <= next_reading;
        end
    end
    
    
    integer         i;
    integer         tmp;
    always @* begin
        next_newest  = reg_newest;
        next_refcnt  = reg_refcnt;
        next_bufbusy = reg_bufbusy;
        next_writing = reg_writing;
        next_reading = reg_reading;
        
        if ( reg_writer_busy && writer_release ) begin
            // 書き終わったら最新にマーク
            next_newest = next_writing;
            
            // 未使用のバッファ割り当て
            begin : loop_writer
                for ( i = 0; i < BUFFER_NUM; i = i+1 ) begin
                    if ( !next_bufbusy[i] && i != next_newest ) begin
                        next_writing = i;
                        disable loop_writer; 
                    end
                end
                $display("ERROR(buffer_allocator): error write_alloc");
            end
        end
        
        // reader release
        for ( i = 0; i < READER_NUM; i = i+1 ) begin
            if ( reg_reader_busy[i] && reader_release[i] ) begin
                tmp = next_reading[i*INDEX_WIDTH +: INDEX_WIDTH];
                next_refcnt[tmp*REFCNT_WIDTH +: REFCNT_WIDTH] = next_refcnt[tmp*REFCNT_WIDTH +: REFCNT_WIDTH] - 1'b1;
            end
        end
        
        // reader request
        for ( i = 0; i < READER_NUM; i = i+1 ) begin
            if ( !reg_reader_busy[i] && reader_request[i] ) begin
                tmp = next_newest;
                next_reading[i*INDEX_WIDTH +: INDEX_WIDTH] = tmp;
                next_refcnt[tmp*REFCNT_WIDTH +: REFCNT_WIDTH] = next_refcnt[tmp*REFCNT_WIDTH +: REFCNT_WIDTH] + 1'b1;
            end
        end
        
        // busy
        for ( i = 0; i < BUFFER_NUM; i = i+1 ) begin
            next_bufbusy[i] = (next_refcnt[i*INDEX_WIDTH +: INDEX_WIDTH] != 0);
        end
   end
   
   
   // assign
   integer      j;
   always @* begin
        writer_index = reg_writing;
        writer_addr  = (param_buf_addr >> (next_writing*ADDR_WIDTH));
        reader_index = reg_reading;
        for ( j = 0; j < READER_NUM; j = j+1 ) begin
            reader_addr[j*ADDR_WIDTH +: ADDR_WIDTH] = (param_buf_addr >> next_reading[j*INDEX_WIDTH +: INDEX_WIDTH]*ADDR_WIDTH);
        end
    end
    
    assign newest_addr  = param_buf_addr >> (reg_newest*ADDR_WIDTH);
    assign newest_index = reg_newest;
    
    assign status_refcnt = reg_refcnt;
    
    

    
endmodule


`default_nettype wire


// end of file
