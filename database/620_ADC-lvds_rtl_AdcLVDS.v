// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/23 22:26:34
// Design Name: 
// Module Name: AdcLVDS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AdcLVDS #(
    parameter AdcChnls = 2,     // Number of ADC in a package
    parameter AdcBits = 14,
    parameter AdcBitOrByteMode = 1, // 1 = BIT mode, 0 = BYTE mode
    parameter AdcMsbOrLsbFst = 1, // 1 = MSB first, 0 = LSB first
    parameter AdcWireMode = 2, // 1 = 1-wire, 2 = 2-wire
    parameter AdcFrmPattern = 16'b0011111110000000,
    parameter AdcSampFreDiv2 = 1,
    parameter AdcDCLKFrequency = 84,
    parameter AdcFCLKFrequency = 12,
    parameter CLKFBOUT_MULT_F = 12,
    parameter CLKOUT1_DIVIDE = 84,
    parameter AdcSyncExtClk = 0,
    parameter AdcLaneInvert = 8'b00001100
)
(
    input DCLK_p_pin,
    input DCLK_n_pin,
    input FCLK_p_pin,
    input FCLK_n_pin,
    input [(AdcChnls*AdcWireMode)-1 : 0] DATA_p_pin,
    input [(AdcChnls*AdcWireMode)-1 : 0] DATA_n_pin,

    input  AdcSampClk,
    
    output AdcFrmClk, 
    output AdcFrmClk2x, 
    output [7:0] AdcDataValid,
    output [15:0] AdcDataCh0,
    output [15:0] AdcDataCh1,
    output [15:0] AdcDataCh2,
    output [15:0] AdcDataCh3,
    output [15:0] AdcDataCh4,
    output [15:0] AdcDataCh5,
    output [15:0] AdcDataCh6,
    output [15:0] AdcDataCh7
    );

    // Pin to IntSignal
    wire IntClk;
    wire IntClkDiv;
    wire IntClkb;
    wire IntClkDivb;
    wire IntBitClkDone;

    wire IntSampleClk;
    wire IntSampleClk2x;
    
    wire AdcIntrfcRst = (~IntBitClkDone);
    wire AdcIntrfcEna = 1     ;
    wire AdcReSync = 0       ;
    wire AdcIdlyCtrlRdy   ;
    
    wire IntDCLK_p;
    wire IntFCLK_p,IntFCLK_n;
    wire [(AdcChnls*AdcWireMode)-1 : 0] IntDATA_p;
    wire [(AdcChnls*AdcWireMode)-1 : 0] IntDATA_n;
    wire IntRst;
