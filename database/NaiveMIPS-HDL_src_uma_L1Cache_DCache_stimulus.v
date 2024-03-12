module DCache_stimulus();
    // Enable one and only one of these
    //`define TEST_CACHE
    //`define TEST_DIRECT
    `define TEST_ALL
    
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
    

    // Connect L2 cache
    wire l2_rreq, l2_wreq;
    wire [4:0]  l2_burst_size;
    wire [31:0] l2_addr;
    wire [31:0] l2_wdata;
    wire [31:0] l2_rdata;
    wire l2_busy;              

    L2Cache cache2(.clk(clk), .reset(reset), 
                 .rreq(l2_rreq), .wreq(l2_wreq), .addr(l2_addr), .burst_size(l2_burst_size), 
                 .rdata(l2_rdata), .wdata(l2_wdata), .busy(l2_busy),
                 .bus_rreq(master_rreq[0]), .bus_wreq(master_wreq[0]), .bus_acc(master_acc[0]), 
                 .bus_addr(master_addr[0]), .bus_rdata(master_rdata), .bus_wdata(master_wdata[0]), 
                 .bus_busy(master_busy)); 

    // Connect DCache
    reg rreq, wreq;
    wire [31:0] rdata;
    wire miss;
    
    reg [22:0] tag_addr;
    reg [3:0]  set_addr;
    reg [2:0]  word_addr;
    reg  [31:0] wdata;
    
    wire cache_rreq, cache_wreq;
    wire [31:0] cache_rdata;
    wire cache_miss;

    DCache cache1(.clk(clk), .reset(reset), 
                  .rreq(cache_rreq), .wreq(cache_wreq), 
                  .addr({tag_addr, set_addr, word_addr, 2'h0}), 
                  .rdata(cache_rdata), .wdata(wdata), .miss(cache_miss),
                  .l2_rreq(l2_rreq), .l2_wreq(l2_wreq), .l2_addr(l2_addr), 
                  .l2_burst_size(l2_burst_size), 
                  .l2_rdata(l2_rdata), .l2_wdata(l2_wdata), .l2_busy(l2_busy));
    
    // Connect Direct Loader
    wire direct_rreq, direct_wreq;
    wire [31:0] direct_rdata;
    wire direct_miss;
    
    DirectLoader loader(.clk(clk), .reset(reset), .rreq(direct_rreq), .wreq(direct_wreq), 
                        .addr({tag_addr, set_addr, word_addr, 2'h0}), 
                        .rdata(direct_rdata), .wdata(wdata), .miss(direct_miss),
                        .bus_rreq(master_rreq[1]), .bus_wreq(master_wreq[1]), .bus_acc(master_acc[1]), 
                        .bus_addr(master_addr[1]), .bus_rdata(master_rdata), .bus_wdata(master_wdata[1]), 
                        .bus_busy(master_busy)); 
    
    `ifdef TEST_CACHE
    assign cache_rreq = rreq;
    assign cache_wreq = wreq;
    assign miss = cache_miss;
    assign rdata = cache_rdata;
    assign direct_rreq = 1'b0;
    assign direct_wreq = 1'b0;
    `endif
    `ifdef TEST_DIRECT
    assign direct_rreq = rreq;
    assign direct_wreq = wreq;
    assign miss = direct_miss;
    assign rdata = direct_rdata;
    assign cache_rreq = 1'b0;
    assign cache_wreq = 1'b0;
    `endif
    `ifdef TEST_ALL
    wire use_direct = tag_addr[0];
    assign direct_rreq = rreq & use_direct;
    assign direct_wreq = wreq & use_direct;
    assign cache_rreq = rreq & ~use_direct;
    assign cache_wreq = wreq & ~use_direct;
    assign miss = use_direct ? direct_miss : cache_miss;
    assign rdata = use_direct ? direct_rdata : cache_rdata;
    `endif
               
    `define MAX_SIZE 100000
    reg [22:0] tag_addr_list[0:`MAX_SIZE];
    reg [2:0] word_addr_list[0:`MAX_SIZE];
    reg [3:0] set_addr_list[0:`MAX_SIZE];
    integer stack_top = 0;
    
    integer counter;
    integer seed = 12923;
    integer index;
    initial begin
        rreq <= 1'b0;
        wreq <= 1'b0;
        #21 begin end
        #4
        for (counter = 0; counter < 100000; counter = counter + 1) begin
            
            if ((stack_top != 0) && ($random(seed) % 2 == 0)) begin
                index = $random(seed) % stack_top;
                if (index < 0) 
                    index = -index;
                tag_addr = tag_addr_list[index];
                word_addr = word_addr_list[index];
                set_addr = set_addr_list[index];
                
                rreq = 1'b1;
                #4 
                if (~miss) begin
                    if (rdata != mem[tag_addr * 32'h80 + set_addr * 32'h8 + word_addr]) begin
                        $display("Error: data mismatch");
                        $stop;
                    end
                end else begin
                    while (miss) #4 begin end
                    #4 begin end
                    if (rdata != mem[tag_addr * 32'h80 + set_addr * 32'h8 + word_addr]) begin
                        $display("Error: data mismatch");
                        $stop;
                    end    
                end
                rreq = 1'b0;
                $display("Test %d, Read @ %h", counter, tag_addr * 32'h80 + set_addr * 32'h8 + word_addr);
            end else begin
                tag_addr = $random(seed) & 23'hFF;
                word_addr = $random(seed) & 3'h7;
                set_addr = $random(seed) & 4'hF;
                
                wdata = $random(seed) % 1024;
                mem[tag_addr * 32'h80 + set_addr * 32'h8 + word_addr] = wdata;
                wreq = 1'b1;
                #4
                if (miss) begin
                    while (miss) #4 begin end
                    #4 begin end
                end
                wreq = 1'b0;
                tag_addr_list[stack_top] = tag_addr;
                word_addr_list[stack_top] = word_addr;
                set_addr_list[stack_top] = set_addr;
                stack_top = stack_top + 1;
                $display("Test %d, Write @ %h", counter, tag_addr * 32'h80 + set_addr * 32'h8 + word_addr);
            end
        end
        $display("PASS");
    end              
endmodule
