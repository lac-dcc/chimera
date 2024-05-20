// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <NULL>
*
* If there is no OPEN-SOURCE licenses are listed, it indicates none of
* content in this Code document is sourced from OPEN-SOURCE communities. 
*
* In this case, the document is protected by copyright, and any use of
* all or part of its content by individuals, organizations, or companies
* without authorization is prohibited, unless the project repository
* associated with this document has added relevant OPEN-SOURCE licenses
* by github.com/MongooseOrion. 
*
* Please make sure using the content of this document in accordance with 
* the respective OPEN-SOURCE licenses. 
* 
* THIS CODE IS PROVIDED BY https://github.com/MongooseOrion. 
* FILE ENCODER TYPE: GBK
* ========================================================================
*/
// 图像数据输入输出
// 
module image_global#(
    parameter       MEM_ROW_WIDTH        = 15    ,
    parameter       MEM_COLUMN_WIDTH     = 10    ,
    parameter       MEM_BANK_WIDTH       = 3     ,
    parameter       CTRL_ADDR_WIDTH = MEM_ROW_WIDTH + MEM_BANK_WIDTH + MEM_COLUMN_WIDTH,
    parameter       MEM_DQ_WIDTH         = 32    
)(
    input               sys_clk                      ,
    input               ddr_clk                     /*synthesis PAP_MARK_DEBUG="1"*/,
    input               sys_rst                     ,
    input               ddr_init                    /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [3:0]   ctrl_command_in             ,
    input       [3:0]   value_command_in            ,
    input               command_flag               ,

    // 字符显示需要的信息
    output reg  [2:0]   channel_index               ,
    output reg  [8:0]   angle_num                   ,
    output reg  [10:0]  scale_value                 ,
    
    // 图像数据输入
    input               cmos1_pclk                  ,
    input               cmos1_href                  ,
    input               cmos1_vsync                 ,
    input       [15:0]  cmos1_pix_data              ,
    input               cmos2_pclk                  ,
    input               cmos2_href                  ,
    input               cmos2_vsync                 ,
    input       [15:0]  cmos2_pix_data              ,
    input               cmos_fusion_pclk            ,
    input               cmos_fusion_href            ,
    input               cmos_fusion_vsync           ,
    input       [15:0]  cmos_fusion_data            ,
    input               hdmi_pclk                   ,
    input               hdmi_href                   ,
    input               hdmi_vsync                  ,
    input       [15:0]  hdmi_pix_data               ,

    // 最终产生的 HDMI 时序用于同步
    input                           vesa_out_clk    ,
    input                           vesa_out_vsync  ,
    input                           vesa_out_de     /*synthesis PAP_MARK_DEBUG="1"*/ ,
    output [15:0]                   vesa_out_data   /*synthesis PAP_MARK_DEBUG="1"*/,
    output                          de_out          /*synthesis PAP_MARK_DEBUG="1"*/,
    
    // AXI 总线
    output [CTRL_ADDR_WIDTH-1:0]    axi_awaddr      /*synthesis PAP_MARK_DEBUG="1"*/,
    output [3:0]                    axi_awid        ,
    output [3:0]                    axi_awlen       ,
    output [2:0]                    axi_awsize      ,
    output [1:0]                    axi_awburst     ,
    input                           axi_awready     /*synthesis PAP_MARK_DEBUG="1"*/,
    output                          axi_awvalid    /*synthesis PAP_MARK_DEBUG="1"*/ ,

    output [MEM_DQ_WIDTH*8-1:0]     axi_wdata       ,
    output [MEM_DQ_WIDTH -1 :0]     axi_wstrb       ,
    input                           axi_wlast       /*synthesis PAP_MARK_DEBUG="1"*/,
    output                          axi_wvalid      ,
    input                           axi_wready      /*synthesis PAP_MARK_DEBUG="1"*/,
    input  [3 : 0]                  axi_bid         ,                                      

    output [CTRL_ADDR_WIDTH-1:0]    axi_araddr     /*synthesis PAP_MARK_DEBUG="1"*/ ,
    output [3:0]                    axi_arid        ,
    output [3:0]                    axi_arlen       ,
    output [2:0]                    axi_arsize      ,
    output [1:0]                    axi_arburst     ,
    output                          axi_arvalid     /*synthesis PAP_MARK_DEBUG="1"*/,
    input                           axi_arready     /*synthesis PAP_MARK_DEBUG="1"*/,

    output                          axi_rready     /*synthesis PAP_MARK_DEBUG="1"*/ ,
    input  [MEM_DQ_WIDTH*8-1:0]     axi_rdata       ,
    input                           axi_rvalid     /*synthesis PAP_MARK_DEBUG="1"*/ ,
    input                           axi_rlast       /*synthesis PAP_MARK_DEBUG="1"*/,
    input  [3:0]                    axi_rid         ,

    output                          init_done /*synthesis PAP_MARK_DEBUG="1"*/
);