//    wire IntClk,IntClkDiv;
//    wire IntClk_90;
    wire IntEna_d;
    wire IntEna;


    
    IBUFGDS_DIFF_OUT 
        #(.DIFF_TERM("TRUE"), .IOSTANDARD("LVDS_25"))
    Inst_FCLK_IBUFDS
        (.I(FCLK_p_pin), .IB(FCLK_n_pin), .O(IntFCLK_p), .OB(IntFCLK_n));
    genvar i;
    generate
        for (i = 0;i<(AdcChnls*AdcWireMode);i=i+1)
        begin
            IBUFGDS_DIFF_OUT 
                #(.DIFF_TERM("TRUE"), .IOSTANDARD("LVDS_25"))
            Inst_DATA_IBUFDS
                (.I(DATA_p_pin[i]), .IB(DATA_n_pin[i]), .O(IntDATA_p[i]), .OB(IntDATA_n[i]));
        end
    endgenerate   

    FDPE 
        #(.INIT(1))
    Inst_Fdpe_Rst
        (.C(IntClkDiv), .CE(1), .PRE(AdcIntrfcRst), .D(0), .Q(IntRst));

    FDCE 
        #(.INIT(1))
    Inst_Fdpe_Ena_0
        (.C(IntClkDiv), .CE(AdcIntrfcEna), .CLR(IntRst), .D(1), .Q(IntEna_d));
    FDCE 
        #(.INIT(1))
    Inst_Fdpe_Ena_1
        (.C(IntClkDiv), .CE(1), .CLR(IntRst), .D(IntEna_d), .Q(IntEna));
        
    // MMCM regenerate dclk
    AdcClock #(
            .AdcDCLKFrequency(AdcDCLKFrequency),
            .AdcFCLKFrequency(AdcFCLKFrequency),
            .CLKFBOUT_MULT_F(CLKFBOUT_MULT_F),
            .CLKOUT1_DIVIDE(CLKOUT1_DIVIDE)
        ) inst_AdcClock (
            .clk_out1  (IntClk), // 84
            .clk_out2  (IntClkDiv), // 12
            .clk_out1b (IntClkb),
            .clk_out2b (IntClkDivb),
            .clk_out3  (IntSampleClk), // 24
            .clk_out4  (IntSampleClk2x), // 48
            .reset     (0),
            .locked    (IntBitClkDone),
            .clk_in1_p (DCLK_p_pin),
            .clk_in1_n (DCLK_n_pin)
        );

    // sample fclk
    wire IntBitslip;
    wire IntFrmAlignDone;
	AdcFrame #(
            .AdcBits(AdcBits),
            .FrmPattern(AdcFrmPattern)
        ) inst_AdcFrame (
            .FrmFCLK_p    (IntFCLK_p),
            .FrmFCLK_n    (IntFCLK_n),
            .FrmClk       (IntClk),
            .FrmClkb      (IntClkb),
            .FrmClkDiv    (IntClkDiv),
            .FrmRst       (IntRst),
            .BitClkDone   (IntBitClkDone),
            .FrmBitslip   (IntBitslip),
            .FrmAlignDone (IntFrmAlignDone)
        );


    wire [16*AdcChnls*AdcWireMode-1:0] DatData;
    wire [AdcChnls*AdcWireMode-1:0]IntDatAlignDone;
    // sample lanes
    generate
        for (i = 0;i<(AdcChnls*AdcWireMode);i=i+1)
        begin
        AdcLane #(
                .AdcBits(AdcBits),
                .AdcInvert(AdcLaneInvert[i])
            ) inst_AdcLane (
                .DatLine_p    (IntDATA_p[i]),
                .DatLine_n    (IntDATA_n[i]),
                .DatClk       (IntClk),
                .DatClkb      (IntClkb),
                .DatClkDiv    (IntClkDiv),
                .DatRst       (IntRst),
                .DatBitslip   (IntBitslip),
                .FrmAlignDone (IntFrmAlignDone),
                .DatData      (DatData[(i+1)*16-1:i*16]),
                .DatAlignDone (IntDatAlignDone[i])
            );
        end
    endgenerate    

    wire [16*AdcChnls*AdcWireMode-1:0] AdcData;
    
    // swap lane data to AdcData
    generate
        for (i = 0;i<(AdcChnls*AdcWireMode);i=i+2)
        begin
        AdcSwap #(
                .AdcBits(AdcBits),
                .AdcBitOrByteMode(AdcBitOrByteMode),
                .AdcMsbOrLsbFst(AdcMsbOrLsbFst),
                .AdcWireMode(AdcWireMode)
            ) inst_AdcSwap (
                .FrmClk    (IntClkDiv),
                .DataLine0 (DatData[(i+1)*16-1:i*16]),
                .DataLine1 (DatData[(i+2)*16-1:(i+1)*16]),
                .AdcData0  (AdcData[(i+1)*16-1:i*16]),
                .AdcData1  (AdcData[(i+2)*16-1:(i+1)*16])
            );
        end
    endgenerate

generate

