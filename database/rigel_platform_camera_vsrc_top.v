// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

`include "macros.vh"
module top
  (
    inout [53:0] MIO,
    inout PS_SRSTB,
    inout PS_CLK,
    inout PS_PORB,
    inout DDR_Clk,
    inout DDR_Clk_n,
    inout DDR_CKE,
    inout DDR_CS_n,
    inout DDR_RAS_n,
    inout DDR_CAS_n,
    output DDR_WEB,
    inout [2:0] DDR_BankAddr,
    inout [14:0] DDR_Addr,
    inout DDR_ODT,
    inout DDR_DRSTB,
    inout [31:0] DDR_DQ,
    inout [3:0] DDR_DM,
    inout [3:0] DDR_DQS,
    inout [3:0] DDR_DQS_n,
    inout DDR_VRN,
    inout DDR_VRP,

    // Camera IO
    input [9:2] CAM0_DIN,
    input CAM0_VSYNC,
    input CAM0_HREF,
    output CAM0_PWDN,
    input CAM0_PCLK,
    output CAM0_XCLK,
    output CAM0_SIO_C,
    inout CAM0_SIO_D,  
 
    input [9:2] CAM1_DIN,
    input CAM1_VSYNC,
    input CAM1_HREF,
    output CAM1_PWDN,
    input CAM1_PCLK,
    output CAM1_XCLK,
    output CAM1_SIO_C,
    inout CAM1_SIO_D,   

    
    output [3:0] debug,


    output VGA_VS_n,
    output VGA_HS_n,
    output [4:0] VGA_red,
    output [4:0] VGA_green,
    output [4:0] VGA_blue



  );
    
    `include "ps7_include.vh";
    
 

    wire FCLK0;
    BUFG bufg0(.I(FCLKCLK[0]),.O(FCLK0));
    wire FCLK1;
    BUFG bufg1(.I(FCLKCLK[1]),.O(FCLK1));
    
    wire rst_n;
    assign ARESETN = FCLKRESETN[0];
    assign rst_n = ARESETN;
    
    //clk25_2_X clkTest(
    //    .CLK_IN1(FCLKCLK[0]),
    //    .CLK_OUT1(FCLK0),
    //    .RESET(!rst_n)
    //);
 
    reg [31:0] incnt;
    reg [31:0] outcnt;

    `REG(FCLKCLK[0],incnt,0,incnt+1)
    `REG(FCLK0,outcnt,0,outcnt+1)

    wire CLK_25M;
    wire CLK_24M;
    wire CLK_48M;
   
      
    ClkCtrl clks(
        .CLKIN_100M(FCLK0),
        .CLKIN_96M(FCLK1),
        .CLK_25M(CLK_25M),
        .CLK_24M(CLK_24M),
        .CLK_48M(CLK_48M),
        .rst_n(rst_n)
    );
    

    wire XCLK_DIV;
    
  
    // debug counters
    
    wire [31:0] cam_debug[3:0];
    
    wire [7:0] display_debug;
    
    wire [31:0] MMIO_CMD;
    wire [31:0] MMIO_CAM0_CMD;
    wire [31:0] MMIO_CAM1_CMD;
    wire [31:0] MMIO_FRAME_BYTES0;
    wire [31:0] MMIO_TRIBUF_ADDR0;
    wire [31:0] MMIO_FRAME_BYTES1;
    wire [31:0] MMIO_TRIBUF_ADDR1;
    wire [31:0] MMIO_FRAME_BYTES2;
    wire [31:0] MMIO_TRIBUF_ADDR2;

    wire rw_cam0_cmd_valid;
    wire [17:0] rw_cam0_resp;
    wire rw_cam0_resp_valid;
    
    wire rw_cam1_cmd_valid;
    wire [17:0] rw_cam1_resp;
    wire rw_cam1_resp_valid;
    
    reg [15:0] cntCmdValid;
    `REG(FCLK0,cntCmdValid,0,cntCmdValid+rw_cam0_cmd_valid)
    reg [15:0] cntRespValid;
    `REG(FCLK0,cntRespValid,0,cntRespValid+rw_cam0_resp_valid)

    wire [31:0] pipe_in_cnt;
    wire [31:0] pipe_out_cnt;
    wire [31:0] pipe_in_tot;
    wire [31:0] pipe_out_tot;

    MMIO_slave mmio(
        .fclk(FCLK0),
        .rst_n(rst_n),
        .S_AXI_ACLK(S2M_GP0_AXI_ACLK),
        .S_AXI_ARADDR(S2M_GP0_AXI_ARADDR), 
        .S_AXI_ARID(S2M_GP0_AXI_ARID),  
        .S_AXI_ARREADY(S2M_GP0_AXI_ARREADY), 
        .S_AXI_ARVALID(S2M_GP0_AXI_ARVALID), 
        .S_AXI_AWADDR(S2M_GP0_AXI_AWADDR), 
        .S_AXI_AWID(S2M_GP0_AXI_AWID), 
        .S_AXI_AWREADY(S2M_GP0_AXI_AWREADY), 
        .S_AXI_AWVALID(S2M_GP0_AXI_AWVALID), 
        .S_AXI_BID(S2M_GP0_AXI_BID), 
        .S_AXI_BREADY(S2M_GP0_AXI_BREADY), 
        .S_AXI_BRESP(S2M_GP0_AXI_BRESP), 
        .S_AXI_BVALID(S2M_GP0_AXI_BVALID), 
        .S_AXI_RDATA(S2M_GP0_AXI_RDATA), 
        .S_AXI_RID(S2M_GP0_AXI_RID), 
        .S_AXI_RLAST(S2M_GP0_AXI_RLAST), 
        .S_AXI_RREADY(S2M_GP0_AXI_RREADY), 
        .S_AXI_RRESP(S2M_GP0_AXI_RRESP), 
        .S_AXI_RVALID(S2M_GP0_AXI_RVALID), 
        .S_AXI_WDATA(S2M_GP0_AXI_WDATA), 
        .S_AXI_WREADY(S2M_GP0_AXI_WREADY), 
        .S_AXI_WSTRB(S2M_GP0_AXI_WSTRB), 
        .S_AXI_WVALID(S2M_GP0_AXI_WVALID),

        .MMIO_CMD(MMIO_CMD[31:0]),
        .MMIO_CAM0_CMD(MMIO_CAM0_CMD[31:0]),
        .MMIO_CAM1_CMD(MMIO_CAM1_CMD[31:0]),
        .MMIO_FRAME_BYTES0(MMIO_FRAME_BYTES0[31:0]),
        .MMIO_TRIBUF_ADDR0(MMIO_TRIBUF_ADDR0[31:0]),
        .MMIO_FRAME_BYTES1(MMIO_FRAME_BYTES1[31:0]),
        .MMIO_TRIBUF_ADDR1(MMIO_TRIBUF_ADDR1[31:0]),
        .MMIO_FRAME_BYTES2(MMIO_FRAME_BYTES2[31:0]),
        .MMIO_TRIBUF_ADDR2(MMIO_TRIBUF_ADDR2[31:0]),
        .debug0(incnt[31:0]),
        .debug1(outcnt[31:0]),
        .debug2(pipe_in_tot[31:0]),
        .debug3(pipe_out_tot[31:0]),
        
        .rw_cam0_cmd_valid(rw_cam0_cmd_valid), 
        .rw_cam0_resp(rw_cam0_resp[17:0]),// {err,rw,addr,data}
        .rw_cam0_resp_valid(rw_cam0_resp_valid),
        
        .rw_cam1_cmd_valid(rw_cam1_cmd_valid), 
        .rw_cam1_resp(rw_cam1_resp[17:0]),// {err,rw,addr,data}
        .rw_cam1_resp_valid(rw_cam1_resp_valid),
        
        .MMIO_IRQ()
    );


    wire startall;
    wire stopall;
    assign startall = (MMIO_CMD == `CMD_START);
    assign stopall = (MMIO_CMD == `CMD_STOP);


    wire wr_sync0; // Allows you to sync frames
    wire wr_frame_valid0;
    wire wr_frame_ready0;
    wire [31:0] wr_FRAME_BYTES0;
    wire [31:0] wr_BUF_ADDR0;
    wire wr_frame_done0;

    //Read interface 
    wire rd_sync0; // allows you to sync frame reads
    wire rd_frame_valid0;
    wire rd_frame_ready0;
    wire [31:0] rd_FRAME_BYTES0;
    wire [31:0] rd_BUF_ADDR0;
    wire rd_frame_done0;

    assign wr_sync0 = 1;
    assign rd_sync0 = 1;

    
    tribuf_ctrl tribuf_ctrl0(

        .fclk(FCLK0),
        .rst_n(rst_n),

        //MMIO interface
        .start(startall),
        .stop(stopall),
        .FRAME_BYTES(MMIO_FRAME_BYTES0[31:0]),
        .TRIBUF_ADDR(MMIO_TRIBUF_ADDR0[31:0]),

        //Write interface (final renderer)
        
        .wr_sync(wr_sync0),
        .wr_frame_valid(wr_frame_valid0),
        .wr_frame_ready(wr_frame_ready0),
        .wr_FRAME_BYTES(wr_FRAME_BYTES0[31:0]),
        .wr_BUF_ADDR(wr_BUF_ADDR0[31:0]),
        .wr_frame_done(wr_frame_done0),
        //Read interface pipe
        .rd_sync(rd_sync0),
        .rd_frame_valid(rd_frame_valid0),
        .rd_frame_ready(rd_frame_ready0),
        .rd_FRAME_BYTES(rd_FRAME_BYTES0[31:0]),
        .rd_BUF_ADDR(rd_BUF_ADDR0[31:0]),
        .rd_frame_done(rd_frame_done0),

        .debug_wr_ptr(),
        .debug_wr_cs(),
        .debug_rd_cs(),
        .debug_rd_ptr()
    );

    wire wr_sync1; // Allows you to sync frames
    wire wr_frame_valid1;
    wire wr_frame_ready1;
    wire [31:0] wr_FRAME_BYTES1;
    wire [31:0] wr_BUF_ADDR1;
    wire wr_frame_done1;

    //Read interface 
    wire rd_sync1; // allows you to sync frame reads
    wire rd_frame_valid1;
    wire rd_frame_ready1;
    wire [31:0] rd_FRAME_BYTES1;
    wire [31:0] rd_BUF_ADDR1;
    wire rd_frame_done1;

    assign wr_sync1 = 1;
    assign rd_sync1 = 1;

    
    tribuf_ctrl tribuf_ctrl1(

        .fclk(FCLK0),
        .rst_n(rst_n),

        //MMIO interface
        .start(startall),
        .stop(stopall),
        .FRAME_BYTES(MMIO_FRAME_BYTES1[31:0]),
        .TRIBUF_ADDR(MMIO_TRIBUF_ADDR1[31:0]),

        //Write interface (final renderer)
        
        .wr_sync(wr_sync1),
        .wr_frame_valid(wr_frame_valid1),
        .wr_frame_ready(wr_frame_ready1),
        .wr_FRAME_BYTES(wr_FRAME_BYTES1[31:0]),
        .wr_BUF_ADDR(wr_BUF_ADDR1[31:0]),
        .wr_frame_done(wr_frame_done1),
        //Read interface pipe
        .rd_sync(rd_sync1),
        .rd_frame_valid(rd_frame_valid1),
        .rd_frame_ready(rd_frame_ready1),
        .rd_FRAME_BYTES(rd_FRAME_BYTES1[31:0]),
        .rd_BUF_ADDR(rd_BUF_ADDR1[31:0]),
        .rd_frame_done(rd_frame_done1),

        .debug_wr_ptr(),
        .debug_wr_cs(),
        .debug_rd_cs(),
        .debug_rd_ptr()
    );




    // Writer
    wire wr_sync2; 
    wire wr_frame_valid2;
    wire wr_frame_ready2;
    wire [31:0] wr_FRAME_BYTES2;
    wire [31:0] wr_BUF_ADDR2;
    wire wr_frame_done2;
     
    //Read interface 
    wire rd_sync2; // allows you to sync frame reads
    wire rd_frame_valid2;
    wire rd_frame_ready2;
    wire [31:0] rd_FRAME_BYTES2;
    wire [31:0] rd_BUF_ADDR2;
    wire rd_frame_done2;

    assign wr_sync2 = 1;
    assign rd_sync2 = 1;

    tribuf_ctrl tribuf_ctrl2(

        .fclk(FCLK0),
        .rst_n(rst_n),

        //MMIO interface
        .start(startall),
        .stop(stopall),
        .FRAME_BYTES(MMIO_FRAME_BYTES2[31:0]),
        .TRIBUF_ADDR(MMIO_TRIBUF_ADDR2[31:0]),

        //Write interface (final renderer)
        
        .wr_sync(wr_sync2),
        .wr_frame_valid(wr_frame_valid2),
        .wr_frame_ready(wr_frame_ready2),
        .wr_FRAME_BYTES(wr_FRAME_BYTES2[31:0]),
        .wr_BUF_ADDR(wr_BUF_ADDR2[31:0]),
        .wr_frame_done(wr_frame_done2),
        //Read interface pipe
        .rd_sync(rd_sync2),
        .rd_frame_valid(rd_frame_valid2),
        .rd_frame_ready(rd_frame_ready2),
        .rd_FRAME_BYTES(rd_FRAME_BYTES2[31:0]),
        .rd_BUF_ADDR(rd_BUF_ADDR2[31:0]),
        .rd_frame_done(rd_frame_done2),

        .debug_wr_ptr(),
        .debug_wr_cs(),
        .debug_rd_cs(),
        .debug_rd_ptr()
    );

