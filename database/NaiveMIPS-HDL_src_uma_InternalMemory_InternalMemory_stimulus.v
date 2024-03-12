module InternalMemory_stimulus;
    reg clk, reset;
  
    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;
    
    reg rreq, wreq;
    reg [31:0] addr;
    reg [31:0] wdata;
    wire [31:0] rdata;
    wire busy, ack;
    InternalMemory memory(.clk(clk), .reset(reset), 
                          .rreq(rreq), .wreq(wreq), .addr(addr), .wdata(rdata), 
                          .rdata(wdata), .busy(busy), .ack(ack));
    
    integer i;    
    initial begin
        rreq = 0;
        wreq = 0;
        #21
        wreq = 1;
        addr = 32'h0000;
        wdata = 32'h1234;
        for (i = 0; i < 50; i = i + 1) begin
            #4 
            addr = addr + 32'h1000;
            wdata = wdata + 32'h1;
        end
        wreq = 0;
        rreq = 1;
        addr = 32'h0000;
        for (i = 0; i < 50; i = i + 1) begin
            #4
            addr = addr + 32'h1000;
        end
        rreq = 0;
    end
endmodule
