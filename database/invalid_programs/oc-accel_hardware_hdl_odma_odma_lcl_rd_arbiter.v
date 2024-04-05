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

module odma_lcl_rd_arbiter #(
                    parameter    AXI_ID_WIDTH = 5
)
(
                    input                clk                                    ,
                    input                rst_n                                  ,

                    //--------------- LCL Read Interface ------------------//
                    //-------------- Read Addr/Req Channel ----------------//
                    output reg                            lcl_rd_valid          ,
                    output reg   [0063:0]                 lcl_rd_ea             ,
                    output reg   [AXI_ID_WIDTH - 1:0]     lcl_rd_axi_id         ,
                    output reg                            lcl_rd_first          ,
                    output reg                            lcl_rd_last           ,
                    output reg   [0127:0]                 lcl_rd_be             ,
                    output reg   [0008:0]                 lcl_rd_ctx            ,
                    output reg                            lcl_rd_ctx_valid      ,
                    input                                 lcl_rd_ready          ,
                    //-------------- Read Data/Resp Channel-----------------//
                    input                                 lcl_rd_data_valid     ,
                    input        [1023:0]                 lcl_rd_data           ,
                    input        [AXI_ID_WIDTH - 1:0]     lcl_rd_data_axi_id    ,
                    input                                 lcl_rd_data_last      ,
                    input                                 lcl_rd_rsp_code       ,
                    output       [0031:0]                 lcl_rd_rsp_ready      ,
                    output       [0031:0]                 lcl_rd_rsp_ready_hint ,

                    //-------------- DSC Engine LCL Rd IF ------------------//
                    //-------------- Read Addr/Req Channel -----------------//
                    input                                 dsc_lcl_rd_valid         ,
                    input        [0063:0]                 dsc_lcl_rd_ea            ,
                    input        [AXI_ID_WIDTH - 1:0]     dsc_lcl_rd_axi_id        ,
                    input                                 dsc_lcl_rd_first         ,
                    input                                 dsc_lcl_rd_last          ,
                    input        [0127:0]                 dsc_lcl_rd_be            ,
                    input        [0008:0]                 dsc_lcl_rd_ctx           ,
                    input                                 dsc_lcl_rd_ctx_valid     ,
                    output                                dsc_lcl_rd_ready         ,
                    //-------------- Read Data/Resp Channel-----------------//
                    output reg                            dsc_lcl_rd_data_valid    ,
                    output reg   [1023:0]                 dsc_lcl_rd_data          ,
                    output reg   [AXI_ID_WIDTH - 1:0]     dsc_lcl_rd_data_axi_id   ,
                    output reg                            dsc_lcl_rd_data_last     ,
                    output reg                            dsc_lcl_rd_rsp_code      ,
                    input                                 dsc_lcl_rd_rsp_ready     ,
                    input                                 dsc_lcl_rd_rsp_ready_hint,

                    //------------ H2A MM Engine LCL Rd IF -----------------//
                    //-------------- Read Addr/Req Channel -----------------//
                    input                                 mm_lcl_rd_valid         ,
                    input        [0063:0]                 mm_lcl_rd_ea            ,
                    input        [AXI_ID_WIDTH - 1:0]     mm_lcl_rd_axi_id        ,
                    input                                 mm_lcl_rd_first         ,
                    input                                 mm_lcl_rd_last          ,
                    input        [0127:0]                 mm_lcl_rd_be            ,
                    input        [0008:0]                 mm_lcl_rd_ctx           ,
                    input                                 mm_lcl_rd_ctx_valid     ,
                    output                                mm_lcl_rd_ready         ,
                    //-------------- Read Data/Resp Channel-----------------//
                    output reg                            mm_lcl_rd_data_valid    ,
                    output reg   [1023:0]                 mm_lcl_rd_data          ,
                    output reg   [AXI_ID_WIDTH - 1:0]     mm_lcl_rd_data_axi_id   ,
                    output reg                            mm_lcl_rd_data_last     ,
                    output reg                            mm_lcl_rd_rsp_code      ,
                    input        [0003:0]                 mm_lcl_rd_rsp_ready     ,
                    input        [0003:0]                 mm_lcl_rd_rsp_ready_hint,

                    //------------ H2A ST Engine LCL Rd IF -----------------//
                    //-------------- Read Addr/Req Channel -----------------//
                    input                                 st_lcl_rd_valid         ,
                    input        [0063:0]                 st_lcl_rd_ea            ,
                    input        [AXI_ID_WIDTH - 1:0]     st_lcl_rd_axi_id        ,
                    input                                 st_lcl_rd_first         ,
                    input                                 st_lcl_rd_last          ,
                    input        [0127:0]                 st_lcl_rd_be            ,
                    input        [0008:0]                 st_lcl_rd_ctx           ,
                    input                                 st_lcl_rd_ctx_valid     ,
                    output                                st_lcl_rd_ready         ,
                    //-------------- Read Data/Resp Channel-----------------//
                    output reg                            st_lcl_rd_data_valid    ,
                    output reg   [1023:0]                 st_lcl_rd_data          ,
                    output reg   [AXI_ID_WIDTH - 1:0]     st_lcl_rd_data_axi_id   ,
                    output reg                            st_lcl_rd_data_last     ,
                    output reg                            st_lcl_rd_rsp_code      ,
                    input                                 st_lcl_rd_rsp_ready     ,
                    input                                 st_lcl_rd_rsp_ready_hint  
                    );


