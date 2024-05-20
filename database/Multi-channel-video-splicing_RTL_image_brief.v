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
* ========================================================================
*/
// 用于显示上半部分画面

module image_brief(
    input               rst,

    input               cmos1_pclk,
    input               cmos1_href,
    input               cmos1_vsync,
    input       [15:0]  cmos1_pix_data,

    input               cmos2_pclk,
    input               cmos2_href,
    input               cmos2_vsync,
    input       [15:0]  cmos2_pix_data,

    input               cmos_fusion_pclk,
    input               cmos_fusion_href,
    input               cmos_fusion_vsync,
    input       [15:0]  cmos_fusion_data,

    input               hdmi_pclk,
    input               hdmi_href,
    input               hdmi_vsync,
    input       [15:0]  hdmi_pix_data,

    output reg          ddr_in_pclk,
    output reg          ddr_in_de,
    output reg          ddr_in_vsync,
    output reg  [15:0]  ddr_in_data   
);
// cmos fusion 单元引入 8 个时间延迟

wire            cmos1_de_out;
wire            cmos1_vs_out;
wire  [15:0]    cmos1_data_out;
wire            cmos2_de_out;
wire            cmos2_vs_out;
wire  [15:0]    cmos2_data_out;
wire            cmos_fusion_de_out;
wire            cmos_fusion_vs_out;
wire  [15:0]    cmos_fusion_data_out;
wire            hdmi_de_out;
wire            hdmi_vs_out;
wire  [15:0]    hdmi_data_out;


video_sampling #(
    .OUT_OFFSET         (11'd0)
) video_sampling_cmos1 (
    .clk                (cmos1_pclk_16bit),
    .rst                (sys_rst),
    .de_in              (cmos1_href),
    .vs_in              (cmos1_vsync),
    .rgb565_in          (cmos1_data),
    .de_out             (cmos1_de_out),
    .vs_out             (cmos1_vs_out),
    .rgb565_out         (cmos1_data_out)
);

video_sampling #(
    OUT_OFFSET          (11'd320)
) video_sampling_cmos2 (
    .clk                (cmos1_pclk_16bit),
    .rst                (sys_rst),
    .de_in              (cmos2_href),
    .vs_in              (cmos2_vsync),
    .rgb565_in          (cmos2_data),
    .de_out             (cmos2_de_out),
    .vs_out             (cmos2_vs_out),
    .rgb565_out         (cmos2_data_out)
);

video_sampling #(
    OUT_OFFSET          (11'd640)
) video_sampling_cmos_fusion (
    .clk                (cmos1_pclk_16bit),
    .rst                (sys_rst),
    .de_in              (cmos_fusion_href),
    .vs_in              (cmos_fusion_vsync),
    .rgb565_in          (cmos_fusion_data),
    .de_out             (cmos_fusion_de_out),
    .vs_out             (cmos_fusion_vs_out),
    .rgb565_out         (cmos_fusion_data_out)
);

video_sampling #(
    OUT_OFFSET          (11'd960)
) video_sampling_hdmi (
    .clk                (cmos1_pclk_16bit),
    .rst                (sys_rst),
    .de_in              (cmos_fusion_href),
    .vs_in              (cmos_fusion_vsync),
    .rgb565_in          (cmos_fusion_data),
    .de_out             (hdmi_de_out),
    .vs_out             (hdmi_vs_out),
    .rgb565_out         (hdmi_data_out)
);

endmodule