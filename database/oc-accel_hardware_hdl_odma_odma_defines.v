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

`include "snap_global_vars.v"

//------------------------------------------------------------------------------
// Convert bit width to byte log width
//------------------------------------------------------------------------------
`define BIT2BYTE_LOG(x) \
    (x == 8)    ? 0 : \
    (x == 16)   ? 1 : \
    (x == 32)   ? 2 : \
    (x == 64)   ? 3 : \
    (x == 128)  ? 4 : \
    (x == 256)  ? 5 : \
    (x == 512)  ? 6 : \
    (x == 1024) ? 7 : 0

//------------------------------------------------------------------------------
// Engine IDs
//------------------------------------------------------------------------------
`define H2AMM_ENGINE_ID 3'b010
`define H2AST_ENGINE_ID 3'b011
`define A2HMM_ENGINE_ID 3'b000
`define A2HST_ENGINE_ID 3'b001
`define DSC_ENGINE_ID   3'b100
`define CMP_ENGINE_ID   3'b101

//------------------------------------------------------------------------------
//Regitster address
//------------------------------------------------------------------------------
`define ODMA_MMIO_ADDR_START            32'h00000000
`define ODMA_MMIO_ADDR_END              32'h00010000
//H2A channel registers
`define H2A_CH0_ID                      32'h00000000
`define H2A_CH0_CTRL                    32'h00000004
`define H2A_CH0_CTRL_W1S                32'h00000008
`define H2A_CH0_CTRL_W1C                32'h0000000C
`define H2A_CH0_STAT                    32'h00000040
`define H2A_CH0_STAT_RC                 32'h00000044
`define H2A_CH0_CMP_DSC_CNT             32'h00000048
`define H2A_CH0_ALIGN                   32'h0000004C
`define H2A_CH0_WB_SIZE                 32'h00000080
`define H2A_CH0_WB_ADDR_LO              32'h00000088
`define H2A_CH0_WB_ADDR_HI              32'h0000008C
`define H2A_CH0_INTR_EN_MASK            32'h00000090
`define H2A_CH0_INTR_EN_MASK_W1S        32'h00000094
`define H2A_CH0_INTR_EN_MASK_W1C        32'h00000098
`define H2A_CH0_PERF_MON_CTRL           32'h000000C0
`define H2A_CH0_PERF_CYC_CNT_LO         32'h000000C4
`define H2A_CH0_PERF_CYC_CNT_HI         32'h000000C8
`define H2A_CH0_PERF_DATA_CNT_LO        32'h000000CC
`define H2A_CH0_PERF_DATA_CNT_HI        32'h000000D0
`define H2A_CH1_ID                      32'h00000100
`define H2A_CH1_CTRL                    32'h00000104
`define H2A_CH1_CTRL_W1S                32'h00000108
`define H2A_CH1_CTRL_W1C                32'h0000010C
`define H2A_CH1_STAT                    32'h00000140
`define H2A_CH1_STAT_RC                 32'h00000144
`define H2A_CH1_CMP_DSC_CNT             32'h00000148
`define H2A_CH1_ALIGN                   32'h0000014C
`define H2A_CH1_WB_SIZE                 32'h00000180
`define H2A_CH1_WB_ADDR_LO              32'h00000188
`define H2A_CH1_WB_ADDR_HI              32'h0000018C
`define H2A_CH1_INTR_EN_MASK            32'h00000190
`define H2A_CH1_INTR_EN_MASK_W1S        32'h00000194
`define H2A_CH1_INTR_EN_MASK_W1C        32'h00000198
`define H2A_CH1_PERF_MON_CTRL           32'h000001C0
`define H2A_CH1_PERF_CYC_CNT_LO         32'h000001C4
`define H2A_CH1_PERF_CYC_CNT_HI         32'h000001C8
`define H2A_CH1_PERF_DATA_CNT_LO        32'h000001CC
`define H2A_CH1_PERF_DATA_CNT_HI        32'h000001D0
`define H2A_CH2_ID                      32'h00000200
`define H2A_CH2_CTRL                    32'h00000204
`define H2A_CH2_CTRL_W1S                32'h00000208
`define H2A_CH2_CTRL_W1C                32'h0000020C
`define H2A_CH2_STAT                    32'h00000240
`define H2A_CH2_STAT_RC                 32'h00000244
`define H2A_CH2_CMP_DSC_CNT             32'h00000248
`define H2A_CH2_ALIGN                   32'h0000024C
`define H2A_CH2_WB_SIZE                 32'h00000280
`define H2A_CH2_WB_ADDR_LO              32'h00000288
`define H2A_CH2_WB_ADDR_HI              32'h0000028C
`define H2A_CH2_INTR_EN_MASK            32'h00000290
`define H2A_CH2_INTR_EN_MASK_W1S        32'h00000294
`define H2A_CH2_INTR_EN_MASK_W1C        32'h00000298
`define H2A_CH2_PERF_MON_CTRL           32'h000002C0
`define H2A_CH2_PERF_CYC_CNT_LO         32'h000002C4
`define H2A_CH2_PERF_CYC_CNT_HI         32'h000002C8
`define H2A_CH2_PERF_DATA_CNT_LO        32'h000002CC
`define H2A_CH2_PERF_DATA_CNT_HI        32'h000002D0
`define H2A_CH3_ID                      32'h00000300
`define H2A_CH3_CTRL                    32'h00000304
`define H2A_CH3_CTRL_W1S                32'h00000308
`define H2A_CH3_CTRL_W1C                32'h0000030C
`define H2A_CH3_STAT                    32'h00000340
`define H2A_CH3_STAT_RC                 32'h00000344
`define H2A_CH3_CMP_DSC_CNT             32'h00000348
`define H2A_CH3_ALIGN                   32'h0000034C
`define H2A_CH3_WB_SIZE                 32'h00000380
`define H2A_CH3_WB_ADDR_LO              32'h00000388
`define H2A_CH3_WB_ADDR_HI              32'h0000038C
`define H2A_CH3_INTR_EN_MASK            32'h00000390
`define H2A_CH3_INTR_EN_MASK_W1S        32'h00000394
`define H2A_CH3_INTR_EN_MASK_W1C        32'h00000398
`define H2A_CH3_PERF_MON_CTRL           32'h000003C0
`define H2A_CH3_PERF_CYC_CNT_LO         32'h000003C4
`define H2A_CH3_PERF_CYC_CNT_HI         32'h000003C8
`define H2A_CH3_PERF_DATA_CNT_LO        32'h000003CC
`define H2A_CH3_PERF_DATA_CNT_HI        32'h000003D0

