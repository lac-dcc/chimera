/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`include  "odma_defines.v"

module odma_lcl_wr_arbiter #(
                    parameter    AXI_ID_WIDTH = 5
)
(
                    input                             clk                  ,
                    input                             rst_n                ,
                    //--------------- LCL Write Interface -----------------//
                    //-------------- Write Addr/Data Channel --------------//
                    output reg                            lcl_wr_valid         ,
                    output reg    [0063:0]                lcl_wr_ea            ,
                    output reg    [AXI_ID_WIDTH - 1:0]    lcl_wr_axi_id        ,
                    output reg    [0127:0]                lcl_wr_be            ,
                    output reg                            lcl_wr_first         ,
                    output reg                            lcl_wr_last          ,
                    output reg    [1023:0]                lcl_wr_data          ,
                    output reg    [0008:0]                lcl_wr_ctx           ,
                    output reg                            lcl_wr_ctx_valid     ,
                    input                                 lcl_wr_ready         ,
                    //-------------- Write Response Channel ---------------//
                    input                                 lcl_wr_rsp_valid     ,
                    input         [AXI_ID_WIDTH - 1:0]    lcl_wr_rsp_axi_id    ,
                    input                                 lcl_wr_rsp_code      ,
                    output        [0031:0]                lcl_wr_rsp_ready     ,
                    //--------------- CMP Engine LCL Wr IF ----------------//
                    //-------------- Write Addr/Data Channel --------------//
                    input                                 cmp_lcl_wr_valid     ,
                    input         [0063:0]                cmp_lcl_wr_ea        ,
                    input         [AXI_ID_WIDTH - 1:0]    cmp_lcl_wr_axi_id    ,
                    input         [0127:0]                cmp_lcl_wr_be        ,
                    input                                 cmp_lcl_wr_first     ,
                    input                                 cmp_lcl_wr_last      ,
                    input         [1023:0]                cmp_lcl_wr_data      ,
                    input         [0008:0]                cmp_lcl_wr_ctx       ,
                    input                                 cmp_lcl_wr_ctx_valid ,
                    output                                cmp_lcl_wr_ready     ,
                    //-------------- Write Response Channel ---------------//
                    output reg                            cmp_lcl_wr_rsp_valid ,
                    output reg    [AXI_ID_WIDTH - 1:0]    cmp_lcl_wr_rsp_axi_id,
                    output reg                            cmp_lcl_wr_rsp_code  ,
                    input         [0031:0]                cmp_lcl_wr_rsp_ready ,
                    //-------------- A2H MM Engine LCL Wr IF --------------//
                    //-------------- Write Addr/Data Channel --------------//
                    input                                mm_lcl_wr_valid       ,
                    input        [0063:0]                mm_lcl_wr_ea          ,
                    input        [AXI_ID_WIDTH - 1:0]    mm_lcl_wr_axi_id      ,
                    input        [0127:0]                mm_lcl_wr_be          ,
                    input                                mm_lcl_wr_first       ,
                    input                                mm_lcl_wr_last        ,
                    input        [1023:0]                mm_lcl_wr_data        ,
                    input        [0008:0]                mm_lcl_wr_ctx         ,
                    input                                mm_lcl_wr_ctx_valid   ,
                    output                               mm_lcl_wr_ready       ,
                    //-------------- Write Response Channel ---------------//
                    output reg                           mm_lcl_wr_rsp_valid   ,
                    output reg   [AXI_ID_WIDTH - 1:0]    mm_lcl_wr_rsp_axi_id  ,
                    output reg                           mm_lcl_wr_rsp_code    ,
                    input                                mm_lcl_wr_rsp_ready   ,
                    //-------------- A2H ST Engine LCL Wr IF --------------//
                    //-------------- Write Addr/Data Channel --------------//
                    input                                st_lcl_wr_valid       ,
                    input        [0063:0]                st_lcl_wr_ea          ,
                    input        [AXI_ID_WIDTH - 1:0]    st_lcl_wr_axi_id      ,
                    input        [0127:0]                st_lcl_wr_be          ,
                    input                                st_lcl_wr_first       ,
                    input                                st_lcl_wr_last        ,
                    input        [1023:0]                st_lcl_wr_data        ,
                    input        [0008:0]                st_lcl_wr_ctx         ,
                    input                                st_lcl_wr_ctx_valid   ,
                    output                               st_lcl_wr_ready       ,
                    //-------------- Write Response Channel ---------------//
                    output reg                           st_lcl_wr_rsp_valid   ,
                    output reg   [AXI_ID_WIDTH - 1:0]    st_lcl_wr_rsp_axi_id  ,
                    output reg                           st_lcl_wr_rsp_code    ,
                    input        [0031:0]                st_lcl_wr_rsp_ready   
                    );

reg  wr_req_cmp_grant;
reg  wr_req_mm_grant;
reg  wr_req_st_grant;
reg  wr_req_arb_en;
reg  wr_req_arb_en_extend;

reg  no_arb;
wire no_valid;


// Writer Request (Addr/Data) Channel
// wr_req_arbiter


// for wr_req_cmp_grant
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        wr_req_cmp_grant <= 1'b0;
    else if (wr_req_arb_en)
        case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
            3'b000: wr_req_cmp_grant <= (cmp_lcl_wr_valid)? 1'b1 : 1'b0;
            3'b100: wr_req_cmp_grant <= (mm_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b0 : 1'b1);
            3'b010: wr_req_cmp_grant <= (cmp_lcl_wr_valid)? 1'b1 : 1'b0;
            3'b001: wr_req_cmp_grant <= (cmp_lcl_wr_valid)? 1'b1: 1'b0;
            default:;
        endcase
    else if (wr_req_arb_en_extend)
        case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
            3'b100: wr_req_cmp_grant <= (cmp_lcl_wr_valid)? 1'b1 : 1'b0;
            3'b010: wr_req_cmp_grant <= (mm_lcl_wr_valid)? 1'b0 : ((cmp_lcl_wr_valid)? 1'b1 : 1'b0);
            3'b001: wr_req_cmp_grant <= (st_lcl_wr_valid)? 1'b0 : ((cmp_lcl_wr_valid)? 1'b1 : 1'b0); 
            default:;
        endcase
    else
        wr_req_cmp_grant <= wr_req_cmp_grant;
        
// for wr_req_mm_grant
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        wr_req_mm_grant <= 1'b0;
    else if (wr_req_arb_en)
        case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
            3'b000: wr_req_mm_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b1 : 1'b0);
            3'b100: wr_req_mm_grant <= (mm_lcl_wr_valid)? 1'b1 : 1'b0;
            3'b010: wr_req_mm_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b0 : 1'b1);
            3'b001: wr_req_mm_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b1 : 1'b0);
            default:;
        endcase
    else if (wr_req_arb_en_extend)
        case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
            3'b100: wr_req_mm_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b1 : 1'b0);
            3'b010: wr_req_mm_grant <= (mm_lcl_wr_valid)? 1'b1 : 1'b0;
            3'b001: wr_req_mm_grant <= (st_lcl_wr_valid)? 1'b0 : ((cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b1 : 1'b0)); 
            default:;
        endcase
    else
        wr_req_mm_grant <= wr_req_mm_grant;
        
// for wr_req_st_grant
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        wr_req_st_grant <= 1'b0;
    else if (wr_req_arb_en)
        case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
            3'b000: wr_req_st_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b1 : 1'b0));
            3'b100: wr_req_st_grant <= (mm_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b1 : 1'b0);
            3'b010: wr_req_st_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b1 : 1'b0);
            3'b001: wr_req_st_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b0 : 1'b1);
            default:;
        endcase
    else if (wr_req_arb_en_extend)
        case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
            3'b100: wr_req_st_grant <= (cmp_lcl_wr_valid)? 1'b0 : ((mm_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b1 : 1'b0));
            3'b010: wr_req_st_grant <= (mm_lcl_wr_valid)? 1'b0 : ((cmp_lcl_wr_valid)? 1'b0 : ((st_lcl_wr_valid)? 1'b1 : 1'b0));
            3'b001: wr_req_st_grant <= (st_lcl_wr_valid)? 1'b1 : 1'b0; 
            default:;
        endcase
    else
        wr_req_st_grant <= wr_req_st_grant;
        
always @(*) begin
    case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
        3'b000:  no_arb = (~(cmp_lcl_wr_valid || mm_lcl_wr_valid || st_lcl_wr_valid)) && wr_req_arb_en;
        3'b100:  no_arb = ((cmp_lcl_wr_valid && cmp_lcl_wr_last && (~mm_lcl_wr_valid) && (~st_lcl_wr_valid))) && wr_req_arb_en;
        3'b010:  no_arb = ((mm_lcl_wr_valid && mm_lcl_wr_last && (~cmp_lcl_wr_valid) && (~st_lcl_wr_valid))) && wr_req_arb_en;
        3'b001:  no_arb = ((st_lcl_wr_valid && st_lcl_wr_last && (~cmp_lcl_wr_valid) && (~mm_lcl_wr_valid))) && wr_req_arb_en;
        default: no_arb = 1'b0;
    endcase
end

assign no_valid = ~(cmp_lcl_wr_valid || mm_lcl_wr_valid || st_lcl_wr_valid);

always @(*) begin
    case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
        3'b000:  wr_req_arb_en = 1'b1;
        3'b100:  wr_req_arb_en = (cmp_lcl_wr_valid) && (cmp_lcl_wr_last) && lcl_wr_ready; 
        3'b010:  wr_req_arb_en = (mm_lcl_wr_valid) && (mm_lcl_wr_last) && lcl_wr_ready; 
        3'b001:  wr_req_arb_en = (st_lcl_wr_valid) && (st_lcl_wr_last) && lcl_wr_ready; 
        default: wr_req_arb_en = 1'b0;
    endcase
end

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        wr_req_arb_en_extend <= 1'b0;
    else if (wr_req_arb_en && no_arb)
        wr_req_arb_en_extend <= 1'b1;
    else if (wr_req_arb_en_extend && (~no_valid))
        wr_req_arb_en_extend <= 1'b0;
    else
        wr_req_arb_en_extend <= wr_req_arb_en_extend;


// Write Request(Addr/Data) Channel Data path
// LCL_Wr_IF -> Arbiter -> Engines
assign cmp_lcl_wr_ready = lcl_wr_ready && wr_req_cmp_grant;
assign mm_lcl_wr_ready = lcl_wr_ready && wr_req_mm_grant;
assign st_lcl_wr_ready = lcl_wr_ready && wr_req_st_grant;

// Engines -> Arbiter -> LCL_Wr_IF
always @(*) begin
    case ({wr_req_cmp_grant, wr_req_mm_grant, wr_req_st_grant})
        3'b000: begin
                lcl_wr_valid = 1'b0;
                lcl_wr_ea = 64'b0;
                lcl_wr_axi_id = 5'b0;
                lcl_wr_be = 128'b0;
                lcl_wr_first = 1'b0;
                lcl_wr_last = 1'b0;
                lcl_wr_data = 1024'b0;
                lcl_wr_ctx = 9'b0;
                lcl_wr_ctx_valid = 1'b0;
        end
        3'b100: begin
                lcl_wr_valid     = cmp_lcl_wr_valid;
                lcl_wr_ea        = cmp_lcl_wr_ea;
                lcl_wr_axi_id    = cmp_lcl_wr_axi_id;
                lcl_wr_be        = cmp_lcl_wr_be;
                lcl_wr_first     = cmp_lcl_wr_first;
                lcl_wr_last      = cmp_lcl_wr_last;
                lcl_wr_data      = cmp_lcl_wr_data;
                lcl_wr_ctx       = cmp_lcl_wr_ctx;
                lcl_wr_ctx_valid = cmp_lcl_wr_ctx_valid;
        end
        3'b010: begin
                lcl_wr_valid     = mm_lcl_wr_valid;
                lcl_wr_ea        = mm_lcl_wr_ea;
                lcl_wr_axi_id    = mm_lcl_wr_axi_id;
                lcl_wr_be        = mm_lcl_wr_be;
                lcl_wr_first     = mm_lcl_wr_first;
                lcl_wr_last      = mm_lcl_wr_last;
                lcl_wr_data      = mm_lcl_wr_data;
                lcl_wr_ctx       = mm_lcl_wr_ctx;
                lcl_wr_ctx_valid = mm_lcl_wr_ctx_valid;
        end
        3'b001: begin
                lcl_wr_valid     = st_lcl_wr_valid;
                lcl_wr_ea        = st_lcl_wr_ea;
                lcl_wr_axi_id    = st_lcl_wr_axi_id;
                lcl_wr_be        = st_lcl_wr_be;
                lcl_wr_first     = st_lcl_wr_first;
                lcl_wr_last      = st_lcl_wr_last;
                lcl_wr_data      = st_lcl_wr_data;
                lcl_wr_ctx       = st_lcl_wr_ctx;
                lcl_wr_ctx_valid = st_lcl_wr_ctx_valid;
        end
        default:;
    endcase
end


// Write Response Channel
// wr_resp_dispatcher
// The dispatcher will dispatch the LCL Wr IF Response to the three engines accodring to the axi_id

// Engines -> Arbiter -> LCL Wr IF
assign lcl_wr_rsp_ready[5]  = cmp_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[13] = cmp_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[21] = cmp_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[29] = cmp_lcl_wr_rsp_ready;


assign lcl_wr_rsp_ready[0]  = mm_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[8] = mm_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[16] = mm_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[24] = mm_lcl_wr_rsp_ready;


assign lcl_wr_rsp_ready[1]  = st_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[9] = st_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[17] = st_lcl_wr_rsp_ready;
assign lcl_wr_rsp_ready[25] = st_lcl_wr_rsp_ready;

assign {lcl_wr_rsp_ready[31:30], lcl_wr_rsp_ready[28:26], lcl_wr_rsp_ready[23:22], lcl_wr_rsp_ready[20:18], lcl_wr_rsp_ready[15:14], lcl_wr_rsp_ready[12:10], lcl_wr_rsp_ready[7:6], lcl_wr_rsp_ready[4:2]} = 20'b0;

//TODO:split the *_lcl_wr_rsp_ready into 4 signals which represent for 4 channels according to the channel_id width


// LCL_Wr_IF -> Arbiter -> Engines
always @(*) begin
    case (lcl_wr_rsp_axi_id[2:0])
        `CMP_ENGINE_ID: begin
                cmp_lcl_wr_rsp_valid  = lcl_wr_rsp_valid;
                cmp_lcl_wr_rsp_axi_id = lcl_wr_rsp_axi_id;
                cmp_lcl_wr_rsp_code   = lcl_wr_rsp_code;

                mm_lcl_wr_rsp_valid   = 1'b0;
                mm_lcl_wr_rsp_axi_id  = 5'b0;
                mm_lcl_wr_rsp_code    = 1'b0;

                st_lcl_wr_rsp_valid   = 1'b0;
                st_lcl_wr_rsp_axi_id  = 5'b0;
                st_lcl_wr_rsp_code    = 1'b0;
        end
        `A2HMM_ENGINE_ID: begin
                cmp_lcl_wr_rsp_valid  = 1'b0;
                cmp_lcl_wr_rsp_axi_id = 5'b0;
                cmp_lcl_wr_rsp_code   = 1'b0;

                mm_lcl_wr_rsp_valid   = lcl_wr_rsp_valid;
                mm_lcl_wr_rsp_axi_id  = lcl_wr_rsp_axi_id;
                mm_lcl_wr_rsp_code    = lcl_wr_rsp_code;

                st_lcl_wr_rsp_valid   = 1'b0;
                st_lcl_wr_rsp_axi_id  = 5'b0;
                st_lcl_wr_rsp_code    = 1'b0;
        end
        `A2HST_ENGINE_ID: begin
                cmp_lcl_wr_rsp_valid  = 1'b0;
                cmp_lcl_wr_rsp_axi_id = 5'b0;
                cmp_lcl_wr_rsp_code   = 1'b0;

                mm_lcl_wr_rsp_valid   = 1'b0;
                mm_lcl_wr_rsp_axi_id  = 5'b0;
                mm_lcl_wr_rsp_code    = 1'b0;

                st_lcl_wr_rsp_valid   = lcl_wr_rsp_valid;
                st_lcl_wr_rsp_axi_id  = lcl_wr_rsp_axi_id;
                st_lcl_wr_rsp_code    = lcl_wr_rsp_code;
        end
        default: begin
                cmp_lcl_wr_rsp_valid  = 1'b0;
                cmp_lcl_wr_rsp_axi_id = 5'b0;
                cmp_lcl_wr_rsp_code   = 1'b0;

                mm_lcl_wr_rsp_valid   = 1'b0;
                mm_lcl_wr_rsp_axi_id  = 5'b0;
                mm_lcl_wr_rsp_code    = 1'b0;

                st_lcl_wr_rsp_valid   = 1'b0;
                st_lcl_wr_rsp_axi_id  = 5'b0;
                st_lcl_wr_rsp_code    = 1'b0;
        end
    endcase
end

endmodule

