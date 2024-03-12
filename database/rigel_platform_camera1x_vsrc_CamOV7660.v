`include "macros.vh"

module CamOV7660 (
    
    //general
    input fclk,
    input rst_n,
    input CLK_24M,
    input CLK_48M,

    // Camera IO
    input [9:2] CAM_DIN,
    input CAM_VSYNC,
    input CAM_HREF,
    output CAM_PWDN,
    input CAM_PCLK,
    output CAM_XCLK,
    output CAM_SIO_C,
    inout CAM_SIO_D,
    

    //Camera register setup
    input [16:0] rw_cmd,
    input rw_cmd_valid,
    output [17:0] rw_resp,// {err,rw,addr,data}
    output rw_resp_valid,

    //pclk
    input [31:0] cam_cmd,
    input cam_cmd_valid,
    output cam_cmd_ready,

    //camera output
    output sdata_burst_valid, // Only valid if the next N (16) are valid
    output sdata_valid,
    input sdata_ready,
    output [63:0] sdata,


    // debug signals
    output [31:0] debug0,
    output [31:0] debug1,
    output [31:0] debug2,
    output [31:0] debug3
);

    wire pclk;
  


    //IBUFG pclk_buffer( .I(CAM_PCLK), .O(pclk));
    assign pclk = CLK_24M;
    
    reg CAM_VSYNC_p1;
    reg CAM_HREF_p1;
    reg [7:0] CAM_DIN_p1;
    reg CAM_VSYNC_p2;
    reg CAM_HREF_p2;
    reg [7:0] CAM_DIN_p2;
  
    `REG(pclk, CAM_VSYNC_p1, 0, CAM_VSYNC)
    `REG(pclk, CAM_HREF_p1, 0, CAM_HREF)
    `REG(pclk, CAM_DIN_p1, 0, CAM_DIN)
    `REG(pclk, CAM_VSYNC_p2, 0, CAM_VSYNC_p1)
    `REG(pclk, CAM_HREF_p2, 0, CAM_HREF_p1)
    `REG(pclk, CAM_DIN_p2, 0, CAM_DIN_p1)



    assign CAM_PWDN = 1'b0; // 0: Normal mode
    assign CAM_XCLK = CLK_48M;

    wire cfifo_full;
    wire cfifo_empty;
    
    wire [31:0] pcam_cmd;
    wire pcam_cmd_valid;
    wire pcam_cmd_ready;

    cfifo32x16 cfifo (
        .rst(!rst_n), // input rst
        .wr_clk(fclk), // input wr_clk
        .rd_clk(pclk), // input rd_clk
        .din(cam_cmd), // input [31 : 0] din
        .wr_en(cam_cmd_valid), // input wr_en
        .rd_en(pcam_cmd_ready), // input rd_en
        .dout(pcam_cmd), // output [31 : 0] dout
        .full(cfifo_full), // output full
        .empty(cfifo_empty) // output empty
    );

    assign cam_cmd_ready = !cfifo_full;
    
    assign pcam_cmd_valid = !cfifo_empty;
    assign pcam_cmd_ready = pcam_cmd_valid;



    // debug counters
    reg [31:0] debug_cnt[2:0];

    wire [16:0] rw_resp_internal;
    reg camsetup_err;
    `REG_ERR(fclk, camsetup_err, rw_cmd_valid && !rw_cmd_ready)
    assign rw_resp = {camsetup_err, rw_resp_internal[16:0]};
    // Camera set up
    wire [31:0] debug_camsetup;
    CamSetup camsetup(
        .clk(fclk),
        .rst_n(rst_n),
        .debug(debug_camsetup),
        .rw_cmd(rw_cmd[16:0]),
        .rw_cmd_valid(rw_cmd_valid),
        .rw_cmd_ready(rw_cmd_ready),
        .rw_resp(rw_resp_internal[16:0]),
        .rw_resp_valid(rw_resp_valid),
        .sioc_o(CAM_SIO_C),
        .siod_io(CAM_SIO_D)
    );

    wire [7:0] cr_pixel;
    wire [31:0] hlen;
    wire [31:0] vlen;
    wire start_stream;

    // TODO make module for this if I want it more commands
    assign start_stream = pcam_cmd_valid && (pcam_cmd == `CMD_START);

    // Reads in raw data byte by byte
    CamReader camreader(
        .din(CAM_DIN_p2),        // D0 - D7
        .vsync(CAM_VSYNC_p2),          // VSYNC
        .href(CAM_HREF_p2),           // HREF
        .pclk(pclk),           // PCLK 
        .rst_n(rst_n),            // 0 - Reset.
        .pixel_valid(cr_pixel_valid),     // Indicates that a pixel has been received.
        .pixel(cr_pixel[7:0]),   // raw
        .start(start_stream), 
        .stop(1'b0),
        .hlen(hlen[31:0]),
        .vlen(vlen[31:0])
    );
    
    wire [10:0] fifo_cnt;
    wire cr_pixel_ready;
    // burst_valid guarentees that once data is accepted it will stay valid for at least 16 
    StreamBuffer stream_buffer(
        .pclk(pclk),
        .fclk(fclk),
        .rst_n(rst_n),
        
        .start(start_stream),

        .din_valid(cr_pixel_valid),
        .din_ready(cr_pixel_ready), //this should never be not ready
        .din(cr_pixel[7:0]),

        .dout(sdata),
        .dout_valid(sdata_valid),
        .dout_ready(sdata_ready),
        .burst_valid(sdata_burst_valid),
        .fifo_cnt(fifo_cnt)
    );
    
    `REG(pclk, debug_cnt[2], 32'h0, {1'b0,20'h0,fifo_cnt})

    reg running;
    `REG(pclk, running, 0, start_stream ? 1'b1 : running)
 
    `REG(CLK_24M, debug_cnt[0], 32'h0, debug_cnt[0]+1'b1)
    `REG(pclk, debug_cnt[1], 32'h0, debug_cnt[1]+1'b1)


    assign debug0 = fifo_cnt;
    assign debug1 = debug_cnt[1];
    assign debug2 = vlen[31:0];
    assign debug3 = hlen[31:0];

endmodule