//A2H channel registers
`define A2H_CH0_ID                      32'h00001000
`define A2H_CH0_CTRL                    32'h00001004
`define A2H_CH0_CTRL_W1S                32'h00001008
`define A2H_CH0_CTRL_W1C                32'h0000100C
`define A2H_CH0_STAT                    32'h00001040
`define A2H_CH0_STAT_RC                 32'h00001044
`define A2H_CH0_CMP_DSC_CNT             32'h00001048
`define A2H_CH0_ALIGN                   32'h0000104C
`define A2H_CH0_WB_SIZE                 32'h00001080
`define A2H_CH0_WB_ADDR_LO              32'h00001088
`define A2H_CH0_WB_ADDR_HI              32'h0000108C
`define A2H_CH0_INTR_EN_MASK            32'h00001090
`define A2H_CH0_INTR_EN_MASK_W1S        32'h00001094
`define A2H_CH0_INTR_EN_MASK_W1C        32'h00001098
`define A2H_CH0_PERF_MON_CTRL           32'h000010C0
`define A2H_CH0_PERF_CYC_CNT_LO         32'h000010C4
`define A2H_CH0_PERF_CYC_CNT_HI         32'h000010C8
`define A2H_CH0_PERF_DATA_CNT_LO        32'h000010CC
`define A2H_CH0_PERF_DATA_CNT_HI        32'h000010D0
`define A2H_CH1_ID                      32'h00001100
`define A2H_CH1_CTRL                    32'h00001104
`define A2H_CH1_CTRL_W1S                32'h00001108
`define A2H_CH1_CTRL_W1C                32'h0000110C
`define A2H_CH1_STAT                    32'h00001140
`define A2H_CH1_STAT_RC                 32'h00001144
`define A2H_CH1_CMP_DSC_CNT             32'h00001148
`define A2H_CH1_ALIGN                   32'h0000114C
`define A2H_CH1_WB_SIZE                 32'h00001180
`define A2H_CH1_WB_ADDR_LO              32'h00001188
`define A2H_CH1_WB_ADDR_HI              32'h0000118C
`define A2H_CH1_INTR_EN_MASK            32'h00001190
`define A2H_CH1_INTR_EN_MASK_W1S        32'h00001194
`define A2H_CH1_INTR_EN_MASK_W1C        32'h00001198
`define A2H_CH1_PERF_MON_CTRL           32'h000011C0
`define A2H_CH1_PERF_CYC_CNT_LO         32'h000011C4
`define A2H_CH1_PERF_CYC_CNT_HI         32'h000011C8
`define A2H_CH1_PERF_DATA_CNT_LO        32'h000011CC
`define A2H_CH1_PERF_DATA_CNT_HI        32'h000011D0
`define A2H_CH2_ID                      32'h00001200
`define A2H_CH2_CTRL                    32'h00001204
`define A2H_CH2_CTRL_W1S                32'h00001208
`define A2H_CH2_CTRL_W1C                32'h0000120C
`define A2H_CH2_STAT                    32'h00001240
`define A2H_CH2_STAT_RC                 32'h00001244
`define A2H_CH2_CMP_DSC_CNT             32'h00001248
`define A2H_CH2_ALIGN                   32'h0000124C
`define A2H_CH2_WB_SIZE                 32'h00001280
`define A2H_CH2_WB_ADDR_LO              32'h00001288
`define A2H_CH2_WB_ADDR_HI              32'h0000128C
`define A2H_CH2_INTR_EN_MASK            32'h00001290
`define A2H_CH2_INTR_EN_MASK_W1S        32'h00001294
`define A2H_CH2_INTR_EN_MASK_W1C        32'h00001298
`define A2H_CH2_PERF_MON_CTRL           32'h000012C0
`define A2H_CH2_PERF_CYC_CNT_LO         32'h000012C4
`define A2H_CH2_PERF_CYC_CNT_HI         32'h000012C8
`define A2H_CH2_PERF_DATA_CNT_LO        32'h000012CC
`define A2H_CH2_PERF_DATA_CNT_HI        32'h000012D0
`define A2H_CH3_ID                      32'h00001300
`define A2H_CH3_CTRL                    32'h00001304
`define A2H_CH3_CTRL_W1S                32'h00001308
`define A2H_CH3_CTRL_W1C                32'h0000130C
`define A2H_CH3_STAT                    32'h00001340
`define A2H_CH3_STAT_RC                 32'h00001344
`define A2H_CH3_CMP_DSC_CNT             32'h00001348
`define A2H_CH3_ALIGN                   32'h0000134C
`define A2H_CH3_WB_SIZE                 32'h00001380
`define A2H_CH3_WB_ADDR_LO              32'h00001388
`define A2H_CH3_WB_ADDR_HI              32'h0000138C
`define A2H_CH3_INTR_EN_MASK            32'h00001390
`define A2H_CH3_INTR_EN_MASK_W1S        32'h00001394
`define A2H_CH3_INTR_EN_MASK_W1C        32'h00001398
`define A2H_CH3_PERF_MON_CTRL           32'h000013C0
`define A2H_CH3_PERF_CYC_CNT_LO         32'h000013C4
`define A2H_CH3_PERF_CYC_CNT_HI         32'h000013C8
`define A2H_CH3_PERF_DATA_CNT_LO        32'h000013CC
`define A2H_CH3_PERF_DATA_CNT_HI        32'h000013D0