//---------------------------------------------------------------

//---------------------------------------------------------------
// CAMERA 0
//---------------------------------------------------------------



    wire [63:0] cam02dramw_data;
    wire cam02dramw_valid;
    wire cam02dramw_burst_valid;
    wire cam02dramw_ready;

    CamOV7660 cam0OV7660_inst(
        //general
        .fclk(FCLK0),
        .CLK_24M(CLK_24M),
        .CLK_48M(CLK_48M),
        .rst_n(rst_n),
        // Camera IO
        .CAM_DIN(CAM0_DIN[9:2]),
        .CAM_VSYNC(CAM0_VSYNC),
        .CAM_HREF(CAM0_HREF),
        .CAM_PWDN(CAM0_PWDN),
        .CAM_PCLK(CAM0_PCLK),
        .CAM_XCLK(CAM0_XCLK),
        .CAM_SIO_C(CAM0_SIO_C),
        .CAM_SIO_D(CAM0_SIO_D),
        //Camera register setup
        
        .rw_cmd(MMIO_CAM0_CMD[16:0]),  //{rw,addr,data}
        .rw_cmd_valid(rw_cam0_cmd_valid), 
        .rw_resp(rw_cam0_resp[17:0]),// {err,rw,addr,data}
        .rw_resp_valid(rw_cam0_resp_valid),
        
        //camera stream ctrl
        .cam_cmd(`CMD_START),
        .cam_cmd_valid(startall),
        .cam_cmd_ready(),
        //camera output
        
        .sdata_burst_valid(cam02dramw_burst_valid),
        .sdata_valid(cam02dramw_valid),
        .sdata_ready(cam02dramw_ready),
        .sdata(cam02dramw_data[63:0]),
        
        // debug signals
        .debug0(cam_debug[0]),
        .debug1(cam_debug[1]),
        .debug2(cam_debug[2]),
        .debug3(cam_debug[3])
    );


    DramWriter cam0_writer(
        .fclk(FCLK0),
        .rst_n(rst_n),
        
        .M2S_AXI_ACLK(M2S_HP0_AXI_ACLK),
        .M2S_AXI_AWADDR(M2S_HP0_AXI_AWADDR),
        .M2S_AXI_AWREADY(M2S_HP0_AXI_AWREADY),
        .M2S_AXI_AWVALID(M2S_HP0_AXI_AWVALID),
        .M2S_AXI_WDATA(M2S_HP0_AXI_WDATA),
        .M2S_AXI_WREADY(M2S_HP0_AXI_WREADY),
        .M2S_AXI_WVALID(M2S_HP0_AXI_WVALID),
        .M2S_AXI_WLAST(M2S_HP0_AXI_WLAST),
        .M2S_AXI_WSTRB(M2S_HP0_AXI_WSTRB),
        
        .M2S_AXI_BRESP(M2S_HP0_AXI_BRESP),
        .M2S_AXI_BREADY(M2S_HP0_AXI_BREADY),
        .M2S_AXI_BVALID(M2S_HP0_AXI_BVALID),
        
        .M2S_AXI_AWLEN(M2S_HP0_AXI_AWLEN),
        .M2S_AXI_AWSIZE(M2S_HP0_AXI_AWSIZE),
        .M2S_AXI_AWBURST(M2S_HP0_AXI_AWBURST),
        
        .wr_frame_valid(wr_frame_valid0),
        .wr_frame_ready(wr_frame_ready0),
        .wr_FRAME_BYTES(wr_FRAME_BYTES0[31:0]),
        .wr_BUF_ADDR(wr_BUF_ADDR0[31:0]),
    
        .debug_astate(),


        .din_burst_valid(cam02dramw_burst_valid),
        .din_valid(cam02dramw_valid),
        .din_ready(cam02dramw_ready),
        .din(cam02dramw_data[63:0])
    );
    
//-----------------------------------------------------------------------------  
 
//---------------------------------------------------------------
// CAMERA 1
//---------------------------------------------------------------



    wire [63:0] cam12dramw_data;
    wire cam12dramw_valid;
    wire cam12dramw_burst_valid;
    wire cam12dramw_ready;

    CamOV7660 cam1OV7660_inst(
        //general
        .fclk(FCLK0),
        .CLK_24M(CLK_24M),
        .CLK_48M(CLK_48M),
        .rst_n(rst_n),
        // Camera IO
        .CAM_DIN(CAM1_DIN[9:2]),
        .CAM_VSYNC(CAM1_VSYNC),
        .CAM_HREF(CAM1_HREF),
        .CAM_PWDN(CAM1_PWDN),
        .CAM_PCLK(CAM1_PCLK),
        .CAM_XCLK(CAM1_XCLK),
        .CAM_SIO_C(CAM1_SIO_C),
        .CAM_SIO_D(CAM1_SIO_D),
        //Camera register setup
        
        .rw_cmd(MMIO_CAM1_CMD[16:0]),  //{rw,addr,data}
        .rw_cmd_valid(rw_cam1_cmd_valid), 
        .rw_resp(rw_cam1_resp[17:0]),// {err,rw,addr,data}
        .rw_resp_valid(rw_cam1_resp_valid),
        
        //camera stream ctrl
        .cam_cmd(`CMD_START),
        .cam_cmd_valid(startall),
        .cam_cmd_ready(),
        //camera output
        
        .sdata_burst_valid(cam12dramw_burst_valid),
        .sdata_valid(cam12dramw_valid),
        .sdata_ready(cam12dramw_ready),
        .sdata(cam12dramw_data[63:0]),
        
        // debug signals
        .debug0(),
        .debug1(),
        .debug2(),
        .debug3()
    );

    DramWriter cam1_writer(
        .fclk(FCLK0),
        .rst_n(rst_n),
        
        .M2S_AXI_ACLK(M2S_HP1_AXI_ACLK),
        .M2S_AXI_AWADDR(M2S_HP1_AXI_AWADDR),
        .M2S_AXI_AWREADY(M2S_HP1_AXI_AWREADY),
        .M2S_AXI_AWVALID(M2S_HP1_AXI_AWVALID),
        .M2S_AXI_WDATA(M2S_HP1_AXI_WDATA),
        .M2S_AXI_WREADY(M2S_HP1_AXI_WREADY),
        .M2S_AXI_WVALID(M2S_HP1_AXI_WVALID),
        .M2S_AXI_WLAST(M2S_HP1_AXI_WLAST),
        .M2S_AXI_WSTRB(M2S_HP1_AXI_WSTRB),
        
        .M2S_AXI_BRESP(M2S_HP1_AXI_BRESP),
        .M2S_AXI_BREADY(M2S_HP1_AXI_BREADY),
        .M2S_AXI_BVALID(M2S_HP1_AXI_BVALID),
        
        .M2S_AXI_AWLEN(M2S_HP1_AXI_AWLEN),
        .M2S_AXI_AWSIZE(M2S_HP1_AXI_AWSIZE),
        .M2S_AXI_AWBURST(M2S_HP1_AXI_AWBURST),
        
        .wr_frame_valid(wr_frame_valid1),
        .wr_frame_ready(wr_frame_ready1),
        .wr_FRAME_BYTES(wr_FRAME_BYTES1[31:0]),
        .wr_BUF_ADDR(wr_BUF_ADDR1[31:0]),
    
        .debug_astate(),


        .din_burst_valid(cam12dramw_burst_valid),
        .din_valid(cam12dramw_valid),
        .din_ready(cam12dramw_ready),
        .din(cam12dramw_data[63:0])
    );
    
