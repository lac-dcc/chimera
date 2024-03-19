/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: av_timing.v
 *  Purpose:  Analog video timing generation module.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module av_timing
(
    input   wire            clk,
    input   wire            resetn,
    input   wire    [1:0]   mode,
    input   wire    [7:0]   din,
    output  wire            din_rdy,
    output  reg     [10:0]  vcnt = 11'd0,
    output  reg     [10:0]  hcnt = 11'd0,
    output  reg     [7:0]   dout = 8'h00
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    function [7:0] calc_xyz_sync;
        input [2:0] fvh;
        begin
            calc_xyz_sync = {
                                1'b1,                       /* Always 1'b1    */
                                fvh,                        /* F, V, H bits   */
                                fvh[1] ^ fvh[0],            /* P3 = V ^ H     */
                                fvh[2] ^ fvh[0],            /* P2 = F ^ H     */
                                fvh[2] ^ fvh[1],            /* P1 = F ^ V     */
                                fvh[2] ^ fvh[1] ^ fvh[0]    /* P0 = F ^ V ^ H */
                            };
        end
    endfunction
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [1:0]   NTSC_ITUR_BT656 = 2'd0,
                        PAL_ITUR_BT656  = 2'd1;
    
    
    reg             field;
    reg             vblank;
    reg             xav_preamb_ena;
    reg             sav_ena;
    reg             eav_ena;
    reg             hblank;
    reg             data_ena;
    
    reg     [10:0]  hpos_cnt = 11'd0;
    reg     [10:0]  vpos_cnt = 11'd0;
    
    reg     [10:0]  vis_hres = 11'd0;
    reg     [10:0]  vis_vres = 11'd0;
    
    reg     [10:0]  hsize = 11'd0;
    reg     [10:0]  vsize = 11'd0;
    
    assign  din_rdy = data_ena & ~vblank;
    
    
    always @(*) begin
        case (mode)
            
            /* 720 x 486 */
            NTSC_ITUR_BT656: begin
                
               /* 
                *  LINE    F V EAV SAV
                *  0-2     1 1  1   0
                *  3-19    0 1  1   0
                *  20-262  0 0  1   0   (243 lines)
                *  263-264 0 1  1   0
                *  265-281 1 1  1   0
                *  282-524 1 0  1   0   (243 lines)
                *
                *  | EAV   |      BLANKING     | SAV   | ACTIVE DATA LINE  |
                *  | CODE  |                   | CODE  |                   |
                *  |F 0 0 X|8 1 8 1 ... 8 1 8 1|F 0 0 X|C Y C Y ... C Y C Y|
                *  |F 0 0 Y|0 0 0 0 ... 0 0 0 0|F 0 0 Y|B   B   ... B   B  |
                *  |       |                   |       |                   |
                *  |<----->|<----------------->|<----->|<----------------->|
                *  |   4            268            4           1440        |
                *  |<----------------------------------------------------->|
                *                            1716
                */
                
                vis_hres = 11'd720;
                vis_vres = 11'd486;
                
                vsize = 11'd525;
                hsize = 11'd1716;
                
                field  = ((vpos_cnt > 11'd2) && (vpos_cnt < 11'd265))? 1'b0 : 1'b1;
                vblank = (((vpos_cnt > 11'd19) && (vpos_cnt < 11'd263)) || (vpos_cnt > 11'd281))? 1'b0 : 1'b1;
                
                xav_preamb_ena = ((hpos_cnt < 3) || ((hpos_cnt > 271) && (hpos_cnt < 275)))? 1'b1 : 1'b0;
                eav_ena  = (hpos_cnt == 3)?   1'b1 : 1'b0;
                sav_ena  = (hpos_cnt == 275)? 1'b1 : 1'b0;
                data_ena = (hpos_cnt >  275)? 1'b1 : 1'b0;
                hblank   = (((hpos_cnt > 3) && (hpos_cnt < 272)) || (vblank & data_ena))? 1'b1 : 1'b0;
            end
            
            /* 720 x 576 */
            PAL_ITUR_BT656: begin
                
               /* 
                *  LINE    F V EAV SAV
                *  0-21    0 1  1   0
                *  22-309  0 0  1   0   (288 lines)
                *  310-311 0 1  1   0
                *  312-334 1 1  1   0
                *  335-622 1 0  1   0   (288 lines)
                *  623-624 1 1  1   0
                *
                *  | EAV   |      BLANKING     | SAV   | ACTIVE DATA LINE  |
                *  | CODE  |                   | CODE  |                   |
                *  |F 0 0 X|8 1 8 1 ... 8 1 8 1|F 0 0 X|C Y C Y ... C Y C Y|
                *  |F 0 0 Y|0 0 0 0 ... 0 0 0 0|F 0 0 Y|B   B   ... B   B  |
                *  |       |                   |       |                   |
                *  |<----->|<----------------->|<----->|<----------------->|
                *  |   4            280            4           1440        |
                *  |<----------------------------------------------------->|
                *                            1728
                */
                
                vis_hres = 11'd720;
                vis_vres = 11'd576;
                
                vsize = 11'd625;
                hsize = 11'd1728;
                
                field  = (vpos_cnt < 11'd312)? 1'b0 : 1'b1;
                vblank = (((vpos_cnt > 11'd21) && (vpos_cnt < 11'd310)) || ((vpos_cnt > 11'd334) && (vpos_cnt < 11'd623)))? 1'b0 : 1'b1;
                
                xav_preamb_ena = ((hpos_cnt < 3) || ((hpos_cnt > 283) && (hpos_cnt < 287)))? 1'b1 : 1'b0;
                eav_ena  = (hpos_cnt == 3)?   1'b1 : 1'b0;
                sav_ena  = (hpos_cnt == 287)? 1'b1 : 1'b0;
                data_ena = (hpos_cnt >  287)? 1'b1 : 1'b0;
                hblank   = (((hpos_cnt > 3) && (hpos_cnt < 284)) || (vblank & data_ena))? 1'b1 : 1'b0;
            end
        endcase
    end
    
    
    always @(posedge clk) begin
        if (~resetn) begin
            hpos_cnt <= 11'd0;
            vpos_cnt <= 11'd0;
        end else begin
            if (hpos_cnt < hsize - 1'b1) begin
                hpos_cnt <= hpos_cnt + 1'b1;
            end else begin
                hpos_cnt <= 11'd0;
                if (vpos_cnt < vsize - 1'b1) begin
                    vpos_cnt <= vpos_cnt + 1'b1;
                end else begin
                    vpos_cnt <= 11'd0;
                end
            end
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  SAV = 1'b0,     /* SAV (start of active video line) */
                EAV = 1'b1;     /* EAV (end of active video line)   */
    
    localparam  BLANKING_Y    = 8'h10,
                BLANKING_CBCR = 8'h80;
    
    
    reg     [23:0]  xav_preamb = 24'h0000ff;
    reg     [7:0]   sav_reg    = 8'h00;
    reg     [7:0]   eav_reg    = 8'h00;
    reg     [7:0]   blank_reg  = BLANKING_CBCR;
    
    
    /* EAV/SAV sequence */
    always @(posedge clk) begin
        if (xav_preamb_ena) begin
            xav_preamb <= {xav_preamb[7:0], xav_preamb[23:8]};
        end else begin
            xav_preamb <= 24'h0000ff;
        end
        
        sav_reg <= calc_xyz_sync({field, vblank, SAV});
        eav_reg <= calc_xyz_sync({field, vblank, EAV});
    end
    
    
    /* Blanking data */
    always @(posedge clk) begin
        if (hblank) begin
            blank_reg <= (blank_reg == BLANKING_CBCR)? BLANKING_Y : BLANKING_CBCR;
        end else begin
            blank_reg <= BLANKING_CBCR;
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [4:0]   EAV_SAV_PREAMB = 5'b10000,
                        SAV_CODE       = 5'b01000,
                        EAV_CODE       = 5'b00100,
                        BLANKING       = 5'b00010,
                        DATA           = 5'b00001;
    
    
    wire    [4:0]   sync_event = {xav_preamb_ena, sav_ena, eav_ena, hblank, data_ena};
    reg     [7:0]   data_mux;
    
    
    always @(*) begin
        case (sync_event)
            EAV_SAV_PREAMB: data_mux = xav_preamb[7:0];
            SAV_CODE:       data_mux = sav_reg;
            EAV_CODE:       data_mux = eav_reg;
            BLANKING:       data_mux = blank_reg;
            DATA:           data_mux = din;
            default:        data_mux = blank_reg;
        endcase
    end
    
    
    /* Register output value */
    always @(posedge clk) begin
        if (~resetn) begin
            dout <= 8'h00;
        end else begin
            dout <= data_mux;
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     din_rdy_1 = 1'b0;
    
    always @(posedge clk) begin
        if (~resetn) begin
            vcnt      <= 11'd0;
            hcnt      <= 11'd0;
            din_rdy_1 <= 1'b0;
        end else begin
            din_rdy_1 <= din_rdy;
            
            if (din_rdy) begin
                hcnt <= (hpos_cnt[0])? hcnt + 1'b1 : hcnt;
            end else begin
                hcnt <= 11'd0;
            end
            
            if (vpos_cnt == 11'd0) begin
                vcnt <= 11'd0;  // even row 0, 2, 4, 6...
            end else begin
                if (din_rdy_1 & ~din_rdy) begin
                    if (vcnt == (vis_vres - 11'd2)) begin
                        vcnt <= 11'd1;  // odd row 1, 3, 5, 7...
                    end else begin
                        vcnt <= vcnt + 2'd2;
                    end
                end
            end
        end
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
