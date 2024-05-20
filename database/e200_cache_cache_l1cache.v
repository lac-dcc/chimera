// This program was cloned from: https://github.com/123xnc/e200_cache
// License: Apache License 2.0

// Cache Memory (4way 4word)               //
// i_  means input port                    //
// o_  means output port                   //
// _p_  means data exchange with processor //
// _m_  means data exchange with memory    //
// Replacement policy is LRU (8bit)        //


`default_nettype none

  module cache32(clk,
               rst,
               i_p_addr,
               i_p_byte_en,
               i_p_writedata,
               i_p_read,
               i_p_write,
               o_p_readdata,
               o_p_readdata_valid,
               o_p_waitrequest,

               o_m_addr,
               o_m_writedata,
               o_m_read,
               o_m_write,
               i_m_readdata,
               i_m_readdata_valid,
               i_m_waitrequest,

               cnt_r,
               cnt_w,
               cnt_hit_r,
               cnt_hit_w,
               cnt_wb_r,
               cnt_wb_w);

    parameter cache_entry = 6;
    input wire         clk, rst;
    input wire [31:0]  i_p_addr;
    input wire [3:0]   i_p_byte_en;
    input wire [31:0]  i_p_writedata;
    input wire         i_p_read, i_p_write;
    output reg [31:0]  o_p_readdata;
    output reg         o_p_readdata_valid;
    output wire        o_p_waitrequest;

    output reg [31:0]  o_m_addr;
    output reg [127:0] o_m_writedata;
    output reg         o_m_read, o_m_write;
    input wire [127:0] i_m_readdata;
    input wire         i_m_readdata_valid;
    input wire         i_m_waitrequest;

    output reg [31:0]  cnt_r;
    output reg [31:0]  cnt_w;
    output reg [31:0]  cnt_hit_r;
    output reg [31:0]  cnt_hit_w;
    output reg [31:0]  cnt_wb_r;
    output reg [31:0]  cnt_wb_w;

    wire [3:0]    hit;
    wire [3:0]    modify;
    wire [3:0]    miss;
    wire [3:0]    valid;
    wire [127:0]  readdata0, readdata1, readdata2, readdata3;
    wire [127:0]  writedata;
    wire          write0, write1, write2, write3;
    wire [3:0]    word_en;
    wire [3:0] 	  byte_en;
    wire [27:0]   addr;
    wire [27:0]   wb_addr0, wb_addr1, wb_addr2, wb_addr3;
    wire [7:0] 	  r_cm_data;
    wire [1:0] 	  hit_num;

    reg  [2:0] 	  state;
    reg  [127:0]  writedata_buf;
    reg  [31:0]   write_addr_buf;
    reg  [3:0] 	  byte_en_buf;
    reg 		  write_buf, read_buf;
    reg  [3:0]    write_set;
    reg  [3:0]    fetch_write;
    reg  [7:0] 	  w_cm_data;
    reg 		  w_cm;

    localparam IDLE = 0;
    localparam COMP = 1;
    localparam HIT  = 2;
    localparam FETCH1 = 3;
    localparam FETCH2 = 4;
    localparam FETCH3 = 5;
    localparam WB1 = 6;
    localparam WB2 = 7;



    integer i;
    
    initial begin
        for(i = 0; i <=(2**cache_entry-1); i=i+1) begin
	        ram_hot.mem[i] = 0;
        end
    end


    simple_ram #(.width(8), .widthad(cache_entry)) ram_hot(clk, addr[cache_entry-1:0], w_cm, w_cm_data, addr[cache_entry-1:0], r_cm_data);

    set #(.cache_entry(cache_entry))
    set0(.clk(clk),
         .rst(rst),
         .entry(addr[cache_entry-1:0]),
         .o_tag(addr[27:cache_entry]),
         .writedata(writedata),
         .byte_en(byte_en),
         .write(write0),
         .word_en(word_en), // 4word r/w change 
         .readdata(readdata0),
         .wb_addr(wb_addr0),
         .hit(hit[0]),
         .modify(modify[0]),
         .miss(miss[0]),
         .valid(valid[0]),
         .read_miss(read_buf));

    set #(.cache_entry(cache_entry))
    set1(.clk(clk),
         .rst(rst),
         .entry(addr[cache_entry-1:0]),
         .o_tag(addr[27:cache_entry]),
         .writedata(writedata),
         .byte_en(byte_en),
         .write(write1),
         .word_en(word_en), // 4word r/w change 
         .readdata(readdata1),
         .wb_addr(wb_addr1),
         .hit(hit[1]),
         .modify(modify[1]),
         .miss(miss[1]),
         .valid(valid[1]),
         .read_miss(read_buf));

    set #(.cache_entry(cache_entry))
    set2(.clk(clk),
         .rst(rst),
         .entry(addr[cache_entry-1:0]),
         .o_tag(addr[27:cache_entry]),
         .writedata(writedata),
         .byte_en(byte_en),
         .write(write2),
         .word_en(word_en), // 4word r/w change 
         .readdata(readdata2),
         .wb_addr(wb_addr2),
         .hit(hit[2]),
         .modify(modify[2]),
         .miss(miss[2]),
         .valid(valid[2]),
         .read_miss(read_buf));

    set #(.cache_entry(cache_entry))
    set3(.clk(clk),
         .rst(rst),
         .entry(addr[cache_entry-1:0]),
         .o_tag(addr[27:cache_entry]),
         .writedata(writedata),
         .byte_en(byte_en),
         .write(write3),
         .word_en(word_en), // 4word r/w change 
         .readdata(readdata3),
         .wb_addr(wb_addr3),
         .hit(hit[3]),
         .modify(modify[3]),
         .miss(miss[3]),
         .valid(valid[3]),
         .read_miss(read_buf));

    assign writedata = (|fetch_write) ?	i_m_readdata : writedata_buf; //128bit
    assign write0 = (fetch_write[0]) ? i_m_readdata_valid : write_set[0];
    assign write1 = (fetch_write[1]) ? i_m_readdata_valid : write_set[1];
    assign write2 = (fetch_write[2]) ? i_m_readdata_valid : write_set[2];
    assign write3 = (fetch_write[3]) ? i_m_readdata_valid : write_set[3];
    assign addr = (o_p_waitrequest) ? write_addr_buf[31:4] : i_p_addr[31:4]; // set module input addr is 28bit 
    assign byte_en = (|fetch_write) ? 4'b1111 : byte_en_buf;
    assign o_p_waitrequest = (state != IDLE);

    assign hit_num = (hit[0]) ? 0 : (hit[1]) ? 1 : (hit[2]) ? 2 : 3;
    assign word_en = (|fetch_write) ? 4'b1111 : 
                     (write_addr_buf[3:2] == 2'b00) ? 4'b0001 :
                     (write_addr_buf[3:2] == 2'b01) ? 4'b0010 :
                     (write_addr_buf[3:2] == 2'b10) ? 4'b0100 : 4'b1000;

    always @(posedge clk) begin
        if(rst) begin
            o_p_readdata_valid <= 0;
            o_p_readdata <= 32'h00000013;
            {o_m_read, o_m_write} <= 0;
            o_m_addr <= 0;
            write_addr_buf <= 0;
            byte_en_buf <= 0;
            writedata_buf <= 0;
            {write_buf, read_buf} <= 0;
            write_set <= 0;
            fetch_write <= 0;
            {cnt_r, cnt_w} <= 0;
            {cnt_hit_r, cnt_hit_w} <= 0;
            {cnt_wb_r, cnt_wb_w} <= 0;
            state <= IDLE;
        end
        else begin
            case (state)
                IDLE: begin
                    write_set <= 0;
                    o_p_readdata_valid <= #21 0;
                    writedata_buf <= {i_p_writedata, i_p_writedata, i_p_writedata, i_p_writedata};
                    write_addr_buf <= i_p_addr;
                    byte_en_buf <= i_p_byte_en;
                    write_buf <= i_p_write;
                    read_buf <= i_p_read;
                    if(i_p_read) begin
                        state <= COMP;
                        cnt_r <= cnt_r + 1;
                    end else if(i_p_write) begin
                        state <= COMP;
                        cnt_w <= cnt_w + 1;
                    end
                end
                COMP: begin
                    if((|hit) && write_buf) begin
                        state <= HIT;
                        write_set <= hit;
                        cnt_hit_w <= cnt_hit_w + 1;
                        w_cm_data <= (r_cm_data[1:0] == hit_num) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                     (r_cm_data[3:2] == hit_num) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                     (r_cm_data[5:4] == hit_num) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                        w_cm <= 1;
                        o_p_readdata_valid <=#21 1;
                    end else if((|hit) && read_buf) begin
                        case(write_addr_buf[3:2])
                            2'b00: o_p_readdata <= (hit[0]) ? readdata0[31:0] : (hit[1]) ? readdata1[31:0] : (hit[2]) ? readdata2[31:0] : readdata3[31:0];
                            2'b01: o_p_readdata <= (hit[0]) ? readdata0[63:32] : (hit[1]) ? readdata1[63:32] : (hit[2]) ? readdata2[63:32] : readdata3[63:32];
                            2'b10: o_p_readdata <= (hit[0]) ? readdata0[95:64] : (hit[1]) ? readdata1[95:64] : (hit[2]) ? readdata2[95:64] : readdata3[95:64];
                            2'b11: o_p_readdata <= (hit[0]) ? readdata0[127:96] : (hit[1]) ? readdata1[127:96] : (hit[2]) ? readdata2[127:96] : readdata3[127:96];
                        endcase
                        o_p_readdata_valid <=#21 1;
                        w_cm_data <= (r_cm_data[1:0] == hit_num) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                     (r_cm_data[3:2] == hit_num) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                     (r_cm_data[5:4] == hit_num) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                        w_cm <= 1;
                        cnt_hit_r <= cnt_hit_r + 1;
                        state <= IDLE;
                    end else if(!(&valid) || !modify[r_cm_data[1:0]]) begin
                        state <= FETCH1;
                        if(!valid[0]) begin
                            fetch_write <= 4'b0001;
                            w_cm_data <= 8'b11100100;
                            w_cm <= 1;
                        end else if(!valid[1]) begin
                            fetch_write <= 4'b0010;
                            w_cm_data <= (r_cm_data[1:0] == 2'b01) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                         (r_cm_data[3:2] == 2'b01) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                         (r_cm_data[5:4] == 2'b01) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                            w_cm <= 1;
                        end else if(!valid[2]) begin
                            fetch_write <= 4'b0100;
                            w_cm_data <= (r_cm_data[1:0] == 2'b10) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                         (r_cm_data[3:2] == 2'b10) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                         (r_cm_data[5:4] == 2'b10) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                            w_cm <= 1;
                        end else if(!valid[3]) begin
                            fetch_write <= 4'b1000;
                            w_cm_data <= (r_cm_data[1:0] == 2'b11) ? {r_cm_data[1:0], r_cm_data[7:2]} :
                                         (r_cm_data[3:2] == 2'b11) ? {r_cm_data[3:2], r_cm_data[7:4], r_cm_data[1:0]} :
                                         (r_cm_data[5:4] == 2'b11) ? {r_cm_data[5:4], r_cm_data[7:6], r_cm_data[3:0]} : r_cm_data;
                            w_cm <= 1;
                        end else if(!modify[r_cm_data[1:0]]) begin
                            if(r_cm_data[1:0] == 2'b00) fetch_write <= 4'b0001;
                            else if(r_cm_data[1:0] == 2'b01) fetch_write <= 4'b0010;
                            else if(r_cm_data[1:0] == 2'b10) fetch_write <= 4'b0100;
                            else if(r_cm_data[1:0] == 2'b11) fetch_write <= 4'b1000;
                            w_cm_data <= {r_cm_data[1:0], r_cm_data[7:2]};
                            w_cm <= 1;
                        end
                        o_m_addr <= {write_addr_buf[31:4], 4'b0000};
                        o_m_read <= 1;
                    end else begin
                        state <= WB1;
                        if(r_cm_data[1:0] == 2'b00) fetch_write <= 4'b0001;
                        else if(r_cm_data[1:0] == 2'b01) fetch_write <= 4'b0010;
                        else if(r_cm_data[1:0] == 2'b10) fetch_write <= 4'b0100;
                        else if(r_cm_data[1:0] == 2'b11) fetch_write <= 4'b1000;
                        w_cm_data <= {r_cm_data[1:0], r_cm_data[7:2]};
                        w_cm <= 1;
                        if(read_buf) cnt_wb_r <= cnt_wb_r + 1;
                        else if(write_buf) cnt_wb_w <= cnt_wb_w + 1;
                    end
                end
                HIT: begin
                    w_cm <= 0;
                    write_set <= 0;
                    state <= IDLE;
                end 
                FETCH1: begin
                    w_cm <= 0;
                    if(!i_m_waitrequest) begin
                        o_m_read <= 0;
                        state <= FETCH2;
                    end
                end
                FETCH2: begin
                    if(i_m_readdata_valid) begin
                        fetch_write <= 0;          
                        if(write_buf) begin
                            state <= FETCH3;
                            write_set <= fetch_write;
                            o_p_readdata_valid <=#21 1;
		                end else if(read_buf) begin
                            state <= IDLE;
		                    o_p_readdata_valid <=#21 1;
		                    case(write_addr_buf[3:2])
		                        2'b00: o_p_readdata <= i_m_readdata[ 31: 0];
		                        2'b01: o_p_readdata <= i_m_readdata[ 63:32];
		                        2'b10: o_p_readdata <= i_m_readdata[ 95:64];
		                        2'b11: o_p_readdata <= i_m_readdata[127:96];
		                    endcase
		                end
                    end
                end
                FETCH3: begin
                    state <= IDLE;
                    write_set <= 0;
                end
                WB1: begin
                    w_cm <= 0;
                    o_m_addr <= (fetch_write[0]) ? {wb_addr0, 4'b0000} :
                                (fetch_write[1]) ? {wb_addr1, 4'b0000} :
                                (fetch_write[2]) ? {wb_addr2, 4'b0000} : {wb_addr3, 4'b0000};
                    o_m_writedata <= (fetch_write[0]) ? readdata0 : 
                                     (fetch_write[1]) ? readdata1 : 
                                     (fetch_write[2]) ? readdata2 : readdata3;
                    o_m_write <= 1;
                    state <= WB2;
                end
                WB2: begin
                    if(!i_m_waitrequest) begin
                        o_m_write <= 0;
                        o_m_addr <= {write_addr_buf[31:4], 4'b0000};
                        o_m_read <= 1;
                        state <= FETCH1;
                    end
                end
            endcase // case (state)
        end
    end

endmodule // cache