//-----------------------------------------------------------------------------  
    
    wire dramr02pipe_valid;
    wire dramr02pipe_ready;
    wire [63:0] dramr02pipe_data;

    DramReaderBuf pipe_reader0(
        .fclk(FCLK0),
        .rst_n(rst_n),
        
        .M2S_AXI_ACLK(), // clock is already driven
        .M2S_AXI_ARADDR(M2S_HP0_AXI_ARADDR),
        .M2S_AXI_ARREADY(M2S_HP0_AXI_ARREADY),
        .M2S_AXI_ARVALID(M2S_HP0_AXI_ARVALID),
        .M2S_AXI_RDATA(M2S_HP0_AXI_RDATA),
        .M2S_AXI_RREADY(M2S_HP0_AXI_RREADY),
        .M2S_AXI_RRESP(M2S_HP0_AXI_RRESP),
        .M2S_AXI_RVALID(M2S_HP0_AXI_RVALID),
        .M2S_AXI_RLAST(M2S_HP0_AXI_RLAST),
        .M2S_AXI_ARLEN(M2S_HP0_AXI_ARLEN),
        .M2S_AXI_ARSIZE(M2S_HP0_AXI_ARSIZE),
        .M2S_AXI_ARBURST(M2S_HP0_AXI_ARBURST),
        
        .rd_frame_valid(rd_frame_valid0),
        .rd_frame_ready(rd_frame_ready0),
        .rd_FRAME_BYTES(rd_FRAME_BYTES0[31:0]),
        .rd_BUF_ADDR(rd_BUF_ADDR0[31:0]),

        .debug_astate(),

        .dout_ready(dramr02pipe_ready),
        .dout_valid(dramr02pipe_valid),
        .dout(dramr02pipe_data[63:0])
    );
    
   
    wire dramr12pipe_valid;
    wire dramr12pipe_ready;
    wire [63:0] dramr12pipe_data;

    DramReaderBuf pipe_reader1(
        .fclk(FCLK0),
        .rst_n(rst_n),
        
        .M2S_AXI_ACLK(), // clock is already driven
        .M2S_AXI_ARADDR(M2S_HP1_AXI_ARADDR),
        .M2S_AXI_ARREADY(M2S_HP1_AXI_ARREADY),
        .M2S_AXI_ARVALID(M2S_HP1_AXI_ARVALID),
        .M2S_AXI_RDATA(M2S_HP1_AXI_RDATA),
        .M2S_AXI_RREADY(M2S_HP1_AXI_RREADY),
        .M2S_AXI_RRESP(M2S_HP1_AXI_RRESP),
        .M2S_AXI_RVALID(M2S_HP1_AXI_RVALID),
        .M2S_AXI_RLAST(M2S_HP1_AXI_RLAST),
        .M2S_AXI_ARLEN(M2S_HP1_AXI_ARLEN),
        .M2S_AXI_ARSIZE(M2S_HP1_AXI_ARSIZE),
        .M2S_AXI_ARBURST(M2S_HP1_AXI_ARBURST),
        
        .rd_frame_valid(rd_frame_valid1),
        .rd_frame_ready(rd_frame_ready1),
        .rd_FRAME_BYTES(rd_FRAME_BYTES1[31:0]),
        .rd_BUF_ADDR(rd_BUF_ADDR1[31:0]),

        .debug_astate(),

        .dout_ready(dramr12pipe_ready),
        .dout_valid(dramr12pipe_valid),
        .dout(dramr12pipe_data[63:0])
    );


