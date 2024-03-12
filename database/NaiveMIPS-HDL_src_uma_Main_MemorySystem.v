module MemorySystem(clk, reset, 
                    irreq, iaddr, irdata, imiss, 
                    drreq, dwreq, daddr, drdata, dwdata, dwmask, dmiss, uncached);
    input  wire clk, reset;
    
    input  wire irreq;
    input  wire [31:0] iaddr;
    output wire [31:0] irdata;
    output wire imiss;
    
    input  wire drreq, dwreq;
    input  wire [31:0] daddr;
    input  wire [31:0] dwdata;
    input  wire [3:0]  dwmask;
    output wire [31:0] drdata;
    output wire dmiss;
    input wire uncached;
    
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
    
    // Connect internal memory slave device (just for debugging)
    generate
    for (i = 1; i < 8; i = i + 1) begin: memory_loop
        
        assign slave_ack[i] = 1'b0;                    
    end
    endgenerate

    reg[31:0] address_reg;
    reg[31:0] wrdata_reg;
    reg wr_reg;
    reg rd_reg;
    always @(posedge clk) begin
      address_reg <= slave_addr;
      wrdata_reg <= slave_wdata;
      wr_reg <= slave_wreq;
      rd_reg <= slave_rreq;
    end
    assign slave_ack[0] = slave_rreq|slave_wreq;
    assign slave_busy[0] = 1'b0;
    mem fake_ram(/*autoinst*/
           .data_o(slave_rdata[0]),
           .address(address_reg[31:2]),
           .data_i(wrdata_reg),
           .rd(rd_reg),
           .wr(wr_reg),
           .byte_enable(4'b1111));
          
    /************************ L2 Cache ************************/
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
    
    // L2 Cache adapter
    wire l2_drreq, l2_dwreq;
    wire [4:0] l2_dburst_size;
    wire [31:0] l2_daddr;
    wire [31:0] l2_dwdata;
    wire l2_dbusy;
    
    wire l2_irreq;
    wire [4:0] l2_iburst_size;
    wire [31:0] l2_iaddr;
    wire l2_ibusy;
    
    L2Adapter adapter(.clk(clk), .reset(reset), 
                 .drreq(l2_drreq), .dwreq(l2_dwreq), .daddr(l2_daddr), 
                 .dburst_size(l2_dburst_size), .dwdata(l2_dwdata), .dbusy(l2_dbusy),
                 .irreq(l2_irreq), .iwreq(1'b0), .iaddr(l2_iaddr), 
                 .iburst_size(l2_iburst_size), .iwdata(32'h0), .ibusy(l2_ibusy),
                 .l2_rreq(l2_rreq), .l2_wreq(l2_wreq), .l2_addr(l2_addr), 
                 .l2_burst_size(l2_burst_size), .l2_wdata(l2_wdata), .l2_busy(l2_busy));
                 
    /******************** L1 Data Cache *************************/
    
    // Connect DCache
    wire [31:0] dcache_rdata;
    wire dcache_miss;
    wire [31:0] peek_addr;
    wire [31:0] peek_rdata;
    wire peek_miss;
    wire [26:0] invalid_line;
    wire invalid_req;
    DCache dcache(.clk(clk), .reset(reset), 
                  .rreq(~uncached & drreq), 
                  .wreq(~uncached & dwreq), 
                  .addr(daddr), 
                  .rdata(dcache_rdata), .wdata(dwdata), .wmask(dwmask), .miss(dcache_miss),
                  .l2_rreq(l2_drreq), .l2_wreq(l2_dwreq), .l2_addr(l2_daddr), 
                  .l2_burst_size(l2_dburst_size), 
                  .l2_rdata(l2_rdata), .l2_wdata(l2_dwdata), .l2_busy(l2_dbusy),
                  .peek_addr(peek_addr), .peek_rdata(peek_rdata), .peek_miss(peek_miss),
                  .invalid_req(invalid_req), .invalid_line(invalid_line));
    
    // Connect Direct Loader
    wire [31:0] direct_rdata;
    wire direct_miss;
    
    DirectLoader loader(.clk(clk), .reset(reset), 
                        .rreq(uncached & drreq), 
                        .wreq(uncached & dwreq), 
                        .addr(daddr), 
                        .rdata(direct_rdata), .wdata(dwdata), .miss(direct_miss),
                        .bus_rreq(master_rreq[1]), .bus_wreq(master_wreq[1]), .bus_acc(master_acc[1]), 
                        .bus_addr(master_addr[1]), .bus_rdata(master_rdata), .bus_wdata(master_wdata[1]), 
                        .bus_busy(master_busy)); 
    
    // Select output from either cached device or uncached device
    assign dmiss = uncached ? direct_miss : dcache_miss;
    assign drdata = uncached ? direct_rdata : dcache_rdata;
    
    /************************ L1 Instruction Cache ********************/
    ICache icache(.clk(clk), .reset(reset), 
                  .rreq(irreq), .addr(iaddr), .rdata(irdata), .miss(imiss),
                  .l2_rreq(l2_irreq), .l2_addr(l2_iaddr), 
                  .l2_burst_size(l2_iburst_size), 
                  .l2_rdata(l2_rdata), .l2_busy(l2_ibusy),
                  .peek_addr(peek_addr), .peek_rdata(peek_rdata), .peek_miss(peek_miss),
                  .invalid_req(invalid_req), .invalid_line(invalid_line));
                  
endmodule