// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module DramReader(
    
    input fclk,
    input rst_n,
    
    //AXI port
    output M2S_AXI_ACLK,
    //
    output reg M2S_AXI_ARVALID,
    input M2S_AXI_ARREADY,
    output reg [31:0] M2S_AXI_ARADDR,
    output [1:0] M2S_AXI_ARBURST,
    output [3:0] M2S_AXI_ARLEN,
    output [1:0] M2S_AXI_ARSIZE,
    //
    input M2S_AXI_RVALID,
    output M2S_AXI_RREADY,
    input M2S_AXI_RLAST,
    input [63:0] M2S_AXI_RDATA,
    //
    input [1:0] M2S_AXI_RRESP,


    //Control config
    input rd_frame_valid,
    output reg rd_frame_ready,
    input [31:0] rd_FRAME_BYTES,
    input [31:0] rd_BUF_ADDR,

    output [1:0] debug_astate,

    //RAM port
    input dout_burst_ready,
    input dout_ready,
    output dout_valid,
    output [63:0] dout
);
    assign M2S_AXI_ACLK = fclk;
    assign M2S_AXI_ARLEN = 4'b1111;
    assign M2S_AXI_ARSIZE = 2'b11;
    assign M2S_AXI_ARBURST = 2'b01;
        
    reg [31:0] BUF_ADDR;
    reg [31:0] FRAME_BYTES;
    `REG(fclk, BUF_ADDR, 0, rd_frame_valid && rd_frame_ready ? rd_BUF_ADDR : BUF_ADDR)
    `REG(fclk, FRAME_BYTES, 0, rd_frame_valid && rd_frame_ready ? rd_FRAME_BYTES : FRAME_BYTES)

    wire frame_done;
    assign frame_done = (M2S_AXI_ARADDR + 128)==(BUF_ADDR+FRAME_BYTES);

    localparam A_IDLE = 0, A_FRAME_IDLE = 1, A_FRAME_WAIT=2;
    //ADDR logic
    reg [1:0] a_state;
    //wire [1:0] debug_astate;
    assign debug_astate = a_state;
    always @(posedge fclk or negedge rst_n) begin
        if (!rst_n) begin
            a_state <= A_IDLE;
            M2S_AXI_ARADDR <= 0;
            M2S_AXI_ARVALID <= 0;
            rd_frame_ready <= 0;
        end 
        else begin
            M2S_AXI_ARVALID <= 0;
            rd_frame_ready <= 0;
            case(a_state)
                A_IDLE : begin
                    rd_frame_ready <= 1;
                    if (rd_frame_valid) begin
                        M2S_AXI_ARADDR <= rd_BUF_ADDR;
                        a_state <= A_FRAME_IDLE;
                    end
                end
                A_FRAME_IDLE : begin
                    if (dout_burst_ready && M2S_AXI_ARREADY) begin
                        a_state <= A_FRAME_WAIT ;
                        M2S_AXI_ARVALID <= 1 ;
                    end
                end
                A_FRAME_WAIT: begin
                    if (r_state == R_IDLE) begin
                        M2S_AXI_ARADDR <= M2S_AXI_ARADDR + 128; // Bursts are 128 bytes long
                        a_state <= frame_done ? A_IDLE : A_FRAME_IDLE ;
                    end
                end
            endcase
        end
    end
    
    
    localparam R_IDLE=0, R_WAIT=1;
    
    //READ logic
    reg [3:0] b_count;
    reg r_state;
    assign M2S_AXI_RREADY = (r_state == R_WAIT) && dout_ready;
    always @(posedge fclk or negedge rst_n) begin
        if (rst_n == 0) begin
            r_state <= R_IDLE;
            b_count <= 0;
        end else case(r_state)
            R_IDLE: begin
                if (a_state==A_FRAME_IDLE && dout_burst_ready && M2S_AXI_ARREADY) begin
                    b_count <= 4'd15;
                    r_state <= R_WAIT;
                end
            end
            R_WAIT: begin
                if (M2S_AXI_RVALID && dout_ready) begin
                    if(b_count == 4'h0) begin
                        r_state <= R_IDLE;
                    end
                    b_count <= b_count - 1'b1; // each valid cycle the bus provides 8 bytes
                end
            end
        endcase
    end

    assign dout = M2S_AXI_RDATA;
    assign dout_valid = M2S_AXI_RVALID && (r_state == R_WAIT);

endmodule : DramReader