// PIPELINE
    wire [3:0] num_frames;

    wire dramr2pipe_valid;
    wire dramr2pipe_ready;
    wire [63:0] dramr2pipe_data;

   
    wire ser02pipe_valid;
    wire ser02pipe_ready;
    wire [31:0] ser02pipe_data;
    
    wire ser12pipe_valid;
    wire ser12pipe_ready;
    wire [31:0] ser12pipe_data;



    serializer #(.INLOGBITS(6), .OUTLOGBITS(5)) inst_cam0(
        
        .clk(FCLK0),
        .rst_n(rst_n),

        .in_valid(dramr02pipe_valid),
        .in_ready(dramr02pipe_ready),
        .in_data(dramr02pipe_data),

        .out_valid(ser02pipe_valid),
        .out_ready(ser02pipe_ready),
        .out_data(ser02pipe_data)

    );
    
    serializer #(.INLOGBITS(6), .OUTLOGBITS(5)) inst_cam1(
        
        .clk(FCLK0),
        .rst_n(rst_n),

        .in_valid(dramr12pipe_valid),
        .in_ready(dramr12pipe_ready),
        .in_data(dramr12pipe_data),

        .out_valid(ser12pipe_valid),
        .out_ready(ser12pipe_ready),
        .out_data(ser12pipe_data)

    );

  

    assign dramr2pipe_data = {
        ser02pipe_data[31:24],ser12pipe_data[31:24],
        ser02pipe_data[23:16],ser12pipe_data[23:16],
        ser02pipe_data[15:8],ser12pipe_data[15:8],
        ser02pipe_data[7:0],ser12pipe_data[7:0]
    };
    assign dramr2pipe_valid = ser02pipe_valid && ser12pipe_valid;
    assign ser02pipe_ready = dramr2pipe_valid && dramr2pipe_ready;
    assign ser12pipe_ready = dramr2pipe_valid && dramr2pipe_ready;


    wire [63:0] pipe2dramw_data;
    wire pipe2dramw_valid;
    wire pipe2dramw_ready;
    
    
    pipeWrap pipeWrap_inst(
        .clk(FCLK0),
        .rst_n(rst_n),

        .start(startall),

        .in_valid(dramr2pipe_valid),
        .in_ready(dramr2pipe_ready),
        .in_data(dramr2pipe_data[63:0]),

        .out_valid(pipe2dramw_valid),
        .out_ready(pipe2dramw_ready),
        .out_data(pipe2dramw_data[63:0])
        
    );
    


    DramWriterBuf pipe_writer2(
        .fclk(FCLK0),
        .rst_n(rst_n),
        
        .M2S_AXI_ACLK(M2S_HP2_AXI_ACLK),
        .M2S_AXI_AWADDR(M2S_HP2_AXI_AWADDR),
        .M2S_AXI_AWREADY(M2S_HP2_AXI_AWREADY),
        .M2S_AXI_AWVALID(M2S_HP2_AXI_AWVALID),
        .M2S_AXI_WDATA(M2S_HP2_AXI_WDATA),
        .M2S_AXI_WREADY(M2S_HP2_AXI_WREADY),
        .M2S_AXI_WVALID(M2S_HP2_AXI_WVALID),
        .M2S_AXI_WLAST(M2S_HP2_AXI_WLAST),
        .M2S_AXI_WSTRB(M2S_HP2_AXI_WSTRB),
        
        .M2S_AXI_BRESP(M2S_HP2_AXI_BRESP),
        .M2S_AXI_BREADY(M2S_HP2_AXI_BREADY),
        .M2S_AXI_BVALID(M2S_HP2_AXI_BVALID),
        
        .M2S_AXI_AWLEN(M2S_HP2_AXI_AWLEN),
        .M2S_AXI_AWSIZE(M2S_HP2_AXI_AWSIZE),
        .M2S_AXI_AWBURST(M2S_HP2_AXI_AWBURST),
        
        .wr_frame_valid(wr_frame_valid2),
        .wr_frame_ready(wr_frame_ready2),
        .wr_FRAME_BYTES(wr_FRAME_BYTES2[31:0]),
        .wr_BUF_ADDR(wr_BUF_ADDR2[31:0]),
    
        .debug_astate(),

        //.din_valid(dramr12pipe_valid),
        //.din_ready(dramr12pipe_ready),
        //.din(dramr12pipe_data[63:0])
        
        .din_valid(pipe2dramw_valid),
        .din_ready(pipe2dramw_ready),
        .din(pipe2dramw_data[63:0])
    );


    //-----------------------------------------------------------------------------
    



    wire [31:0] cur_vga_addr;
    wire [7:0] VGA_red_full;
    wire [7:0] VGA_green_full;
    wire [7:0] VGA_blue_full;

    wire [31:0] vga_cmd;
    wire vga_cmd_valid;
    assign vga_cmd = startall ? `CMD_START : stopall ? `CMD_STOP : 32'h0;
    assign vga_cmd_valid = startall | stopall;
    
    wire dramr2display_burst_ready;
    wire dramr2display_valid;
    wire dramr2display_ready;
    wire [63:0] dramr2display_data;
    
    DramReader vga_reader2(
        .fclk(FCLK0),
        .rst_n(rst_n),
        
        .M2S_AXI_ACLK(), // clock is already driven
        .M2S_AXI_ARADDR(M2S_HP2_AXI_ARADDR),
        .M2S_AXI_ARREADY(M2S_HP2_AXI_ARREADY),
        .M2S_AXI_ARVALID(M2S_HP2_AXI_ARVALID),
        .M2S_AXI_RDATA(M2S_HP2_AXI_RDATA),
        .M2S_AXI_RREADY(M2S_HP2_AXI_RREADY),
        .M2S_AXI_RRESP(M2S_HP2_AXI_RRESP),
        .M2S_AXI_RVALID(M2S_HP2_AXI_RVALID),
        .M2S_AXI_RLAST(M2S_HP2_AXI_RLAST),
        .M2S_AXI_ARLEN(M2S_HP2_AXI_ARLEN),
        .M2S_AXI_ARSIZE(M2S_HP2_AXI_ARSIZE),
        .M2S_AXI_ARBURST(M2S_HP2_AXI_ARBURST),
        
        .rd_frame_valid(rd_frame_valid2),
        .rd_frame_ready(rd_frame_ready2),
        .rd_FRAME_BYTES(rd_FRAME_BYTES2[31:0]),
        .rd_BUF_ADDR(rd_BUF_ADDR2[31:0]),

        .debug_astate(),

        .dout_burst_ready(dramr2display_burst_ready),
        .dout_ready(dramr2display_ready),
        .dout_valid(dramr2display_valid),
        .dout(dramr2display_data[63:0])
    );

    wire pvalid;

    display vga_display(
        .fclk(FCLK0),
        .rst_n(rst_n),
        .vgaclk(CLK_25M),
        
        .vga_cmd(vga_cmd),
        .vga_cmd_valid(vga_cmd_valid),
        .vga_cmd_ready(),

        .VGA_VS_n(VGA_VS_n),
        .VGA_HS_n(VGA_HS_n),
        .VGA_red(VGA_red_full[7:0]),
        .VGA_green(VGA_green_full[7:0]),
        .VGA_blue(VGA_blue_full[7:0]),
        .pvalid(pvalid),
        .sdata_burst_ready(dramr2display_burst_ready),
        .sdata_valid(dramr2display_valid),
        .sdata_ready(dramr2display_ready),
        .sdata(dramr2display_data[63:0]),

        .debug(display_debug[7:0])
    );
    
    assign VGA_red[4:0] = pvalid ? VGA_red_full[7:3] : 0;
    assign VGA_green[4:0] = pvalid ? VGA_green_full[7:3] : 0;
    assign VGA_blue[4:0] = pvalid ? VGA_blue_full[7:3] : 0;

    //assign VGA_red[4:0] = pvalid ? 5'b11111 : 0;
    //assign VGA_green[4:0] = pvalid ? 5'h0 : 0;
    //assign VGA_blue[4:0] = pvalid ? 5'h0 : 0;
    
    reg [31:0] debug_cnt;
    `REG(CLK_25M, debug_cnt, 2, debug_cnt+1'b1)

    assign debug[3:0] = debug_cnt[12:9];

endmodule : top

