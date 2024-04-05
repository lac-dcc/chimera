/* This module controls the reading and writing of frames to memory and implements a triple buffer system
*/

module tribuf_ctrl(

    input fclk,
    input rst_n,

    //MMIO interface
    input start,
    input stop,
    input [31:0] FRAME_BYTES,
    input [31:0] TRIBUF_ADDR,

    //Write interface (final renderer)
    input wr_sync, // Allows you to sync frames
    output reg wr_frame_valid,
    input wr_frame_ready,
    output [31:0] wr_FRAME_BYTES,
    output [31:0] wr_BUF_ADDR,
    output reg wr_frame_done,

    //Read interface (VGA)
    input rd_sync, // allows you to sync frame reads
    output reg rd_frame_valid,
    input rd_frame_ready,
    output [31:0] rd_FRAME_BYTES,
    output [31:0] rd_BUF_ADDR,
    output reg rd_frame_done,

    output [1:0] debug_wr_ptr,
    output [1:0] debug_rd_ptr,
    output [1:0] debug_wr_cs,
    output [1:0] debug_rd_cs
);

    wire grand_start;
    assign grand_start = start;

    wire [31:0] buf0;
    wire [31:0] buf1;
    wire [31:0] buf2;
    assign buf0 = TRIBUF_ADDR[31:0];
    assign buf1 = TRIBUF_ADDR[31:0] + FRAME_BYTES[31:0] ;
    assign buf2 = TRIBUF_ADDR[31:0] + (FRAME_BYTES[31:0] << 1);


    reg [1:0] wr_ptr;
    reg [1:0] rd_ptr;
    reg [1:0] wr_ptr_next;
    reg [1:0] rd_ptr_next;
    reg [1:0] wr_ptr_prev;
    
    assign debug_wr_ptr = wr_ptr;
    assign debug_rd_ptr = rd_ptr;

    assign wr_FRAME_BYTES = FRAME_BYTES[31:0];
    assign wr_BUF_ADDR = (wr_ptr==2'h0) ? buf0 : (wr_ptr==2'h1) ? buf1 : buf2 ;
    
    assign rd_FRAME_BYTES = FRAME_BYTES[31:0];
    assign rd_BUF_ADDR = (rd_ptr==2'h0) ? buf0 : (rd_ptr==2'h1) ? buf1 : buf2 ;
    
    reg [1:0] wr_cs;
    reg [1:0] wr_ns;
    assign debug_wr_cs = wr_cs;

    reg stopping;
    `REG(fclk, stopping, 0, stop ? 1 : (start ? 0 : stopping))

    localparam STOPPED=0, WAIT=1, WORKING=2;
    always @(*) begin
        case(wr_cs)
            STOPPED : begin
                wr_ns = grand_start ? WAIT : STOPPED ;
                wr_frame_valid = 0;
                wr_frame_done = 0;
            end 
            WAIT : begin
                wr_ns = stopping ? STOPPED : (wr_frame_ready && wr_sync ? WORKING : WAIT);
                wr_frame_valid = !stopping && wr_frame_ready && wr_sync ? 1 : 0 ;
                wr_frame_done = 0;
            end 
            WORKING : begin
                wr_ns = wr_frame_ready ? WAIT : WORKING;
                wr_frame_valid = 0;
                wr_frame_done = wr_frame_ready ? 1 : 0 ;
            end 
            default : begin
                wr_ns = STOPPED ;
                wr_frame_valid = 0;
                wr_frame_done = 0;
            end 

        endcase
    end
    `REG(fclk, wr_cs, STOPPED, wr_ns)
    `REG(fclk, wr_ptr, 2'h0, wr_frame_valid ? wr_ptr_next : wr_ptr)
    `REG(fclk, wr_ptr_prev, 2'h0, wr_frame_done ? wr_ptr : wr_ptr_prev)
    
    reg [1:0] rd_cs;
    reg [1:0] rd_ns;
    
    assign debug_rd_cs = rd_cs;
    always @(*) begin
        case(rd_cs)
            STOPPED : begin
                rd_ns = grand_start ? WAIT : STOPPED ;
                rd_frame_valid = 0;
                rd_frame_done = 0;
            end 
            WAIT : begin
                rd_ns = rd_sync && rd_frame_ready ? WORKING : WAIT;
                rd_frame_valid = rd_sync && rd_frame_ready ? 1 : 0 ;
                rd_frame_done = 0;
            end 
            WORKING : begin
                rd_ns = rd_frame_ready ? WAIT : WORKING;
                rd_frame_valid = 0;
                rd_frame_done = rd_frame_ready ? 1 : 0 ;
            end 
            default : begin
                rd_ns = STOPPED ;
                rd_frame_valid = 0;
                rd_frame_done = 0;
            end 
        endcase
    end
    `REG(fclk, rd_cs, STOPPED, rd_ns)
    `REG(fclk, rd_ptr, 2'h0, rd_frame_valid ? rd_ptr_next : rd_ptr)

    localparam READ=2'h0, READING=2'h1, WRITTEN=2'h2, WRITING=2'h3;
    reg [1:0] buf_state[2:0]; 
    always @(posedge fclk or negedge rst_n) begin
        if(!rst_n) begin
            buf_state[0] <= READ;
            buf_state[1] <= READ;
            buf_state[2] <= READ;
        end
        else begin
            if (wr_frame_valid) begin
                buf_state[wr_ptr_next] <= WRITING ;
            end
            if (wr_frame_done) begin
                buf_state[wr_ptr] <= WRITTEN ;
                // If previous frame has not been read, invalidate it
                // Corner case, might already have decided to read wr_ptr_prev. but this should be fine.
                if (buf_state[wr_ptr_prev] == WRITTEN) begin
                    buf_state[wr_ptr_prev] <= READ ;
                end
            end
            if (rd_frame_valid) begin
                buf_state[rd_ptr_next] <= READING ;
            end
            if (rd_frame_done) begin
                buf_state[rd_ptr] <= READ ;
            end
        end
    end
    
    wire [1:0]  wr_ptr_plus1;
    wire [1:0]  wr_ptr_plus2;
    assign wr_ptr_plus1 = (wr_ptr==2'h2) ? 2'h0 : (wr_ptr+1'b1);
    assign wr_ptr_plus2 = (wr_ptr==2'h0) ? 2'h2 : (wr_ptr-1'b1);

    always @(*) begin
        if ( buf_state[wr_ptr_plus1] == READ) begin
            wr_ptr_next = wr_ptr_plus1;
        end
        else if ( buf_state[wr_ptr_plus2] == READ) begin
            wr_ptr_next = wr_ptr_plus2;
        end
        else if (buf_state[wr_ptr_plus1] != READING ) begin
            wr_ptr_next = wr_ptr_plus1;
        end
        else begin
            wr_ptr_next = wr_ptr_plus2;
        end
    end

    wire [1:0]  rd_ptr_plus1;
    wire [1:0]  rd_ptr_plus2;
    assign rd_ptr_plus1 = (rd_ptr==2) ? 0 : (rd_ptr+1'b1);
    assign rd_ptr_plus2 = (rd_ptr==0) ? 2 : (rd_ptr-1'b1);

    always @(*) begin
        if (buf_state[rd_ptr_plus1]==WRITTEN) begin
            rd_ptr_next = rd_ptr_plus1;
        end
        else if (buf_state[rd_ptr_plus2]==WRITTEN) begin
            rd_ptr_next = rd_ptr_plus2;
        end
        else begin
            rd_ptr_next = rd_ptr ;
        end
    end

endmodule : tribuf_ctrl
