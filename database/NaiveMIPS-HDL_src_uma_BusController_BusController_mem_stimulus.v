module Bus_mem_stimulus;
    reg clk, reset;
  
    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;
        
    wire [127:0] master_addr_all;
    wire [31:0] master_rdata;
    wire [127:0] master_wdata_all;
    reg  [3:0] master_rreq;
    reg  [3:0] master_wreq;
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
    reg [31:0] master_addr[0:3];
    reg [31:0] master_wdata[0:3];
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
    
    integer correct_count = 0;
    integer total_count = 0;
    // Generate master requests
    generate 
    for (i = 0; i < 4; i = i + 1) begin: master_sim
        integer iter;
        integer iter2;
        integer seed = i * 100;
        reg [31:0] begin_addr;
        reg [31:0] shift_addr;
        reg [31:0] comp_result;
        initial begin
            $display("Begin Simulation");
            master_wreq[i] = 0;
            master_rreq[i] = 0;
            #21 #4
            for (iter = 0; iter < 500; iter = iter + 1) begin
                if ($random(seed) % 2 == 0) begin
                    master_wreq[i] = 1;
                    $display("Write Request");
                    while (~master_acc[i]) #1 begin  end
                    begin_addr = (($random(seed) % 32'h40000) & 32'hFFFFF000) + i * 32'h10;
                    for (iter2 = 0; iter2 < 4; iter2 = iter2 + 1) begin
                        #4
                        master_addr[i] = begin_addr;
                        master_wdata[i] = $random(seed) % 32'h40000 + 32'h1;
                        mem[master_addr[i][31:2]] = master_wdata[i];
                        begin_addr = begin_addr + 32'h4;
                    end
                    master_wreq[i] = 0;
                end else begin
                    master_rreq[i] = 1;
                    $display("Read Request");
                    while (~master_acc[i]) #1 begin end
                    begin_addr = (($random(seed) % 32'h40000) & 32'hFFFFF000) + i * 32'h10;
                    #4
                    master_addr[i] = begin_addr;
                    #4
                    master_addr[i] = begin_addr + 32'h4;
                    #4
                    master_addr[i] = begin_addr + 32'h8;
                    if (mem[begin_addr[31:2]] != 0) begin
                        if (mem[begin_addr[31:2]] == master_rdata) 
                            correct_count = correct_count + 1;
                        else begin
                            #8 $stop; 
                        end
                        total_count = total_count + 4;
                    end
                    #4
                    master_rreq[i] = 0;
                    master_addr[i] = begin_addr + 32'hC;
                    for (iter2 = 1; iter2 < 4; iter2 = iter2 + 1) begin
                        shift_addr = begin_addr + 32'h4 * iter2;
                        comp_result = mem[shift_addr[31:2]];
                        if (mem[shift_addr[31:2]] != 0) begin
                            if (mem[shift_addr[31:2]] == master_rdata) 
                                correct_count = correct_count + 1;
                            else begin
                                #8 $stop; 
                            end
                        end
                        #4 begin end
                    end
                    
                end
                #8
                while (($random(seed) % 20) != 0) #4 begin end
            end
            $display("Tested on %d reads, %d are correct", total_count, correct_count);
        end
        
    end
    endgenerate
    
    initial begin
        #21
        while (~seg_fault) #2 begin end
        $display("Segmentation Fault!");
        $stop;
    end
endmodule