//Interrupt block registers
`define INTR_ID                         32'h00002000
`define INTR_USER_EN_MASK               32'h00002004
`define INTR_USER_EN_MASK_W1S           32'h00002008
`define INTR_USER_EN_MASK_W1C           32'h0000200C
`define INTR_CHNL_EN_MASK               32'h00002010
`define INTR_CHNL_EN_MASK_W1S           32'h00002014
`define INTR_CHNL_EN_MASK_W1C           32'h00002018
`define INTR_USER_REQ                   32'h00002040
`define INTR_CHNL_REQ                   32'h00002044
`define INTR_USER_PENDING               32'h00002048
`define INTR_CHNL_PENDING               32'h0000204C
`define INTR_CH0_OBJ_HANDLE_LO          32'h00002050
`define INTR_CH0_OBJ_HANDLE_HI          32'h00002054
`define INTR_CH1_OBJ_HANDLE_LO          32'h00002058
`define INTR_CH1_OBJ_HANDLE_HI          32'h0000205C
`define INTR_CH2_OBJ_HANDLE_LO          32'h00002060
`define INTR_CH2_OBJ_HANDLE_HI          32'h00002064
`define INTR_CH3_OBJ_HANDLE_LO          32'h00002068
`define INTR_CH3_OBJ_HANDLE_HI          32'h0000206C

//Config registers
`define CFG_ID                          32'h00003000
`define CFG_AXI_MAX_WR_SIZE             32'h00003040
`define CFG_AXI_MAX_RD_SIZE             32'h00003044
`define CFG_AXI_WR_FLUSH_TIMEOUT        32'h00003060

//H2A channel DMA registers
`define H2A_CH0_DMA_ID                  32'h00004000
`define H2A_CH0_DMA_DSC_ADDR_LO         32'h00004080
`define H2A_CH0_DMA_DSC_ADDR_HI         32'h00004084
`define H2A_CH0_DMA_DSC_ADJ             32'h00004088
`define H2A_CH0_DMA_DSC_CREDIT          32'h0000408C
`define H2A_CH1_DMA_ID                  32'h00004100
`define H2A_CH1_DMA_DSC_ADDR_LO         32'h00004180
`define H2A_CH1_DMA_DSC_ADDR_HI         32'h00004184
`define H2A_CH1_DMA_DSC_ADJ             32'h00004188
`define H2A_CH1_DMA_DSC_CREDIT          32'h0000418C
`define H2A_CH2_DMA_ID                  32'h00004200
`define H2A_CH2_DMA_DSC_ADDR_LO         32'h00004280
`define H2A_CH2_DMA_DSC_ADDR_HI         32'h00004284
`define H2A_CH2_DMA_DSC_ADJ             32'h00004288
`define H2A_CH2_DMA_DSC_CREDIT          32'h0000428C
`define H2A_CH3_DMA_ID                  32'h00004300
`define H2A_CH3_DMA_DSC_ADDR_LO         32'h00004380
`define H2A_CH3_DMA_DSC_ADDR_HI         32'h00004384
`define H2A_CH3_DMA_DSC_ADJ             32'h00004388
`define H2A_CH3_DMA_DSC_CREDIT          32'h0000438C

//A2H channel DMA registers
`define A2H_CH0_DMA_ID                  32'h00005000
`define A2H_CH0_DMA_DSC_ADDR_LO         32'h00005080
`define A2H_CH0_DMA_DSC_ADDR_HI         32'h00005084
`define A2H_CH0_DMA_DSC_ADJ             32'h00005088
`define A2H_CH0_DMA_DSC_CREDIT          32'h0000508C
`define A2H_CH1_DMA_ID                  32'h00005100
`define A2H_CH1_DMA_DSC_ADDR_LO         32'h00005180
`define A2H_CH1_DMA_DSC_ADDR_HI         32'h00005184
`define A2H_CH1_DMA_DSC_ADJ             32'h00005188
`define A2H_CH1_DMA_DSC_CREDIT          32'h0000518C
`define A2H_CH2_DMA_ID                  32'h00005200
`define A2H_CH2_DMA_DSC_ADDR_LO         32'h00005280
`define A2H_CH2_DMA_DSC_ADDR_HI         32'h00005284
`define A2H_CH2_DMA_DSC_ADJ             32'h00005288
`define A2H_CH2_DMA_DSC_CREDIT          32'h0000528C
`define A2H_CH3_DMA_ID                  32'h00005300
`define A2H_CH3_DMA_DSC_ADDR_LO         32'h00005380
`define A2H_CH3_DMA_DSC_ADDR_HI         32'h00005384
`define A2H_CH3_DMA_DSC_ADJ             32'h00005388
`define A2H_CH3_DMA_DSC_CREDIT          32'h0000538C

//DMA common registers
`define DMA_COMMON_ID                   32'h00006000
`define DMA_COMMON_DSC_CTRL             32'h00006010
`define DMA_COMMON_DSC_CTRL_W1S         32'h00006014
`define DMA_COMMON_DSC_CTRL_W1C         32'h00006018
`define DMA_COMMON_DSC_CREDIT_EN        32'h00006020
`define DMA_COMMON_DSC_CREDIT_EN_W1S    32'h00006024
`define DMA_COMMON_DSC_CREDIT_EN_W1C    32'h00006028

`ifdef ENABLE_ODMA_512
    `define ACTION_DATA_WIDTH_512
`endif


