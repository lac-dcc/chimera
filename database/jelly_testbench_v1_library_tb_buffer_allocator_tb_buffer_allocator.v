
`timescale 1ns / 1ps
`default_nettype none


module tb_buffer_allocator();
    localparam RATE = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_buffer_allocator.vcd");
        $dumpvars(0, tb_buffer_allocator);
        
        #100000;
            $finish;
    end
    
    
    parameter   RAND_BUSY = 0;
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)    clk   = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100)   reset = 1'b0;
    
    reg     cke = 1'b1;
    always @(posedge clk) cke <= RAND_BUSY ? {$random()} : 1'b1;
    
    
    parameter   BUFFER_NUM   = 4;
    parameter   READER_NUM   = 2;
    parameter   ADDR_WIDTH   = 32;
    parameter   REFCNT_WIDTH = 4;
    parameter   INDEX_WIDTH  = BUFFER_NUM < 2 ? 1 :
                               BUFFER_NUM < 4 ? 2 :
                               BUFFER_NUM < 8 ? 3 : 4;
    
    
    reg     [ADDR_WIDTH-1:0]     param_buf_addr0 = 32'h0001_0000;
    reg     [ADDR_WIDTH-1:0]     param_buf_addr1 = 32'h0002_0000;
    reg     [ADDR_WIDTH-1:0]     param_buf_addr2 = 32'h0003_0000;
    reg     [ADDR_WIDTH-1:0]     param_buf_addr3 = 32'h0004_0000;
    
    reg                          writer_request = 0;
    reg                          writer_release = 0;
    wire     [ADDR_WIDTH-1:0]    writer_addr;
    wire     [INDEX_WIDTH-1:0]   writer_index;
    
    reg                          reader0_request = 0;
    reg                          reader0_release = 0;
    wire    [ADDR_WIDTH-1:0]     reader0_addr;
    wire    [INDEX_WIDTH-1:0]    reader0_index;
    
    reg                          reader1_request = 0;
    reg                          reader1_release = 0;
    wire    [ADDR_WIDTH-1:0]     reader1_addr;
    wire    [INDEX_WIDTH-1:0]    reader1_index;
    
    wire    [INDEX_WIDTH-1:0]    status_newest;
    wire    [REFCNT_WIDTH-1:0]   status_refcnt0;
    wire    [REFCNT_WIDTH-1:0]   status_refcnt1;
    wire    [REFCNT_WIDTH-1:0]   status_refcnt2;
    wire    [REFCNT_WIDTH-1:0]   status_refcnt3;
    
    
    jelly_buffer_allocator
            #(
                .BUFFER_NUM     (BUFFER_NUM),
                .READER_NUM     (READER_NUM),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .REFCNT_WIDTH   (REFCNT_WIDTH),
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_buffer_allocator
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .param_buf_addr ({param_buf_addr3, param_buf_addr2, param_buf_addr1, param_buf_addr0}),
                
                .writer_request (writer_request),
                .writer_release (writer_release),
                .writer_addr    (writer_addr),
                .writer_index   (writer_index),
                
                .reader_request ({reader1_request, reader0_request}),
                .reader_release ({reader1_release, reader0_release}),
                .reader_addr    ({reader1_addr,    reader0_addr   }),
                .reader_index   ({reader1_index,   reader0_index  }),
                
                .status_newest  (status_newest),
                .status_refcnt  ({status_refcnt3, status_refcnt2, status_refcnt1, status_refcnt0})
            );
    
    
    initial begin
    #10000;
        while ( 1 ) begin
            while ( {$random()} % 10 != 0 )
                @(posedge clk);
            writer_request <= 1'b1;
            @(posedge clk);
            writer_request <= 1'b0;
            @(posedge clk);
            
            @(posedge clk);
            while ( {$random()} % 100 != 0 )
                @(posedge clk);
            
            writer_release <= 1'b1;
            @(posedge clk);
            writer_release <= 1'b0;
            @(posedge clk);
        end
    end
    
    initial begin
    #10000;
        while ( 1 ) begin
            while ( {$random()} % 10 != 0 )
                @(posedge clk);
            
            reader0_request <= 1'b1;
            @(posedge clk);
            reader0_request <= 1'b0;
            @(posedge clk);
            
            @(posedge clk);
            while ( {$random()} % 100 != 0 )
                @(posedge clk);
            
            reader0_release <= 1'b1;
            @(posedge clk);
            reader0_release <= 1'b0;
            @(posedge clk);
        end
    end
    
    initial begin
    #10000;
        while ( 1 ) begin
            while ( {$random()} % 10 != 0 )
                @(posedge clk);
            
            reader1_request <= 1'b1;
            @(posedge clk);
            reader1_request <= 1'b0;
            @(posedge clk);
            
            @(posedge clk);
            while ( {$random()} % 100 != 0 )
                @(posedge clk);
            
            reader1_release <= 1'b1;
            @(posedge clk);
            reader1_release <= 1'b0;
            @(posedge clk);
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
