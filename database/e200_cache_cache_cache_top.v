// This program was cloned from: https://github.com/123xnc/e200_cache
// License: Apache License 2.0

module cache(clk,
            rst,
            i_icache_addr,
            i_icache_read,
            o_icache_readdata,
            o_icache_readdata_valid,
            o_icache_waitrequest,

            i_dcache_addr,
            i_dcache_byte_en,
            i_dcache_writedata,
            i_dcache_read,
            i_dcache_write,
            o_dcache_readdata,
            o_dcache_readdata_valid,
            o_dcache_waitrequest,

            o_m_addr,
            o_m_byte_en,
            o_m_writedata,
            o_m_read,
            o_m_write,
            i_m_readdata,
            i_m_readdata_valid,
            i_m_waitrequest);

    input wire         clk, rst;

    input wire [31:0]   i_icache_addr;
    input wire          i_icache_read;
    output wire [31:0]  o_icache_readdata;
    output wire         o_icache_readdata_valid;
    output wire         o_icache_waitrequest;

    input wire [31:0]   i_dcache_addr;
    input wire [3:0]    i_dcache_byte_en;
    input wire [31:0]   i_dcache_writedata;
    input wire          i_dcache_read, i_dcache_write;
    output wire [31:0]  o_dcache_readdata;
    output wire         o_dcache_readdata_valid;
    output wire         o_dcache_waitrequest;

    output wire [31:0]  o_m_addr;
    output wire [3:0]   o_m_byte_en;
    output wire [127:0] o_m_writedata;
    output wire         o_m_read, o_m_write;
    input wire [127:0]  i_m_readdata;
    input wire          i_m_readdata_valid;
    input wire          i_m_waitrequest;

    wire [31:0]  o_icache_addr;
    wire         o_icache_read;
    wire [127:0] i_icache_readdata;
    wire         i_icache_readdata_valid;
    wire         i_icache_waitrequest = 1'b0;

    wire [31:0]  o_dcache_addr;
    wire [127:0] o_dcache_writedata;
    wire         o_dcache_read, o_dcache_write;
    wire [127:0] i_dcache_readdata;
    wire         i_dcache_readdata_valid;
    wire         i_dcache_waitrequest = 1'b0;


//     wire [31:0]  l2_addr;
//     wire [3:0]   l2_byte_en;
//     wire [127:0] l2_writedata;
//     wire         l2_read, l2_write;
//     wire [127:0] l2_readdata;
//     wire         l2_readdata_valid;
//     wire         l2_waitrequest;

//     //dcache has the higher priority
//     reg icache_use;
//     reg dcache_use;
//     assign i_icache_waitrequest = dcache_use || l2_waitrequest;
//     assign i_dcache_waitrequest = l2_waitrequest;

//     assign l2_addr = dcache_use ? o_dcache_addr 
//                                 : o_icache_addr;
//     assign l2_byte_en = 4'b1111;
//     assign o_dcache_writedata = o_dcache_writedata;
//     assign l2_read = dcache_use ? o_dcache_read
//                                 : o_icache_read;
//     assign l2_write = o_dcache_write;
//     assign l2_writedata = o_dcache_writedata;
    