if (AdcSampFreDiv2 == 0) begin
    if (AdcSyncExtClk == 1) begin

        assign AdcFrmClk = AdcSampClk;
        assign AdcDataValid = IntDatAlignDone;

        wire s_axis_tready;
        wire m_axis_tvalid;
        wire [AdcChnls*2-1:0] m_axis_tkeep;
        wire [16*AdcChnls*AdcWireMode-1:0] AdcDataSamp;

        axis_async_fifo_adapter #(
            .DEPTH(512),
            .S_DATA_WIDTH(16*AdcChnls),
            .M_DATA_WIDTH(16*AdcChnls),
            .ID_ENABLE(0),
            .ID_WIDTH(8),
            .DEST_ENABLE(0),
            .DEST_WIDTH(8),
            .USER_ENABLE(0),
            .USER_WIDTH(8),
            .FRAME_FIFO(0),
            .USER_BAD_FRAME_VALUE(1'b1),
            .USER_BAD_FRAME_MASK(1'b1),
            .DROP_BAD_FRAME(0),
            .DROP_WHEN_FULL(0)
        )
        Inst_async_fifo (
            // AXI input
            .s_clk(IntClkDiv),
            .s_rst(IntRst),
            .s_axis_tdata (AdcData),
            .s_axis_tkeep ({AdcChnls*4{1'b1}}),
            .s_axis_tvalid(IntDatAlignDone[0]),
            .s_axis_tready(s_axis_tready),
            .s_axis_tlast (0),
            // AXI output
            .m_clk(AdcSampClk),
            .m_rst(1'b0),
            .m_axis_tdata (AdcDataSamp),
            .m_axis_tkeep (m_axis_tkeep),
            .m_axis_tvalid(m_axis_tvalid),
            .m_axis_tready(1'b1),
            .m_axis_tlast ()
        );
        
        if (AdcChnls == 1) begin
            assign AdcDataCh0 = AdcDataSamp[15:0];
        end else if (AdcChnls == 2) begin
            assign AdcDataCh0 = AdcDataSamp[15:0];
            assign AdcDataCh1 = AdcDataSamp[31:16];
        end else if (AdcChnls == 4) begin
            assign AdcDataCh0 = AdcDataSamp[15:0];
            assign AdcDataCh1 = AdcDataSamp[31:16];
            assign AdcDataCh2 = AdcDataSamp[47:32];
            assign AdcDataCh3 = AdcDataSamp[63:48];
        end else if (AdcChnls == 6) begin
            assign AdcDataCh0 = AdcDataSamp[15:0];
            assign AdcDataCh1 = AdcDataSamp[31:16];
            assign AdcDataCh2 = AdcDataSamp[47:32];
            assign AdcDataCh3 = AdcDataSamp[63:48];
            assign AdcDataCh4 = AdcDataSamp[79:64];
            assign AdcDataCh5 = AdcDataSamp[95:80];
        end else if (AdcChnls == 8) begin
            assign AdcDataCh0 = AdcDataSamp[15:0];
            assign AdcDataCh1 = AdcDataSamp[31:16];
            assign AdcDataCh2 = AdcDataSamp[47:32];
            assign AdcDataCh3 = AdcDataSamp[63:48];
            assign AdcDataCh4 = AdcDataSamp[79:64];
            assign AdcDataCh5 = AdcDataSamp[95:80];
            assign AdcDataCh6 = AdcDataSamp[111:96];
            assign AdcDataCh7 = AdcDataSamp[127:112];
        end
        
    end else begin
//        assign AdcFrmClk = IntClkDiv;
//        assign AdcFrmClk2x = IntClkDiv2x;
        assign AdcDataValid = IntDatAlignDone;
        
        if (AdcChnls == 1) begin
            assign AdcDataCh0 = AdcData[15:0];
        end else if (AdcChnls == 2) begin
            assign AdcDataCh0 = AdcData[15:0];
            assign AdcDataCh1 = ~AdcData[31:16];
        end else if (AdcChnls == 4) begin
            assign AdcDataCh0 = AdcData[15:0];
            assign AdcDataCh1 = AdcData[31:16];
            assign AdcDataCh2 = AdcData[47:32];
            assign AdcDataCh3 = AdcData[63:48];
        end else if (AdcChnls == 6) begin
            assign AdcDataCh0 = AdcData[15:0];
            assign AdcDataCh1 = AdcData[31:16];
            assign AdcDataCh2 = AdcData[47:32];
            assign AdcDataCh3 = AdcData[63:48];
            assign AdcDataCh4 = AdcData[79:64];
            assign AdcDataCh5 = AdcData[95:80];
        end else if (AdcChnls == 8) begin
            assign AdcDataCh0 = AdcData[15:0];
            assign AdcDataCh1 = AdcData[31:16];
            assign AdcDataCh2 = AdcData[47:32];
            assign AdcDataCh3 = AdcData[63:48];
            assign AdcDataCh4 = AdcData[79:64];
            assign AdcDataCh5 = AdcData[95:80];
            assign AdcDataCh6 = AdcData[111:96];
            assign AdcDataCh7 = AdcData[127:112];
        end
    end 

end else begin
    // 2x Sample => 1 Channel
    // AdcFrmClk => 2xAdcFrmClk = AdcSampClk
    wire [8*AdcChnls*AdcWireMode-1:0] AdcDataSampThis;
    wire [8*AdcChnls*AdcWireMode-1:0] AdcDataSampNext;

    for (i = 0; i<AdcChnls;i=i+1) begin
        assign AdcDataSampThis[(i+1)*16-1:i*16] = AdcData[i*32+16-1:i*32];
        assign AdcDataSampNext[(i+1)*16-1:i*16] = AdcData[i*32+16-1+16:i*32+16];
    end
    
    wire [16*AdcChnls*AdcWireMode-1:0] AdcDataSamp;

    wire s_axis_tready;
    wire m_axis_tvalid;
    wire [AdcChnls*2-1:0] m_axis_tkeep;
    // 2x 50MHz to 1x 100MHz
    axis_async_fifo_adapter #(
        .DEPTH(512),
        .S_DATA_WIDTH(16*AdcChnls*2),
        .M_DATA_WIDTH(16*AdcChnls),
        .ID_ENABLE(0),
        .ID_WIDTH(8),
        .DEST_ENABLE(0),
        .DEST_WIDTH(8),
        .USER_ENABLE(0),
        .USER_WIDTH(8),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1'b1),
        .USER_BAD_FRAME_MASK(1'b1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    )
    Inst_async_fifo (
        // AXI input
        .s_clk(IntClkDiv),
        .s_rst(IntRst),
        .s_axis_tdata ({AdcDataSampNext,AdcDataSampThis}),
        .s_axis_tkeep ({AdcChnls*8{1'b1}}),
        .s_axis_tvalid(IntDatAlignDone[0]),
        .s_axis_tready(s_axis_tready),
        .s_axis_tlast (0),
        // AXI output
        .m_clk(IntSampleClk),
        .m_rst(1'b0),
        .m_axis_tdata (AdcDataSamp),
        .m_axis_tkeep (m_axis_tkeep),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tready(1'b1),
        .m_axis_tlast ()
    );

    assign AdcFrmClk = IntSampleClk;
    assign AdcFrmClk2x = IntSampleClk2x;
    assign AdcDataValid = IntDatAlignDone;
    
//    reg [15:0] AdcPattern;
//    always @ (posedge AdcFrmClk) begin
//        AdcPattern <= AdcPattern + 1'b1;
//    end
    
    if (AdcChnls == 1) begin
        assign AdcDataCh0 = AdcDataSamp[15:0];
    end else if (AdcChnls == 2) begin
        assign AdcDataCh0 = AdcDataSamp[15:0];
        assign AdcDataCh1 = AdcDataSamp[31:16];
//        assign AdcDataCh0 = AdcPattern;
//        assign AdcDataCh1 = AdcPattern; 
    end else if (AdcChnls == 4) begin
        assign AdcDataCh0 = AdcDataSamp[15:0];
        assign AdcDataCh1 = AdcDataSamp[31:16];
        assign AdcDataCh2 = AdcDataSamp[47:32];
        assign AdcDataCh3 = AdcDataSamp[63:48];
    end
    
end

endgenerate


endmodule