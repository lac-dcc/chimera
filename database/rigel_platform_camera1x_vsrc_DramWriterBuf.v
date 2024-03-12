module DramWriterBuf(
    
    input fclk,
    input rst_n,
    
    //AXI port
    output M2S_AXI_ACLK,
    output reg [31:0] M2S_AXI_AWADDR,
    input M2S_AXI_AWREADY,
    output reg M2S_AXI_AWVALID,
    
    output [63:0] M2S_AXI_WDATA,
    output [7:0] M2S_AXI_WSTRB,
    input M2S_AXI_WREADY,
    output M2S_AXI_WVALID,
    output M2S_AXI_WLAST,
    
    input [1:0] M2S_AXI_BRESP,
    input M2S_AXI_BVALID,
    output M2S_AXI_BREADY,
    
    output [3:0] M2S_AXI_AWLEN,
    output [1:0] M2S_AXI_AWSIZE,
    output [1:0] M2S_AXI_AWBURST,
    
    //Control config
    input wr_frame_valid,
    output reg wr_frame_ready,
    input [31:0] wr_FRAME_BYTES,
    input [31:0] wr_BUF_ADDR,

    output [1:0] debug_astate,
    //RAM port
    input [63:0] din,
    output din_ready,
    input din_valid
    
);

    wire fifo_burst_valid;
    wire fifo_ready;
    wire fifo_valid;
    wire [63:0] fifo_data;
    
    wire fifo_full;
    wire fifo_empty;
    
    wire [8:0] rd_data_count;
    wire [8:0] wr_data_count;


    fifo_64w_64r_512d pipefifo (
          .rst(!rst_n), // input rst
          .wr_clk(fclk), // input wr_clk
          .rd_clk(fclk), // input rd_clk
          .din(din[63:0]), // input [63 : 0] din
          .wr_en(din_valid), // input wr_en
          .rd_en(fifo_ready), // input rd_en
          .dout(fifo_data[63:0]), // output [63 : 0] dramout
          .full(fifo_full), // output full
          .empty(fifo_empty), // output empty
          .rd_data_count(rd_data_count[8:0]), // output [8 : 0] rd_data_count
          .wr_data_count(wr_data_count[8:0]) // output [8 : 0] wr_data_count
    );

    assign fifo_burst_valid = (rd_data_count > 9'd25);
    assign fifo_valid = !fifo_empty;
    assign din_ready = !fifo_full;

    assign M2S_AXI_ACLK = fclk;
    assign M2S_AXI_AWLEN = 4'b1111; // 16 transfers??
    assign M2S_AXI_AWSIZE = 2'b11; // Represents 8 Bytes per "Transfer" (64 bit wide data bus)
    assign M2S_AXI_AWBURST = 2'b01; // Represents Type "Incr"
    assign M2S_AXI_WSTRB = 8'b11111111;
    
    reg [31:0] BUF_ADDR;
    reg [31:0] FRAME_BYTES;
    `REG(fclk, BUF_ADDR, 0, wr_frame_valid && wr_frame_ready ? wr_BUF_ADDR : BUF_ADDR)
    `REG(fclk, FRAME_BYTES, 0, wr_frame_valid && wr_frame_ready ? wr_FRAME_BYTES : FRAME_BYTES)

    
    wire frame_done;
    assign frame_done = (M2S_AXI_AWADDR + 128)==(BUF_ADDR+FRAME_BYTES);
    
    localparam A_IDLE=0, A_FRAME_IDLE=1, A_FRAME_WAIT=2;
    //ADDR logic
    reg [1:0] a_state;  
    assign debug_astate = a_state;
    always @(posedge fclk or negedge rst_n) begin
        if (rst_n == 0) begin
            a_state <= A_IDLE;
            M2S_AXI_AWVALID <= 0;
            M2S_AXI_AWADDR <= 0;
            wr_frame_ready <= 0 ;
        end 
        else begin
            M2S_AXI_AWVALID <= 0;
            wr_frame_ready <= 0 ;
            case(a_state)
                A_IDLE: begin
                    wr_frame_ready <= 1;
                    if (wr_frame_valid) begin
                        M2S_AXI_AWADDR <= wr_BUF_ADDR;
                        a_state <= A_FRAME_IDLE;
                    end
                end
                A_FRAME_IDLE: begin
                    if (fifo_burst_valid && M2S_AXI_AWREADY) begin
                        a_state <= A_FRAME_WAIT;
                        M2S_AXI_AWVALID <= 1 ;
                    end
                end
                A_FRAME_WAIT: begin
                    if (w_state == W_IDLE) begin
                        M2S_AXI_AWADDR <= M2S_AXI_AWADDR+128;
                        a_state <= frame_done ? A_IDLE : A_FRAME_IDLE ;
                    end
                end
            endcase
        end
    end
    
    localparam W_IDLE=0, W_WAIT=1;

    //WRITE logic
    reg [3:0] b_count;
    reg w_state;
    always @(posedge fclk or negedge rst_n) begin
        if (rst_n == 0) begin
            w_state <= W_IDLE;
            b_count <= 0;
        end 
        else case(w_state)
            W_IDLE: begin
                if (a_state==A_FRAME_IDLE && fifo_burst_valid && M2S_AXI_AWREADY) begin
                    b_count <= 4'd15;
                    w_state <= W_WAIT;
                end
            end
            W_WAIT: begin
                if (M2S_AXI_WREADY && M2S_AXI_WVALID) begin
                    if(b_count == 4'h0) begin
                        w_state <= W_IDLE;
                    end
                    b_count <= b_count - 1'b1;
                end
            end
        endcase
    end

    assign M2S_AXI_WLAST = (b_count == 4'h0);
    assign M2S_AXI_WVALID = (w_state == W_WAIT) && fifo_valid;

    assign fifo_ready = (w_state == W_WAIT) && M2S_AXI_WREADY;
       
    assign M2S_AXI_BREADY = 1'b1;
    assign M2S_AXI_WDATA = fifo_data;

endmodule : DramWriterBuf