//     assign i_icache_readdata = l2_readdata;
//     assign i_icache_readdata_valid = l2_readdata_valid;
//     assign i_dcache_readdata = l2_readdata;
//     assign i_dcache_readdata_valid = l2_readdata_valid;

    reg icache_use, dcache_use, dcache_read, dcache_write;
    reg cache_use;


    reg [31:0]  l2_addr;
    wire [3:0]   l2_byte_en = 4'b1111;
    reg [127:0] l2_writedata;
    reg         l2_read, l2_write;
    wire [127:0] l2_readdata;
    wire         l2_readdata_valid;
    wire         l2_waitrequest;

    assign i_icache_readdata = l2_readdata;
    assign i_dcache_readdata = l2_readdata;
    assign i_icache_readdata_valid = (cache_use == 1) ? l2_readdata_valid : 1'b0;
    assign i_dcache_readdata_valid = (cache_use == 0) ? l2_readdata_valid : 1'b0;

    always @(posedge clk ) begin
       if(rst) begin
              dcache_use <= 0;
              dcache_read <= 0;
              dcache_write <= 0;
              icache_use <= 0;
              cache_use <= 1;
       end

       //receive singal
       if(o_icache_read) icache_use <= 1;
       if(o_dcache_read) begin
              dcache_use <= 1;
              dcache_read <= 1;
       end
       if(o_dcache_write)begin
              dcache_use <= 1;
              dcache_write <= 1;
       end

       if(dcache_use && (~l2_waitrequest)) begin
              cache_use <= 0;
              if(dcache_read) l2_read <= 1;
              if(dcache_write) l2_write <= 1;
              l2_writedata <= o_dcache_writedata;
              l2_addr <= o_dcache_addr;    
       end
       else if (icache_use && (~l2_waitrequest))begin
              cache_use <= 1;
              l2_read <= 1;
              l2_addr <= o_icache_addr;
       end
       else begin
              l2_read <= 0;
              l2_write <= 0;
       end
    end

    always @(posedge l2_readdata_valid ) begin
       if(cache_use) begin
              icache_use = 0;
       end
       else begin
              dcache_use = 0;
              dcache_read = 0;
              dcache_write = 0;
       end
    end

    cache32 #(.cache_entry(6))
    icache(.clk(clk), 
           .rst(rst),
           .i_p_addr(i_icache_addr),
           .i_p_byte_en(4'b1111),
           .i_p_writedata(0),
           .i_p_read(i_icache_read),
           .i_p_write(0),
           .o_p_readdata(o_icache_readdata),
           .o_p_readdata_valid(o_icache_readdata_valid),
           .o_p_waitrequest(o_icache_waitrequest),

           .o_m_addr(o_icache_addr),
           .o_m_writedata(),
           .o_m_read(o_icache_read),
           .o_m_write(),
           .i_m_readdata(i_icache_readdata),
           .i_m_readdata_valid(i_icache_readdata_valid),
           .i_m_waitrequest(i_icache_waitrequest));

    cache32 #(.cache_entry(6))
    dcache(.clk(clk), 
           .rst(rst),
           .i_p_addr(i_dcache_addr),
           .i_p_byte_en(i_dcache_byte_en),
           .i_p_writedata(i_dcache_writedata),
           .i_p_read(i_dcache_read),
           .i_p_write(i_dcache_write),
           .o_p_readdata(o_dcache_readdata),
           .o_p_readdata_valid(o_dcache_readdata_valid),
           .o_p_waitrequest(o_dcache_waitrequest),

           .o_m_addr(o_dcache_addr),
           .o_m_writedata(o_dcache_writedata),
           .o_m_read(o_dcache_read),
           .o_m_write(o_dcache_write),
           .i_m_readdata(i_dcache_readdata),
           .i_m_readdata_valid(i_dcache_readdata_valid),
           .i_m_waitrequest(i_dcache_waitrequest));
    
    cache128 #(.cache_entry(10))
    l2cache(.clk(clk), 
            .rst(rst),
            .i_p_addr(l2_addr),
            .i_p_byte_en(l2_byte_en),
            .i_p_writedata(l2_writedata),
            .i_p_read(l2_read),
            .i_p_write(l2_write),
            .o_p_readdata(l2_readdata),
            .o_p_readdata_valid(l2_readdata_valid),
            .o_p_waitrequest(l2_waitrequest),

            .o_m_addr(o_m_addr),
            .o_m_byte_en(o_m_byte_en),
            .o_m_writedata(o_m_writedata),
            .o_m_read(o_m_read),
            .o_m_write(o_m_write),
            .i_m_readdata(i_m_readdata),
            .i_m_readdata_valid(i_m_readdata_valid),
            .i_m_waitrequest(i_m_waitrequest));


endmodule