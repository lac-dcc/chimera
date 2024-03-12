
module CacheGroup_stimulus;
    //`define TEST_CACHE_GROUP;
    reg clk, reset;

    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;
    
    /********************* Bus with connected memory devices *******************/
    wire [127:0] master_addr_all;
    wire [31:0] master_rdata;
    wire [127:0] master_wdata_all;
    wire [3:0] master_rreq;
    wire [3:0] master_wreq;
    wire [3:0] master_acc;
    wire master_busy;
    
    wire [31:0] slave_addr;
    wire [31:0] slave_wdata;
    wire [255:0] slave_rdata_all;
    wire slave_rreq;
    wire slave_wreq;
    wire [7:0] slave_ack;
    wire [7:0] slave_busy;
    
    wire seg_fault;
    wire [2:0] seg_reason;
    wire [31:0] seg_addr;
    BusController bus(.clk(clk), .reset(reset), 
                      .master_addr(master_addr_all), 
                      .master_rdata(master_rdata), 
                      .master_wdata(master_wdata_all), 
                      .master_rreq(master_rreq), 
                      .master_wreq(master_wreq), 
                      .master_acc(master_acc), 
                      .master_busy(master_busy), 
                      .slave_addr(slave_addr), 
                      .slave_rdata(slave_rdata_all), 
                      .slave_wdata(slave_wdata), 
                      .slave_rreq(slave_rreq), 
                      .slave_wreq(slave_wreq),
                      .slave_ack(slave_ack), 
                      .slave_busy(slave_busy),
                      .seg_fault(seg_fault), 
                      .seg_reason(seg_reason), 
                      .seg_addr(seg_addr));
    // Unpack signals
    genvar i;
    wire [31:0] master_addr[0:3];
    wire [31:0] master_wdata[0:3];
    wire [31:0] slave_rdata[0:7];
    generate 
    for (i = 0; i < 4; i = i + 1) begin: master_unpack
        assign master_addr_all[32*i+:32] = master_addr[i];
        assign master_wdata_all[32*i+:32] = master_wdata[i];
    end
    for (i = 0; i < 8; i = i + 1) begin: slave_unpack
        assign slave_rdata_all[32*i+:32] = slave_rdata[i];
    end
    endgenerate
    
    // Connect internal memory slave device
    generate
    for (i = 0; i < 8; i = i + 1) begin: memory_loop
        
        InternalMemory #(i * 32'h8000) mem(.clk(clk), .reset(reset), 
                                    .rreq(slave_rreq), 
                                    .wreq(slave_wreq), 
                                    .addr(slave_addr), 
                                    .wdata(slave_wdata), 
                                    .rdata(slave_rdata[i]), 
                                    .busy(slave_busy[i]), 
                                    .ack(slave_ack[i]));
                             
    end
    endgenerate
    
    reg [31:0] mem[0:32'hFFFF];
    integer j;
    initial begin
        for (j = 0; j < 32'hFFFF; j = j + 1)
            mem[j] = 0;
    end
    
    // Connect Cache Group
    reg  [20:0] tag_addr;
    reg  [4:0]  set_addr;
    reg  [3:0]  word_addr;
    
    reg  rreq, wreq;
    reg  [4:0]  burst_size;
    reg  [31:0] wdata;
    wire [31:0] rdata;
    wire busy;
    
    `ifdef TEST_CACHE_GROUP
    CacheGroup cache(.clk(clk), .reset(reset), 
                     .rreq(rreq), .wreq(wreq), .addr({tag_addr, set_addr, word_addr, 2'h0}), .burst_size(burst_size), 
                     .rdata(rdata), .wdata(wdata), .busy(busy),
                     .bus_rreq(master_rreq[0]), .bus_wreq(master_wreq[0]), .bus_acc(master_acc[0]), 
                     .bus_addr(master_addr[0]), .bus_rdata(master_rdata), .bus_wdata(master_wdata[0]), 
                     .bus_busy(master_busy)); 
    `else                 

    L2Cache cache2(.clk(clk), .reset(reset), 
                 .rreq(rreq), .wreq(wreq), .addr({tag_addr, set_addr, word_addr, 2'h0}), .burst_size(burst_size), 
                 .rdata(rdata), .wdata(wdata), .busy(busy),
                 .bus_rreq(master_rreq[0]), .bus_wreq(master_wreq[0]), .bus_acc(master_acc[0]), 
                 .bus_addr(master_addr[0]), .bus_rdata(master_rdata), .bus_wdata(master_wdata[0]), 
                 .bus_busy(master_busy)); 
    `endif
                                      
    `define MAX_SIZE 100000
    reg [20:0] tag_addr_list[0:`MAX_SIZE];
    reg [3:0] word_addr_list[0:`MAX_SIZE];
    reg [4:0] set_addr_list[0:`MAX_SIZE];
    reg [4:0] burst_size_list[0:`MAX_SIZE];
    integer stack_top = 0;
    
    // tag_addr can be in [0, 32)
    integer counter, index;
    integer seed = 100;
    initial begin
        rreq = 1'b0;
        wreq = 1'b0;
        set_addr = 8'h2;
        #21
        #4 
        
        for (counter = 0; counter < 100000; counter = counter + 1) begin
            
            if ((stack_top != 0) && ($random(seed) % 2 == 0)) begin
                index = $random(seed) % stack_top;
                if (index < 0) 
                    index = -index;
                tag_addr = tag_addr_list[index];
                word_addr = word_addr_list[index];
                burst_size = burst_size_list[index];
                set_addr = set_addr_list[index];
                
                rreq = 1'b1;
                #4 rreq = 1'b0;
                while (busy) #4 begin end
                for (j = 0; j < burst_size; j = j + 1) begin
                    if (rdata != mem[tag_addr * 32'h200 + set_addr * 32'h10 + word_addr + j]) begin
                        $display("Error: data mismatch");
                        $stop;
                    end
                    #4 begin end
                end
                $display("Test %d, Read %d words @ %h", counter, burst_size, tag_addr * 32'h200 + set_addr * 32'h10 + word_addr);
            end else begin
                tag_addr = $random(seed) & 21'h3F;
                word_addr = $random(seed) & 4'hF;
                burst_size = 16 - {1'b0, word_addr};
                `ifndef TEST_CACHE_GROUP
                set_addr = $random(seed) & 5'h1F;
                `endif
                
                wreq = 1'b1;
                #4
                wreq = 1'b0;
                while (busy) #4 begin end
                for (j = 0; j < burst_size; j = j + 1) begin
                    #4 wdata = $random(seed) % 1024;
                    mem[tag_addr * 32'h200 + set_addr * 32'h10 + word_addr + j] = wdata;
                end
                #4 tag_addr_list[stack_top] = tag_addr;
                word_addr_list[stack_top] = word_addr;
                set_addr_list[stack_top] = set_addr;
                burst_size_list[stack_top] = burst_size;
                stack_top = stack_top + 1;
                $display("Test %d, Write %d words @ %h", counter, burst_size, tag_addr * 32'h200 + set_addr * 32'h10 + word_addr);
            end
        end
        $display("PASS");
    end   
endmodule