/////////////////////////////
//
// For debug
//
/////////////////////////////


reg [27:0] lcl_rd_cnt;
reg [27:0] lcl_rd_data_cnt;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_cnt <= 28'd0;
    else if (lcl_rd_valid && lcl_rd_ready && (lcl_rd_axi_id == 5'b11010))
        lcl_rd_cnt <= (lcl_rd_last)? 28'd0 : lcl_rd_cnt + 1;
    else
        lcl_rd_cnt <= lcl_rd_cnt;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        lcl_rd_data_cnt <= 28'd0;
    else if (lcl_rd_data_valid && lcl_rd_rsp_ready && (lcl_rd_data_axi_id == 5'b11010))
        lcl_rd_data_cnt <= (lcl_rd_data_last)? 28'd0 : lcl_rd_data_cnt + 1;
    else
        lcl_rd_data_cnt <= lcl_rd_data_cnt;





reg  rd_req_dsc_grant;
reg  rd_req_mm_grant;
reg  rd_req_st_grant;
reg  rd_req_arb_en;
reg  rd_req_arb_en_extend;

reg  no_arb;
wire no_valid;

// Read Requester Channel
// rd_req_arbiter
// if the rd_req_arb_en is high, the arbiter will follow the priority that DSC Engine > MM Engine > ST Engine
// if the rd_req_arb_en_extend is high, the arbiter will give the highest priority to current engine
// When both rd_req_arb_en and no_arb are high, the rd_req_arb_en_extend will be pulled up
// no_arb: 1) value 1'b1 means that the granter does not change when rd_req_arb_en is high.
//         2) value 1'b0 means that the granter changes whne rd_req_arb_en is high. 

// for rd_req_dsc_grant
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        rd_req_dsc_grant <= 1'b0;
    else if (rd_req_arb_en)
        case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
            3'b000: rd_req_dsc_grant <= (dsc_lcl_rd_valid)? 1'b1 : 1'b0;
            3'b100: rd_req_dsc_grant <= (mm_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b0 : 1'b1);
            3'b010: rd_req_dsc_grant <= (dsc_lcl_rd_valid)? 1'b1 : 1'b0;
            3'b001: rd_req_dsc_grant <= (dsc_lcl_rd_valid)? 1'b1 : 1'b0;
            default:;
        endcase
    else if (rd_req_arb_en_extend)
        case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
            //3'b000: rd_req_dsc_grant <= (dsc_lcl_rd_valid)? 1'b1 : 1'b0;
            3'b100: rd_req_dsc_grant <= (dsc_lcl_rd_valid)? 1'b1 : 1'b0;
            3'b010: rd_req_dsc_grant <= (mm_lcl_rd_valid)? 1'b0 : ((dsc_lcl_rd_valid)? 1'b1 : 1'b0);
            3'b001: rd_req_dsc_grant <= (st_lcl_rd_valid)? 1'b0 : ((dsc_lcl_rd_valid)? 1'b1 : 1'b0);
            default:;
        endcase
    else
        rd_req_dsc_grant <= rd_req_dsc_grant;

// for rd_req_mm_grant
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        rd_req_mm_grant <= 1'b0;
    else if (rd_req_arb_en)
        case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
            3'b000: rd_req_mm_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b1 : 1'b0);
            3'b100: rd_req_mm_grant <= (mm_lcl_rd_valid)? 1'b1 : 1'b0;
            3'b010: rd_req_mm_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b0 : 1'b1);
            3'b001: rd_req_mm_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b1 : 1'b0);
            default:;
        endcase
    else if (rd_req_arb_en_extend)
        case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
            //3'b000: rd_req_mm_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b1 : 1'b0);
            3'b100: rd_req_mm_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b1 : 1'b0);
            3'b010: rd_req_mm_grant <= (mm_lcl_rd_valid)? 1'b1 : 1'b0;
            3'b001: rd_req_mm_grant <= (st_lcl_rd_valid)? 1'b0 : ((dsc_lcl_rd_valid)? 1'b0 : (mm_lcl_rd_valid)? 1'b1 : 1'b0);
            default:;
        endcase
    else
        rd_req_mm_grant <= rd_req_mm_grant;

// for rd_req_st_grant
always @(posedge clk or negedge rst_n)
    if (!rst_n)
        rd_req_st_grant <= 1'b0;
    else if (rd_req_arb_en)
        case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
            3'b000: rd_req_st_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b1 : 1'b0));
            3'b100: rd_req_st_grant <= (mm_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b1 : 1'b0);
            3'b010: rd_req_st_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b1 : 1'b0);
            3'b001: rd_req_st_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b0 : 1'b1);
            default:;
        endcase
    else if (rd_req_arb_en_extend)
        case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
           // 3'b000: rd_req_st_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b1 : 1'b0));
            3'b100: rd_req_st_grant <= (dsc_lcl_rd_valid)? 1'b0 : ((mm_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b1 : 1'b0));
            3'b010: rd_req_st_grant <= (mm_lcl_rd_valid)? 1'b0 : ((dsc_lcl_rd_valid)? 1'b0 : ((st_lcl_rd_valid)? 1'b1 : 1'b0));
            3'b001: rd_req_st_grant <= (st_lcl_rd_valid)? 1'b1 : 1'b0;
            default:;
        endcase
    else
        rd_req_st_grant <= rd_req_st_grant;

always @(*) 
    case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
        3'b000:  no_arb = (~(dsc_lcl_rd_valid || mm_lcl_rd_valid || st_lcl_rd_valid)) && rd_req_arb_en;
        3'b100:  no_arb = ((dsc_lcl_rd_valid && dsc_lcl_rd_last && (~mm_lcl_rd_valid) && (~st_lcl_rd_valid))) && rd_req_arb_en;
        3'b010:  no_arb = ((mm_lcl_rd_valid && mm_lcl_rd_last && (~dsc_lcl_rd_valid) && (~st_lcl_rd_valid))) && rd_req_arb_en;
        3'b001:  no_arb = ((st_lcl_rd_valid && st_lcl_rd_last && (~dsc_lcl_rd_valid) && (~mm_lcl_rd_valid))) && rd_req_arb_en;
        default: no_arb = 1'b0;     
    endcase

assign no_valid = ~(dsc_lcl_rd_valid || mm_lcl_rd_valid || st_lcl_rd_valid);

always @(*) begin
    case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
        3'b000:  rd_req_arb_en = 1'b1;
        3'b100:  rd_req_arb_en = (dsc_lcl_rd_valid) && (dsc_lcl_rd_last) && lcl_rd_ready;
        3'b010:  rd_req_arb_en = (mm_lcl_rd_valid) && (mm_lcl_rd_last) && lcl_rd_ready;
        3'b001:  rd_req_arb_en = (st_lcl_rd_valid) && (st_lcl_rd_last) && lcl_rd_ready;
        default: rd_req_arb_en = 1'b0;
    endcase
end

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        rd_req_arb_en_extend <= 1'b0;
    else if (rd_req_arb_en && no_arb)
        rd_req_arb_en_extend <= 1'b1;
    else if (rd_req_arb_en_extend && (~no_valid))
        rd_req_arb_en_extend  <= 1'b0;
    else
        rd_req_arb_en_extend <= rd_req_arb_en_extend;


// Read request channel Data path
// LCL_Rd_IF -> Arbiter -> Engines
assign dsc_lcl_rd_ready = lcl_rd_ready && rd_req_dsc_grant;
assign mm_lcl_rd_ready = lcl_rd_ready && rd_req_mm_grant;
assign st_lcl_rd_ready = lcl_rd_ready && rd_req_st_grant;

// Engines -> Arbiter -> LCL_Rd_IF
always @(*) begin
    case ({rd_req_dsc_grant, rd_req_mm_grant, rd_req_st_grant})
        3'b000: begin
                lcl_rd_valid = 1'b0;
                lcl_rd_ea = 64'b0;
                lcl_rd_axi_id = 5'b0;
                lcl_rd_first = 1'b0;
                lcl_rd_last = 1'b0;
                lcl_rd_be = 128'b0;
                lcl_rd_ctx = 9'b0;
                lcl_rd_ctx_valid = 1'b0;
        end
        3'b100: begin
                lcl_rd_valid     = dsc_lcl_rd_valid;
                lcl_rd_ea        = dsc_lcl_rd_ea;
                lcl_rd_axi_id    = dsc_lcl_rd_axi_id;
                lcl_rd_first     = dsc_lcl_rd_first;
                lcl_rd_last      = dsc_lcl_rd_last;
                lcl_rd_be        = dsc_lcl_rd_be;
                lcl_rd_ctx       = dsc_lcl_rd_ctx;
                lcl_rd_ctx_valid = dsc_lcl_rd_ctx_valid;
        end
        3'b010: begin
                lcl_rd_valid     = mm_lcl_rd_valid;
                lcl_rd_ea        = mm_lcl_rd_ea;
                lcl_rd_axi_id    = mm_lcl_rd_axi_id;
                lcl_rd_first     = mm_lcl_rd_first;
                lcl_rd_last      = mm_lcl_rd_last;
                lcl_rd_be        = mm_lcl_rd_be;
                lcl_rd_ctx       = mm_lcl_rd_ctx;
                lcl_rd_ctx_valid = mm_lcl_rd_ctx_valid;
        end
        3'b001: begin
                lcl_rd_valid     = st_lcl_rd_valid;
                lcl_rd_ea        = st_lcl_rd_ea;
                lcl_rd_axi_id    = st_lcl_rd_axi_id;
                lcl_rd_first     = st_lcl_rd_first;
                lcl_rd_last      = st_lcl_rd_last;
                lcl_rd_be        = st_lcl_rd_be;
                lcl_rd_ctx       = st_lcl_rd_ctx;
                lcl_rd_ctx_valid = st_lcl_rd_ctx_valid;
        end
        default:;
    endcase
end


// Read Response/Data Channel
// rd_resp_dispatcher
// The dispatcher will dispatch the LCL Rd IF Response/Data to the three engines according to the axi_id
// 

// Engines -> Arbiter -> LCL Rd IF
assign lcl_rd_rsp_ready[4]       = dsc_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready[12]      = dsc_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready[20]      = dsc_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready[28]      = dsc_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready_hint[4]  = dsc_lcl_rd_rsp_ready_hint;
assign lcl_rd_rsp_ready_hint[12] = dsc_lcl_rd_rsp_ready_hint;
assign lcl_rd_rsp_ready_hint[20] = dsc_lcl_rd_rsp_ready_hint;
assign lcl_rd_rsp_ready_hint[28] = dsc_lcl_rd_rsp_ready_hint;


assign lcl_rd_rsp_ready[2]       = mm_lcl_rd_rsp_ready[0];
assign lcl_rd_rsp_ready[10]       = mm_lcl_rd_rsp_ready[1];
assign lcl_rd_rsp_ready[18]      = mm_lcl_rd_rsp_ready[2];
assign lcl_rd_rsp_ready[26]      = mm_lcl_rd_rsp_ready[3];
assign lcl_rd_rsp_ready_hint[2]  = mm_lcl_rd_rsp_ready_hint[0];
assign lcl_rd_rsp_ready_hint[10]  = mm_lcl_rd_rsp_ready_hint[1];
assign lcl_rd_rsp_ready_hint[18] = mm_lcl_rd_rsp_ready_hint[2];
assign lcl_rd_rsp_ready_hint[26] = mm_lcl_rd_rsp_ready_hint[3];


assign lcl_rd_rsp_ready[3]       = st_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready[11]       = st_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready[19]      = st_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready[27]      = st_lcl_rd_rsp_ready;
assign lcl_rd_rsp_ready_hint[3]  = st_lcl_rd_rsp_ready_hint;
assign lcl_rd_rsp_ready_hint[11]  = st_lcl_rd_rsp_ready_hint;
assign lcl_rd_rsp_ready_hint[19] = st_lcl_rd_rsp_ready_hint;
assign lcl_rd_rsp_ready_hint[27] = st_lcl_rd_rsp_ready_hint;

assign {lcl_rd_rsp_ready[31:29], 
        lcl_rd_rsp_ready[25:21], 
        lcl_rd_rsp_ready[17:13], 
        lcl_rd_rsp_ready[9:5], 
        lcl_rd_rsp_ready[1:0]  } = 20'b0;

assign {lcl_rd_rsp_ready_hint[31:29], 
        lcl_rd_rsp_ready_hint[25:21], 
        lcl_rd_rsp_ready_hint[17:13], 
        lcl_rd_rsp_ready_hint[9:5], 
        lcl_rd_rsp_ready_hint[1:0]  } = 20'b0;

//TODO: spilt the *_lcl_rd_rsp_ready signal into 4 ready signals which is for an individual channel

// LCL Rd IF -> Arbiter -> Engines
always @(*) begin
    case (lcl_rd_data_axi_id[2:0])
        `DSC_ENGINE_ID: begin
                dsc_lcl_rd_data_valid  = lcl_rd_data_valid;
                dsc_lcl_rd_data_axi_id = lcl_rd_data_axi_id;
                dsc_lcl_rd_data        = lcl_rd_data;
                dsc_lcl_rd_data_last   = lcl_rd_data_last;
                dsc_lcl_rd_rsp_code    = lcl_rd_rsp_code;

                mm_lcl_rd_data_valid   = 1'b0; 
                mm_lcl_rd_data_axi_id  = 5'b0;
                mm_lcl_rd_data         = 1024'b0;
                mm_lcl_rd_data_last    = 1'b0;
                mm_lcl_rd_rsp_code     = 1'b0;

                st_lcl_rd_data_valid   = 1'b0; 
                st_lcl_rd_data_axi_id  = 5'b0;
                st_lcl_rd_data         = 1024'b0;
                st_lcl_rd_data_last    = 1'b0;
                st_lcl_rd_rsp_code     = 1'b0;
        end
        `H2AMM_ENGINE_ID: begin
                mm_lcl_rd_data_valid   = lcl_rd_data_valid;
                mm_lcl_rd_data_axi_id  = lcl_rd_data_axi_id;
                mm_lcl_rd_data         = lcl_rd_data;
                mm_lcl_rd_data_last    = lcl_rd_data_last;
                mm_lcl_rd_rsp_code     = lcl_rd_rsp_code;

                dsc_lcl_rd_data_valid  = 1'b0; 
                dsc_lcl_rd_data_axi_id = 5'b0;
                dsc_lcl_rd_data        = 1024'b0;
                dsc_lcl_rd_data_last   = 1'b0;
                dsc_lcl_rd_rsp_code    = 1'b0;

                st_lcl_rd_data_valid   = 1'b0; 
                st_lcl_rd_data_axi_id  = 5'b0;
                st_lcl_rd_data         = 1024'b0;
                st_lcl_rd_data_last    = 1'b0;
                st_lcl_rd_rsp_code     = 1'b0;
        end
        `H2AST_ENGINE_ID: begin
                st_lcl_rd_data_valid   = lcl_rd_data_valid;
                st_lcl_rd_data_axi_id  = lcl_rd_data_axi_id;
                st_lcl_rd_data         = lcl_rd_data;
                st_lcl_rd_data_last    = lcl_rd_data_last;
                st_lcl_rd_rsp_code     = lcl_rd_rsp_code;

                dsc_lcl_rd_data_valid  = 1'b0; 
                dsc_lcl_rd_data_axi_id = 5'b0;
                dsc_lcl_rd_data        = 1024'b0;
                dsc_lcl_rd_data_last   = 1'b0;
                dsc_lcl_rd_rsp_code    = 1'b0;

                mm_lcl_rd_data_valid   = 1'b0; 
                mm_lcl_rd_data_axi_id  = 5'b0;
                mm_lcl_rd_data         = 1024'b0;
                mm_lcl_rd_data_last    = 1'b0;
                mm_lcl_rd_rsp_code     = 1'b0;
        end
        default: begin
                dsc_lcl_rd_data_valid  = 1'b0;
                dsc_lcl_rd_data_axi_id = 5'b0;
                dsc_lcl_rd_data        = 1024'b0;
                dsc_lcl_rd_data_last   = 1'b0;
                dsc_lcl_rd_rsp_code    = 1'b0;

                mm_lcl_rd_data_valid   = 1'b0; 
                mm_lcl_rd_data_axi_id  = 5'b0;
                mm_lcl_rd_data         = 1024'b0;
                mm_lcl_rd_data_last    = 1'b0;
                mm_lcl_rd_rsp_code     = 1'b0;

                st_lcl_rd_data_valid   = 1'b0; 
                st_lcl_rd_data_axi_id  = 5'b0;
                st_lcl_rd_data         = 1024'b0;
                st_lcl_rd_data_last    = 1'b0;
                st_lcl_rd_rsp_code     = 1'b0;
        end
    endcase
end

endmodule











