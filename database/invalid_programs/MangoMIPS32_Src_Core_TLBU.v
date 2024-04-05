/********************MangoMIPS32*******************
Filename:   TLBU.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

`define  TLB_Idle      2'd0
`define  TLB_Translate 2'd1
`define  TLB_Ready     2'd2

module TLBU
(
    input  wire            clk,
    input  wire            rst,

    input  wire [`TLBOp  ] tlb_op,
    input  wire [`DataBus] Index,
    input  wire [`DataBus] Random,
    input  wire [`DataBus] EntryLo0,
    input  wire [`DataBus] EntryLo1,
    input  wire [`DataBus] PageMask,
    input  wire [`DataBus] EntryHi,

    input  wire            immu_en,
    input  wire [`AddrBus] immu_vaddr,
    output wire            immu_rdy,
    output reg  [`AddrBus] immu_paddr,
    output reg             immu_cat,
    input  wire            immu_stall,

    input  wire            dmmu_en,
    input  wire [`AddrBus] dmmu_vaddr,
    input  wire            dmmu_refs,
    output wire            dmmu_rdy,
    output reg  [`AddrBus] dmmu_paddr,
    output reg             dmmu_cat,
    input  wire            dmmu_stall,

    output reg             cp0_idxwen,
    output reg  [`DataBus] cp0_wIndex,
    output reg             cp0_tlbwen,
    output reg  [`TLB_Itm] cp0_tlbitm,

    output reg             i_tlbr,
    output reg             i_tlbi,
    output reg             d_tlbr,
    output reg             d_tlbi,
    output reg             d_tlbm
);

`ifdef Fixed_Mapping_MMU

    always @(*) begin
        cp0_idxwen <= `false;
        cp0_wIndex <= `ZeroWord;
        cp0_tlbwen <= `false;
        cp0_tlbitm <= 0;
        i_tlbi     <= `false;
        i_tlbr     <= `false;
        d_tlbi     <= `false;
        d_tlbr     <= `false;
        d_tlbm     <= `false;
    end

`else

    reg  [`TLB_Itm] TLB [`TLB_Sel];

    reg  [ 7: 0] ilk_asid,  dlk_asid;
    reg          ilk_valid, dlk_valid;

    // TLB translation : stage1
    reg  [`AddrBus] i_vaddr, d_vaddr;
    wire [`TLB_Sel] i_hit,   d_hit,   p_hit;
    wire [`TLB_Sel] i_match, d_match, p_match;
    wire [`TLB_Sel] i_avlb,  d_avlb,  p_avlb;

    genvar i;
    generate
        for (i = 0; i < `TLB_N; i = i + 1) begin
            assign i_match[i] = ((TLB[i][`TLB_VPN2] & ~TLB[i][`TLB_VMask])
                                  ^ (i_vaddr[`VPN2] & ~TLB[i][`TLB_VMask])) == 0;
            assign d_match[i] = ((TLB[i][`TLB_VPN2] & ~TLB[i][`TLB_VMask])
                                  ^ (d_vaddr[`VPN2] & ~TLB[i][`TLB_VMask])) == 0;
            assign p_match[i] = ((TLB[i][`TLB_VPN2] & ~TLB[i][`TLB_VMask])
                                  ^ (EntryHi[`VPN2] & ~TLB[i][`TLB_VMask])) == 0;
            assign i_avlb[i]  = TLB[i][`TLB_G] || (TLB[i][`TLB_ASID] ^ ilk_asid) == 0;
            assign d_avlb[i]  = TLB[i][`TLB_G] || (TLB[i][`TLB_ASID] ^ dlk_asid) == 0;
            assign p_avlb[i]  = TLB[i][`TLB_G] || (TLB[i][`TLB_ASID] ^ EntryHi[`ASID]) == 0;
            assign i_hit[i]   = i_match[i] && i_avlb[i];
            assign d_hit[i]   = d_match[i] && d_avlb[i];
            assign p_hit[i]   = p_match[i] && p_avlb[i];
        end
    endgenerate

    reg  [`TLB_Idx] i_hitidx, d_hitidx, p_hitidx;
    wire            i_miss,   d_miss,   p_miss;

    assign i_miss = i_hit == 0;
    assign d_miss = d_hit == 0;
    assign p_miss = p_hit == 0;
    
    always @(*) begin
        casez (i_hit)
            32'b00000000000000000000000000000001: i_hitidx <= 0;
            32'b0000000000000000000000000000001?: i_hitidx <= 1;
            32'b000000000000000000000000000001??: i_hitidx <= 2;
            32'b00000000000000000000000000001???: i_hitidx <= 3;
            32'b0000000000000000000000000001????: i_hitidx <= 4;
            32'b000000000000000000000000001?????: i_hitidx <= 5;
            32'b00000000000000000000000001??????: i_hitidx <= 6;
            32'b0000000000000000000000001???????: i_hitidx <= 7;
            32'b000000000000000000000001????????: i_hitidx <= 8;
            32'b00000000000000000000001?????????: i_hitidx <= 9;
            32'b0000000000000000000001??????????: i_hitidx <= 10;
            32'b000000000000000000001???????????: i_hitidx <= 11;
            32'b00000000000000000001????????????: i_hitidx <= 12;
            32'b0000000000000000001?????????????: i_hitidx <= 13;
            32'b000000000000000001??????????????: i_hitidx <= 14;
            32'b00000000000000001???????????????: i_hitidx <= 15;
            32'b0000000000000001????????????????: i_hitidx <= 16;
            32'b000000000000001?????????????????: i_hitidx <= 17;
            32'b00000000000001??????????????????: i_hitidx <= 18;
            32'b0000000000001???????????????????: i_hitidx <= 19;
            32'b000000000001????????????????????: i_hitidx <= 20;
            32'b00000000001?????????????????????: i_hitidx <= 21;
            32'b0000000001??????????????????????: i_hitidx <= 22;
            32'b000000001???????????????????????: i_hitidx <= 23;
            32'b00000001????????????????????????: i_hitidx <= 24;
            32'b0000001?????????????????????????: i_hitidx <= 25;
            32'b000001??????????????????????????: i_hitidx <= 26;
            32'b00001???????????????????????????: i_hitidx <= 27;
            32'b0001????????????????????????????: i_hitidx <= 28;
            32'b001?????????????????????????????: i_hitidx <= 29;
            32'b01??????????????????????????????: i_hitidx <= 30;
            32'b1???????????????????????????????: i_hitidx <= 31;
            default:                              i_hitidx <= 0;
        endcase

        casez (d_hit)
            32'b00000000000000000000000000000001: d_hitidx <= 0;
            32'b0000000000000000000000000000001?: d_hitidx <= 1;
            32'b000000000000000000000000000001??: d_hitidx <= 2;
            32'b00000000000000000000000000001???: d_hitidx <= 3;
            32'b0000000000000000000000000001????: d_hitidx <= 4;
            32'b000000000000000000000000001?????: d_hitidx <= 5;
            32'b00000000000000000000000001??????: d_hitidx <= 6;
            32'b0000000000000000000000001???????: d_hitidx <= 7;
            32'b000000000000000000000001????????: d_hitidx <= 8;
            32'b00000000000000000000001?????????: d_hitidx <= 9;
            32'b0000000000000000000001??????????: d_hitidx <= 10;
            32'b000000000000000000001???????????: d_hitidx <= 11;
            32'b00000000000000000001????????????: d_hitidx <= 12;
            32'b0000000000000000001?????????????: d_hitidx <= 13;
            32'b000000000000000001??????????????: d_hitidx <= 14;
            32'b00000000000000001???????????????: d_hitidx <= 15;
            32'b0000000000000001????????????????: d_hitidx <= 16;
            32'b000000000000001?????????????????: d_hitidx <= 17;
            32'b00000000000001??????????????????: d_hitidx <= 18;
            32'b0000000000001???????????????????: d_hitidx <= 19;
            32'b000000000001????????????????????: d_hitidx <= 20;
            32'b00000000001?????????????????????: d_hitidx <= 21;
            32'b0000000001??????????????????????: d_hitidx <= 22;
            32'b000000001???????????????????????: d_hitidx <= 23;
            32'b00000001????????????????????????: d_hitidx <= 24;
            32'b0000001?????????????????????????: d_hitidx <= 25;
            32'b000001??????????????????????????: d_hitidx <= 26;
            32'b00001???????????????????????????: d_hitidx <= 27;
            32'b0001????????????????????????????: d_hitidx <= 28;
            32'b001?????????????????????????????: d_hitidx <= 29;
            32'b01??????????????????????????????: d_hitidx <= 30;
            32'b1???????????????????????????????: d_hitidx <= 31;
            default:                              d_hitidx <= 0;
        endcase

        casez (p_hit)
            32'b00000000000000000000000000000001: p_hitidx <= 0;
            32'b0000000000000000000000000000001?: p_hitidx <= 1;
            32'b000000000000000000000000000001??: p_hitidx <= 2;
            32'b00000000000000000000000000001???: p_hitidx <= 3;
            32'b0000000000000000000000000001????: p_hitidx <= 4;
            32'b000000000000000000000000001?????: p_hitidx <= 5;
            32'b00000000000000000000000001??????: p_hitidx <= 6;
            32'b0000000000000000000000001???????: p_hitidx <= 7;
            32'b000000000000000000000001????????: p_hitidx <= 8;
            32'b00000000000000000000001?????????: p_hitidx <= 9;
            32'b0000000000000000000001??????????: p_hitidx <= 10;
            32'b000000000000000000001???????????: p_hitidx <= 11;
            32'b00000000000000000001????????????: p_hitidx <= 12;
            32'b0000000000000000001?????????????: p_hitidx <= 13;
            32'b000000000000000001??????????????: p_hitidx <= 14;
            32'b00000000000000001???????????????: p_hitidx <= 15;
            32'b0000000000000001????????????????: p_hitidx <= 16;
            32'b000000000000001?????????????????: p_hitidx <= 17;
            32'b00000000000001??????????????????: p_hitidx <= 18;
            32'b0000000000001???????????????????: p_hitidx <= 19;
            32'b000000000001????????????????????: p_hitidx <= 20;
            32'b00000000001?????????????????????: p_hitidx <= 21;
            32'b0000000001??????????????????????: p_hitidx <= 22;
            32'b000000001???????????????????????: p_hitidx <= 23;
            32'b00000001????????????????????????: p_hitidx <= 24;
            32'b0000001?????????????????????????: p_hitidx <= 25;
            32'b000001??????????????????????????: p_hitidx <= 26;
            32'b00001???????????????????????????: p_hitidx <= 27;
            32'b0001????????????????????????????: p_hitidx <= 28;
            32'b001?????????????????????????????: p_hitidx <= 29;
            32'b01??????????????????????????????: p_hitidx <= 30;
            32'b1???????????????????????????????: p_hitidx <= 31;
            default:                              p_hitidx <= 0;
        endcase
    end

    // TLB translation : stage2
    reg  [`TLB_Idx] i_idx,   d_idx;
    reg  [`TLB_Idx] i_eob,   d_eob; // EvenOddBit
    reg  [`PageNum] i_pfn,   d_pfn;
    reg  [`CacheAt] i_cat,   d_cat;
    reg             i_vld,   d_vld;
    reg             i_drt,   d_drt;

    reg  [`AddrBus] i_paddr, d_paddr;

    wire [`TLB_Itm] i_itm = TLB[i_idx];
    wire [`TLB_Itm] d_itm = TLB[d_idx];

    always @(*) begin
        casez (i_itm[`TLB_Mask])
            16'b0000000000000000: i_eob <= 12;
            16'b0000000000000011: i_eob <= 14;
            16'b00000000000011??: i_eob <= 16;
            16'b000000000011????: i_eob <= 18;
            16'b0000000011??????: i_eob <= 20;
            16'b00000011????????: i_eob <= 22;
            16'b000011??????????: i_eob <= 24;
            16'b0011????????????: i_eob <= 26;
            16'b11??????????????: i_eob <= 28;
            default:              i_eob <= 12; // UNDEFINED
        endcase

        casez (d_itm[`TLB_Mask])
            16'b0000000000000000: d_eob <= 12;
            16'b0000000000000011: d_eob <= 14;
            16'b00000000000011??: d_eob <= 16;
            16'b000000000011????: d_eob <= 18;
            16'b0000000011??????: d_eob <= 20;
            16'b00000011????????: d_eob <= 22;
            16'b000011??????????: d_eob <= 24;
            16'b0011????????????: d_eob <= 26;
            16'b11??????????????: d_eob <= 28;
            default:              d_eob <= 12; // UNDEFINED
        endcase

        if(i_vaddr[i_eob]) begin
            i_pfn <= i_itm[`TLB_PFN1];
            i_vld <= i_itm[`TLB_V1  ];
            i_cat <= i_itm[`TLB_C1  ];
            i_drt <= i_itm[`TLB_D1  ];
        end
        else begin
            i_pfn <= i_itm[`TLB_PFN0];
            i_vld <= i_itm[`TLB_V0  ];
            i_cat <= i_itm[`TLB_C0  ];
            i_drt <= i_itm[`TLB_D0  ];
        end

        if(d_vaddr[d_eob]) begin
            d_pfn <= d_itm[`TLB_PFN1];
            d_vld <= d_itm[`TLB_V1  ];
            d_cat <= d_itm[`TLB_C1  ];
            d_drt <= d_itm[`TLB_D1  ];
        end
        else begin
            d_pfn <= d_itm[`TLB_PFN0];
            d_vld <= d_itm[`TLB_V0  ];
            d_cat <= d_itm[`TLB_C0  ];
            d_drt <= d_itm[`TLB_D0  ];
        end

        case (i_eob)
            12:      i_paddr <= {i_pfn[19: 0], i_vaddr[11:0]};
            14:      i_paddr <= {i_pfn[19: 2], i_vaddr[13:0]};
            16:      i_paddr <= {i_pfn[19: 4], i_vaddr[15:0]};
            18:      i_paddr <= {i_pfn[19: 6], i_vaddr[17:0]};
            20:      i_paddr <= {i_pfn[19: 8], i_vaddr[19:0]};
            22:      i_paddr <= {i_pfn[19:10], i_vaddr[21:0]};
            24:      i_paddr <= {i_pfn[19:12], i_vaddr[23:0]};
            26:      i_paddr <= {i_pfn[19:14], i_vaddr[25:0]};
            28:      i_paddr <= {i_pfn[19:16], i_vaddr[27:0]};
            default: i_paddr <= {i_pfn[19: 0], i_vaddr[11:0]};
        endcase

        case (d_eob)
            12:      d_paddr <= {d_pfn[19: 0], d_vaddr[11:0]};
            14:      d_paddr <= {d_pfn[19: 2], d_vaddr[13:0]};
            16:      d_paddr <= {d_pfn[19: 4], d_vaddr[15:0]};
            18:      d_paddr <= {d_pfn[19: 6], d_vaddr[17:0]};
            20:      d_paddr <= {d_pfn[19: 8], d_vaddr[19:0]};
            22:      d_paddr <= {d_pfn[19:10], d_vaddr[21:0]};
            24:      d_paddr <= {d_pfn[19:12], d_vaddr[23:0]};
            26:      d_paddr <= {d_pfn[19:14], d_vaddr[25:0]};
            28:      d_paddr <= {d_pfn[19:16], d_vaddr[27:0]};
            default: d_paddr <= {d_pfn[19: 0], d_vaddr[11:0]};
        endcase
    end
    
    // TLB control & I/O
    reg  [ 1: 0] i_state,   d_state;

    assign immu_rdy = immu_en && ilk_valid;
    assign dmmu_rdy = dmmu_en && dlk_valid;


    wire   tlb_nop  = tlb_op == `TOP_NOP;

    wire [`TLB_Idx] idx_index = Index [`TLB_Idx];
    wire [`TLB_Idx] idx_rand  = Random[`TLB_Idx];

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            i_state    <= `TLB_Idle;
            i_vaddr    <= `ZeroWord;
            i_idx      <= 0;
            immu_paddr <= `ZeroWord;
            immu_cat   <= `false;
            ilk_asid   <= 0;
            ilk_valid  <= `false;
            i_tlbi     <= `false;
            i_tlbr     <= `false;

            d_state    <= `TLB_Idle;
            d_vaddr    <= `ZeroWord;
            d_idx      <= 0;
            dmmu_paddr <= `ZeroWord;
            dmmu_cat   <= `false;
            dlk_asid   <= 0;
            dlk_valid  <= `false;
            d_tlbi     <= `false;
            d_tlbr     <= `false;
            d_tlbm     <= `false;

            cp0_idxwen <= `false;
            cp0_wIndex <= `ZeroWord;
            cp0_tlbwen <= `false;
            cp0_tlbitm <= 0;
        end
        else begin
            cp0_idxwen <= `false;
            cp0_tlbwen <= `false;

            case (i_state)
                `TLB_Idle: begin
                    if(immu_en && !immu_rdy && tlb_nop) begin
                        i_state   <= `TLB_Translate;
                        i_vaddr   <= immu_vaddr;
                        ilk_asid  <= EntryHi[`ASID];
                    end
                end

                `TLB_Translate: begin
                    if(i_miss)  // TLBRefill
                        i_tlbr <= `true;
                    i_state <= `TLB_Ready;
                    i_idx   <= i_hitidx;
                end

                `TLB_Ready: begin
                    if(!i_vld)  // TLBInvalid
                        i_tlbi <= `true;
                    ilk_valid  <= `true;
                    immu_paddr <= i_paddr;
                    case (i_cat)
                        3'd3:    immu_cat <= `true;
                        default: immu_cat <= `false;
                    endcase
                    
                    if(!immu_stall) begin
                        i_state   <= `TLB_Idle;
                        ilk_valid <= `false;
                        i_tlbi    <= `false;
                        i_tlbr    <= `false;
                    end
                end
            endcase

            case (d_state)
                `TLB_Idle: begin
                    if(dmmu_en && !dmmu_rdy && tlb_nop) begin
                        d_state   <= `TLB_Translate;
                        d_vaddr   <= dmmu_vaddr;
                        dlk_asid  <= EntryHi[`ASID];
                    end
                end

                `TLB_Translate: begin
                    if(d_miss)  // TLBRefill
                        d_tlbr <= `true;
                    d_state <= `TLB_Ready;
                    d_idx   <= d_hitidx;
                end

                `TLB_Ready: begin
                    if(!d_vld)  // TLBInvalid
                        d_tlbi <= `true;
                    if(!d_drt && dmmu_refs)  // TLBModified
                        d_tlbm <= `true;
                    dlk_valid  <= `true;
                    dmmu_paddr <= d_paddr;
                    case (d_cat)
                        3'd3:    dmmu_cat <= `true;
                        default: dmmu_cat <= `false;
                    endcase

                    if(!dmmu_stall) begin
                        dlk_valid <= `false;
                        d_tlbi    <= `false;
                        d_tlbr    <= `false;
                        d_tlbm    <= `false;
                        d_state   <= `TLB_Idle;
                    end
                end
            endcase

            case (tlb_op)
                `TOP_TLBR: begin
                    cp0_tlbwen <= `true;
                    cp0_tlbitm <= TLB[idx_index];
                end

                `TOP_TLBP: begin
                    cp0_idxwen <= `true;
                    if(p_miss) cp0_wIndex <= 32'h80000000;
                    else       cp0_wIndex <= {32'b0, p_hitidx};
                end
            endcase
        end
    end
    
    integer j;
    initial begin
        for(j = 0; j < `TLB_N; j = j + 1)
            TLB[j] <= 0;
    end
    
    always @(posedge clk) begin
        case (tlb_op)
            `TOP_TLBWI: begin
                TLB[idx_index][`TLB_Mask] <= PageMask[`Mask];
                TLB[idx_index][`TLB_VPN2] <= EntryHi [`VPN2] & ~PageMask[`VMask];
                TLB[idx_index][`TLB_ASID] <= EntryHi [`ASID];
                TLB[idx_index][`TLB_G   ] <= EntryLo0[`Glb ] & EntryLo1[`Glb];
                TLB[idx_index][`TLB_PFN0] <= EntryLo0[`PFN ] & ~PageMask[`PMask];
                TLB[idx_index][`TLB_V0  ] <= EntryLo0[`Vld ];
                TLB[idx_index][`TLB_D0  ] <= EntryLo0[`Drt ];
                TLB[idx_index][`TLB_C0  ] <= EntryLo0[`CAt ];
                TLB[idx_index][`TLB_PFN1] <= EntryLo1[`PFN ] & ~PageMask[`PMask];
                TLB[idx_index][`TLB_V1  ] <= EntryLo1[`Vld ];
                TLB[idx_index][`TLB_D1  ] <= EntryLo1[`Drt ];
                TLB[idx_index][`TLB_C1  ] <= EntryLo1[`CAt ];
            end

            `TOP_TLBWR: begin
                TLB[idx_rand][`TLB_Mask] <= PageMask[`Mask];
                TLB[idx_rand][`TLB_VPN2] <= EntryHi [`VPN2] & ~PageMask[`VMask];
                TLB[idx_rand][`TLB_ASID] <= EntryHi [`ASID];
                TLB[idx_rand][`TLB_G   ] <= EntryLo0[`Glb ] & EntryLo1[`Glb];
                TLB[idx_rand][`TLB_PFN0] <= EntryLo0[`PFN ] & ~PageMask[`PMask];
                TLB[idx_rand][`TLB_V0  ] <= EntryLo0[`Vld ];
                TLB[idx_rand][`TLB_D0  ] <= EntryLo0[`Drt ];
                TLB[idx_rand][`TLB_C0  ] <= EntryLo0[`CAt ];
                TLB[idx_rand][`TLB_PFN1] <= EntryLo1[`PFN ] & ~PageMask[`PMask];
                TLB[idx_rand][`TLB_V1  ] <= EntryLo1[`Vld ];
                TLB[idx_rand][`TLB_D1  ] <= EntryLo1[`Drt ];
                TLB[idx_rand][`TLB_C1  ] <= EntryLo1[`CAt ];
            end
        endcase
    end
    
`endif

endmodule