wire                            channel1_rd_en      ;
wire                            channel1_rready     /* synthesis syn_keep = 1 */;
wire [MEM_DQ_WIDTH*8-1'b1:0]    channel1_data       ;
wire                            channel2_rd_en      ;
wire                            channel2_rready     /* synthesis syn_keep = 1 */;
wire [MEM_DQ_WIDTH*8-1'b1:0]    channel2_data       ;
wire                            channel3_rd_en      ;
wire                            channel3_rready     ;
wire [MEM_DQ_WIDTH*8-1'b1:0]    channel3_data       ;
wire                            channel4_rd_en      ;
wire                            channel4_rready     /* synthesis syn_keep = 1 */;
wire [MEM_DQ_WIDTH*8-1'b1:0]    channel4_data       ;
wire                            channel5_rd_en      ;
wire                            channel5_rready     ;
wire [MEM_DQ_WIDTH*8-1'b1:0]    channel5_data       ;
wire                            buf_wr_en           ;
wire [MEM_DQ_WIDTH*8-1'b1:0]    buf_wr_data         ;
wire                            init_tc_done        ;
wire                            init_qd_done        ;
wire [15:0]                     rgb565_out_1        ;
wire [15:0]                     rgb565_out_2        ;                  

reg [3:0]   reg_value_command   /*synthesis PAP_MARK_DEBUG="1"*/;
reg         ultimate_clk_in     ;
reg         ultimate_de_in      ;
reg         ultimate_vs_in      ;
reg [15:0]  ultimate_data_in    ;
reg [3:0]   rotate_mode         ;
reg [3:0]   mirror_mode         ;
reg [3:0]   scale_mode          ;


// 照相机 1 1/16
video_sampling_1 #(
    .IMAGE_TAG          (4'd1),
    .SEL_MODE           (2'd1)
)video_sampling_cmos1 (
    .clk                (cmos1_pclk         ),
    .rst                (sys_rst            ),
    .de_in              (cmos1_href         ),
    .vs_in              (cmos1_vsync        ),
    .rgb565_in          (cmos1_pix_data     ),
    .rd_clk             (ddr_clk            ),
    .rd_en              (channel1_rd_en     ),
    .data_out_ready     (channel1_rready    ),
    .rd_data            (channel1_data      ),
    .burst_emergency    (),
    .trans_id           ()
);


// 照相机 2 1/16
video_sampling_1 #(
    .IMAGE_TAG          (4'd2),
    .SEL_MODE           (2'd1)
)video_sampling_cmos2 (
    .clk                (cmos2_pclk         ),
    .rst                (sys_rst            ),
    .de_in              (cmos2_href         ),
    .vs_in              (cmos2_vsync        ),
    .rgb565_in          (cmos2_pix_data     ),
    .rd_clk             (ddr_clk            ),
    .rd_en              (channel2_rd_en     ),
    .data_out_ready     (channel2_rready    ),
    .rd_data            (channel2_data      ),
    .burst_emergency    (),
    .trans_id           ()
);


// 照相机融合视图 1/16
video_sampling_1 #(
    .IMAGE_TAG          (4'd3),
    .SEL_MODE           (2'd1)
)video_sampling_cmos_fusion (
    .clk                (cmos_fusion_pclk   ),
    .rst                (sys_rst            ),
    .de_in              (cmos_fusion_href   ),
    .vs_in              (cmos_fusion_vsync  ),
    .rgb565_in          (cmos_fusion_data   ),
    .rd_clk             (ddr_clk            ),
    .rd_en              (channel3_rd_en     ),
    .data_out_ready     (channel3_rready    ),
    .rd_data            (channel3_data      ),
    .burst_emergency    (),
    .trans_id           ()
);


// HDMI 1/16
video_sampling_1 #(
    .IMAGE_TAG          (4'd4),
    .SEL_MODE           (2'd1)
)video_sampling_hdmi (
    .clk                (hdmi_pclk          ),
    .rst                (sys_rst            ),
    .de_in              (hdmi_href          ),
    .vs_in              (hdmi_vsync         ),
    .rgb565_in          (hdmi_pix_data      ),
    .rd_clk             (ddr_clk            ),
    .rd_en              (channel4_rd_en     ),
    .data_out_ready     (channel4_rready    ),
    .rd_data            (channel4_data      ),
    .burst_emergency    (),
    .trans_id           ()
);


// 旋转、翻转模式控制
always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst) begin
        mirror_mode <= 'd0; 
        rotate_mode <= 'd0;
    end
    else if(ctrl_command_in == 4'b0011 && command_flag == 1'b1) begin
        rotate_mode <= value_command_in;
    end
    else if(ctrl_command_in == 4'b0100 && command_flag == 1'b1) begin
        if (value_command_in == 'd2) begin   //切换到水平镜像时，先旋转180°
            mirror_mode <= 4'd2; 
            rotate_mode <= 4'd1;
        end
        else if (value_command_in == 'd0) begin
            mirror_mode <= 4'd0;
            rotate_mode <= 4'd0;            
        end
        else begin
            mirror_mode <= value_command_in;
            rotate_mode <= rotate_mode;
        end
    end
    else begin
        mirror_mode <= mirror_mode;
        rotate_mode <= rotate_mode;        
    end
end


// 缩放模式控制
always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst) begin
        scale_mode <= 'b0;
    end
    else if((ctrl_command_in == 4'b0010) && (command_flag == 1'b1)) begin
        if(value_command_in == 4'd11) begin
            scale_mode <= 4'd10;
        end
        else begin
            scale_mode <= value_command_in;
        end
    end
    else begin
        scale_mode <= scale_mode;
    end
end


// 输出图像 9/16
// 960*560
always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst) begin
        reg_value_command <= 'b0;
    end
    else if((ctrl_command_in == 4'b1111) && (command_flag == 1'b1)) begin
        reg_value_command <= value_command_in;
    end
    else begin
        reg_value_command <= reg_value_command;
    end
end

always @(*) begin
    if(reg_value_command == 4'd0) begin
        ultimate_clk_in <= cmos1_pclk;
        ultimate_vs_in <= cmos1_vsync;
        ultimate_de_in <= cmos1_href;
        ultimate_data_in <= cmos1_pix_data;
    end
    else if(reg_value_command == 4'd1) begin
        ultimate_clk_in <= cmos1_pclk;
        ultimate_vs_in <= cmos1_vsync;
        ultimate_de_in <= cmos1_href;
        ultimate_data_in <= cmos1_pix_data;
    end
    else if(reg_value_command == 4'd2) begin
        ultimate_clk_in <= cmos2_pclk;
        ultimate_vs_in <= cmos2_vsync;
        ultimate_de_in <= cmos2_href;
        ultimate_data_in <= cmos2_pix_data;
    end
    else if(reg_value_command == 4'd3) begin
        ultimate_clk_in <= cmos_fusion_pclk;
        ultimate_vs_in <= cmos_fusion_vsync;
        ultimate_de_in <= cmos_fusion_href;
        ultimate_data_in <= cmos_fusion_data;
    end
    else if(reg_value_command == 4'd4) begin
        ultimate_clk_in <= hdmi_pclk;
        ultimate_vs_in <= hdmi_vsync;
        ultimate_de_in <= hdmi_href;
        ultimate_data_in <= hdmi_pix_data;
    end
    else begin
        ultimate_clk_in <= ultimate_clk_in;
        ultimate_vs_in <= ultimate_vs_in;
        ultimate_de_in <= ultimate_de_in;
        ultimate_data_in <= ultimate_data_in;
    end
end

video_sampling_2 #(
    .IMAGE_TAG          (4'd5)
)video_sampling_ultimate (
    .clk                (ultimate_clk_in    ),
    .rst                (sys_rst            ),
    .vs_in              (ultimate_vs_in     ),
    .de_in              (ultimate_de_in     ),
    .rgb565_in          (ultimate_data_in   ),
    .scale_mode         (scale_mode         ),
    .rd_clk             (ddr_clk            ),
    .rd_en              (channel5_rd_en     ),
    .data_out_ready     (channel5_rready    ),
    .rd_data            (channel5_data      ),
    .burst_emergency    (),
    .trans_id           ()
);


// 数据经过 AXI 总线写入 DDR
axi_interconnect_wr u_axi_interconnect_wr(
    .clk                            (ddr_clk            ),
    .rst                            (ddr_init           ),

    .channel1_vsync                 (cmos1_vsync        ),
    .channel1_rready                (channel1_rready    ),
    .channel1_rd_en                 (channel1_rd_en     ),
    .channel1_data                  (channel1_data      ),

    .channel2_vsync                 (cmos2_vsync        ),
    .channel2_rready                (channel2_rready    ),
    .channel2_rd_en                 (channel2_rd_en     ),
    .channel2_data                  (channel2_data      ),

    .channel3_vsync                 (cmos_fusion_vsync  ),
    .channel3_rready                (channel3_rready    ),
    .channel3_rd_en                 (channel3_rd_en     ),
    .channel3_data                  (channel3_data      ),

    .channel4_vsync                 (hdmi_vsync     ),
    .channel4_rready                (channel4_rready    ),
    .channel4_rd_en                 (channel4_rd_en     ),
    .channel4_data                  (channel4_data      ),

    .channel5_vsync                 (ultimate_vs_in     ),
    .channel5_rready                (channel5_rready    ),
    .channel5_rd_en                 (channel5_rd_en     ),
    .channel5_data                  (channel5_data      ),
    
    .init_qd_done                   (init_qd_done       ),
    .init_tc_done                   (init_tc_done       ),
    .init_done                      (init_done          ),

    .axi_awaddr                     (axi_awaddr  ),
    .axi_awid                       (axi_awid    ),
    .axi_awlen                      (axi_awlen   ),
    .axi_awsize                     (axi_awsize  ),
    .axi_awburst                    (axi_awburst ),
    .axi_awready                    (axi_awready ),
    .axi_awvalid                    (axi_awvalid ),
    .axi_wdata                      (axi_wdata   ),
    .axi_wstrb                      (axi_wstrb   ),
    .axi_wlast                      (axi_wlast   ),
    .axi_wvalid                     (axi_wvalid  ),
    .axi_wready                     (axi_wready  ),
    .axi_bid                        (axi_bid     ),
    .axi_bvalid                     (axi_bvalid  ),
    .axi_bready                     (axi_bready  )
);


// 数据经过 AXI 读取出 DDR
axi_interconnect_rd u_axi_interconnect_rd(
    .clk                        (ddr_clk        ),
    .rst                        (ddr_init       ),

    .hdmi_vsync                 (vesa_out_vsync ),
    .hdmi_href                  (vesa_out_de    ),
    .frame_instruct             (frame_instruct ),
    .buf_wr_data                (buf_wr_data ),
    .buf_wr_en                  (buf_wr_en   ),
    .rotate_mode                (rotate_mode ),

    .axi_arvalid                (axi_arvalid ),
    .axi_arready                (axi_arready ),
    .axi_araddr                 (axi_araddr  ),
    .axi_arid                   (axi_arid    ),
    .axi_arlen                  (axi_arlen   ),
    .axi_arsize                 (axi_arsize  ),
    .axi_arburst                (axi_arburst ),        
    .axi_rready                 (axi_rready  ),
    .axi_rdata                  (axi_rdata   ),
    .axi_rvalid                 (axi_rvalid  ),
    .axi_rlast                  (axi_rlast   ),
    .axi_rid                    (axi_rid     )
); 


// 读缓冲 buf
ddr_rd_buf u_ddr_rd_buf(
    .clk                        (ddr_clk        ),
    .rst                        (ddr_init       ),
    .rotate_mode                (rotate_mode    ), 
    .mirror_mode                (mirror_mode    ),
    .scale_mode                 (scale_mode     ),
  
    .frame_instruct             (frame_instruct ), 
    .buf_wr_en                  (buf_wr_en      ),
    .buf_wr_data                (buf_wr_data    ),
    .rd_clk                     (vesa_out_clk   ), 
    .rd_rst                     (ddr_init       ), 
    .rd_en                      (vesa_out_de    ), 
    .rd_fsync                   (vesa_out_vsync ), 
    .de_o                       (de_out         ), 
    .rgb565_out                 (vesa_out_data  )
);


// 输出字符显示需要的信息
// 显示视频信号
always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst) begin
        channel_index <= 'b0;
    end
    else if(reg_value_command == 4'd0) begin
        channel_index <= 3'd1;
    end
    else begin
        channel_index <= reg_value_command[2:0];
    end
end

always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst) begin
        angle_num <= 'b0;
    end
    else if(rotate_mode == 4'd1) begin
        angle_num <= 'd180;
    end
    else if(rotate_mode == 4'd0) begin
        angle_num <= 'd0;
    end
    else begin
        angle_num <= angle_num;
    end
end

always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst) begin
        scale_value <= {7'd75,4'd0};
    end
    else if(scale_mode == 4'd0) begin
        scale_value <= {7'd75,4'd0};
    end
    else if (scale_mode == 4'd1) begin  //20抽1；
        scale_value <= {7'd71,4'd5};       
    end
    else if (scale_mode == 4'd2) begin  //15抽1；
        scale_value <= {7'd70,4'd0};      
    end
    else if (scale_mode == 4'd3) begin  //10抽1；
        scale_value <= {7'd67,4'd5};  
    end 
    else if (scale_mode == 4'd4) begin  //9抽1；
        scale_value <= {7'd66,4'd0};    
    end
    else if (scale_mode == 4'd5) begin  //8抽1；
        scale_value <= {7'd64,4'd5};      
    end
    else if (scale_mode == 4'd6) begin  //7抽1；
        scale_value <= {7'd63,4'd0};       
    end
    else if (scale_mode == 4'd7) begin  //6抽1；
        scale_value <= {7'd61,4'd5}; 
    end 
    else if (scale_mode == 4'd8) begin  //5抽1；
        scale_value <= {7'd60,4'd5};  
    end
    else if (scale_mode == 4'd9) begin  //4抽1；
        scale_value <= {7'd56,4'd5};    
    end
    else if (scale_mode == 4'd10) begin  //3抽1；
        scale_value <= {7'd50,4'd0};   
    end
    else if (scale_mode == 4'd11) begin  //2抽1；
        scale_value <= {7'd37,4'd5};   
    end
    else begin
        scale_value <= scale_value;
    end
end


endmodule