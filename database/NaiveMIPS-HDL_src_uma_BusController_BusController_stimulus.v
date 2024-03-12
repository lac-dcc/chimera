module BusController_stimulus;
    reg clk, reset;
  
    initial begin
        clk = 1'b1;
        reset = 1'b1;
        #20 reset = 1'b0;
    end
    always
        #2 clk = ~clk;
  
    reg  [31:0] master_addr0, master_addr1, master_addr2;
    wire [31:0] master_rdata;
    reg  [31:0] master_wdata0, master_wdata1, master_wdata2;
    reg         master_rreq0, master_wreq0, master_rreq1, master_wreq1, master_rreq2, master_wreq2;
    wire [3:0]  master_acc;
    wire        master_busy;
  
    wire [31:0] slave_addr;
    reg  [31:0] slave_rdata0, slave_rdata1, slave_rdata2;
    wire [31:0] slave_wdata;
    wire        slave_rreq, slave_wreq;
    reg         slave_busy0, slave_busy1, slave_busy2;
    reg         slave_ack0, slave_ack1, slave_ack2;
    
    wire        seg_fault;
    wire [2:0]  seg_reason;
    wire [31:0] seg_addr;
  
    BusController controller(.clk(clk), .reset(reset), 
                              .master_addr({32'b0, master_addr2, master_addr1, master_addr0}), 
                              .master_rdata(master_rdata), 
                              .master_wdata({32'b0, master_wdata2, master_wdata1, master_wdata0}), 
                              .master_rreq({1'b0, master_rreq2, master_rreq1, master_rreq0}), 
                              .master_wreq({1'b0, master_wreq2, master_wreq1, master_wreq0}), 
                              .master_acc(master_acc), 
                              .master_busy(master_busy),
                              .slave_addr(slave_addr), 
                              .slave_rdata({160'b0, slave_rdata2, slave_rdata1, slave_rdata0}), 
                              .slave_wdata(slave_wdata), 
                              .slave_rreq(slave_rreq), 
                              .slave_wreq(slave_wreq), 
                              .slave_busy({5'h0, slave_busy2, slave_busy1, slave_busy0}),
                              .slave_ack({5'h0, slave_ack2, slave_ack1, slave_ack0}),
                              .seg_fault(seg_fault),
                              .seg_reason(seg_reason),
                              .seg_addr(seg_addr));
  
  
    initial begin
        master_rreq0 = 0;
        master_wreq0 = 0;
        master_rreq1 = 0;
        master_wreq1 = 0;
        master_rreq2 = 0;
        master_wreq2 = 0;
        slave_ack0 = 0;
        slave_ack1 = 0;
        slave_ack2 = 0;
        slave_busy0 = 0;
        slave_busy1 = 0;
        slave_busy2 = 0;
        #21  
        #4
        master_rreq0 = 1;
        master_rreq1 = 1;
        #8
        master_addr0 = 32'h8004;
        slave_ack0 = 1;
        #4
        master_addr0 = 32'h8008;
        slave_busy0 = 0;
        slave_rdata0 = 32'h2333;
        #4
        master_rreq0 = 0;
        master_addr0 = 32'h800C;
        slave_rdata0 = 32'h2444;
        #4 
        slave_ack0 = 0;
        slave_rdata0 = 32'h2555;
        #4 #4 #4 
        master_rreq1 = 0;
        master_addr1 = 32'h2004;
        slave_ack1 = 1;
        master_wreq2 = 1;
        #4 
        slave_ack1 = 0;
        slave_busy1 = 1;
        #8
        slave_busy1 = 0;
        slave_rdata1 = 32'h7444;
        #4 #4 #4
        master_addr2 = 32'h100;
        master_wdata2 = 32'h23;
        slave_ack2 = 1;
        #4
        master_addr2 = 32'h104;
        master_wdata2 = 32'h24;
        slave_busy2 = 1;
        #4 
        master_addr2 = 32'hx;
        master_wdata2 = 32'hx;
        slave_busy2 = 0;
        #4
        master_wreq2 = 0;
        master_addr2 = 32'h108;
        master_wdata2 = 32'h25;
        slave_busy2 = 1;
        #4
        master_addr2 = 32'hx;
        master_wdata2 = 32'hx;
        #4
        slave_busy2 = 0;
        #4
        slave_busy2 = 1;
        slave_ack2 = 0;
        #8
        slave_busy2 = 0;
        #4
        master_wreq0 = 1;
        #8
        master_wreq0 = 0;
        master_addr0 = 32'h10C;
        master_wdata0 = 32'h66;
        slave_ack2 = 1;
        #8
        slave_ack2 = 0;
    end

endmodule