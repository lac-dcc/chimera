module LoadManager_stimulus;
    reg clk, reset;

    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;

    reg wtrig, rtrig;
    reg [31:0] physical_addr;
    reg [7:0] group_addr;
    
    wire bus_rreq, bus_wreq;
    wire [31:0] bus_addr, bus_wdata;
    reg  bus_acc, bus_busy;
    reg  [31:0] bus_rdata;
    
    wire mem_wreq;
    wire [7:0]  mem_raddr, mem_waddr;
    wire [31:0] mem_wdata;
    reg  [31:0] mem_rdata;
    
    wire fault, finish;
    
    LoadManager loader(.clk(clk), .reset(reset), 
                       .wtrig(wtrig), .rtrig(rtrig),
                       .physical_addr(physical_addr), .group_addr(group_addr),
                       .bus_rreq(bus_rreq), .bus_wreq(bus_wreq), .bus_acc(bus_acc), 
                       .bus_addr(bus_addr), .bus_rdata(bus_rdata), .bus_wdata(bus_wdata), .bus_busy(bus_busy),
                       .mem_wreq(mem_wreq), .mem_raddr(mem_raddr), .mem_waddr(mem_waddr), 
                       .mem_rdata(mem_rdata), .mem_wdata(mem_wdata),
                       .fault(fault), .finish(finish));
    
    reg [31:0] delay;
    always @(posedge clk) begin
        delay <= mem_raddr + 32'h1234;
        mem_rdata <= delay;
    end
    
    integer counter;
    integer seed = 0;
    initial begin
        wtrig <= 1'b0;
        rtrig <= 1'b0;
        bus_acc <= 1'b0;
        #21
        wtrig <= 1'b1;
        physical_addr <= 32'h8000;
        group_addr <= 9'h10;
        #4
        wtrig <= 1'b0;
        #4 #4
        bus_acc <= 1'b1;
        #4 #4
        while (bus_wreq != 0) begin
            if ($random(seed) % 3 != 0)
                bus_busy <= 1'b0;
            else
                bus_busy <= 1'b1;
            #4 begin end
        end 
        #4 
        bus_acc = 1'b0;
        #4 #4
        rtrig <= 1'b1;
        physical_addr <= 32'h8000;
        group_addr <= 9'h10;
        #4
        rtrig <= 1'b0;
        #4 #4
        bus_acc <= 1'b1;
        #4 #4
        
        counter = 0;
        while (counter != 16) begin
            if ($random(seed) % 3 != 0) begin
                bus_busy <= 1'b1;
            end else begin
                bus_busy <= 1'b0;
                bus_rdata <= 32'd1000 + counter;
                counter <= counter + 1;
            end
            #4 begin end
        end
        bus_acc <= 1'b0;
    end
endmodule