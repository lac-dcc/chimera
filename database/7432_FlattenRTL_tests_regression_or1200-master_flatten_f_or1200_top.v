// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module or1200_top #(
        parameter dw =32,
        parameter aw =32,
        parameter ppic_ints =20,
        parameter boot_adr =32'h00000100,
        parameter iwb_biu_bl=(1<<(4-2)),
        parameter iwb_biu_dw=32,
        parameter iwb_biu_aw=32,
        parameter dwb_biu_bl=(1<<(4-2)),
        parameter dwb_biu_dw=32,
        parameter dwb_biu_aw=32,
        parameter or1200_immu_top_boot_adr=boot_adr,
        parameter or1200_immu_top_dw=32,
        parameter or1200_immu_top_aw=32,
        parameter or1200_immu_top_or1200_immu_tlb_dw=32,
        parameter or1200_immu_top_or1200_immu_tlb_aw=32,
        parameter or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_aw=6,
        parameter or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_dw=14,
        parameter or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_aw=6,
        parameter or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_dw=22,
        parameter or1200_ic_top_dw=32,
        parameter or1200_ic_top_or1200_ic_ram_dw=32,
        parameter or1200_ic_top_or1200_ic_ram_aw=13-2,
        parameter or1200_ic_top_or1200_ic_ram_ic_ram0_aw=13-2,
        parameter or1200_ic_top_or1200_ic_ram_ic_ram0_dw=32,
        parameter or1200_ic_top_or1200_ic_tag_dw=20,
        parameter or1200_ic_top_or1200_ic_tag_aw=13-4,
        parameter or1200_ic_top_or1200_ic_tag_ic_tag0_aw=13-4,
        parameter or1200_ic_top_or1200_ic_tag_ic_tag0_dw=20,
        parameter or1200_cpu_boot_adr=boot_adr,
        parameter or1200_cpu_dw=32,
        parameter or1200_cpu_aw=5,
        parameter or1200_cpu_or1200_genpc_boot_adr=or1200_cpu_boot_adr,
        parameter or1200_cpu_or1200_rf_dw=32,
        parameter or1200_cpu_or1200_rf_aw=5,
        parameter or1200_cpu_or1200_rf_rf_a_aw=5,
        parameter or1200_cpu_or1200_rf_rf_a_dw=32,
        parameter or1200_cpu_or1200_rf_rf_b_aw=5,
        parameter or1200_cpu_or1200_rf_rf_b_dw=32,
        parameter or1200_cpu_or1200_operandmuxes_width=32,
        parameter or1200_cpu_or1200_fpu_width=32,
        parameter or1200_cpu_or1200_mult_mac_width=32,
        parameter or1200_cpu_or1200_sprs_width=32,
        parameter or1200_cpu_or1200_lsu_dw=32,
        parameter or1200_cpu_or1200_lsu_aw=5,
        parameter or1200_cpu_or1200_lsu_or1200_mem2reg_width=32,
        parameter or1200_cpu_or1200_lsu_or1200_reg2mem_width=32,
        parameter or1200_cpu_or1200_wbmux_width=32,
        parameter or1200_dmmu_top_dw=32,
        parameter or1200_dmmu_top_aw=32,
        parameter or1200_dmmu_top_or1200_dmmu_tlb_dw=32,
        parameter or1200_dmmu_top_or1200_dmmu_tlb_aw=32,
        parameter or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_aw=6,
        parameter or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_dw=14,
        parameter or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_aw=6,
        parameter or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_dw=24,
        parameter or1200_dc_top_dw=32,
        parameter or1200_dc_top_aw=32,
        parameter or1200_dc_top_or1200_dc_ram_dw=32,
        parameter or1200_dc_top_or1200_dc_ram_aw=13-2,
        parameter or1200_dc_top_or1200_dc_ram_dc_ram_aw=13-2,
        parameter or1200_dc_top_or1200_dc_ram_dc_ram_dw=or1200_dc_top_or1200_dc_ram_dw,
        parameter or1200_dc_top_or1200_dc_tag_dw=20+1,
        parameter or1200_dc_top_or1200_dc_tag_aw=13-4,
        parameter or1200_dc_top_or1200_dc_tag_dc_tag0_aw=13-4,
        parameter or1200_dc_top_or1200_dc_tag_dc_tag0_dw=20+1,
        parameter or1200_qmem_top_dw=32,
        parameter or1200_sb_dw=32,
        parameter or1200_sb_aw=32,
        parameter or1200_du_dw=32,
        parameter or1200_du_aw=32) (
            input clk_i,
            input rst_i,
            input [ppic_ints-1:0] pic_ints_i,
            input [1:0] clmode_i,
            input iwb_clk_i,
            input iwb_rst_i,
            input iwb_ack_i,
            input iwb_err_i,
            input iwb_rty_i,
            input [dw-1:0] iwb_dat_i,
            output iwb_cyc_o,
            output [aw-1:0] iwb_adr_o,
            output iwb_stb_o,
            output iwb_we_o,
            output [3:0] iwb_sel_o,
            output [dw-1:0] iwb_dat_o,
            output [2:0] iwb_cti_o,
            output [1:0] iwb_bte_o,
            input dwb_clk_i,
            input dwb_rst_i,
            input dwb_ack_i,
            input dwb_err_i,
            input dwb_rty_i,
            input [dw-1:0] dwb_dat_i,
            output dwb_cyc_o,
            output [aw-1:0] dwb_adr_o,
            output dwb_stb_o,
            output dwb_we_o,
            output [3:0] dwb_sel_o,
            output [dw-1:0] dwb_dat_o,
            output [2:0] dwb_cti_o,
            output [1:0] dwb_bte_o,
            input dbg_stall_i,
            input dbg_ewt_i,
            output [3:0] dbg_lss_o,
            output [1:0] dbg_is_o,
            output [10:0] dbg_wp_o,
            output dbg_bp_o,
            input dbg_stb_i,
            input dbg_we_i,
            input [aw-1:0] dbg_adr_i,
            input [dw-1:0] dbg_dat_i,
            output [dw-1:0] dbg_dat_o,
            output dbg_ack_o,
            input pm_cpustall_i,
            output [3:0] pm_clksd_o,
            output pm_dc_gate_o,
            output pm_ic_gate_o,
            output pm_dmmu_gate_o,
            output pm_immu_gate_o,
            output pm_tt_gate_o,
            output pm_cpu_gate_o,
            output pm_wakeup_o,
            output pm_lvolt_o,
            output sig_tick) ;




    wire [dw-1:0] dcsb_dat_dc ;
    wire [aw-1:0] dcsb_adr_dc ;
    wire dcsb_cyc_dc ;
    wire dcsb_stb_dc ;
    wire dcsb_we_dc ;
    wire [3:0] dcsb_sel_dc ;
    wire dcsb_cab_dc ;
    wire [dw-1:0] dcsb_dat_sb ;
    wire dcsb_ack_sb ;
    wire dcsb_err_sb ;
    wire [dw-1:0] sbbiu_dat_sb ;
    wire [aw-1:0] sbbiu_adr_sb ;
    wire sbbiu_cyc_sb ;
    wire sbbiu_stb_sb ;
    wire sbbiu_we_sb ;
    wire [3:0] sbbiu_sel_sb ;
    wire sbbiu_cab_sb ;
    wire [dw-1:0] sbbiu_dat_biu ;
    wire sbbiu_ack_biu ;
    wire sbbiu_err_biu ;
    wire [dw-1:0] icbiu_dat_ic ;
    wire [aw-1:0] icbiu_adr_ic ;
    wire [aw-1:0] icbiu_adr_ic_word ;
    wire icbiu_cyc_ic ;
    wire icbiu_stb_ic ;
    wire icbiu_we_ic ;
    wire [3:0] icbiu_sel_ic ;
    wire [3:0] icbiu_tag_ic ;
    wire icbiu_cab_ic ;
    wire [dw-1:0] icbiu_dat_biu ;
    wire icbiu_ack_biu ;
    wire icbiu_err_biu ;
    wire [3:0] icbiu_tag_biu ;
    wire boot_adr_sel=1'b0 ;
    wire supv ;
    wire [aw-1:0] spr_addr ;
    wire [dw-1:0] spr_dat_cpu ;
    wire [31:0] spr_cs ;
    wire spr_we ;
    wire mtspr_dc_done ;
    wire sb_en ;
    wire dmmu_en ;
    wire [31:0] spr_dat_dmmu ;
    wire qmemdmmu_err_qmem ;
    wire [3:0] qmemdmmu_tag_qmem ;
    wire [aw-1:0] qmemdmmu_adr_dmmu ;
    wire qmemdmmu_cycstb_dmmu ;
    wire qmemdmmu_ci_dmmu ;
    wire dc_en ;
    wire [31:0] dcpu_adr_cpu ;
    wire dcpu_cycstb_cpu ;
    wire dcpu_we_cpu ;
    wire [3:0] dcpu_sel_cpu ;
    wire [3:0] dcpu_tag_cpu ;
    wire [31:0] dcpu_dat_cpu ;
    wire [31:0] dcpu_dat_qmem ;
    wire dcpu_ack_qmem ;
    wire dcpu_rty_qmem ;
    wire dcpu_err_dmmu ;
    wire [3:0] dcpu_tag_dmmu ;
    wire dc_no_writethrough ;
    wire immu_en ;
    wire [31:0] spr_dat_immu ;
    wire ic_en ;
    wire [31:0] icpu_adr_cpu ;
    wire icpu_cycstb_cpu ;
    wire [3:0] icpu_sel_cpu ;
    wire [3:0] icpu_tag_cpu ;
    wire [31:0] icpu_dat_qmem ;
    wire icpu_ack_qmem ;
    wire [31:0] icpu_adr_immu ;
    wire icpu_err_immu ;
    wire [3:0] icpu_tag_immu ;
    wire icpu_rty_immu ;
    wire [aw-1:0] qmemimmu_adr_immu ;
    wire qmemimmu_rty_qmem ;
    wire qmemimmu_err_qmem ;
    wire [3:0] qmemimmu_tag_qmem ;
    wire qmemimmu_cycstb_immu ;
    wire qmemimmu_ci_immu ;
    wire [aw-1:0] icqmem_adr_qmem ;
    wire icqmem_rty_ic ;
    wire icqmem_err_ic ;
    wire [3:0] icqmem_tag_ic ;
    wire icqmem_cycstb_qmem ;
    wire icqmem_ci_qmem ;
    wire [31:0] icqmem_dat_ic ;
    wire icqmem_ack_ic ;
    wire [aw-1:0] dcqmem_adr_qmem ;
    wire dcqmem_rty_dc ;
    wire dcqmem_err_dc ;
    wire [3:0] dcqmem_tag_dc ;
    wire dcqmem_cycstb_qmem ;
    wire dcqmem_ci_qmem ;
    wire [31:0] dcqmem_dat_dc ;
    wire [31:0] dcqmem_dat_qmem ;
    wire dcqmem_we_qmem ;
    wire [3:0] dcqmem_sel_qmem ;
    wire dcqmem_ack_dc ;
    wire [dw-1:0] spr_dat_pic ;
    wire pic_wakeup ;
    wire sig_int ;
    wire [dw-1:0] spr_dat_pm ;
    wire [dw-1:0] spr_dat_tt ;
    wire [dw-1:0] spr_dat_du ;
    wire du_stall ;
    wire [dw-1:0] du_addr ;
    wire [dw-1:0] du_dat_du ;
    wire du_read ;
    wire du_write ;
    wire [13:0] du_except_trig ;
    wire [13:0] du_except_stop ;
    wire [14-1:0] du_dsr ;
    wire [24:0] du_dmr1 ;
    wire [dw-1:0] du_dat_cpu ;
    wire [dw-1:0] du_lsu_store_dat ;
    wire [dw-1:0] du_lsu_load_dat ;
    wire du_hwbkpt ;
    wire du_hwbkpt_ls_r=1'b0 ;
    wire du_flush_pipe ;
    wire flushpipe ;
    wire ex_freeze ;
    wire wb_freeze ;
    wire id_void ;
    wire ex_void ;
    wire [31:0] id_insn ;
    wire [31:0] ex_insn ;
    wire [31:0] wb_insn ;
    wire [31:0] id_pc ;
    wire [31:0] ex_pc ;
    wire [31:0] wb_pc ;
    wire [3-1:0] branch_op ;
    wire [31:0] spr_dat_npc ;
    wire [31:0] rf_dataw ;
    wire abort_ex ;
    wire abort_mvspr ;
    wire [3:0] icqmem_sel_qmem ;
    wire [3:0] icqmem_tag_qmem ;
    wire [3:0] dcqmem_tag_qmem ;

    wire  iwb_biu_clk;
    wire  iwb_biu_rst;
    wire [1:0] iwb_biu_clmode;
    wire  iwb_biu_wb_clk_i;
    wire  iwb_biu_wb_rst_i;
    wire  iwb_biu_wb_ack_i;
    wire  iwb_biu_wb_err_i;
    wire  iwb_biu_wb_rty_i;
    wire [ iwb_biu_dw -1:0] iwb_biu_wb_dat_i;
    reg  iwb_biu_wb_cyc_o;
    reg [ iwb_biu_aw -1:0] iwb_biu_wb_adr_o;
    reg  iwb_biu_wb_stb_o;
    reg  iwb_biu_wb_we_o;
    reg [3:0] iwb_biu_wb_sel_o;
    wire [ iwb_biu_dw -1:0] iwb_biu_wb_dat_o;
    reg [2:0] iwb_biu_wb_cti_o;
    reg [1:0] iwb_biu_wb_bte_o;
    wire [ iwb_biu_dw -1:0] iwb_biu_biu_dat_i;
    wire [ iwb_biu_aw -1:0] iwb_biu_biu_adr_i;
    wire  iwb_biu_biu_cyc_i;
    wire  iwb_biu_biu_stb_i;
    wire  iwb_biu_biu_we_i;
    wire [3:0] iwb_biu_biu_sel_i;
    wire  iwb_biu_biu_cab_i;
    wire [31:0] iwb_biu_biu_dat_o;
    wire  iwb_biu_biu_ack_o;
    wire  iwb_biu_biu_err_o;
    wire  dwb_biu_clk;
    wire  dwb_biu_rst;
    wire [1:0] dwb_biu_clmode;
    wire  dwb_biu_wb_clk_i;
    wire  dwb_biu_wb_rst_i;
    wire  dwb_biu_wb_ack_i;
    wire  dwb_biu_wb_err_i;
    wire  dwb_biu_wb_rty_i;
    wire [ dwb_biu_dw -1:0] dwb_biu_wb_dat_i;
    reg  dwb_biu_wb_cyc_o;
    reg [ dwb_biu_aw -1:0] dwb_biu_wb_adr_o;
    reg  dwb_biu_wb_stb_o;
    reg  dwb_biu_wb_we_o;
    reg [3:0] dwb_biu_wb_sel_o;
    wire [ dwb_biu_dw -1:0] dwb_biu_wb_dat_o;
    reg [2:0] dwb_biu_wb_cti_o;
    reg [1:0] dwb_biu_wb_bte_o;
    wire [ dwb_biu_dw -1:0] dwb_biu_biu_dat_i;
    wire [ dwb_biu_aw -1:0] dwb_biu_biu_adr_i;
    wire  dwb_biu_biu_cyc_i;
    wire  dwb_biu_biu_stb_i;
    wire  dwb_biu_biu_we_i;
    wire [3:0] dwb_biu_biu_sel_i;
    wire  dwb_biu_biu_cab_i;
    wire [31:0] dwb_biu_biu_dat_o;
    wire  dwb_biu_biu_ack_o;
    wire  dwb_biu_biu_err_o;

    wire  iwb_biu_wb_ack  ;
    assign   iwb_biu_wb_dat_o  =  iwb_biu_biu_dat_i  ;
    wire  iwb_biu_retry_cnt  ;
    assign   iwb_biu_retry_cnt  =1'b0;
    reg[3:0]  iwb_biu_burst_len  ;
    reg  iwb_biu_biu_stb_reg  ;
    wire  iwb_biu_biu_stb  ;
    reg  iwb_biu_wb_cyc_nxt  ;
    reg  iwb_biu_wb_stb_nxt  ;
    reg[2:0]  iwb_biu_wb_cti_nxt  ;
    reg  iwb_biu_wb_ack_cnt  ;
    reg  iwb_biu_wb_err_cnt  ;
    reg  iwb_biu_wb_rty_cnt  ;
    reg  iwb_biu_biu_ack_cnt  ;
    reg  iwb_biu_biu_err_cnt  ;
    reg  iwb_biu_biu_rty_cnt  ;
    wire  iwb_biu_biu_rty  ;
    reg[1:0]  iwb_biu_wb_fsm_state_cur  ;
    reg[1:0]  iwb_biu_wb_fsm_state_nxt  ;
    wire[1:0]  iwb_biu_wb_fsm_idle  =2'h0;
    wire[1:0]  iwb_biu_wb_fsm_trans  =2'h1;
    wire[1:0]  iwb_biu_wb_fsm_last  =2'h2;
    assign   iwb_biu_wb_ack  =  iwb_biu_wb_ack_i  &!  iwb_biu_wb_err_i  &!  iwb_biu_wb_rty_i  ;
    always @(  posedge    iwb_biu_wb_clk_i          or  posedge   iwb_biu_wb_rst_i  )
    begin
        if (  iwb_biu_wb_rst_i  ==(1'b1))
            iwb_biu_wb_fsm_state_cur   <=  iwb_biu_wb_fsm_idle  ;
        else
            iwb_biu_wb_fsm_state_cur   <=  iwb_biu_wb_fsm_state_nxt  ;
    end

    always @(  posedge    iwb_biu_wb_clk_i          or  posedge   iwb_biu_wb_rst_i  )
    begin
        if (  iwb_biu_wb_rst_i  ==(1'b1))
        begin
            iwb_biu_burst_len   <=0;
        end
        else
        begin
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  )
                iwb_biu_burst_len   <=  iwb_biu_bl  [3:0]-2;
            else
                if (  iwb_biu_wb_stb_o  &  iwb_biu_wb_ack  )
                    iwb_biu_burst_len   <=  iwb_biu_burst_len  -1;
        end
    end

    always @(                iwb_biu_wb_fsm_state_cur                                    or    iwb_biu_burst_len                      or    iwb_biu_wb_err_i                     or    iwb_biu_wb_rty_i                    or    iwb_biu_wb_ack                   or    iwb_biu_wb_cti_o                  or    iwb_biu_wb_sel_o                 or    iwb_biu_wb_stb_o                or    iwb_biu_wb_we_o               or    iwb_biu_biu_cyc_i              or    iwb_biu_biu_stb             or    iwb_biu_biu_cab_i            or    iwb_biu_biu_sel_i           or    iwb_biu_biu_we_i   )
    begin
        case (  iwb_biu_wb_fsm_state_cur  )
            iwb_biu_wb_fsm_idle   :
            begin
                iwb_biu_wb_cyc_nxt   =  iwb_biu_biu_cyc_i  &  iwb_biu_biu_stb  ;
                iwb_biu_wb_stb_nxt   =  iwb_biu_biu_cyc_i  &  iwb_biu_biu_stb  ;
                iwb_biu_wb_cti_nxt   ={!  iwb_biu_biu_cab_i  ,1'b1,!  iwb_biu_biu_cab_i  };
                if (  iwb_biu_biu_cyc_i  &  iwb_biu_biu_stb  )
                    iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_trans  ;
                else
                    iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_idle  ;
            end
            iwb_biu_wb_fsm_trans   :
            begin
                iwb_biu_wb_cyc_nxt   =!  iwb_biu_wb_stb_o  |!  iwb_biu_wb_err_i  &!  iwb_biu_wb_rty_i  &!(  iwb_biu_wb_ack  &  iwb_biu_wb_cti_o  ==3'b111);
                iwb_biu_wb_stb_nxt   =!  iwb_biu_wb_stb_o  |!  iwb_biu_wb_err_i  &!  iwb_biu_wb_rty_i  &!  iwb_biu_wb_ack  |!  iwb_biu_wb_err_i  &!  iwb_biu_wb_rty_i  &  iwb_biu_wb_cti_o  ==3'b010;
                iwb_biu_wb_cti_nxt   [2]=  iwb_biu_wb_stb_o  &  iwb_biu_wb_ack  &  iwb_biu_burst_len  =='h0|  iwb_biu_wb_cti_o  [2];
                iwb_biu_wb_cti_nxt   [1]=1'b1;
                iwb_biu_wb_cti_nxt   [0]=  iwb_biu_wb_stb_o  &  iwb_biu_wb_ack  &  iwb_biu_burst_len  =='h0|  iwb_biu_wb_cti_o  [0];
                if ((!  iwb_biu_biu_cyc_i  |!  iwb_biu_biu_stb  |!  iwb_biu_biu_cab_i  |  iwb_biu_biu_sel_i  !=  iwb_biu_wb_sel_o  |  iwb_biu_biu_we_i  !=  iwb_biu_wb_we_o  )&  iwb_biu_wb_cti_o  ==3'b010)
                    iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_last  ;
                else
                    if ((  iwb_biu_wb_err_i  |  iwb_biu_wb_rty_i  |  iwb_biu_wb_ack  &  iwb_biu_wb_cti_o  ==3'b111)&  iwb_biu_wb_stb_o  )
                        iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_idle  ;
                    else
                        iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_trans  ;
            end
            iwb_biu_wb_fsm_last   :
            begin
                iwb_biu_wb_cyc_nxt   =!  iwb_biu_wb_stb_o  |!  iwb_biu_wb_err_i  &!  iwb_biu_wb_rty_i  &!(  iwb_biu_wb_ack  &  iwb_biu_wb_cti_o  ==3'b111);
                iwb_biu_wb_stb_nxt   =!  iwb_biu_wb_stb_o  |!  iwb_biu_wb_err_i  &!  iwb_biu_wb_rty_i  &!(  iwb_biu_wb_ack  &  iwb_biu_wb_cti_o  ==3'b111);
                iwb_biu_wb_cti_nxt   [2]=  iwb_biu_wb_ack  &  iwb_biu_wb_stb_o  |  iwb_biu_wb_cti_o  [2];
                iwb_biu_wb_cti_nxt   [1]=1'b1;
                iwb_biu_wb_cti_nxt   [0]=  iwb_biu_wb_ack  &  iwb_biu_wb_stb_o  |  iwb_biu_wb_cti_o  [0];
                if ((  iwb_biu_wb_err_i  |  iwb_biu_wb_rty_i  |  iwb_biu_wb_ack  &  iwb_biu_wb_cti_o  ==3'b111)&  iwb_biu_wb_stb_o  )
                    iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_idle  ;
                else
                    iwb_biu_wb_fsm_state_nxt   =  iwb_biu_wb_fsm_last  ;
            end
            default :
            begin
                iwb_biu_wb_cyc_nxt   =1'bx;
                iwb_biu_wb_stb_nxt   =1'bx;
                iwb_biu_wb_cti_nxt   =3'bxxx;
                iwb_biu_wb_fsm_state_nxt   =2'bxx;
            end
        endcase
    end

    always @(  posedge    iwb_biu_wb_clk_i          or  posedge   iwb_biu_wb_rst_i  )
    begin
        if (  iwb_biu_wb_rst_i  ==(1'b1))
        begin
            iwb_biu_wb_cyc_o   <=1'b0;
            iwb_biu_wb_stb_o   <=1'b0;
            iwb_biu_wb_cti_o   <=3'b111;
            iwb_biu_wb_bte_o   <=(  iwb_biu_bl  ==8) ? 2'b10:(  iwb_biu_bl  ==4) ? 2'b01:2'b00;
            iwb_biu_wb_we_o   <=1'b0;
            iwb_biu_wb_sel_o   <=4'hf;
            iwb_biu_wb_adr_o   <={  iwb_biu_aw  {1'b0}};
        end
        else
        begin
            iwb_biu_wb_cyc_o   <=  iwb_biu_wb_cyc_nxt  ;
            if (  iwb_biu_wb_ack  &  iwb_biu_wb_cti_o  ==3'b111)
                iwb_biu_wb_stb_o   <=1'b0;
            else
                iwb_biu_wb_stb_o   <=  iwb_biu_wb_stb_nxt  ;
            iwb_biu_wb_cti_o   <=  iwb_biu_wb_cti_nxt  ;
            iwb_biu_wb_bte_o   <=(  iwb_biu_bl  ==8) ? 2'b10:(  iwb_biu_bl  ==4) ? 2'b01:2'b00;
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  )
            begin
                iwb_biu_wb_we_o   <=  iwb_biu_biu_we_i  ;
                iwb_biu_wb_sel_o   <=  iwb_biu_biu_sel_i  ;
            end
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  )
            begin
                iwb_biu_wb_adr_o   <=  iwb_biu_biu_adr_i  ;
            end
            else
                if (  iwb_biu_wb_stb_o  &  iwb_biu_wb_ack  )
                begin
                    if (  iwb_biu_bl  ==4)
                    begin
                        iwb_biu_wb_adr_o   [3:2]<=  iwb_biu_wb_adr_o  [3:2]+1;
                    end
                    if (  iwb_biu_bl  ==8)
                    begin
                        iwb_biu_wb_adr_o   [4:2]<=  iwb_biu_wb_adr_o  [4:2]+1;
                    end
                end
        end
    end

    always @(  posedge    iwb_biu_wb_clk_i          or  posedge   iwb_biu_wb_rst_i  )
    begin
        if (  iwb_biu_wb_rst_i  ==(1'b1))
        begin
            iwb_biu_wb_ack_cnt   <=1'b0;
            iwb_biu_wb_err_cnt   <=1'b0;
            iwb_biu_wb_rty_cnt   <=1'b0;
        end
        else
        begin
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  |!(|  iwb_biu_clmode  ))
                iwb_biu_wb_ack_cnt   <=1'b0;
            else
                if (  iwb_biu_wb_stb_o  &  iwb_biu_wb_ack  )
                    iwb_biu_wb_ack_cnt   <=!  iwb_biu_wb_ack_cnt  ;
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  |!(|  iwb_biu_clmode  ))
                iwb_biu_wb_err_cnt   <=1'b0;
            else
                if (  iwb_biu_wb_stb_o  &  iwb_biu_wb_err_i  )
                    iwb_biu_wb_err_cnt   <=!  iwb_biu_wb_err_cnt  ;
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  |!(|  iwb_biu_clmode  ))
                iwb_biu_wb_rty_cnt   <=1'b0;
            else
                if (  iwb_biu_wb_stb_o  &  iwb_biu_wb_rty_i  )
                    iwb_biu_wb_rty_cnt   <=!  iwb_biu_wb_rty_cnt  ;
        end
    end

    always @(  posedge    iwb_biu_clk          or  posedge   iwb_biu_rst  )
    begin
        if (  iwb_biu_rst  ==(1'b1))
        begin
            iwb_biu_biu_stb_reg   <=1'b0;
            iwb_biu_biu_ack_cnt   <=1'b0;
            iwb_biu_biu_err_cnt   <=1'b0;
            iwb_biu_biu_rty_cnt   <=1'b0;
        end
        else
        begin
            if (  iwb_biu_biu_stb_i  &!  iwb_biu_biu_cab_i  &  iwb_biu_biu_ack_o  )
                iwb_biu_biu_stb_reg   <=1'b0;
            else
                iwb_biu_biu_stb_reg   <=  iwb_biu_biu_stb_i  ;
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  |!(|  iwb_biu_clmode  ))
                iwb_biu_biu_ack_cnt   <=1'b0;
            else
                if (  iwb_biu_biu_ack_o  )
                    iwb_biu_biu_ack_cnt   <=!  iwb_biu_biu_ack_cnt  ;
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  |!(|  iwb_biu_clmode  ))
                iwb_biu_biu_err_cnt   <=1'b0;
            else
                if (  iwb_biu_wb_err_i  &  iwb_biu_biu_err_o  )
                    iwb_biu_biu_err_cnt   <=!  iwb_biu_biu_err_cnt  ;
            if (  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_idle  |!(|  iwb_biu_clmode  ))
                iwb_biu_biu_rty_cnt   <=1'b0;
            else
                if (  iwb_biu_biu_rty  )
                    iwb_biu_biu_rty_cnt   <=!  iwb_biu_biu_rty_cnt  ;
        end
    end

    assign   iwb_biu_biu_stb  =  iwb_biu_biu_stb_i  &  iwb_biu_biu_stb_reg  ;
    assign   iwb_biu_biu_dat_o  =  iwb_biu_wb_dat_i  ;
    assign   iwb_biu_biu_rty  =(  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_trans  )&  iwb_biu_wb_rty_i  &  iwb_biu_wb_stb_o  &(  iwb_biu_wb_rty_cnt  ~^  iwb_biu_biu_rty_cnt  );
    assign   iwb_biu_biu_ack_o  =(  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_trans  )&  iwb_biu_wb_ack  &  iwb_biu_wb_stb_o  &(  iwb_biu_wb_ack_cnt  ~^  iwb_biu_biu_ack_cnt  );
    assign   iwb_biu_biu_err_o  =(  iwb_biu_wb_fsm_state_cur  ==  iwb_biu_wb_fsm_trans  )&  iwb_biu_wb_err_i  &  iwb_biu_wb_stb_o  &(  iwb_biu_wb_err_cnt  ~^  iwb_biu_biu_err_cnt  );

    assign icbiu_adr_ic_word={icbiu_adr_ic[31:2],2'h0};


    wire  dwb_biu_wb_ack  ;
    assign   dwb_biu_wb_dat_o  =  dwb_biu_biu_dat_i  ;
    wire  dwb_biu_retry_cnt  ;
    assign   dwb_biu_retry_cnt  =1'b0;
    reg[3:0]  dwb_biu_burst_len  ;
    reg  dwb_biu_biu_stb_reg  ;
    wire  dwb_biu_biu_stb  ;
    reg  dwb_biu_wb_cyc_nxt  ;
    reg  dwb_biu_wb_stb_nxt  ;
    reg[2:0]  dwb_biu_wb_cti_nxt  ;
    reg  dwb_biu_wb_ack_cnt  ;
    reg  dwb_biu_wb_err_cnt  ;
    reg  dwb_biu_wb_rty_cnt  ;
    reg  dwb_biu_biu_ack_cnt  ;
    reg  dwb_biu_biu_err_cnt  ;
    reg  dwb_biu_biu_rty_cnt  ;
    wire  dwb_biu_biu_rty  ;
    reg[1:0]  dwb_biu_wb_fsm_state_cur  ;
    reg[1:0]  dwb_biu_wb_fsm_state_nxt  ;
    wire[1:0]  dwb_biu_wb_fsm_idle  =2'h0;
    wire[1:0]  dwb_biu_wb_fsm_trans  =2'h1;
    wire[1:0]  dwb_biu_wb_fsm_last  =2'h2;
    assign   dwb_biu_wb_ack  =  dwb_biu_wb_ack_i  &!  dwb_biu_wb_err_i  &!  dwb_biu_wb_rty_i  ;
    always @(  posedge    dwb_biu_wb_clk_i          or  posedge   dwb_biu_wb_rst_i  )
    begin
        if (  dwb_biu_wb_rst_i  ==(1'b1))
            dwb_biu_wb_fsm_state_cur   <=  dwb_biu_wb_fsm_idle  ;
        else
            dwb_biu_wb_fsm_state_cur   <=  dwb_biu_wb_fsm_state_nxt  ;
    end

    always @(  posedge    dwb_biu_wb_clk_i          or  posedge   dwb_biu_wb_rst_i  )
    begin
        if (  dwb_biu_wb_rst_i  ==(1'b1))
        begin
            dwb_biu_burst_len   <=0;
        end
        else
        begin
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  )
                dwb_biu_burst_len   <=  dwb_biu_bl  [3:0]-2;
            else
                if (  dwb_biu_wb_stb_o  &  dwb_biu_wb_ack  )
                    dwb_biu_burst_len   <=  dwb_biu_burst_len  -1;
        end
    end

    always @(                dwb_biu_wb_fsm_state_cur                                    or    dwb_biu_burst_len                      or    dwb_biu_wb_err_i                     or    dwb_biu_wb_rty_i                    or    dwb_biu_wb_ack                   or    dwb_biu_wb_cti_o                  or    dwb_biu_wb_sel_o                 or    dwb_biu_wb_stb_o                or    dwb_biu_wb_we_o               or    dwb_biu_biu_cyc_i              or    dwb_biu_biu_stb             or    dwb_biu_biu_cab_i            or    dwb_biu_biu_sel_i           or    dwb_biu_biu_we_i   )
    begin
        case (  dwb_biu_wb_fsm_state_cur  )
            dwb_biu_wb_fsm_idle   :
            begin
                dwb_biu_wb_cyc_nxt   =  dwb_biu_biu_cyc_i  &  dwb_biu_biu_stb  ;
                dwb_biu_wb_stb_nxt   =  dwb_biu_biu_cyc_i  &  dwb_biu_biu_stb  ;
                dwb_biu_wb_cti_nxt   ={!  dwb_biu_biu_cab_i  ,1'b1,!  dwb_biu_biu_cab_i  };
                if (  dwb_biu_biu_cyc_i  &  dwb_biu_biu_stb  )
                    dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_trans  ;
                else
                    dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_idle  ;
            end
            dwb_biu_wb_fsm_trans   :
            begin
                dwb_biu_wb_cyc_nxt   =!  dwb_biu_wb_stb_o  |!  dwb_biu_wb_err_i  &!  dwb_biu_wb_rty_i  &!(  dwb_biu_wb_ack  &  dwb_biu_wb_cti_o  ==3'b111);
                dwb_biu_wb_stb_nxt   =!  dwb_biu_wb_stb_o  |!  dwb_biu_wb_err_i  &!  dwb_biu_wb_rty_i  &!  dwb_biu_wb_ack  |!  dwb_biu_wb_err_i  &!  dwb_biu_wb_rty_i  &  dwb_biu_wb_cti_o  ==3'b010;
                dwb_biu_wb_cti_nxt   [2]=  dwb_biu_wb_stb_o  &  dwb_biu_wb_ack  &  dwb_biu_burst_len  =='h0|  dwb_biu_wb_cti_o  [2];
                dwb_biu_wb_cti_nxt   [1]=1'b1;
                dwb_biu_wb_cti_nxt   [0]=  dwb_biu_wb_stb_o  &  dwb_biu_wb_ack  &  dwb_biu_burst_len  =='h0|  dwb_biu_wb_cti_o  [0];
                if ((!  dwb_biu_biu_cyc_i  |!  dwb_biu_biu_stb  |!  dwb_biu_biu_cab_i  |  dwb_biu_biu_sel_i  !=  dwb_biu_wb_sel_o  |  dwb_biu_biu_we_i  !=  dwb_biu_wb_we_o  )&  dwb_biu_wb_cti_o  ==3'b010)
                    dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_last  ;
                else
                    if ((  dwb_biu_wb_err_i  |  dwb_biu_wb_rty_i  |  dwb_biu_wb_ack  &  dwb_biu_wb_cti_o  ==3'b111)&  dwb_biu_wb_stb_o  )
                        dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_idle  ;
                    else
                        dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_trans  ;
            end
            dwb_biu_wb_fsm_last   :
            begin
                dwb_biu_wb_cyc_nxt   =!  dwb_biu_wb_stb_o  |!  dwb_biu_wb_err_i  &!  dwb_biu_wb_rty_i  &!(  dwb_biu_wb_ack  &  dwb_biu_wb_cti_o  ==3'b111);
                dwb_biu_wb_stb_nxt   =!  dwb_biu_wb_stb_o  |!  dwb_biu_wb_err_i  &!  dwb_biu_wb_rty_i  &!(  dwb_biu_wb_ack  &  dwb_biu_wb_cti_o  ==3'b111);
                dwb_biu_wb_cti_nxt   [2]=  dwb_biu_wb_ack  &  dwb_biu_wb_stb_o  |  dwb_biu_wb_cti_o  [2];
                dwb_biu_wb_cti_nxt   [1]=1'b1;
                dwb_biu_wb_cti_nxt   [0]=  dwb_biu_wb_ack  &  dwb_biu_wb_stb_o  |  dwb_biu_wb_cti_o  [0];
                if ((  dwb_biu_wb_err_i  |  dwb_biu_wb_rty_i  |  dwb_biu_wb_ack  &  dwb_biu_wb_cti_o  ==3'b111)&  dwb_biu_wb_stb_o  )
                    dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_idle  ;
                else
                    dwb_biu_wb_fsm_state_nxt   =  dwb_biu_wb_fsm_last  ;
            end
            default :
            begin
                dwb_biu_wb_cyc_nxt   =1'bx;
                dwb_biu_wb_stb_nxt   =1'bx;
                dwb_biu_wb_cti_nxt   =3'bxxx;
                dwb_biu_wb_fsm_state_nxt   =2'bxx;
            end
        endcase
    end

    always @(  posedge    dwb_biu_wb_clk_i          or  posedge   dwb_biu_wb_rst_i  )
    begin
        if (  dwb_biu_wb_rst_i  ==(1'b1))
        begin
            dwb_biu_wb_cyc_o   <=1'b0;
            dwb_biu_wb_stb_o   <=1'b0;
            dwb_biu_wb_cti_o   <=3'b111;
            dwb_biu_wb_bte_o   <=(  dwb_biu_bl  ==8) ? 2'b10:(  dwb_biu_bl  ==4) ? 2'b01:2'b00;
            dwb_biu_wb_we_o   <=1'b0;
            dwb_biu_wb_sel_o   <=4'hf;
            dwb_biu_wb_adr_o   <={  dwb_biu_aw  {1'b0}};
        end
        else
        begin
            dwb_biu_wb_cyc_o   <=  dwb_biu_wb_cyc_nxt  ;
            if (  dwb_biu_wb_ack  &  dwb_biu_wb_cti_o  ==3'b111)
                dwb_biu_wb_stb_o   <=1'b0;
            else
                dwb_biu_wb_stb_o   <=  dwb_biu_wb_stb_nxt  ;
            dwb_biu_wb_cti_o   <=  dwb_biu_wb_cti_nxt  ;
            dwb_biu_wb_bte_o   <=(  dwb_biu_bl  ==8) ? 2'b10:(  dwb_biu_bl  ==4) ? 2'b01:2'b00;
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  )
            begin
                dwb_biu_wb_we_o   <=  dwb_biu_biu_we_i  ;
                dwb_biu_wb_sel_o   <=  dwb_biu_biu_sel_i  ;
            end
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  )
            begin
                dwb_biu_wb_adr_o   <=  dwb_biu_biu_adr_i  ;
            end
            else
                if (  dwb_biu_wb_stb_o  &  dwb_biu_wb_ack  )
                begin
                    if (  dwb_biu_bl  ==4)
                    begin
                        dwb_biu_wb_adr_o   [3:2]<=  dwb_biu_wb_adr_o  [3:2]+1;
                    end
                    if (  dwb_biu_bl  ==8)
                    begin
                        dwb_biu_wb_adr_o   [4:2]<=  dwb_biu_wb_adr_o  [4:2]+1;
                    end
                end
        end
    end

    always @(  posedge    dwb_biu_wb_clk_i          or  posedge   dwb_biu_wb_rst_i  )
    begin
        if (  dwb_biu_wb_rst_i  ==(1'b1))
        begin
            dwb_biu_wb_ack_cnt   <=1'b0;
            dwb_biu_wb_err_cnt   <=1'b0;
            dwb_biu_wb_rty_cnt   <=1'b0;
        end
        else
        begin
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  |!(|  dwb_biu_clmode  ))
                dwb_biu_wb_ack_cnt   <=1'b0;
            else
                if (  dwb_biu_wb_stb_o  &  dwb_biu_wb_ack  )
                    dwb_biu_wb_ack_cnt   <=!  dwb_biu_wb_ack_cnt  ;
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  |!(|  dwb_biu_clmode  ))
                dwb_biu_wb_err_cnt   <=1'b0;
            else
                if (  dwb_biu_wb_stb_o  &  dwb_biu_wb_err_i  )
                    dwb_biu_wb_err_cnt   <=!  dwb_biu_wb_err_cnt  ;
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  |!(|  dwb_biu_clmode  ))
                dwb_biu_wb_rty_cnt   <=1'b0;
            else
                if (  dwb_biu_wb_stb_o  &  dwb_biu_wb_rty_i  )
                    dwb_biu_wb_rty_cnt   <=!  dwb_biu_wb_rty_cnt  ;
        end
    end

    always @(  posedge    dwb_biu_clk          or  posedge   dwb_biu_rst  )
    begin
        if (  dwb_biu_rst  ==(1'b1))
        begin
            dwb_biu_biu_stb_reg   <=1'b0;
            dwb_biu_biu_ack_cnt   <=1'b0;
            dwb_biu_biu_err_cnt   <=1'b0;
            dwb_biu_biu_rty_cnt   <=1'b0;
        end
        else
        begin
            if (  dwb_biu_biu_stb_i  &!  dwb_biu_biu_cab_i  &  dwb_biu_biu_ack_o  )
                dwb_biu_biu_stb_reg   <=1'b0;
            else
                dwb_biu_biu_stb_reg   <=  dwb_biu_biu_stb_i  ;
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  |!(|  dwb_biu_clmode  ))
                dwb_biu_biu_ack_cnt   <=1'b0;
            else
                if (  dwb_biu_biu_ack_o  )
                    dwb_biu_biu_ack_cnt   <=!  dwb_biu_biu_ack_cnt  ;
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  |!(|  dwb_biu_clmode  ))
                dwb_biu_biu_err_cnt   <=1'b0;
            else
                if (  dwb_biu_wb_err_i  &  dwb_biu_biu_err_o  )
                    dwb_biu_biu_err_cnt   <=!  dwb_biu_biu_err_cnt  ;
            if (  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_idle  |!(|  dwb_biu_clmode  ))
                dwb_biu_biu_rty_cnt   <=1'b0;
            else
                if (  dwb_biu_biu_rty  )
                    dwb_biu_biu_rty_cnt   <=!  dwb_biu_biu_rty_cnt  ;
        end
    end

    assign   dwb_biu_biu_stb  =  dwb_biu_biu_stb_i  &  dwb_biu_biu_stb_reg  ;
    assign   dwb_biu_biu_dat_o  =  dwb_biu_wb_dat_i  ;
    assign   dwb_biu_biu_rty  =(  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_trans  )&  dwb_biu_wb_rty_i  &  dwb_biu_wb_stb_o  &(  dwb_biu_wb_rty_cnt  ~^  dwb_biu_biu_rty_cnt  );
    assign   dwb_biu_biu_ack_o  =(  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_trans  )&  dwb_biu_wb_ack  &  dwb_biu_wb_stb_o  &(  dwb_biu_wb_ack_cnt  ~^  dwb_biu_biu_ack_cnt  );
    assign   dwb_biu_biu_err_o  =(  dwb_biu_wb_fsm_state_cur  ==  dwb_biu_wb_fsm_trans  )&  dwb_biu_wb_err_i  &  dwb_biu_wb_stb_o  &(  dwb_biu_wb_err_cnt  ~^  dwb_biu_biu_err_cnt  );
    assign iwb_biu_clk = clk_i;
    assign iwb_biu_rst = rst_i;
    assign iwb_biu_clmode = clmode_i;
    assign iwb_biu_wb_clk_i = iwb_clk_i;
    assign iwb_biu_wb_rst_i = iwb_rst_i;
    assign iwb_biu_wb_ack_i = iwb_ack_i;
    assign iwb_biu_wb_err_i = iwb_err_i;
    assign iwb_biu_wb_rty_i = iwb_rty_i;
    assign iwb_biu_wb_dat_i = iwb_dat_i;
    assign iwb_cyc_o = iwb_biu_wb_cyc_o;
    assign iwb_adr_o = iwb_biu_wb_adr_o;
    assign iwb_stb_o = iwb_biu_wb_stb_o;
    assign iwb_we_o = iwb_biu_wb_we_o;
    assign iwb_sel_o = iwb_biu_wb_sel_o;
    assign iwb_dat_o = iwb_biu_wb_dat_o;
    assign iwb_cti_o = iwb_biu_wb_cti_o;
    assign iwb_bte_o = iwb_biu_wb_bte_o;
    assign iwb_biu_biu_dat_i = icbiu_dat_ic;
    assign iwb_biu_biu_adr_i = icbiu_adr_ic_word;
    assign iwb_biu_biu_cyc_i = icbiu_cyc_ic;
    assign iwb_biu_biu_stb_i = icbiu_stb_ic;
    assign iwb_biu_biu_we_i = icbiu_we_ic;
    assign iwb_biu_biu_sel_i = icbiu_sel_ic;
    assign iwb_biu_biu_cab_i = icbiu_cab_ic;
    assign icbiu_dat_biu = iwb_biu_biu_dat_o;
    assign icbiu_ack_biu = iwb_biu_biu_ack_o;
    assign icbiu_err_biu = iwb_biu_biu_err_o;
    assign dwb_biu_clk = clk_i;
    assign dwb_biu_rst = rst_i;
    assign dwb_biu_clmode = clmode_i;
    assign dwb_biu_wb_clk_i = dwb_clk_i;
    assign dwb_biu_wb_rst_i = dwb_rst_i;
    assign dwb_biu_wb_ack_i = dwb_ack_i;
    assign dwb_biu_wb_err_i = dwb_err_i;
    assign dwb_biu_wb_rty_i = dwb_rty_i;
    assign dwb_biu_wb_dat_i = dwb_dat_i;
    assign dwb_cyc_o = dwb_biu_wb_cyc_o;
    assign dwb_adr_o = dwb_biu_wb_adr_o;
    assign dwb_stb_o = dwb_biu_wb_stb_o;
    assign dwb_we_o = dwb_biu_wb_we_o;
    assign dwb_sel_o = dwb_biu_wb_sel_o;
    assign dwb_dat_o = dwb_biu_wb_dat_o;
    assign dwb_cti_o = dwb_biu_wb_cti_o;
    assign dwb_bte_o = dwb_biu_wb_bte_o;
    assign dwb_biu_biu_dat_i = sbbiu_dat_sb;
    assign dwb_biu_biu_adr_i = sbbiu_adr_sb;
    assign dwb_biu_biu_cyc_i = sbbiu_cyc_sb;
    assign dwb_biu_biu_stb_i = sbbiu_stb_sb;
    assign dwb_biu_biu_we_i = sbbiu_we_sb;
    assign dwb_biu_biu_sel_i = sbbiu_sel_sb;
    assign dwb_biu_biu_cab_i = sbbiu_cab_sb;
    assign sbbiu_dat_biu = dwb_biu_biu_dat_o;
    assign sbbiu_ack_biu = dwb_biu_biu_ack_o;
    assign sbbiu_err_biu = dwb_biu_biu_err_o;


    wire  or1200_immu_top_clk;
    wire  or1200_immu_top_rst;
    wire  or1200_immu_top_ic_en;
    wire  or1200_immu_top_immu_en;
    wire  or1200_immu_top_supv;
    wire [ or1200_immu_top_aw -1:0] or1200_immu_top_icpu_adr_i;
    wire  or1200_immu_top_icpu_cycstb_i;
    reg [ or1200_immu_top_aw -1:0] or1200_immu_top_icpu_adr_o;
    wire [3:0] or1200_immu_top_icpu_tag_o;
    wire  or1200_immu_top_icpu_rty_o;
    wire  or1200_immu_top_icpu_err_o;
    wire  or1200_immu_top_boot_adr_sel_i;
    wire  or1200_immu_top_spr_cs;
    wire  or1200_immu_top_spr_write;
    wire [ or1200_immu_top_aw -1:0] or1200_immu_top_spr_addr;
    wire [31:0] or1200_immu_top_spr_dat_i;
    wire [31:0] or1200_immu_top_spr_dat_o;
    wire  or1200_immu_top_qmemimmu_rty_i;
    wire  or1200_immu_top_qmemimmu_err_i;
    wire [3:0] or1200_immu_top_qmemimmu_tag_i;
    wire [ or1200_immu_top_aw -1:0] or1200_immu_top_qmemimmu_adr_o;
    wire  or1200_immu_top_qmemimmu_cycstb_o;
    wire  or1200_immu_top_qmemimmu_ci_o;

    wire  or1200_immu_top_itlb_spr_access  ;
    wire[31:13]  or1200_immu_top_itlb_ppn  ;
    wire  or1200_immu_top_itlb_hit  ;
    wire  or1200_immu_top_itlb_uxe  ;
    wire  or1200_immu_top_itlb_sxe  ;
    wire[31:0]  or1200_immu_top_itlb_dat_o  ;
    wire  or1200_immu_top_itlb_en  ;
    wire  or1200_immu_top_itlb_ci  ;
    wire  or1200_immu_top_itlb_done  ;
    wire  or1200_immu_top_fault  ;
    wire  or1200_immu_top_miss  ;
    wire  or1200_immu_top_page_cross  ;
    reg[31:0]  or1200_immu_top_icpu_adr_default  ;
    reg  or1200_immu_top_icpu_adr_select  ;
    reg[31:13]  or1200_immu_top_icpu_vpn_r  ;
    reg  or1200_immu_top_itlb_en_r  ;
    reg  or1200_immu_top_dis_spr_access_frst_clk  ;
    reg  or1200_immu_top_dis_spr_access_scnd_clk  ;
    wire[31:0]  or1200_immu_top_icpu_adr_boot  =  or1200_immu_top_boot_adr  ;
    always @(  posedge    or1200_immu_top_rst          or  posedge   or1200_immu_top_clk  )
        if (  or1200_immu_top_rst  ==(1'b1))
        begin
            or1200_immu_top_icpu_adr_default   <=32'h0000_0100;
            or1200_immu_top_icpu_adr_select   <=1'b1;
        end
        else
            if (  or1200_immu_top_icpu_adr_select  )
            begin
                or1200_immu_top_icpu_adr_default   <=  or1200_immu_top_icpu_adr_boot  ;
                or1200_immu_top_icpu_adr_select   <=1'b0;
            end
            else
            begin
                or1200_immu_top_icpu_adr_default   <=  or1200_immu_top_icpu_adr_i  ;
            end

    always @(     or1200_immu_top_icpu_adr_boot              or    or1200_immu_top_icpu_adr_default           or    or1200_immu_top_icpu_adr_select   )
        if (  or1200_immu_top_icpu_adr_select  )
            or1200_immu_top_icpu_adr_o   =  or1200_immu_top_icpu_adr_boot  ;
        else
            or1200_immu_top_icpu_adr_o   =  or1200_immu_top_icpu_adr_default  ;

    assign   or1200_immu_top_page_cross  =  or1200_immu_top_icpu_adr_i  [31:13]!=  or1200_immu_top_icpu_vpn_r  ;
    always @(  posedge    or1200_immu_top_clk          or  posedge   or1200_immu_top_rst  )
        if (  or1200_immu_top_rst  ==(1'b1))
            or1200_immu_top_icpu_vpn_r   <={32-13{1'b0}};
        else
            or1200_immu_top_icpu_vpn_r   <=  or1200_immu_top_icpu_adr_i  [31:13];

    assign   or1200_immu_top_itlb_spr_access  =  or1200_immu_top_spr_cs  &~  or1200_immu_top_dis_spr_access_scnd_clk  ;
    always @(  posedge    or1200_immu_top_clk          or  posedge   or1200_immu_top_rst  )
        if (  or1200_immu_top_rst  ==(1'b1))
            or1200_immu_top_dis_spr_access_frst_clk   <=1'b0;
        else
            if (!  or1200_immu_top_icpu_rty_o  )
                or1200_immu_top_dis_spr_access_frst_clk   <=1'b0;
            else
                if (  or1200_immu_top_spr_cs  )
                    or1200_immu_top_dis_spr_access_frst_clk   <=1'b1;

    always @(  posedge    or1200_immu_top_clk          or  posedge   or1200_immu_top_rst  )
        if (  or1200_immu_top_rst  ==(1'b1))
            or1200_immu_top_dis_spr_access_scnd_clk   <=1'b0;
        else
            if (!  or1200_immu_top_icpu_rty_o  )
                or1200_immu_top_dis_spr_access_scnd_clk   <=1'b0;
            else
                if (  or1200_immu_top_dis_spr_access_frst_clk  )
                    or1200_immu_top_dis_spr_access_scnd_clk   <=1'b1;

    assign   or1200_immu_top_icpu_tag_o  =  or1200_immu_top_miss   ? 4'hd:  or1200_immu_top_fault   ? 4'hc:  or1200_immu_top_qmemimmu_tag_i  ;
    assign   or1200_immu_top_icpu_rty_o  =  or1200_immu_top_qmemimmu_rty_i  ;
    assign   or1200_immu_top_icpu_err_o  =  or1200_immu_top_miss  |  or1200_immu_top_fault  |  or1200_immu_top_qmemimmu_err_i  ;
    always @(  posedge    or1200_immu_top_clk          or  posedge   or1200_immu_top_rst  )
        if (  or1200_immu_top_rst  ==(1'b1))
            or1200_immu_top_itlb_en_r   <=1'b0;
        else
            or1200_immu_top_itlb_en_r   <=  or1200_immu_top_itlb_en  &~  or1200_immu_top_itlb_spr_access  ;

    assign   or1200_immu_top_itlb_done  =  or1200_immu_top_itlb_en_r  &~  or1200_immu_top_page_cross  ;
    assign   or1200_immu_top_qmemimmu_cycstb_o  =  or1200_immu_top_immu_en   ? ~(  or1200_immu_top_miss  |  or1200_immu_top_fault  )&  or1200_immu_top_icpu_cycstb_i  &~  or1200_immu_top_page_cross  &  or1200_immu_top_itlb_done  &~  or1200_immu_top_itlb_spr_access  :  or1200_immu_top_icpu_cycstb_i  &~  or1200_immu_top_page_cross  ;
    assign   or1200_immu_top_qmemimmu_ci_o  =  or1200_immu_top_immu_en   ?   or1200_immu_top_itlb_ci  :1'b0;
    assign   or1200_immu_top_qmemimmu_adr_o  =  or1200_immu_top_immu_en  &  or1200_immu_top_itlb_done   ? {  or1200_immu_top_itlb_ppn  ,  or1200_immu_top_icpu_adr_i  [13-1:2],2'h0}:{  or1200_immu_top_icpu_vpn_r  ,  or1200_immu_top_icpu_adr_i  [13-1:2],2'h0};
    reg[31:0]  or1200_immu_top_spr_dat_reg  ;
    always @(  posedge    or1200_immu_top_clk          or  posedge   or1200_immu_top_rst  )
        if (  or1200_immu_top_rst  ==(1'b1))
            or1200_immu_top_spr_dat_reg   <=32'h0000_0000;
        else
            if (  or1200_immu_top_spr_cs  &!  or1200_immu_top_dis_spr_access_scnd_clk  )
                or1200_immu_top_spr_dat_reg   <=  or1200_immu_top_itlb_dat_o  ;

    assign   or1200_immu_top_spr_dat_o  =  or1200_immu_top_itlb_spr_access   ?   or1200_immu_top_itlb_dat_o  :  or1200_immu_top_spr_dat_reg  ;
    assign   or1200_immu_top_fault  =  or1200_immu_top_itlb_done  &((!  or1200_immu_top_supv  &!  or1200_immu_top_itlb_uxe  )||(  or1200_immu_top_supv  &!  or1200_immu_top_itlb_sxe  ));
    assign   or1200_immu_top_miss  =  or1200_immu_top_itlb_done  &!  or1200_immu_top_itlb_hit  ;
    assign   or1200_immu_top_itlb_en  =  or1200_immu_top_immu_en  &  or1200_immu_top_icpu_cycstb_i  ;

    wire  or1200_immu_top_or1200_immu_tlb_clk;
    wire  or1200_immu_top_or1200_immu_tlb_rst;
    wire  or1200_immu_top_or1200_immu_tlb_tlb_en;
    wire [ or1200_immu_top_or1200_immu_tlb_aw -1:0] or1200_immu_top_or1200_immu_tlb_vaddr;
    wire  or1200_immu_top_or1200_immu_tlb_hit;
    wire [31:13] or1200_immu_top_or1200_immu_tlb_ppn;
    wire  or1200_immu_top_or1200_immu_tlb_uxe;
    wire  or1200_immu_top_or1200_immu_tlb_sxe;
    wire  or1200_immu_top_or1200_immu_tlb_ci;
    wire  or1200_immu_top_or1200_immu_tlb_spr_cs;
    wire  or1200_immu_top_or1200_immu_tlb_spr_write;
    wire [31:0] or1200_immu_top_or1200_immu_tlb_spr_addr;
    wire [31:0] or1200_immu_top_or1200_immu_tlb_spr_dat_i;
    wire [31:0] or1200_immu_top_or1200_immu_tlb_spr_dat_o;

    wire[31:13+6-1+1]  or1200_immu_top_or1200_immu_tlb_vpn  ;
    wire  or1200_immu_top_or1200_immu_tlb_v  ;
    wire[6-1:0]  or1200_immu_top_or1200_immu_tlb_tlb_index  ;
    wire  or1200_immu_top_or1200_immu_tlb_tlb_mr_en  ;
    wire  or1200_immu_top_or1200_immu_tlb_tlb_mr_we  ;
    wire[32-6-13+1-1:0]  or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in  ;
    wire[32-6-13+1-1:0]  or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out  ;
    wire  or1200_immu_top_or1200_immu_tlb_tlb_tr_en  ;
    wire  or1200_immu_top_or1200_immu_tlb_tlb_tr_we  ;
    wire[32-13+3-1:0]  or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in  ;
    wire[32-13+3-1:0]  or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out  ;
    assign   or1200_immu_top_or1200_immu_tlb_tlb_mr_en  =  or1200_immu_top_or1200_immu_tlb_tlb_en  |(  or1200_immu_top_or1200_immu_tlb_spr_cs  &!  or1200_immu_top_or1200_immu_tlb_spr_addr  [7]);
    assign   or1200_immu_top_or1200_immu_tlb_tlb_mr_we  =  or1200_immu_top_or1200_immu_tlb_spr_cs  &  or1200_immu_top_or1200_immu_tlb_spr_write  &!  or1200_immu_top_or1200_immu_tlb_spr_addr  [7];
    assign   or1200_immu_top_or1200_immu_tlb_tlb_tr_en  =  or1200_immu_top_or1200_immu_tlb_tlb_en  |(  or1200_immu_top_or1200_immu_tlb_spr_cs  &  or1200_immu_top_or1200_immu_tlb_spr_addr  [7]);
    assign   or1200_immu_top_or1200_immu_tlb_tlb_tr_we  =  or1200_immu_top_or1200_immu_tlb_spr_cs  &  or1200_immu_top_or1200_immu_tlb_spr_write  &  or1200_immu_top_or1200_immu_tlb_spr_addr  [7];
    assign   or1200_immu_top_or1200_immu_tlb_spr_dat_o  =(!  or1200_immu_top_or1200_immu_tlb_spr_write  &!  or1200_immu_top_or1200_immu_tlb_spr_addr  [7]) ? {  or1200_immu_top_or1200_immu_tlb_vpn  ,  or1200_immu_top_or1200_immu_tlb_tlb_index  ,{32-6-13-7{1'b0}},1'b0,5'b00000,  or1200_immu_top_or1200_immu_tlb_v  }:(!  or1200_immu_top_or1200_immu_tlb_spr_write  &  or1200_immu_top_or1200_immu_tlb_spr_addr  [7]) ? {  or1200_immu_top_or1200_immu_tlb_ppn  ,{13-8{1'b0}},  or1200_immu_top_or1200_immu_tlb_uxe  ,  or1200_immu_top_or1200_immu_tlb_sxe  ,{4{1'b0}},  or1200_immu_top_or1200_immu_tlb_ci  ,1'b0}:32'h00000000;
    assign {  or1200_immu_top_or1200_immu_tlb_vpn  ,  or1200_immu_top_or1200_immu_tlb_v  }=  or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out  ;
    assign   or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in  ={  or1200_immu_top_or1200_immu_tlb_spr_dat_i  [31:13+6-1+1],  or1200_immu_top_or1200_immu_tlb_spr_dat_i  [0]};
    assign {  or1200_immu_top_or1200_immu_tlb_ppn  ,  or1200_immu_top_or1200_immu_tlb_uxe  ,  or1200_immu_top_or1200_immu_tlb_sxe  ,  or1200_immu_top_or1200_immu_tlb_ci  }=  or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out  ;
    assign   or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in  ={  or1200_immu_top_or1200_immu_tlb_spr_dat_i  [31:13],  or1200_immu_top_or1200_immu_tlb_spr_dat_i  [7],  or1200_immu_top_or1200_immu_tlb_spr_dat_i  [6],  or1200_immu_top_or1200_immu_tlb_spr_dat_i  [1]};
    assign   or1200_immu_top_or1200_immu_tlb_hit  =(  or1200_immu_top_or1200_immu_tlb_vpn  ==  or1200_immu_top_or1200_immu_tlb_vaddr  [31:13+6-1+1])&  or1200_immu_top_or1200_immu_tlb_v  ;
    assign   or1200_immu_top_or1200_immu_tlb_tlb_index  =  or1200_immu_top_or1200_immu_tlb_spr_cs   ?   or1200_immu_top_or1200_immu_tlb_spr_addr  [6-1:0]:  or1200_immu_top_or1200_immu_tlb_vaddr  [13+6-1:13];

    wire  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk;
    wire  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce;
    wire  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we;
    wire [ or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_aw -1:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr;
    wire [ or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_dw -1:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di;
    wire [ or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_dw -1:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_doq;
    wire  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk;
    wire  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce;
    wire  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we;
    wire [ or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_aw -1:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr;
    wire [ or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_dw -1:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di;
    wire [ or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_dw -1:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_doq;

    reg[  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_dw  -1:0]  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_mem  [(1<<  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_aw  )-1:0];
    reg[  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_aw  -1:0]  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr_reg  ;
    assign   or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_doq  =  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_mem  [  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr_reg  ];
    always @( posedge   or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk  )
        if (  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce  )
            or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr_reg   <=  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr  ;

    always @( posedge   or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk  )
        if (  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we  &&  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce  )
            or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_mem   [  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr  ]<=  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di  ;




    reg[  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_dw  -1:0]  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_mem  [(1<<  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_aw  )-1:0];
    reg[  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_aw  -1:0]  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr_reg  ;
    assign   or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_doq  =  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_mem  [  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr_reg  ];
    always @( posedge   or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk  )
        if (  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce  )
            or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr_reg   <=  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr  ;

    always @( posedge   or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk  )
        if (  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we  &&  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce  )
            or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_mem   [  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr  ]<=  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di  ;

    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk = or1200_immu_top_or1200_immu_tlb_clk;
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce = or1200_immu_top_or1200_immu_tlb_tlb_mr_en;
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we = or1200_immu_top_or1200_immu_tlb_tlb_mr_we;
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr = or1200_immu_top_or1200_immu_tlb_tlb_index;
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di = or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in;
    assign or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out = or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_doq;
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk = or1200_immu_top_or1200_immu_tlb_clk;
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce = or1200_immu_top_or1200_immu_tlb_tlb_tr_en;
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we = or1200_immu_top_or1200_immu_tlb_tlb_tr_we;
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr = or1200_immu_top_or1200_immu_tlb_tlb_index;
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in;
    assign or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out = or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_doq;

    assign or1200_immu_top_or1200_immu_tlb_clk = or1200_immu_top_clk;
    assign or1200_immu_top_or1200_immu_tlb_rst = or1200_immu_top_rst;
    assign or1200_immu_top_or1200_immu_tlb_tlb_en = or1200_immu_top_itlb_en;
    assign or1200_immu_top_or1200_immu_tlb_vaddr = or1200_immu_top_icpu_adr_i;
    assign or1200_immu_top_itlb_hit = or1200_immu_top_or1200_immu_tlb_hit;
    assign or1200_immu_top_itlb_ppn = or1200_immu_top_or1200_immu_tlb_ppn;
    assign or1200_immu_top_itlb_uxe = or1200_immu_top_or1200_immu_tlb_uxe;
    assign or1200_immu_top_itlb_sxe = or1200_immu_top_or1200_immu_tlb_sxe;
    assign or1200_immu_top_itlb_ci = or1200_immu_top_or1200_immu_tlb_ci;
    assign or1200_immu_top_or1200_immu_tlb_spr_cs = or1200_immu_top_itlb_spr_access;
    assign or1200_immu_top_or1200_immu_tlb_spr_write = or1200_immu_top_spr_write;
    assign or1200_immu_top_or1200_immu_tlb_spr_addr = or1200_immu_top_spr_addr;
    assign or1200_immu_top_or1200_immu_tlb_spr_dat_i = or1200_immu_top_spr_dat_i;
    assign or1200_immu_top_itlb_dat_o = or1200_immu_top_or1200_immu_tlb_spr_dat_o;

    assign or1200_immu_top_clk = clk_i;
    assign or1200_immu_top_rst = rst_i;
    assign or1200_immu_top_ic_en = ic_en;
    assign or1200_immu_top_immu_en = immu_en;
    assign or1200_immu_top_supv = supv;
    assign or1200_immu_top_icpu_adr_i = icpu_adr_cpu;
    assign or1200_immu_top_icpu_cycstb_i = icpu_cycstb_cpu;
    assign icpu_adr_immu = or1200_immu_top_icpu_adr_o;
    assign icpu_tag_immu = or1200_immu_top_icpu_tag_o;
    assign icpu_rty_immu = or1200_immu_top_icpu_rty_o;
    assign icpu_err_immu = or1200_immu_top_icpu_err_o;
    assign or1200_immu_top_boot_adr_sel_i = boot_adr_sel;
    assign or1200_immu_top_spr_cs = spr_cs[5'd02];
    assign or1200_immu_top_spr_write = spr_we;
    assign or1200_immu_top_spr_addr = spr_addr;
    assign or1200_immu_top_spr_dat_i = spr_dat_cpu;
    assign spr_dat_immu = or1200_immu_top_spr_dat_o;
    assign or1200_immu_top_qmemimmu_rty_i = qmemimmu_rty_qmem;
    assign or1200_immu_top_qmemimmu_err_i = qmemimmu_err_qmem;
    assign or1200_immu_top_qmemimmu_tag_i = qmemimmu_tag_qmem;
    assign qmemimmu_adr_immu = or1200_immu_top_qmemimmu_adr_o;
    assign qmemimmu_cycstb_immu = or1200_immu_top_qmemimmu_cycstb_o;
    assign qmemimmu_ci_immu = or1200_immu_top_qmemimmu_ci_o;


    wire  or1200_ic_top_clk;
    wire  or1200_ic_top_rst;
    wire [ or1200_ic_top_dw -1:0] or1200_ic_top_icbiu_dat_o;
    wire [31:0] or1200_ic_top_icbiu_adr_o;
    wire  or1200_ic_top_icbiu_cyc_o;
    wire  or1200_ic_top_icbiu_stb_o;
    wire  or1200_ic_top_icbiu_we_o;
    wire [3:0] or1200_ic_top_icbiu_sel_o;
    wire  or1200_ic_top_icbiu_cab_o;
    wire [ or1200_ic_top_dw -1:0] or1200_ic_top_icbiu_dat_i;
    wire  or1200_ic_top_icbiu_ack_i;
    wire  or1200_ic_top_icbiu_err_i;
    wire  or1200_ic_top_ic_en;
    wire [31:0] or1200_ic_top_icqmem_adr_i;
    wire  or1200_ic_top_icqmem_cycstb_i;
    wire  or1200_ic_top_icqmem_ci_i;
    wire [3:0] or1200_ic_top_icqmem_sel_i;
    wire [3:0] or1200_ic_top_icqmem_tag_i;
    wire [ or1200_ic_top_dw -1:0] or1200_ic_top_icqmem_dat_o;
    wire  or1200_ic_top_icqmem_ack_o;
    wire  or1200_ic_top_icqmem_rty_o;
    wire  or1200_ic_top_icqmem_err_o;
    wire [3:0] or1200_ic_top_icqmem_tag_o;
    wire  or1200_ic_top_spr_cs;
    wire  or1200_ic_top_spr_write;
    wire [31:0] or1200_ic_top_spr_dat_i;

    wire  or1200_ic_top_tag_v  ;
    wire[20-2:0]  or1200_ic_top_tag  ;
    wire[  or1200_ic_top_dw  -1:0]  or1200_ic_top_to_icram  ;
    wire[  or1200_ic_top_dw  -1:0]  or1200_ic_top_from_icram  ;
    wire[31:0]  or1200_ic_top_saved_addr  ;
    wire[3:0]  or1200_ic_top_icram_we  ;
    wire  or1200_ic_top_ictag_we  ;
    wire[31:0]  or1200_ic_top_ic_addr  ;
    wire  or1200_ic_top_icfsm_biu_read  ;
    reg  or1200_ic_top_tagcomp_miss  ;
    wire[13-1:4]  or1200_ic_top_ictag_addr  ;
    wire  or1200_ic_top_ictag_en  ;
    wire  or1200_ic_top_ictag_v  ;
    wire  or1200_ic_top_ic_inv  ;
    wire  or1200_ic_top_icfsm_first_hit_ack  ;
    wire  or1200_ic_top_icfsm_first_miss_ack  ;
    wire  or1200_ic_top_icfsm_first_miss_err  ;
    wire  or1200_ic_top_icfsm_burst  ;
    wire  or1200_ic_top_icfsm_tag_we  ;
    reg  or1200_ic_top_ic_inv_q  ;
    assign   or1200_ic_top_icbiu_adr_o  =  or1200_ic_top_ic_addr  ;
    assign   or1200_ic_top_ic_inv  =  or1200_ic_top_spr_cs  &  or1200_ic_top_spr_write  ;
    assign   or1200_ic_top_ictag_we  =  or1200_ic_top_icfsm_tag_we  |  or1200_ic_top_ic_inv  ;
    assign   or1200_ic_top_ictag_addr  =  or1200_ic_top_ic_inv   ?   or1200_ic_top_spr_dat_i  [13-1:4]:  or1200_ic_top_ic_addr  [13-1:4];
    assign   or1200_ic_top_ictag_en  =  or1200_ic_top_ic_inv  |  or1200_ic_top_ic_en  ;
    assign   or1200_ic_top_ictag_v  =~  or1200_ic_top_ic_inv  ;
    assign   or1200_ic_top_icbiu_dat_o  =32'h00000000;
    assign   or1200_ic_top_icbiu_cyc_o  =(  or1200_ic_top_ic_en  ) ?   or1200_ic_top_icfsm_biu_read  :  or1200_ic_top_icqmem_cycstb_i  ;
    assign   or1200_ic_top_icbiu_stb_o  =(  or1200_ic_top_ic_en  ) ?   or1200_ic_top_icfsm_biu_read  :  or1200_ic_top_icqmem_cycstb_i  ;
    assign   or1200_ic_top_icbiu_we_o  =1'b0;
    assign   or1200_ic_top_icbiu_sel_o  =(  or1200_ic_top_ic_en  &  or1200_ic_top_icfsm_biu_read  ) ? 4'b1111:  or1200_ic_top_icqmem_sel_i  ;
    assign   or1200_ic_top_icbiu_cab_o  =(  or1200_ic_top_ic_en  ) ?   or1200_ic_top_icfsm_burst  :1'b0;
    assign   or1200_ic_top_icqmem_rty_o  =~  or1200_ic_top_icqmem_ack_o  &~  or1200_ic_top_icqmem_err_o  ;
    assign   or1200_ic_top_icqmem_tag_o  =  or1200_ic_top_icqmem_err_o   ? 4'hb:  or1200_ic_top_icqmem_tag_i  ;
    assign   or1200_ic_top_icqmem_ack_o  =  or1200_ic_top_ic_en   ? (  or1200_ic_top_icfsm_first_hit_ack  |  or1200_ic_top_icfsm_first_miss_ack  ):  or1200_ic_top_icbiu_ack_i  ;
    assign   or1200_ic_top_icqmem_err_o  =  or1200_ic_top_ic_en   ?   or1200_ic_top_icfsm_first_miss_err  :  or1200_ic_top_icbiu_err_i  ;
    assign   or1200_ic_top_ic_addr  =(  or1200_ic_top_icfsm_biu_read  ) ?   or1200_ic_top_saved_addr  :  or1200_ic_top_icqmem_adr_i  ;
    assign   or1200_ic_top_to_icram  =  or1200_ic_top_icbiu_dat_i  ;
    assign   or1200_ic_top_icqmem_dat_o  =  or1200_ic_top_icfsm_first_miss_ack  |!  or1200_ic_top_ic_en   ?   or1200_ic_top_icbiu_dat_i  :  or1200_ic_top_from_icram  ;
    always @(  posedge    or1200_ic_top_clk          or  posedge   or1200_ic_top_rst  )
        if (  or1200_ic_top_rst  ==(1'b1))
            or1200_ic_top_ic_inv_q   <=1'b0;
        else
            or1200_ic_top_ic_inv_q   <=  or1200_ic_top_ic_inv  ;

    always @(     or1200_ic_top_tag              or    or1200_ic_top_saved_addr           or    or1200_ic_top_tag_v   )
    begin
        if ((  or1200_ic_top_tag  !=  or1200_ic_top_saved_addr  [31:13-1+1])|!  or1200_ic_top_tag_v  )
            or1200_ic_top_tagcomp_miss   =1'b1;
        else
            or1200_ic_top_tagcomp_miss   =1'b0;
    end


    wire  or1200_ic_top_or1200_ic_fsm_clk;
    wire  or1200_ic_top_or1200_ic_fsm_rst;
    wire  or1200_ic_top_or1200_ic_fsm_ic_en;
    wire  or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i;
    wire  or1200_ic_top_or1200_ic_fsm_icqmem_ci_i;
    wire  or1200_ic_top_or1200_ic_fsm_tagcomp_miss;
    wire  or1200_ic_top_or1200_ic_fsm_biudata_valid;
    wire  or1200_ic_top_or1200_ic_fsm_biudata_error;
    wire [31:0] or1200_ic_top_or1200_ic_fsm_start_addr;
    wire [31:0] or1200_ic_top_or1200_ic_fsm_saved_addr;
    wire [3:0] or1200_ic_top_or1200_ic_fsm_icram_we;
    wire  or1200_ic_top_or1200_ic_fsm_tag_we;
    wire  or1200_ic_top_or1200_ic_fsm_biu_read;
    wire  or1200_ic_top_or1200_ic_fsm_first_hit_ack;
    wire  or1200_ic_top_or1200_ic_fsm_first_miss_ack;
    wire  or1200_ic_top_or1200_ic_fsm_first_miss_err;
    wire  or1200_ic_top_or1200_ic_fsm_burst;

    reg[31:0]  or1200_ic_top_or1200_ic_fsm_saved_addr_r  ;
    reg[1:0]  or1200_ic_top_or1200_ic_fsm_state  ;
    reg[4-1:0]  or1200_ic_top_or1200_ic_fsm_cnt  ;
    reg  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  ;
    reg  or1200_ic_top_or1200_ic_fsm_load  ;
    reg  or1200_ic_top_or1200_ic_fsm_cache_inhibit  ;
    reg  or1200_ic_top_or1200_ic_fsm_last_eval_miss  ;
    assign   or1200_ic_top_or1200_ic_fsm_icram_we  ={4{  or1200_ic_top_or1200_ic_fsm_biu_read  &  or1200_ic_top_or1200_ic_fsm_biudata_valid  &!  or1200_ic_top_or1200_ic_fsm_cache_inhibit  }};
    assign   or1200_ic_top_or1200_ic_fsm_tag_we  =  or1200_ic_top_or1200_ic_fsm_biu_read  &  or1200_ic_top_or1200_ic_fsm_biudata_valid  &!  or1200_ic_top_or1200_ic_fsm_cache_inhibit  ;
    assign   or1200_ic_top_or1200_ic_fsm_biu_read  =(  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  &  or1200_ic_top_or1200_ic_fsm_tagcomp_miss  )|(!  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  &  or1200_ic_top_or1200_ic_fsm_load  );
    assign   or1200_ic_top_or1200_ic_fsm_saved_addr  =  or1200_ic_top_or1200_ic_fsm_saved_addr_r  ;
    assign   or1200_ic_top_or1200_ic_fsm_first_hit_ack  =(  or1200_ic_top_or1200_ic_fsm_state  ==2'd1)&  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  &!  or1200_ic_top_or1200_ic_fsm_tagcomp_miss  &!  or1200_ic_top_or1200_ic_fsm_cache_inhibit  ;
    assign   or1200_ic_top_or1200_ic_fsm_first_miss_ack  =(  or1200_ic_top_or1200_ic_fsm_state  ==2'd1)&  or1200_ic_top_or1200_ic_fsm_biudata_valid  &~  or1200_ic_top_or1200_ic_fsm_first_hit_ack  ;
    assign   or1200_ic_top_or1200_ic_fsm_first_miss_err  =(  or1200_ic_top_or1200_ic_fsm_state  ==2'd1)&  or1200_ic_top_or1200_ic_fsm_biudata_error  ;
    assign   or1200_ic_top_or1200_ic_fsm_burst  =(  or1200_ic_top_or1200_ic_fsm_state  ==2'd1)&  or1200_ic_top_or1200_ic_fsm_tagcomp_miss  &!  or1200_ic_top_or1200_ic_fsm_cache_inhibit  |(  or1200_ic_top_or1200_ic_fsm_state  ==2'd2);
    always @(  posedge    or1200_ic_top_or1200_ic_fsm_clk          or  posedge   or1200_ic_top_or1200_ic_fsm_rst  )
    begin
        if (  or1200_ic_top_or1200_ic_fsm_rst  ==(1'b1))
        begin
            or1200_ic_top_or1200_ic_fsm_state   <=2'd0;
            or1200_ic_top_or1200_ic_fsm_saved_addr_r   <=32'b0;
            or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
            or1200_ic_top_or1200_ic_fsm_load   <=1'b0;
            or1200_ic_top_or1200_ic_fsm_cnt   <=4'd0;
            or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b0;
            or1200_ic_top_or1200_ic_fsm_last_eval_miss   <=0;
        end
        else
        case (  or1200_ic_top_or1200_ic_fsm_state  )
            2 'd0:
                if (  or1200_ic_top_or1200_ic_fsm_ic_en  &  or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i  )
                begin
                    or1200_ic_top_or1200_ic_fsm_state   <=2'd1;
                    or1200_ic_top_or1200_ic_fsm_saved_addr_r   <=  or1200_ic_top_or1200_ic_fsm_start_addr  ;
                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b1;
                    or1200_ic_top_or1200_ic_fsm_load   <=1'b1;
                    or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=  or1200_ic_top_or1200_ic_fsm_icqmem_ci_i  ;
                    or1200_ic_top_or1200_ic_fsm_last_eval_miss   <=0;
                end
                else
                begin
                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                    or1200_ic_top_or1200_ic_fsm_load   <=1'b0;
                    or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b0;
                end
            2 'd1:
            begin
                if (  or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i  &  or1200_ic_top_or1200_ic_fsm_icqmem_ci_i  )
                    or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b1;
                if (  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  )
                    or1200_ic_top_or1200_ic_fsm_saved_addr_r   [31:13-1+1]<=  or1200_ic_top_or1200_ic_fsm_start_addr  [31:13-1+1];
                if ((!  or1200_ic_top_or1200_ic_fsm_ic_en  )||(  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  &!  or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i  )||(  or1200_ic_top_or1200_ic_fsm_biudata_error  )||(  or1200_ic_top_or1200_ic_fsm_cache_inhibit  &  or1200_ic_top_or1200_ic_fsm_biudata_valid  ))
                begin
                    or1200_ic_top_or1200_ic_fsm_state   <=2'd0;
                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                    or1200_ic_top_or1200_ic_fsm_load   <=1'b0;
                    or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b0;
                end
                else
                    if (  or1200_ic_top_or1200_ic_fsm_tagcomp_miss  &  or1200_ic_top_or1200_ic_fsm_biudata_valid  )
                    begin
                        or1200_ic_top_or1200_ic_fsm_state   <=2'd2;
                        or1200_ic_top_or1200_ic_fsm_saved_addr_r   [4-1:2]<=  or1200_ic_top_or1200_ic_fsm_saved_addr_r  [4-1:2]+1;
                        or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                        or1200_ic_top_or1200_ic_fsm_cnt   <=((1<<4)-(2*4));
                        or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b0;
                    end
                    else
                        if (!  or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i  &!  or1200_ic_top_or1200_ic_fsm_last_eval_miss  )
                        begin
                            or1200_ic_top_or1200_ic_fsm_state   <=2'd0;
                            or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                            or1200_ic_top_or1200_ic_fsm_load   <=1'b0;
                            or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b0;
                        end
                        else
                            if (!  or1200_ic_top_or1200_ic_fsm_tagcomp_miss  &!  or1200_ic_top_or1200_ic_fsm_icqmem_ci_i  )
                            begin
                                or1200_ic_top_or1200_ic_fsm_saved_addr_r   <=  or1200_ic_top_or1200_ic_fsm_start_addr  ;
                                or1200_ic_top_or1200_ic_fsm_cache_inhibit   <=1'b0;
                            end
                            else
                                or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                if (  or1200_ic_top_or1200_ic_fsm_hitmiss_eval  &!  or1200_ic_top_or1200_ic_fsm_tagcomp_miss  )
                    or1200_ic_top_or1200_ic_fsm_last_eval_miss   <=1;
            end
            2 'd2:
            begin
                if (!  or1200_ic_top_or1200_ic_fsm_ic_en  )
                begin
                    or1200_ic_top_or1200_ic_fsm_state   <=2'd0;
                    or1200_ic_top_or1200_ic_fsm_saved_addr_r   <=  or1200_ic_top_or1200_ic_fsm_start_addr  ;
                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                    or1200_ic_top_or1200_ic_fsm_load   <=1'b0;
                end
                else
                    if (  or1200_ic_top_or1200_ic_fsm_biudata_valid  &&(|  or1200_ic_top_or1200_ic_fsm_cnt  ))
                    begin
                        or1200_ic_top_or1200_ic_fsm_cnt   <=  or1200_ic_top_or1200_ic_fsm_cnt  -4'd4;
                        or1200_ic_top_or1200_ic_fsm_saved_addr_r   [4-1:2]<=  or1200_ic_top_or1200_ic_fsm_saved_addr_r  [4-1:2]+1;
                    end
                    else
                        if (  or1200_ic_top_or1200_ic_fsm_biudata_valid  )
                        begin
                            or1200_ic_top_or1200_ic_fsm_state   <=2'd0;
                            or1200_ic_top_or1200_ic_fsm_saved_addr_r   <=  or1200_ic_top_or1200_ic_fsm_start_addr  ;
                            or1200_ic_top_or1200_ic_fsm_hitmiss_eval   <=1'b0;
                            or1200_ic_top_or1200_ic_fsm_load   <=1'b0;
                        end
            end
            default :
                or1200_ic_top_or1200_ic_fsm_state   <=2'd0;
        endcase
    end

    assign or1200_ic_top_or1200_ic_fsm_clk = or1200_ic_top_clk;
    assign or1200_ic_top_or1200_ic_fsm_rst = or1200_ic_top_rst;
    assign or1200_ic_top_or1200_ic_fsm_ic_en = or1200_ic_top_ic_en;
    assign or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i = or1200_ic_top_icqmem_cycstb_i;
    assign or1200_ic_top_or1200_ic_fsm_icqmem_ci_i = or1200_ic_top_icqmem_ci_i;
    assign or1200_ic_top_or1200_ic_fsm_tagcomp_miss = or1200_ic_top_tagcomp_miss;
    assign or1200_ic_top_or1200_ic_fsm_biudata_valid = or1200_ic_top_icbiu_ack_i;
    assign or1200_ic_top_or1200_ic_fsm_biudata_error = or1200_ic_top_icbiu_err_i;
    assign or1200_ic_top_or1200_ic_fsm_start_addr = or1200_ic_top_icqmem_adr_i;
    assign or1200_ic_top_saved_addr = or1200_ic_top_or1200_ic_fsm_saved_addr;
    assign or1200_ic_top_icram_we = or1200_ic_top_or1200_ic_fsm_icram_we;
    assign or1200_ic_top_icfsm_tag_we = or1200_ic_top_or1200_ic_fsm_tag_we;
    assign or1200_ic_top_icfsm_biu_read = or1200_ic_top_or1200_ic_fsm_biu_read;
    assign or1200_ic_top_icfsm_first_hit_ack = or1200_ic_top_or1200_ic_fsm_first_hit_ack;
    assign or1200_ic_top_icfsm_first_miss_ack = or1200_ic_top_or1200_ic_fsm_first_miss_ack;
    assign or1200_ic_top_icfsm_first_miss_err = or1200_ic_top_or1200_ic_fsm_first_miss_err;
    assign or1200_ic_top_icfsm_burst = or1200_ic_top_or1200_ic_fsm_burst;


    wire  or1200_ic_top_or1200_ic_ram_clk;
    wire  or1200_ic_top_or1200_ic_ram_rst;
    wire [ or1200_ic_top_or1200_ic_ram_aw -1:0] or1200_ic_top_or1200_ic_ram_addr;
    wire  or1200_ic_top_or1200_ic_ram_en;
    wire [3:0] or1200_ic_top_or1200_ic_ram_we;
    wire [ or1200_ic_top_or1200_ic_ram_dw -1:0] or1200_ic_top_or1200_ic_ram_datain;
    wire [ or1200_ic_top_or1200_ic_ram_dw -1:0] or1200_ic_top_or1200_ic_ram_dataout;


    wire  or1200_ic_top_or1200_ic_ram_ic_ram0_clk;
    wire  or1200_ic_top_or1200_ic_ram_ic_ram0_ce;
    wire  or1200_ic_top_or1200_ic_ram_ic_ram0_we;
    wire [ or1200_ic_top_or1200_ic_ram_ic_ram0_aw -1:0] or1200_ic_top_or1200_ic_ram_ic_ram0_addr;
    wire [ or1200_ic_top_or1200_ic_ram_ic_ram0_dw -1:0] or1200_ic_top_or1200_ic_ram_ic_ram0_di;
    wire [ or1200_ic_top_or1200_ic_ram_ic_ram0_dw -1:0] or1200_ic_top_or1200_ic_ram_ic_ram0_doq;

    reg[  or1200_ic_top_or1200_ic_ram_ic_ram0_dw  -1:0]  or1200_ic_top_or1200_ic_ram_ic_ram0_mem  [(1<<  or1200_ic_top_or1200_ic_ram_ic_ram0_aw  )-1:0];
    reg[  or1200_ic_top_or1200_ic_ram_ic_ram0_aw  -1:0]  or1200_ic_top_or1200_ic_ram_ic_ram0_addr_reg  ;
    assign   or1200_ic_top_or1200_ic_ram_ic_ram0_doq  =  or1200_ic_top_or1200_ic_ram_ic_ram0_mem  [  or1200_ic_top_or1200_ic_ram_ic_ram0_addr_reg  ];
    always @( posedge   or1200_ic_top_or1200_ic_ram_ic_ram0_clk  )
        if (  or1200_ic_top_or1200_ic_ram_ic_ram0_ce  )
            or1200_ic_top_or1200_ic_ram_ic_ram0_addr_reg   <=  or1200_ic_top_or1200_ic_ram_ic_ram0_addr  ;

    always @( posedge   or1200_ic_top_or1200_ic_ram_ic_ram0_clk  )
        if (  or1200_ic_top_or1200_ic_ram_ic_ram0_we  &&  or1200_ic_top_or1200_ic_ram_ic_ram0_ce  )
            or1200_ic_top_or1200_ic_ram_ic_ram0_mem   [  or1200_ic_top_or1200_ic_ram_ic_ram0_addr  ]<=  or1200_ic_top_or1200_ic_ram_ic_ram0_di  ;

    assign or1200_ic_top_or1200_ic_ram_ic_ram0_clk = or1200_ic_top_or1200_ic_ram_clk;
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_ce = or1200_ic_top_or1200_ic_ram_en;
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_we = or1200_ic_top_or1200_ic_ram_we[0];
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_addr = or1200_ic_top_or1200_ic_ram_addr;
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_di = or1200_ic_top_or1200_ic_ram_datain;
    assign or1200_ic_top_or1200_ic_ram_dataout = or1200_ic_top_or1200_ic_ram_ic_ram0_doq;

    assign or1200_ic_top_or1200_ic_ram_clk = or1200_ic_top_clk;
    assign or1200_ic_top_or1200_ic_ram_rst = or1200_ic_top_rst;
    assign or1200_ic_top_or1200_ic_ram_addr = or1200_ic_top_ic_addr[13-1:2];
    assign or1200_ic_top_or1200_ic_ram_en = or1200_ic_top_ic_en;
    assign or1200_ic_top_or1200_ic_ram_we = or1200_ic_top_icram_we;
    assign or1200_ic_top_or1200_ic_ram_datain = or1200_ic_top_to_icram;
    assign or1200_ic_top_from_icram = or1200_ic_top_or1200_ic_ram_dataout;


    wire  or1200_ic_top_or1200_ic_tag_clk;
    wire  or1200_ic_top_or1200_ic_tag_rst;
    wire [ or1200_ic_top_or1200_ic_tag_aw -1:0] or1200_ic_top_or1200_ic_tag_addr;
    wire  or1200_ic_top_or1200_ic_tag_en;
    wire  or1200_ic_top_or1200_ic_tag_we;
    wire [ or1200_ic_top_or1200_ic_tag_dw -1:0] or1200_ic_top_or1200_ic_tag_datain;
    wire  or1200_ic_top_or1200_ic_tag_tag_v;
    wire [ or1200_ic_top_or1200_ic_tag_dw -2:0] or1200_ic_top_or1200_ic_tag_tag;


    wire  or1200_ic_top_or1200_ic_tag_ic_tag0_clk;
    wire  or1200_ic_top_or1200_ic_tag_ic_tag0_ce;
    wire  or1200_ic_top_or1200_ic_tag_ic_tag0_we;
    wire [ or1200_ic_top_or1200_ic_tag_ic_tag0_aw -1:0] or1200_ic_top_or1200_ic_tag_ic_tag0_addr;
    wire [ or1200_ic_top_or1200_ic_tag_ic_tag0_dw -1:0] or1200_ic_top_or1200_ic_tag_ic_tag0_di;
    wire [ or1200_ic_top_or1200_ic_tag_ic_tag0_dw -1:0] or1200_ic_top_or1200_ic_tag_ic_tag0_doq;

    reg[  or1200_ic_top_or1200_ic_tag_ic_tag0_dw  -1:0]  or1200_ic_top_or1200_ic_tag_ic_tag0_mem  [(1<<  or1200_ic_top_or1200_ic_tag_ic_tag0_aw  )-1:0];
    reg[  or1200_ic_top_or1200_ic_tag_ic_tag0_aw  -1:0]  or1200_ic_top_or1200_ic_tag_ic_tag0_addr_reg  ;
    assign   or1200_ic_top_or1200_ic_tag_ic_tag0_doq  =  or1200_ic_top_or1200_ic_tag_ic_tag0_mem  [  or1200_ic_top_or1200_ic_tag_ic_tag0_addr_reg  ];
    always @( posedge   or1200_ic_top_or1200_ic_tag_ic_tag0_clk  )
        if (  or1200_ic_top_or1200_ic_tag_ic_tag0_ce  )
            or1200_ic_top_or1200_ic_tag_ic_tag0_addr_reg   <=  or1200_ic_top_or1200_ic_tag_ic_tag0_addr  ;

    always @( posedge   or1200_ic_top_or1200_ic_tag_ic_tag0_clk  )
        if (  or1200_ic_top_or1200_ic_tag_ic_tag0_we  &&  or1200_ic_top_or1200_ic_tag_ic_tag0_ce  )
            or1200_ic_top_or1200_ic_tag_ic_tag0_mem   [  or1200_ic_top_or1200_ic_tag_ic_tag0_addr  ]<=  or1200_ic_top_or1200_ic_tag_ic_tag0_di  ;

    assign or1200_ic_top_or1200_ic_tag_ic_tag0_clk = or1200_ic_top_or1200_ic_tag_clk;
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_ce = or1200_ic_top_or1200_ic_tag_en;
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_we = or1200_ic_top_or1200_ic_tag_we;
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_addr = or1200_ic_top_or1200_ic_tag_addr;
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_di = or1200_ic_top_or1200_ic_tag_datain;
    assign {or1200_ic_top_or1200_ic_tag_tag,or1200_ic_top_or1200_ic_tag_tag_v} = or1200_ic_top_or1200_ic_tag_ic_tag0_doq;

    assign or1200_ic_top_or1200_ic_tag_clk = or1200_ic_top_clk;
    assign or1200_ic_top_or1200_ic_tag_rst = or1200_ic_top_rst;
    assign or1200_ic_top_or1200_ic_tag_addr = or1200_ic_top_ictag_addr;
    assign or1200_ic_top_or1200_ic_tag_en = or1200_ic_top_ictag_en;
    assign or1200_ic_top_or1200_ic_tag_we = or1200_ic_top_ictag_we;
    assign or1200_ic_top_or1200_ic_tag_datain = {or1200_ic_top_ic_addr[31:13-1+1],or1200_ic_top_ictag_v};
    assign or1200_ic_top_tag_v = or1200_ic_top_or1200_ic_tag_tag_v;
    assign or1200_ic_top_tag = or1200_ic_top_or1200_ic_tag_tag;

    assign or1200_ic_top_clk = clk_i;
    assign or1200_ic_top_rst = rst_i;
    assign icbiu_dat_ic = or1200_ic_top_icbiu_dat_o;
    assign icbiu_adr_ic = or1200_ic_top_icbiu_adr_o;
    assign icbiu_cyc_ic = or1200_ic_top_icbiu_cyc_o;
    assign icbiu_stb_ic = or1200_ic_top_icbiu_stb_o;
    assign icbiu_we_ic = or1200_ic_top_icbiu_we_o;
    assign icbiu_sel_ic = or1200_ic_top_icbiu_sel_o;
    assign icbiu_cab_ic = or1200_ic_top_icbiu_cab_o;
    assign or1200_ic_top_icbiu_dat_i = icbiu_dat_biu;
    assign or1200_ic_top_icbiu_ack_i = icbiu_ack_biu;
    assign or1200_ic_top_icbiu_err_i = icbiu_err_biu;
    assign or1200_ic_top_ic_en = ic_en;
    assign or1200_ic_top_icqmem_adr_i = icqmem_adr_qmem;
    assign or1200_ic_top_icqmem_cycstb_i = icqmem_cycstb_qmem;
    assign or1200_ic_top_icqmem_ci_i = icqmem_ci_qmem;
    assign or1200_ic_top_icqmem_sel_i = icqmem_sel_qmem;
    assign or1200_ic_top_icqmem_tag_i = icqmem_tag_qmem;
    assign icqmem_dat_ic = or1200_ic_top_icqmem_dat_o;
    assign icqmem_ack_ic = or1200_ic_top_icqmem_ack_o;
    assign icqmem_rty_ic = or1200_ic_top_icqmem_rty_o;
    assign icqmem_err_ic = or1200_ic_top_icqmem_err_o;
    assign icqmem_tag_ic = or1200_ic_top_icqmem_tag_o;
    assign or1200_ic_top_spr_cs = spr_cs[5'd04];
    assign or1200_ic_top_spr_write = spr_we;
    assign or1200_ic_top_spr_dat_i = spr_dat_cpu;


    wire  or1200_cpu_clk;
    wire  or1200_cpu_rst;
    wire  or1200_cpu_ic_en;
    wire [31:0] or1200_cpu_icpu_adr_o;
    wire  or1200_cpu_icpu_cycstb_o;
    wire [3:0] or1200_cpu_icpu_sel_o;
    wire [3:0] or1200_cpu_icpu_tag_o;
    wire [31:0] or1200_cpu_icpu_dat_i;
    wire  or1200_cpu_icpu_ack_i;
    wire  or1200_cpu_icpu_rty_i;
    wire  or1200_cpu_icpu_err_i;
    wire [31:0] or1200_cpu_icpu_adr_i;
    wire [3:0] or1200_cpu_icpu_tag_i;
    wire  or1200_cpu_immu_en;
    wire  or1200_cpu_id_void;
    wire [31:0] or1200_cpu_id_insn;
    wire  or1200_cpu_ex_void;
    wire [31:0] or1200_cpu_ex_insn;
    wire  or1200_cpu_ex_freeze;
    wire [31:0] or1200_cpu_wb_insn;
    wire  or1200_cpu_wb_freeze;
    wire [31:0] or1200_cpu_id_pc;
    wire [31:0] or1200_cpu_ex_pc;
    wire [31:0] or1200_cpu_wb_pc;
    wire [3-1:0] or1200_cpu_branch_op;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_npc;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_rf_dataw;
    wire  or1200_cpu_ex_flushpipe;
    wire  or1200_cpu_du_stall;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_du_addr;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_du_dat_du;
    wire  or1200_cpu_du_read;
    wire  or1200_cpu_du_write;
    wire [13:0] or1200_cpu_du_except_stop;
    wire  or1200_cpu_du_flush_pipe;
    wire [13:0] or1200_cpu_du_except_trig;
    wire [14-1:0] or1200_cpu_du_dsr;
    wire [24:0] or1200_cpu_du_dmr1;
    wire  or1200_cpu_du_hwbkpt;
    wire  or1200_cpu_du_hwbkpt_ls_r;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_du_dat_cpu;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_du_lsu_store_dat;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_du_lsu_load_dat;
    wire  or1200_cpu_abort_mvspr;
    wire  or1200_cpu_abort_ex;
    wire  or1200_cpu_dc_en;
    wire [31:0] or1200_cpu_dcpu_adr_o;
    wire  or1200_cpu_dcpu_cycstb_o;
    wire  or1200_cpu_dcpu_we_o;
    wire [3:0] or1200_cpu_dcpu_sel_o;
    wire [3:0] or1200_cpu_dcpu_tag_o;
    wire [31:0] or1200_cpu_dcpu_dat_o;
    wire [31:0] or1200_cpu_dcpu_dat_i;
    wire  or1200_cpu_dcpu_ack_i;
    wire  or1200_cpu_dcpu_rty_i;
    wire  or1200_cpu_dcpu_err_i;
    wire [3:0] or1200_cpu_dcpu_tag_i;
    wire  or1200_cpu_sb_en;
    wire  or1200_cpu_dmmu_en;
    wire  or1200_cpu_dc_no_writethrough;
    wire  or1200_cpu_boot_adr_sel_i;
    wire  or1200_cpu_sig_int;
    wire  or1200_cpu_sig_tick;
    wire  or1200_cpu_supv;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_addr;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_cpu;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_pic;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_tt;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_pm;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_dmmu;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_immu;
    wire [ or1200_cpu_dw -1:0] or1200_cpu_spr_dat_du;
    wire [31:0] or1200_cpu_spr_cs;
    wire  or1200_cpu_spr_we;
    wire  or1200_cpu_mtspr_dc_done;

    wire[31:0]  or1200_cpu_if_insn  ;
    wire  or1200_cpu_saving_if_insn  ;
    wire[31:0]  or1200_cpu_if_pc  ;
    wire[  or1200_cpu_aw  -1:0]  or1200_cpu_rf_addrw  ;
    wire[  or1200_cpu_aw  -1:0]  or1200_cpu_rf_addra  ;
    wire[  or1200_cpu_aw  -1:0]  or1200_cpu_rf_addrb  ;
    wire  or1200_cpu_rf_rda  ;
    wire  or1200_cpu_rf_rdb  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_id_simm  ;
    wire[  or1200_cpu_dw  -1:2]  or1200_cpu_id_branch_addrtarget  ;
    wire[  or1200_cpu_dw  -1:2]  or1200_cpu_ex_branch_addrtarget  ;
    wire[5-1:0]  or1200_cpu_alu_op  ;
    wire[4-1:0]  or1200_cpu_alu_op2  ;
    wire[4-1:0]  or1200_cpu_comp_op  ;
    wire[3-1:0]  or1200_cpu_pre_branch_op  ;
    wire[4-1:0]  or1200_cpu_id_lsu_op  ;
    wire  or1200_cpu_genpc_freeze  ;
    wire  or1200_cpu_if_freeze  ;
    wire  or1200_cpu_id_freeze  ;
    wire[2-1:0]  or1200_cpu_sel_a  ;
    wire[2-1:0]  or1200_cpu_sel_b  ;
    wire[4-1:0]  or1200_cpu_rfwb_op  ;
    wire[8-1:0]  or1200_cpu_fpu_op  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_rf_dataa  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_rf_datab  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_muxed_a  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_muxed_b  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_wb_forw  ;
    wire  or1200_cpu_wbforw_valid  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_operand_a  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_operand_b  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_alu_dataout  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_lsu_dataout  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_sprs_dataout  ;
    wire[  or1200_cpu_dw  -1:0]  or1200_cpu_fpu_dataout  ;
    wire  or1200_cpu_fpu_done  ;
    wire[31:0]  or1200_cpu_ex_simm  ;
    wire[3-1:0]  or1200_cpu_multicycle  ;
    wire[2-1:0]  or1200_cpu_wait_on  ;
    wire[4-1:0]  or1200_cpu_except_type  ;
    wire[4:0]  or1200_cpu_cust5_op  ;
    wire[5:0]  or1200_cpu_cust5_limm  ;
    wire  or1200_cpu_if_flushpipe  ;
    wire  or1200_cpu_id_flushpipe  ;
    wire  or1200_cpu_wb_flushpipe  ;
    wire  or1200_cpu_extend_flush  ;
    wire  or1200_cpu_ex_branch_taken  ;
    wire  or1200_cpu_flag  ;
    wire  or1200_cpu_flagforw  ;
    wire  or1200_cpu_flag_we  ;
    wire  or1200_cpu_flagforw_alu  ;
    wire  or1200_cpu_flag_we_alu  ;
    wire  or1200_cpu_flagforw_fpu  ;
    wire  or1200_cpu_flag_we_fpu  ;
    wire  or1200_cpu_carry  ;
    wire  or1200_cpu_cyforw  ;
    wire  or1200_cpu_cy_we_alu  ;
    wire  or1200_cpu_ovforw  ;
    wire  or1200_cpu_ov_we_alu  ;
    wire  or1200_cpu_ovforw_mult_mac  ;
    wire  or1200_cpu_ov_we_mult_mac  ;
    wire  or1200_cpu_cy_we_rf  ;
    wire  or1200_cpu_lsu_stall  ;
    wire  or1200_cpu_epcr_we  ;
    wire  or1200_cpu_eear_we  ;
    wire  or1200_cpu_esr_we  ;
    wire  or1200_cpu_pc_we  ;
    wire[31:0]  or1200_cpu_epcr  ;
    wire[31:0]  or1200_cpu_eear  ;
    wire[17-1:0]  or1200_cpu_esr  ;
    wire[12-1:0]  or1200_cpu_fpcsr  ;
    wire  or1200_cpu_fpcsr_we  ;
    wire  or1200_cpu_sr_we  ;
    wire[17-1:0]  or1200_cpu_to_sr  ;
    wire[17-1:0]  or1200_cpu_sr  ;
    wire  or1200_cpu_dsx  ;
    wire  or1200_cpu_except_flushpipe  ;
    wire  or1200_cpu_except_start  ;
    wire  or1200_cpu_except_started  ;
    wire  or1200_cpu_fpu_except_started  ;
    wire  or1200_cpu_sig_syscall  ;
    wire  or1200_cpu_sig_trap  ;
    wire  or1200_cpu_sig_range  ;
    wire  or1200_cpu_sig_fp  ;
    wire[31:0]  or1200_cpu_spr_dat_cfgr  ;
    wire[31:0]  or1200_cpu_spr_dat_rf  ;
    wire[31:0]  or1200_cpu_spr_dat_ppc  ;
    wire[31:0]  or1200_cpu_spr_dat_mac  ;
    wire[31:0]  or1200_cpu_spr_dat_fpu  ;
    wire  or1200_cpu_mtspr_done  ;
    wire  or1200_cpu_force_dslot_fetch  ;
    wire  or1200_cpu_no_more_dslot  ;
    wire  or1200_cpu_ex_spr_read  ;
    wire  or1200_cpu_ex_spr_write  ;
    wire  or1200_cpu_if_stall  ;
    wire  or1200_cpu_id_macrc_op  ;
    wire  or1200_cpu_ex_macrc_op  ;
    wire[3-1:0]  or1200_cpu_id_mac_op  ;
    wire[3-1:0]  or1200_cpu_mac_op  ;
    wire[31:0]  or1200_cpu_mult_mac_result  ;
    wire  or1200_cpu_mult_mac_stall  ;
    wire[13:0]  or1200_cpu_except_trig  ;
    wire[13:0]  or1200_cpu_except_stop  ;
    wire  or1200_cpu_genpc_refetch  ;
    wire  or1200_cpu_rfe  ;
    wire  or1200_cpu_lsu_unstall  ;
    wire  or1200_cpu_except_align  ;
    wire  or1200_cpu_except_dtlbmiss  ;
    wire  or1200_cpu_except_dmmufault  ;
    wire  or1200_cpu_except_illegal  ;
    wire  or1200_cpu_except_itlbmiss  ;
    wire  or1200_cpu_except_immufault  ;
    wire  or1200_cpu_except_ibuserr  ;
    wire  or1200_cpu_except_dbuserr  ;
    assign   or1200_cpu_du_except_trig  =  or1200_cpu_except_trig  ;
    assign   or1200_cpu_du_except_stop  =  or1200_cpu_except_stop  ;
    assign   or1200_cpu_du_lsu_store_dat  =  or1200_cpu_operand_b  ;
    assign   or1200_cpu_du_lsu_load_dat  =  or1200_cpu_lsu_dataout  ;
    assign   or1200_cpu_dc_en  =  or1200_cpu_sr  [3];
    assign   or1200_cpu_ic_en  =  or1200_cpu_sr  [4];
    assign   or1200_cpu_sb_en  =1'b0;
    assign   or1200_cpu_dmmu_en  =  or1200_cpu_sr  [5];
    assign   or1200_cpu_immu_en  =  or1200_cpu_sr  [6]&~  or1200_cpu_except_started  ;
    assign   or1200_cpu_supv  =  or1200_cpu_sr  [0];
    assign   or1200_cpu_flagforw  =(  or1200_cpu_flag_we_alu  &  or1200_cpu_flagforw_alu  )|(  or1200_cpu_flagforw_fpu  &  or1200_cpu_flag_we_fpu  );
    assign   or1200_cpu_flag_we  =(  or1200_cpu_flag_we_alu  |  or1200_cpu_flag_we_fpu  )&~  or1200_cpu_abort_mvspr  ;
    assign   or1200_cpu_mtspr_done  =  or1200_cpu_mtspr_dc_done  ;
    assign   or1200_cpu_sig_range  =  or1200_cpu_sr  [11];

    wire  or1200_cpu_or1200_genpc_clk;
    wire  or1200_cpu_or1200_genpc_rst;
    wire [31:0] or1200_cpu_or1200_genpc_icpu_adr_o;
    wire  or1200_cpu_or1200_genpc_icpu_cycstb_o;
    wire [3:0] or1200_cpu_or1200_genpc_icpu_sel_o;
    wire [3:0] or1200_cpu_or1200_genpc_icpu_tag_o;
    wire  or1200_cpu_or1200_genpc_icpu_rty_i;
    wire [31:0] or1200_cpu_or1200_genpc_icpu_adr_i;
    wire [3-1:0] or1200_cpu_or1200_genpc_pre_branch_op;
    wire [3-1:0] or1200_cpu_or1200_genpc_branch_op;
    wire [4-1:0] or1200_cpu_or1200_genpc_except_type;
    wire  or1200_cpu_or1200_genpc_except_prefix;
    wire [31:2] or1200_cpu_or1200_genpc_id_branch_addrtarget;
    wire [31:2] or1200_cpu_or1200_genpc_ex_branch_addrtarget;
    wire [31:0] or1200_cpu_or1200_genpc_muxed_b;
    wire [31:0] or1200_cpu_or1200_genpc_operand_b;
    wire  or1200_cpu_or1200_genpc_flag;
    wire  or1200_cpu_or1200_genpc_flagforw;
    reg  or1200_cpu_or1200_genpc_ex_branch_taken;
    wire  or1200_cpu_or1200_genpc_except_start;
    wire [31:0] or1200_cpu_or1200_genpc_epcr;
    wire [31:0] or1200_cpu_or1200_genpc_spr_dat_i;
    wire  or1200_cpu_or1200_genpc_spr_pc_we;
    wire  or1200_cpu_or1200_genpc_genpc_refetch;
    wire  or1200_cpu_or1200_genpc_genpc_freeze;
    wire  or1200_cpu_or1200_genpc_no_more_dslot;
    wire  or1200_cpu_or1200_genpc_lsu_stall;
    wire  or1200_cpu_or1200_genpc_du_flush_pipe;
    wire [31:0] or1200_cpu_or1200_genpc_spr_dat_npc;

    reg[31:2]  or1200_cpu_or1200_genpc_pcreg_default  ;
    reg  or1200_cpu_or1200_genpc_pcreg_select  ;
    reg[31:2]  or1200_cpu_or1200_genpc_pcreg  ;
    reg[31:0]  or1200_cpu_or1200_genpc_pc  ;
    reg  or1200_cpu_or1200_genpc_genpc_refetch_r  ;
    reg  or1200_cpu_or1200_genpc_wait_lsu  ;
    assign   or1200_cpu_or1200_genpc_icpu_adr_o  =!  or1200_cpu_or1200_genpc_no_more_dslot  &!  or1200_cpu_or1200_genpc_except_start  &!  or1200_cpu_or1200_genpc_spr_pc_we  &!  or1200_cpu_or1200_genpc_du_flush_pipe  &(  or1200_cpu_or1200_genpc_icpu_rty_i  |  or1200_cpu_or1200_genpc_genpc_refetch  ) ?   or1200_cpu_or1200_genpc_icpu_adr_i  :{  or1200_cpu_or1200_genpc_pc  [31:2],1'b0,  or1200_cpu_or1200_genpc_ex_branch_taken  |  or1200_cpu_or1200_genpc_spr_pc_we  };
    assign   or1200_cpu_or1200_genpc_icpu_cycstb_o  =~(  or1200_cpu_or1200_genpc_genpc_freeze  |(|  or1200_cpu_or1200_genpc_pre_branch_op  &&!  or1200_cpu_or1200_genpc_icpu_rty_i  )|  or1200_cpu_or1200_genpc_wait_lsu  );
    assign   or1200_cpu_or1200_genpc_icpu_sel_o  =4'b1111;
    assign   or1200_cpu_or1200_genpc_icpu_tag_o  =4'h1;
    always @(  posedge    or1200_cpu_or1200_genpc_clk          or  posedge   or1200_cpu_or1200_genpc_rst  )
        if (  or1200_cpu_or1200_genpc_rst  ==(1'b1))
            or1200_cpu_or1200_genpc_wait_lsu   <=1'b0;
        else
            if (!  or1200_cpu_or1200_genpc_wait_lsu  &|  or1200_cpu_or1200_genpc_pre_branch_op  &  or1200_cpu_or1200_genpc_lsu_stall  )
                or1200_cpu_or1200_genpc_wait_lsu   <=1'b1;
            else
                if (  or1200_cpu_or1200_genpc_wait_lsu  &~|  or1200_cpu_or1200_genpc_pre_branch_op  )
                    or1200_cpu_or1200_genpc_wait_lsu   <=1'b0;

    always @(  posedge    or1200_cpu_or1200_genpc_clk          or  posedge   or1200_cpu_or1200_genpc_rst  )
        if (  or1200_cpu_or1200_genpc_rst  ==(1'b1))
            or1200_cpu_or1200_genpc_genpc_refetch_r   <=1'b0;
        else
            if (  or1200_cpu_or1200_genpc_genpc_refetch  )
                or1200_cpu_or1200_genpc_genpc_refetch_r   <=1'b1;
            else
                or1200_cpu_or1200_genpc_genpc_refetch_r   <=1'b0;

    always @(              or1200_cpu_or1200_genpc_pcreg                                or    or1200_cpu_or1200_genpc_ex_branch_addrtarget                    or    or1200_cpu_or1200_genpc_flag                   or    or1200_cpu_or1200_genpc_branch_op                  or    or1200_cpu_or1200_genpc_except_type                 or    or1200_cpu_or1200_genpc_except_start                or    or1200_cpu_or1200_genpc_operand_b               or    or1200_cpu_or1200_genpc_epcr              or    or1200_cpu_or1200_genpc_spr_pc_we             or    or1200_cpu_or1200_genpc_spr_dat_i            or    or1200_cpu_or1200_genpc_except_prefix           or    or1200_cpu_or1200_genpc_du_flush_pipe   )
    begin
        casez ({  or1200_cpu_or1200_genpc_du_flush_pipe  ,  or1200_cpu_or1200_genpc_spr_pc_we  ,  or1200_cpu_or1200_genpc_except_start  ,  or1200_cpu_or1200_genpc_branch_op  })
            { 3'b000,3'd0}:
            begin
                or1200_cpu_or1200_genpc_pc   ={  or1200_cpu_or1200_genpc_pcreg  +30'd1,2'b0};
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b0;
            end
            { 3'b000,3'd1}:
            begin
                or1200_cpu_or1200_genpc_pc   ={  or1200_cpu_or1200_genpc_ex_branch_addrtarget  ,2'b00};
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
            end
            { 3'b000,3'd2}:
            begin
                or1200_cpu_or1200_genpc_pc   =  or1200_cpu_or1200_genpc_operand_b  ;
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
            end
            { 3'b000,3'd4}:
                if (  or1200_cpu_or1200_genpc_flag  )
                begin
                    or1200_cpu_or1200_genpc_pc   ={  or1200_cpu_or1200_genpc_ex_branch_addrtarget  ,2'b00};
                    or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
                end
                else
                begin
                    or1200_cpu_or1200_genpc_pc   ={  or1200_cpu_or1200_genpc_pcreg  +30'd1,2'b0};
                    or1200_cpu_or1200_genpc_ex_branch_taken   =1'b0;
                end
            { 3'b000,3'd5}:
                if (  or1200_cpu_or1200_genpc_flag  )
                begin
                    or1200_cpu_or1200_genpc_pc   ={  or1200_cpu_or1200_genpc_pcreg  +30'd1,2'b0};
                    or1200_cpu_or1200_genpc_ex_branch_taken   =1'b0;
                end
                else
                begin
                    or1200_cpu_or1200_genpc_pc   ={  or1200_cpu_or1200_genpc_ex_branch_addrtarget  ,2'b00};
                    or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
                end
            { 3'b000,3'd6}:
            begin
                or1200_cpu_or1200_genpc_pc   =  or1200_cpu_or1200_genpc_epcr  ;
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
            end
            { 3'b100,3'b???}:
            begin
                or1200_cpu_or1200_genpc_pc   =  or1200_cpu_or1200_genpc_spr_dat_npc  ;
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
            end
            { 3'b001,3'b???}:
            begin
                or1200_cpu_or1200_genpc_pc   ={(  or1200_cpu_or1200_genpc_except_prefix   ? 20'hF0000:20'h00000),  or1200_cpu_or1200_genpc_except_type  ,8'h00};
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b1;
            end
            default :
            begin
                or1200_cpu_or1200_genpc_pc   =  or1200_cpu_or1200_genpc_spr_dat_i  ;
                or1200_cpu_or1200_genpc_ex_branch_taken   =1'b0;
            end
        endcase
    end

    wire[31:0]  or1200_cpu_or1200_genpc_pcreg_boot  =  or1200_cpu_or1200_genpc_boot_adr  ;
    always @(  posedge    or1200_cpu_or1200_genpc_clk          or  posedge   or1200_cpu_or1200_genpc_rst  )
        if (  or1200_cpu_or1200_genpc_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_genpc_pcreg_default   <=(  or1200_cpu_or1200_genpc_boot_adr  >>2)-4;
            or1200_cpu_or1200_genpc_pcreg_select   <=1'b1;
        end
        else
            if (  or1200_cpu_or1200_genpc_pcreg_select  )
            begin
                or1200_cpu_or1200_genpc_pcreg_default   <=  or1200_cpu_or1200_genpc_pcreg_boot  [31:2];
                or1200_cpu_or1200_genpc_pcreg_select   <=1'b0;
            end
            else
                if (  or1200_cpu_or1200_genpc_spr_pc_we  )
                begin
                    or1200_cpu_or1200_genpc_pcreg_default   <=  or1200_cpu_or1200_genpc_spr_dat_i  [31:2];
                end
                else
                    if (  or1200_cpu_or1200_genpc_du_flush_pipe  |  or1200_cpu_or1200_genpc_no_more_dslot  |  or1200_cpu_or1200_genpc_except_start  |!  or1200_cpu_or1200_genpc_genpc_freeze  &!  or1200_cpu_or1200_genpc_icpu_rty_i  &!  or1200_cpu_or1200_genpc_genpc_refetch  )
                    begin
                        or1200_cpu_or1200_genpc_pcreg_default   <=  or1200_cpu_or1200_genpc_pc  [31:2];
                    end

    always @(     or1200_cpu_or1200_genpc_pcreg_boot              or    or1200_cpu_or1200_genpc_pcreg_default           or    or1200_cpu_or1200_genpc_pcreg_select   )
        if (  or1200_cpu_or1200_genpc_pcreg_select  )
            or1200_cpu_or1200_genpc_pcreg   =  or1200_cpu_or1200_genpc_pcreg_boot  [31:2];
        else
            or1200_cpu_or1200_genpc_pcreg   =  or1200_cpu_or1200_genpc_pcreg_default  ;

    assign or1200_cpu_or1200_genpc_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_genpc_rst = or1200_cpu_rst;
    assign or1200_cpu_icpu_adr_o = or1200_cpu_or1200_genpc_icpu_adr_o;
    assign or1200_cpu_icpu_cycstb_o = or1200_cpu_or1200_genpc_icpu_cycstb_o;
    assign or1200_cpu_icpu_sel_o = or1200_cpu_or1200_genpc_icpu_sel_o;
    assign or1200_cpu_icpu_tag_o = or1200_cpu_or1200_genpc_icpu_tag_o;
    assign or1200_cpu_or1200_genpc_icpu_rty_i = or1200_cpu_icpu_rty_i;
    assign or1200_cpu_or1200_genpc_icpu_adr_i = or1200_cpu_icpu_adr_i;
    assign or1200_cpu_or1200_genpc_pre_branch_op = or1200_cpu_pre_branch_op;
    assign or1200_cpu_or1200_genpc_branch_op = or1200_cpu_branch_op;
    assign or1200_cpu_or1200_genpc_except_type = or1200_cpu_except_type;
    assign or1200_cpu_or1200_genpc_except_prefix = or1200_cpu_sr[14];
    assign or1200_cpu_or1200_genpc_id_branch_addrtarget = or1200_cpu_id_branch_addrtarget;
    assign or1200_cpu_or1200_genpc_ex_branch_addrtarget = or1200_cpu_ex_branch_addrtarget;
    assign or1200_cpu_or1200_genpc_muxed_b = or1200_cpu_muxed_b;
    assign or1200_cpu_or1200_genpc_operand_b = or1200_cpu_operand_b;
    assign or1200_cpu_or1200_genpc_flag = or1200_cpu_flag;
    assign or1200_cpu_or1200_genpc_flagforw = or1200_cpu_flagforw;
    assign or1200_cpu_ex_branch_taken = or1200_cpu_or1200_genpc_ex_branch_taken;
    assign or1200_cpu_or1200_genpc_except_start = or1200_cpu_except_start;
    assign or1200_cpu_or1200_genpc_epcr = or1200_cpu_epcr;
    assign or1200_cpu_or1200_genpc_spr_dat_i = or1200_cpu_spr_dat_cpu;
    assign or1200_cpu_or1200_genpc_spr_pc_we = or1200_cpu_pc_we;
    assign or1200_cpu_or1200_genpc_genpc_refetch = or1200_cpu_genpc_refetch;
    assign or1200_cpu_or1200_genpc_genpc_freeze = or1200_cpu_genpc_freeze;
    assign or1200_cpu_or1200_genpc_no_more_dslot = or1200_cpu_no_more_dslot;
    assign or1200_cpu_or1200_genpc_lsu_stall = or1200_cpu_lsu_stall;
    assign or1200_cpu_or1200_genpc_du_flush_pipe = or1200_cpu_du_flush_pipe;
    assign or1200_cpu_or1200_genpc_spr_dat_npc = or1200_cpu_spr_dat_npc;


    wire  or1200_cpu_or1200_if_clk;
    wire  or1200_cpu_or1200_if_rst;
    wire [31:0] or1200_cpu_or1200_if_icpu_dat_i;
    wire  or1200_cpu_or1200_if_icpu_ack_i;
    wire  or1200_cpu_or1200_if_icpu_err_i;
    wire [31:0] or1200_cpu_or1200_if_icpu_adr_i;
    wire [3:0] or1200_cpu_or1200_if_icpu_tag_i;
    wire  or1200_cpu_or1200_if_if_freeze;
    wire [31:0] or1200_cpu_or1200_if_if_insn;
    wire [31:0] or1200_cpu_or1200_if_if_pc;
    wire  or1200_cpu_or1200_if_if_flushpipe;
    wire  or1200_cpu_or1200_if_saving_if_insn;
    wire  or1200_cpu_or1200_if_if_stall;
    wire  or1200_cpu_or1200_if_no_more_dslot;
    wire  or1200_cpu_or1200_if_genpc_refetch;
    wire  or1200_cpu_or1200_if_rfe;
    wire  or1200_cpu_or1200_if_except_itlbmiss;
    wire  or1200_cpu_or1200_if_except_immufault;
    wire  or1200_cpu_or1200_if_except_ibuserr;

    wire  or1200_cpu_or1200_if_save_insn  ;
    wire  or1200_cpu_or1200_if_if_bypass  ;
    reg  or1200_cpu_or1200_if_if_bypass_reg  ;
    reg[31:0]  or1200_cpu_or1200_if_insn_saved  ;
    reg[31:0]  or1200_cpu_or1200_if_addr_saved  ;
    reg[2:0]  or1200_cpu_or1200_if_err_saved  ;
    reg  or1200_cpu_or1200_if_saved  ;
    assign   or1200_cpu_or1200_if_save_insn  =(  or1200_cpu_or1200_if_icpu_ack_i  |  or1200_cpu_or1200_if_icpu_err_i  )&  or1200_cpu_or1200_if_if_freeze  &!  or1200_cpu_or1200_if_saved  ;
    assign   or1200_cpu_or1200_if_saving_if_insn  =!  or1200_cpu_or1200_if_if_flushpipe  &  or1200_cpu_or1200_if_save_insn  ;
    assign   or1200_cpu_or1200_if_if_bypass  =  or1200_cpu_or1200_if_icpu_adr_i  [0] ? 1'b0:  or1200_cpu_or1200_if_if_bypass_reg  |  or1200_cpu_or1200_if_if_flushpipe  ;
    always @(  posedge    or1200_cpu_or1200_if_clk          or  posedge   or1200_cpu_or1200_if_rst  )
        if (  or1200_cpu_or1200_if_rst  ==(1'b1))
            or1200_cpu_or1200_if_if_bypass_reg   <=1'b0;
        else
            or1200_cpu_or1200_if_if_bypass_reg   <=  or1200_cpu_or1200_if_if_bypass  ;

    assign   or1200_cpu_or1200_if_if_insn  =  or1200_cpu_or1200_if_no_more_dslot  |  or1200_cpu_or1200_if_rfe  |  or1200_cpu_or1200_if_if_bypass   ? {6'b000101,26'h041_0000}:  or1200_cpu_or1200_if_saved   ?   or1200_cpu_or1200_if_insn_saved  :  or1200_cpu_or1200_if_icpu_ack_i   ?   or1200_cpu_or1200_if_icpu_dat_i  :{6'b000101,26'h061_0000};
    assign   or1200_cpu_or1200_if_if_pc  =  or1200_cpu_or1200_if_saved   ?   or1200_cpu_or1200_if_addr_saved  :{  or1200_cpu_or1200_if_icpu_adr_i  [31:2],2'h0};
    assign   or1200_cpu_or1200_if_if_stall  =!  or1200_cpu_or1200_if_icpu_err_i  &!  or1200_cpu_or1200_if_icpu_ack_i  &!  or1200_cpu_or1200_if_saved  ;
    assign   or1200_cpu_or1200_if_genpc_refetch  =  or1200_cpu_or1200_if_saved  &  or1200_cpu_or1200_if_icpu_ack_i  ;
    assign   or1200_cpu_or1200_if_except_itlbmiss  =  or1200_cpu_or1200_if_no_more_dslot   ? 1'b0:  or1200_cpu_or1200_if_saved   ?   or1200_cpu_or1200_if_err_saved  [0]:  or1200_cpu_or1200_if_icpu_err_i  &(  or1200_cpu_or1200_if_icpu_tag_i  ==4'hd);
    assign   or1200_cpu_or1200_if_except_immufault  =  or1200_cpu_or1200_if_no_more_dslot   ? 1'b0:  or1200_cpu_or1200_if_saved   ?   or1200_cpu_or1200_if_err_saved  [1]:  or1200_cpu_or1200_if_icpu_err_i  &(  or1200_cpu_or1200_if_icpu_tag_i  ==4'hc);
    assign   or1200_cpu_or1200_if_except_ibuserr  =  or1200_cpu_or1200_if_no_more_dslot   ? 1'b0:  or1200_cpu_or1200_if_saved   ?   or1200_cpu_or1200_if_err_saved  [2]:  or1200_cpu_or1200_if_icpu_err_i  &(  or1200_cpu_or1200_if_icpu_tag_i  ==4'hb);
    always @(  posedge    or1200_cpu_or1200_if_clk          or  posedge   or1200_cpu_or1200_if_rst  )
        if (  or1200_cpu_or1200_if_rst  ==(1'b1))
            or1200_cpu_or1200_if_saved   <=1'b0;
        else
            if (  or1200_cpu_or1200_if_if_flushpipe  )
                or1200_cpu_or1200_if_saved   <=1'b0;
            else
                if (  or1200_cpu_or1200_if_save_insn  )
                    or1200_cpu_or1200_if_saved   <=1'b1;
                else
                    if (!  or1200_cpu_or1200_if_if_freeze  )
                        or1200_cpu_or1200_if_saved   <=1'b0;

    always @(  posedge    or1200_cpu_or1200_if_clk          or  posedge   or1200_cpu_or1200_if_rst  )
        if (  or1200_cpu_or1200_if_rst  ==(1'b1))
            or1200_cpu_or1200_if_insn_saved   <={6'b000101,26'h041_0000};
        else
            if (  or1200_cpu_or1200_if_if_flushpipe  )
                or1200_cpu_or1200_if_insn_saved   <={6'b000101,26'h041_0000};
            else
                if (  or1200_cpu_or1200_if_save_insn  )
                    or1200_cpu_or1200_if_insn_saved   <=  or1200_cpu_or1200_if_icpu_err_i   ? {6'b000101,26'h041_0000}:  or1200_cpu_or1200_if_icpu_dat_i  ;
                else
                    if (!  or1200_cpu_or1200_if_if_freeze  )
                        or1200_cpu_or1200_if_insn_saved   <={6'b000101,26'h041_0000};

    always @(  posedge    or1200_cpu_or1200_if_clk          or  posedge   or1200_cpu_or1200_if_rst  )
        if (  or1200_cpu_or1200_if_rst  ==(1'b1))
            or1200_cpu_or1200_if_addr_saved   <=32'h00000000;
        else
            if (  or1200_cpu_or1200_if_if_flushpipe  )
                or1200_cpu_or1200_if_addr_saved   <=32'h00000000;
            else
                if (  or1200_cpu_or1200_if_save_insn  )
                    or1200_cpu_or1200_if_addr_saved   <={  or1200_cpu_or1200_if_icpu_adr_i  [31:2],2'b00};
                else
                    if (!  or1200_cpu_or1200_if_if_freeze  )
                        or1200_cpu_or1200_if_addr_saved   <={  or1200_cpu_or1200_if_icpu_adr_i  [31:2],2'b00};

    always @(  posedge    or1200_cpu_or1200_if_clk          or  posedge   or1200_cpu_or1200_if_rst  )
        if (  or1200_cpu_or1200_if_rst  ==(1'b1))
            or1200_cpu_or1200_if_err_saved   <=3'b000;
        else
            if (  or1200_cpu_or1200_if_if_flushpipe  )
                or1200_cpu_or1200_if_err_saved   <=3'b000;
            else
                if (  or1200_cpu_or1200_if_save_insn  )
                begin
                    or1200_cpu_or1200_if_err_saved   [0]<=  or1200_cpu_or1200_if_icpu_err_i  &(  or1200_cpu_or1200_if_icpu_tag_i  ==4'hd);
                    or1200_cpu_or1200_if_err_saved   [1]<=  or1200_cpu_or1200_if_icpu_err_i  &(  or1200_cpu_or1200_if_icpu_tag_i  ==4'hc);
                    or1200_cpu_or1200_if_err_saved   [2]<=  or1200_cpu_or1200_if_icpu_err_i  &(  or1200_cpu_or1200_if_icpu_tag_i  ==4'hb);
                end
                else
                    if (!  or1200_cpu_or1200_if_if_freeze  )
                        or1200_cpu_or1200_if_err_saved   <=3'b000;

    assign or1200_cpu_or1200_if_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_if_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_if_icpu_dat_i = or1200_cpu_icpu_dat_i;
    assign or1200_cpu_or1200_if_icpu_ack_i = or1200_cpu_icpu_ack_i;
    assign or1200_cpu_or1200_if_icpu_err_i = or1200_cpu_icpu_err_i;
    assign or1200_cpu_or1200_if_icpu_adr_i = or1200_cpu_icpu_adr_i;
    assign or1200_cpu_or1200_if_icpu_tag_i = or1200_cpu_icpu_tag_i;
    assign or1200_cpu_or1200_if_if_freeze = or1200_cpu_if_freeze;
    assign or1200_cpu_if_insn = or1200_cpu_or1200_if_if_insn;
    assign or1200_cpu_if_pc = or1200_cpu_or1200_if_if_pc;
    assign or1200_cpu_or1200_if_if_flushpipe = or1200_cpu_if_flushpipe;
    assign or1200_cpu_saving_if_insn = or1200_cpu_or1200_if_saving_if_insn;
    assign or1200_cpu_if_stall = or1200_cpu_or1200_if_if_stall;
    assign or1200_cpu_or1200_if_no_more_dslot = or1200_cpu_no_more_dslot;
    assign or1200_cpu_genpc_refetch = or1200_cpu_or1200_if_genpc_refetch;
    assign or1200_cpu_or1200_if_rfe = or1200_cpu_rfe;
    assign or1200_cpu_except_itlbmiss = or1200_cpu_or1200_if_except_itlbmiss;
    assign or1200_cpu_except_immufault = or1200_cpu_or1200_if_except_immufault;
    assign or1200_cpu_except_ibuserr = or1200_cpu_or1200_if_except_ibuserr;


    wire  or1200_cpu_or1200_ctrl_clk;
    wire  or1200_cpu_or1200_ctrl_rst;
    wire  or1200_cpu_or1200_ctrl_except_flushpipe;
    wire  or1200_cpu_or1200_ctrl_extend_flush;
    wire  or1200_cpu_or1200_ctrl_if_flushpipe;
    wire  or1200_cpu_or1200_ctrl_id_flushpipe;
    wire  or1200_cpu_or1200_ctrl_ex_flushpipe;
    wire  or1200_cpu_or1200_ctrl_wb_flushpipe;
    wire  or1200_cpu_or1200_ctrl_id_freeze;
    wire  or1200_cpu_or1200_ctrl_ex_freeze;
    wire  or1200_cpu_or1200_ctrl_wb_freeze;
    wire [31:0] or1200_cpu_or1200_ctrl_if_insn;
    reg [31:0] or1200_cpu_or1200_ctrl_id_insn;
    reg [31:0] or1200_cpu_or1200_ctrl_ex_insn;
    wire  or1200_cpu_or1200_ctrl_abort_mvspr;
    reg [3-1:0] or1200_cpu_or1200_ctrl_id_branch_op;
    reg [3-1:0] or1200_cpu_or1200_ctrl_ex_branch_op;
    wire  or1200_cpu_or1200_ctrl_ex_branch_taken;
    wire  or1200_cpu_or1200_ctrl_pc_we;
    wire [5-1:0] or1200_cpu_or1200_ctrl_rf_addra;
    wire [5-1:0] or1200_cpu_or1200_ctrl_rf_addrb;
    wire  or1200_cpu_or1200_ctrl_rf_rda;
    wire  or1200_cpu_or1200_ctrl_rf_rdb;
    reg [5-1:0] or1200_cpu_or1200_ctrl_alu_op;
    reg [4-1:0] or1200_cpu_or1200_ctrl_alu_op2;
    wire [3-1:0] or1200_cpu_or1200_ctrl_mac_op;
    reg [4-1:0] or1200_cpu_or1200_ctrl_comp_op;
    reg [5-1:0] or1200_cpu_or1200_ctrl_rf_addrw;
    reg [4-1:0] or1200_cpu_or1200_ctrl_rfwb_op;
    wire [8-1:0] or1200_cpu_or1200_ctrl_fpu_op;
    reg [31:0] or1200_cpu_or1200_ctrl_wb_insn;
    reg [31:0] or1200_cpu_or1200_ctrl_id_simm;
    reg [31:0] or1200_cpu_or1200_ctrl_ex_simm;
    wire [31:2] or1200_cpu_or1200_ctrl_id_branch_addrtarget;
    reg [31:2] or1200_cpu_or1200_ctrl_ex_branch_addrtarget;
    reg [2-1:0] or1200_cpu_or1200_ctrl_sel_a;
    reg [2-1:0] or1200_cpu_or1200_ctrl_sel_b;
    reg [4-1:0] or1200_cpu_or1200_ctrl_id_lsu_op;
    wire [4:0] or1200_cpu_or1200_ctrl_cust5_op;
    wire [5:0] or1200_cpu_or1200_ctrl_cust5_limm;
    wire [31:0] or1200_cpu_or1200_ctrl_id_pc;
    wire [31:0] or1200_cpu_or1200_ctrl_ex_pc;
    wire  or1200_cpu_or1200_ctrl_du_hwbkpt;
    reg [3-1:0] or1200_cpu_or1200_ctrl_multicycle;
    reg [2-1:0] or1200_cpu_or1200_ctrl_wait_on;
    wire  or1200_cpu_or1200_ctrl_wbforw_valid;
    reg  or1200_cpu_or1200_ctrl_sig_syscall;
    reg  or1200_cpu_or1200_ctrl_sig_trap;
    wire  or1200_cpu_or1200_ctrl_force_dslot_fetch;
    wire  or1200_cpu_or1200_ctrl_no_more_dslot;
    wire  or1200_cpu_or1200_ctrl_id_void;
    wire  or1200_cpu_or1200_ctrl_ex_void;
    wire  or1200_cpu_or1200_ctrl_ex_spr_read;
    wire  or1200_cpu_or1200_ctrl_ex_spr_write;
    wire  or1200_cpu_or1200_ctrl_du_flush_pipe;
    wire [3-1:0] or1200_cpu_or1200_ctrl_id_mac_op;
    wire  or1200_cpu_or1200_ctrl_id_macrc_op;
    wire  or1200_cpu_or1200_ctrl_ex_macrc_op;
    wire  or1200_cpu_or1200_ctrl_rfe;
    reg  or1200_cpu_or1200_ctrl_except_illegal;
    wire  or1200_cpu_or1200_ctrl_dc_no_writethrough;

    wire  or1200_cpu_or1200_ctrl_if_maci_op  ;
    reg[5-1:0]  or1200_cpu_or1200_ctrl_wb_rfaddrw  ;
    reg  or1200_cpu_or1200_ctrl_sel_imm  ;
    wire  or1200_cpu_or1200_ctrl_wb_void  ;
    reg  or1200_cpu_or1200_ctrl_ex_delayslot_dsi  ;
    reg  or1200_cpu_or1200_ctrl_ex_delayslot_nop  ;
    reg  or1200_cpu_or1200_ctrl_spr_read  ;
    reg  or1200_cpu_or1200_ctrl_spr_write  ;
    assign   or1200_cpu_or1200_ctrl_rf_addra  =  or1200_cpu_or1200_ctrl_if_insn  [20:16];
    assign   or1200_cpu_or1200_ctrl_rf_addrb  =  or1200_cpu_or1200_ctrl_if_insn  [15:11];
    assign   or1200_cpu_or1200_ctrl_rf_rda  =  or1200_cpu_or1200_ctrl_if_insn  [31]||  or1200_cpu_or1200_ctrl_if_maci_op  ;
    assign   or1200_cpu_or1200_ctrl_rf_rdb  =  or1200_cpu_or1200_ctrl_if_insn  [30];
    assign   or1200_cpu_or1200_ctrl_force_dslot_fetch  =1'b0;
    assign   or1200_cpu_or1200_ctrl_no_more_dslot  =(|  or1200_cpu_or1200_ctrl_ex_branch_op  &!  or1200_cpu_or1200_ctrl_id_void  &  or1200_cpu_or1200_ctrl_ex_branch_taken  )|(  or1200_cpu_or1200_ctrl_ex_branch_op  ==3'd6);
    assign   or1200_cpu_or1200_ctrl_id_void  =(  or1200_cpu_or1200_ctrl_id_insn  [31:26]==6'b000101)&  or1200_cpu_or1200_ctrl_id_insn  [16];
    assign   or1200_cpu_or1200_ctrl_ex_void  =(  or1200_cpu_or1200_ctrl_ex_insn  [31:26]==6'b000101)&  or1200_cpu_or1200_ctrl_ex_insn  [16];
    assign   or1200_cpu_or1200_ctrl_wb_void  =(  or1200_cpu_or1200_ctrl_wb_insn  [31:26]==6'b000101)&  or1200_cpu_or1200_ctrl_wb_insn  [16];
    assign   or1200_cpu_or1200_ctrl_ex_spr_write  =  or1200_cpu_or1200_ctrl_spr_write  &&!  or1200_cpu_or1200_ctrl_abort_mvspr  ;
    assign   or1200_cpu_or1200_ctrl_ex_spr_read  =  or1200_cpu_or1200_ctrl_spr_read  &&!  or1200_cpu_or1200_ctrl_abort_mvspr  ;
    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_ctrl_ex_delayslot_nop   <=1'b0;
            or1200_cpu_or1200_ctrl_ex_delayslot_dsi   <=1'b0;
        end
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &!  or1200_cpu_or1200_ctrl_ex_delayslot_dsi  &  or1200_cpu_or1200_ctrl_ex_delayslot_nop  )
            begin
                or1200_cpu_or1200_ctrl_ex_delayslot_nop   <=  or1200_cpu_or1200_ctrl_id_void  ;
                or1200_cpu_or1200_ctrl_ex_delayslot_dsi   <=!  or1200_cpu_or1200_ctrl_id_void  ;
            end
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_ex_delayslot_dsi  &!  or1200_cpu_or1200_ctrl_ex_delayslot_nop  )
                begin
                    or1200_cpu_or1200_ctrl_ex_delayslot_nop   <=1'b0;
                    or1200_cpu_or1200_ctrl_ex_delayslot_dsi   <=1'b0;
                end
                else
                    if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                    begin
                        or1200_cpu_or1200_ctrl_ex_delayslot_nop   <=  or1200_cpu_or1200_ctrl_id_void  &&  or1200_cpu_or1200_ctrl_ex_branch_taken  &&(  or1200_cpu_or1200_ctrl_ex_branch_op  !=3'd0)&&(  or1200_cpu_or1200_ctrl_ex_branch_op  !=3'd6);
                        or1200_cpu_or1200_ctrl_ex_delayslot_dsi   <=!  or1200_cpu_or1200_ctrl_id_void  &&  or1200_cpu_or1200_ctrl_ex_branch_taken  &&(  or1200_cpu_or1200_ctrl_ex_branch_op  !=3'd0)&&(  or1200_cpu_or1200_ctrl_ex_branch_op  !=3'd6);
                    end
    end

    assign   or1200_cpu_or1200_ctrl_if_flushpipe  =  or1200_cpu_or1200_ctrl_except_flushpipe  |  or1200_cpu_or1200_ctrl_pc_we  |  or1200_cpu_or1200_ctrl_extend_flush  |  or1200_cpu_or1200_ctrl_du_flush_pipe  ;
    assign   or1200_cpu_or1200_ctrl_id_flushpipe  =  or1200_cpu_or1200_ctrl_except_flushpipe  |  or1200_cpu_or1200_ctrl_pc_we  |  or1200_cpu_or1200_ctrl_extend_flush  |  or1200_cpu_or1200_ctrl_du_flush_pipe  ;
    assign   or1200_cpu_or1200_ctrl_ex_flushpipe  =  or1200_cpu_or1200_ctrl_except_flushpipe  |  or1200_cpu_or1200_ctrl_pc_we  |  or1200_cpu_or1200_ctrl_extend_flush  |  or1200_cpu_or1200_ctrl_du_flush_pipe  ;
    assign   or1200_cpu_or1200_ctrl_wb_flushpipe  =  or1200_cpu_or1200_ctrl_except_flushpipe  |  or1200_cpu_or1200_ctrl_pc_we  |  or1200_cpu_or1200_ctrl_extend_flush  |  or1200_cpu_or1200_ctrl_du_flush_pipe  ;
    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_ex_simm   <=32'h0000_0000;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
            begin
                or1200_cpu_or1200_ctrl_ex_simm   <=  or1200_cpu_or1200_ctrl_id_simm  ;
            end
    end

    always @(   or1200_cpu_or1200_ctrl_id_insn   )
    begin
        case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
            6 'b100111:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [15]}},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
            6 'b101000:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [15]}},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
            6 'b100001,6'b100010,6'b100011,6'b100100,6'b100101,6'b100110:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [15]}},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
            6 'b101100:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [15]}},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
            6 'b110000:
                or1200_cpu_or1200_ctrl_id_simm   ={16'b0,  or1200_cpu_or1200_ctrl_id_insn  [25:21],  or1200_cpu_or1200_ctrl_id_insn  [10:0]};
            6 'b110101,6'b110111,6'b110110:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [25]}},  or1200_cpu_or1200_ctrl_id_insn  [25:21],  or1200_cpu_or1200_ctrl_id_insn  [10:0]};
            6 'b101011:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [15]}},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
            6 'b101111:
                or1200_cpu_or1200_ctrl_id_simm   ={{16{  or1200_cpu_or1200_ctrl_id_insn  [15]}},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
            default :
                or1200_cpu_or1200_ctrl_id_simm   ={{16'b0},  or1200_cpu_or1200_ctrl_id_insn  [15:0]};
        endcase
    end

    assign   or1200_cpu_or1200_ctrl_id_branch_addrtarget  ={{4{  or1200_cpu_or1200_ctrl_id_insn  [25]}},  or1200_cpu_or1200_ctrl_id_insn  [25:0]}+  or1200_cpu_or1200_ctrl_id_pc  [31:2];
    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_ex_branch_addrtarget   <=0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                or1200_cpu_or1200_ctrl_ex_branch_addrtarget   <=  or1200_cpu_or1200_ctrl_id_branch_addrtarget  ;
    end

    assign   or1200_cpu_or1200_ctrl_if_maci_op  =1'b0;
    assign   or1200_cpu_or1200_ctrl_id_macrc_op  =1'b0;
    assign   or1200_cpu_or1200_ctrl_ex_macrc_op  =1'b0;
    assign   or1200_cpu_or1200_ctrl_cust5_op  =  or1200_cpu_or1200_ctrl_ex_insn  [4:0];
    assign   or1200_cpu_or1200_ctrl_cust5_limm  =  or1200_cpu_or1200_ctrl_ex_insn  [10:5];
    assign   or1200_cpu_or1200_ctrl_rfe  =(  or1200_cpu_or1200_ctrl_id_branch_op  ==3'd6)|(  or1200_cpu_or1200_ctrl_ex_branch_op  ==3'd6);
    always @(       or1200_cpu_or1200_ctrl_rf_addrw                  or    or1200_cpu_or1200_ctrl_id_insn             or    or1200_cpu_or1200_ctrl_rfwb_op            or    or1200_cpu_or1200_ctrl_wbforw_valid           or    or1200_cpu_or1200_ctrl_wb_rfaddrw   )
        if ((  or1200_cpu_or1200_ctrl_id_insn  [20:16]==  or1200_cpu_or1200_ctrl_rf_addrw  )&&  or1200_cpu_or1200_ctrl_rfwb_op  [0])
            or1200_cpu_or1200_ctrl_sel_a   =2'd2;
        else
            if ((  or1200_cpu_or1200_ctrl_id_insn  [20:16]==  or1200_cpu_or1200_ctrl_wb_rfaddrw  )&&  or1200_cpu_or1200_ctrl_wbforw_valid  )
                or1200_cpu_or1200_ctrl_sel_a   =2'd3;
            else
                or1200_cpu_or1200_ctrl_sel_a   =2'd0;

    always @(        or1200_cpu_or1200_ctrl_rf_addrw                    or    or1200_cpu_or1200_ctrl_sel_imm              or    or1200_cpu_or1200_ctrl_id_insn             or    or1200_cpu_or1200_ctrl_rfwb_op            or    or1200_cpu_or1200_ctrl_wbforw_valid           or    or1200_cpu_or1200_ctrl_wb_rfaddrw   )
        if (  or1200_cpu_or1200_ctrl_sel_imm  )
            or1200_cpu_or1200_ctrl_sel_b   =2'd1;
        else
            if ((  or1200_cpu_or1200_ctrl_id_insn  [15:11]==  or1200_cpu_or1200_ctrl_rf_addrw  )&&  or1200_cpu_or1200_ctrl_rfwb_op  [0])
                or1200_cpu_or1200_ctrl_sel_b   =2'd2;
            else
                if ((  or1200_cpu_or1200_ctrl_id_insn  [15:11]==  or1200_cpu_or1200_ctrl_wb_rfaddrw  )&&  or1200_cpu_or1200_ctrl_wbforw_valid  )
                    or1200_cpu_or1200_ctrl_sel_b   =2'd3;
                else
                    or1200_cpu_or1200_ctrl_sel_b   =2'd0;

    always @(   or1200_cpu_or1200_ctrl_id_insn   )
    begin
        case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
            6 'b001001,6'b101101:
                or1200_cpu_or1200_ctrl_multicycle   =3'd1;
            default :
            begin
                or1200_cpu_or1200_ctrl_multicycle   =3'd0;
            end
        endcase
    end

    always @(   or1200_cpu_or1200_ctrl_id_insn   )
    begin
        case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
            6 'b111000:
                or1200_cpu_or1200_ctrl_wait_on   =(1'b0|(  or1200_cpu_or1200_ctrl_id_insn  [4:0]==5'b0_1001)|(  or1200_cpu_or1200_ctrl_id_insn  [4:0]==5'b0_1010)|(  or1200_cpu_or1200_ctrl_id_insn  [4:0]==5'b0_0110)|(  or1200_cpu_or1200_ctrl_id_insn  [4:0]==5'b0_1011)) ? 2'd1:2'd0;
            6 'b101100:
                or1200_cpu_or1200_ctrl_wait_on   =2'd1;
            6 'b110000:
            begin
                or1200_cpu_or1200_ctrl_wait_on   =2'd3;
            end
            default :
            begin
                or1200_cpu_or1200_ctrl_wait_on   =2'd0;
            end
        endcase
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_rf_addrw   <=5'd0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  )
                or1200_cpu_or1200_ctrl_rf_addrw   <=5'd00;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
                    6 'b000001,6'b010010:
                        or1200_cpu_or1200_ctrl_rf_addrw   <=5'd09;
                    default :
                        or1200_cpu_or1200_ctrl_rf_addrw   <=  or1200_cpu_or1200_ctrl_id_insn  [25:21];
                endcase
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_wb_rfaddrw   <=5'd0;
        else
            if (!  or1200_cpu_or1200_ctrl_wb_freeze  )
                or1200_cpu_or1200_ctrl_wb_rfaddrw   <=  or1200_cpu_or1200_ctrl_rf_addrw  ;
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_id_insn   <={6'b000101,26'h041_0000};
        else
            if (  or1200_cpu_or1200_ctrl_id_flushpipe  )
                or1200_cpu_or1200_ctrl_id_insn   <={6'b000101,26'h041_0000};
            else
                if (!  or1200_cpu_or1200_ctrl_id_freeze  )
                begin
                    or1200_cpu_or1200_ctrl_id_insn   <=  or1200_cpu_or1200_ctrl_if_insn  ;
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_ex_insn   <={6'b000101,26'h041_0000};
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_ex_insn   <={6'b000101,26'h041_0000};
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    or1200_cpu_or1200_ctrl_ex_insn   <=  or1200_cpu_or1200_ctrl_id_insn  ;
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_wb_insn   <={6'b000101,26'h041_0000};
        else
            if (!  or1200_cpu_or1200_ctrl_wb_freeze  )
            begin
                or1200_cpu_or1200_ctrl_wb_insn   <=  or1200_cpu_or1200_ctrl_ex_insn  ;
            end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
        else
            if (!  or1200_cpu_or1200_ctrl_id_freeze  )
            begin
                case (  or1200_cpu_or1200_ctrl_if_insn  [31:26])
                    6 'b010010:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b010001:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b001001:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b101101:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b110000:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b001000:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b110101:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b110110:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b110111:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b111000:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b111001:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    6 'b000101:
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b0;
                    default :
                    begin
                        or1200_cpu_or1200_ctrl_sel_imm   <=1'b1;
                    end
                endcase
            end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_except_illegal   <=1'b0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_except_illegal   <=1'b0;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
                        6 'b000000,6'b000001,6'b010010,6'b010001,6'b000011,6'b000100,6'b001001,6'b000110,6'b101101,6'b001000,6'b100001,6'b100010,6'b100011,6'b100100,6'b100101,6'b100110,6'b100111,6'b101000,6'b101001,6'b101010,6'b101011,6'b101100,6'b101111,6'b110000,6'b110101,6'b110110,6'b110111,6'b111001,6'b000101:
                            or1200_cpu_or1200_ctrl_except_illegal   <=1'b0;
                        6 'b111000:
                            or1200_cpu_or1200_ctrl_except_illegal   <=1'b0|((  or1200_cpu_or1200_ctrl_id_insn  [4:0]==5'b0_1000)&(  or1200_cpu_or1200_ctrl_id_insn  [9:6]==4'd3));
                        default :
                            or1200_cpu_or1200_ctrl_except_illegal   <=1'b1;
                    endcase
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0100;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0100;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
                        6 'b000110:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b1_0001;
                        6 'b100111:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0000;
                        6 'b101000:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0001;
                        6 'b101001:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0011;
                        6 'b101010:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0100;
                        6 'b101011:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0101;
                        6 'b101100:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0110;
                        6 'b101111:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b1_0000;
                        6 'b111000:
                            or1200_cpu_or1200_ctrl_alu_op   <={1'b0,  or1200_cpu_or1200_ctrl_id_insn  [3:0]};
                        6 'b111001:
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b1_0000;
                        default :
                        begin
                            or1200_cpu_or1200_ctrl_alu_op   <=5'b0_0100;
                        end
                    endcase
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_alu_op2   <=0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_alu_op2   <=0;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    or1200_cpu_or1200_ctrl_alu_op2   <=  or1200_cpu_or1200_ctrl_id_insn  [9:6];
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_ctrl_spr_read   <=1'b0;
            or1200_cpu_or1200_ctrl_spr_write   <=1'b0;
        end
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
            begin
                or1200_cpu_or1200_ctrl_spr_read   <=1'b0;
                or1200_cpu_or1200_ctrl_spr_write   <=1'b0;
            end
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
                        6 'b101101:
                        begin
                            or1200_cpu_or1200_ctrl_spr_read   <=1'b1;
                            or1200_cpu_or1200_ctrl_spr_write   <=1'b0;
                        end
                        6 'b110000:
                        begin
                            or1200_cpu_or1200_ctrl_spr_read   <=1'b0;
                            or1200_cpu_or1200_ctrl_spr_write   <=1'b1;
                        end
                        default :
                        begin
                            or1200_cpu_or1200_ctrl_spr_read   <=1'b0;
                            or1200_cpu_or1200_ctrl_spr_write   <=1'b0;
                        end
                    endcase
                end
    end

    assign   or1200_cpu_or1200_ctrl_id_mac_op  =3'b000;
    assign   or1200_cpu_or1200_ctrl_mac_op  =3'b000;
    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_rfwb_op   <=4'b0000;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_rfwb_op   <=4'b0000;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
                        6 'b000001:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b011,1'b1};
                        6 'b010010:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b011,1'b1};
                        6 'b000110:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b101101:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b010,1'b1};
                        6 'b100001:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b001,1'b1};
                        6 'b100010:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b001,1'b1};
                        6 'b100011:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b001,1'b1};
                        6 'b100100:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b001,1'b1};
                        6 'b100101:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b001,1'b1};
                        6 'b100110:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b001,1'b1};
                        6 'b100111:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b101000:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b101001:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b101010:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b101011:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b101100:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        6 'b111000:
                            or1200_cpu_or1200_ctrl_rfwb_op   <={3'b000,1'b1};
                        default :
                            or1200_cpu_or1200_ctrl_rfwb_op   <=4'b0000;
                    endcase
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd0;
        else
            if (  or1200_cpu_or1200_ctrl_id_flushpipe  )
                or1200_cpu_or1200_ctrl_id_branch_op   <=3'd0;
            else
                if (!  or1200_cpu_or1200_ctrl_id_freeze  )
                begin
                    case (  or1200_cpu_or1200_ctrl_if_insn  [31:26])
                        6 'b000000:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd1;
                        6 'b000001:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd1;
                        6 'b010010:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd2;
                        6 'b010001:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd2;
                        6 'b000011:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd5;
                        6 'b000100:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd4;
                        6 'b001001:
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd6;
                        default :
                            or1200_cpu_or1200_ctrl_id_branch_op   <=3'd0;
                    endcase
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_ex_branch_op   <=3'd0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_ex_branch_op   <=3'd0;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                    or1200_cpu_or1200_ctrl_ex_branch_op   <=  or1200_cpu_or1200_ctrl_id_branch_op  ;

    always @(   or1200_cpu_or1200_ctrl_id_insn   )
    begin
        case (  or1200_cpu_or1200_ctrl_id_insn  [31:26])
            6 'b100001:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0110;
            6 'b100010:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0111;
            6 'b100011:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0010;
            6 'b100100:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0011;
            6 'b100101:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0100;
            6 'b100110:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0101;
            6 'b110101:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b1110;
            6 'b110110:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b1010;
            6 'b110111:
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b1100;
            default :
                or1200_cpu_or1200_ctrl_id_lsu_op   =4'b0000;
        endcase
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_ctrl_comp_op   <=4'd0;
        end
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_comp_op   <=4'd0;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                    or1200_cpu_or1200_ctrl_comp_op   <=  or1200_cpu_or1200_ctrl_id_insn  [24:21];
    end

    assign   or1200_cpu_or1200_ctrl_fpu_op  ={8{1'b0}};
    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_sig_syscall   <=1'b0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_sig_syscall   <=1'b0;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    or1200_cpu_or1200_ctrl_sig_syscall   <=(  or1200_cpu_or1200_ctrl_id_insn  [31:23]=={6'b001000,3'b000});
                end
    end

    always @(  posedge    or1200_cpu_or1200_ctrl_clk          or  posedge   or1200_cpu_or1200_ctrl_rst  )
    begin
        if (  or1200_cpu_or1200_ctrl_rst  ==(1'b1))
            or1200_cpu_or1200_ctrl_sig_trap   <=1'b0;
        else
            if (!  or1200_cpu_or1200_ctrl_ex_freeze  &  or1200_cpu_or1200_ctrl_id_freeze  |  or1200_cpu_or1200_ctrl_ex_flushpipe  )
                or1200_cpu_or1200_ctrl_sig_trap   <=1'b0;
            else
                if (!  or1200_cpu_or1200_ctrl_ex_freeze  )
                begin
                    or1200_cpu_or1200_ctrl_sig_trap   <=(  or1200_cpu_or1200_ctrl_id_insn  [31:23]=={6'b001000,3'b010})|  or1200_cpu_or1200_ctrl_du_hwbkpt  ;
                end
    end

    assign   or1200_cpu_or1200_ctrl_dc_no_writethrough  =0;
    assign or1200_cpu_or1200_ctrl_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_ctrl_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_ctrl_except_flushpipe = or1200_cpu_except_flushpipe;
    assign or1200_cpu_or1200_ctrl_extend_flush = or1200_cpu_extend_flush;
    assign or1200_cpu_if_flushpipe = or1200_cpu_or1200_ctrl_if_flushpipe;
    assign or1200_cpu_id_flushpipe = or1200_cpu_or1200_ctrl_id_flushpipe;
    assign or1200_cpu_ex_flushpipe = or1200_cpu_or1200_ctrl_ex_flushpipe;
    assign or1200_cpu_wb_flushpipe = or1200_cpu_or1200_ctrl_wb_flushpipe;
    assign or1200_cpu_or1200_ctrl_id_freeze = or1200_cpu_id_freeze;
    assign or1200_cpu_or1200_ctrl_ex_freeze = or1200_cpu_ex_freeze;
    assign or1200_cpu_or1200_ctrl_wb_freeze = or1200_cpu_wb_freeze;
    assign or1200_cpu_or1200_ctrl_if_insn = or1200_cpu_if_insn;
    assign or1200_cpu_id_insn = or1200_cpu_or1200_ctrl_id_insn;
    assign or1200_cpu_ex_insn = or1200_cpu_or1200_ctrl_ex_insn;
    assign or1200_cpu_or1200_ctrl_abort_mvspr = or1200_cpu_abort_mvspr;
    assign or1200_cpu_pre_branch_op = or1200_cpu_or1200_ctrl_id_branch_op;
    assign or1200_cpu_branch_op = or1200_cpu_or1200_ctrl_ex_branch_op;
    assign or1200_cpu_or1200_ctrl_ex_branch_taken = or1200_cpu_ex_branch_taken;
    assign or1200_cpu_or1200_ctrl_pc_we = or1200_cpu_pc_we;
    assign or1200_cpu_rf_addra = or1200_cpu_or1200_ctrl_rf_addra;
    assign or1200_cpu_rf_addrb = or1200_cpu_or1200_ctrl_rf_addrb;
    assign or1200_cpu_rf_rda = or1200_cpu_or1200_ctrl_rf_rda;
    assign or1200_cpu_rf_rdb = or1200_cpu_or1200_ctrl_rf_rdb;
    assign or1200_cpu_alu_op = or1200_cpu_or1200_ctrl_alu_op;
    assign or1200_cpu_alu_op2 = or1200_cpu_or1200_ctrl_alu_op2;
    assign or1200_cpu_mac_op = or1200_cpu_or1200_ctrl_mac_op;
    assign or1200_cpu_comp_op = or1200_cpu_or1200_ctrl_comp_op;
    assign or1200_cpu_rf_addrw = or1200_cpu_or1200_ctrl_rf_addrw;
    assign or1200_cpu_rfwb_op = or1200_cpu_or1200_ctrl_rfwb_op;
    assign or1200_cpu_fpu_op = or1200_cpu_or1200_ctrl_fpu_op;
    assign or1200_cpu_wb_insn = or1200_cpu_or1200_ctrl_wb_insn;
    assign or1200_cpu_id_simm = or1200_cpu_or1200_ctrl_id_simm;
    assign or1200_cpu_ex_simm = or1200_cpu_or1200_ctrl_ex_simm;
    assign or1200_cpu_id_branch_addrtarget = or1200_cpu_or1200_ctrl_id_branch_addrtarget;
    assign or1200_cpu_ex_branch_addrtarget = or1200_cpu_or1200_ctrl_ex_branch_addrtarget;
    assign or1200_cpu_sel_a = or1200_cpu_or1200_ctrl_sel_a;
    assign or1200_cpu_sel_b = or1200_cpu_or1200_ctrl_sel_b;
    assign or1200_cpu_id_lsu_op = or1200_cpu_or1200_ctrl_id_lsu_op;
    assign or1200_cpu_cust5_op = or1200_cpu_or1200_ctrl_cust5_op;
    assign or1200_cpu_cust5_limm = or1200_cpu_or1200_ctrl_cust5_limm;
    assign or1200_cpu_or1200_ctrl_id_pc = or1200_cpu_id_pc;
    assign or1200_cpu_or1200_ctrl_ex_pc = or1200_cpu_ex_pc;
    assign or1200_cpu_or1200_ctrl_du_hwbkpt = or1200_cpu_du_hwbkpt;
    assign or1200_cpu_multicycle = or1200_cpu_or1200_ctrl_multicycle;
    assign or1200_cpu_wait_on = or1200_cpu_or1200_ctrl_wait_on;
    assign or1200_cpu_or1200_ctrl_wbforw_valid = or1200_cpu_wbforw_valid;
    assign or1200_cpu_sig_syscall = or1200_cpu_or1200_ctrl_sig_syscall;
    assign or1200_cpu_sig_trap = or1200_cpu_or1200_ctrl_sig_trap;
    assign or1200_cpu_force_dslot_fetch = or1200_cpu_or1200_ctrl_force_dslot_fetch;
    assign or1200_cpu_no_more_dslot = or1200_cpu_or1200_ctrl_no_more_dslot;
    assign or1200_cpu_id_void = or1200_cpu_or1200_ctrl_id_void;
    assign or1200_cpu_ex_void = or1200_cpu_or1200_ctrl_ex_void;
    assign or1200_cpu_ex_spr_read = or1200_cpu_or1200_ctrl_ex_spr_read;
    assign or1200_cpu_ex_spr_write = or1200_cpu_or1200_ctrl_ex_spr_write;
    assign or1200_cpu_or1200_ctrl_du_flush_pipe = or1200_cpu_du_flush_pipe;
    assign or1200_cpu_id_mac_op = or1200_cpu_or1200_ctrl_id_mac_op;
    assign or1200_cpu_id_macrc_op = or1200_cpu_or1200_ctrl_id_macrc_op;
    assign or1200_cpu_ex_macrc_op = or1200_cpu_or1200_ctrl_ex_macrc_op;
    assign or1200_cpu_rfe = or1200_cpu_or1200_ctrl_rfe;
    assign or1200_cpu_except_illegal = or1200_cpu_or1200_ctrl_except_illegal;
    assign or1200_cpu_dc_no_writethrough = or1200_cpu_or1200_ctrl_dc_no_writethrough;


    wire  or1200_cpu_or1200_rf_clk;
    wire  or1200_cpu_or1200_rf_rst;
    wire  or1200_cpu_or1200_rf_cy_we_i;
    wire  or1200_cpu_or1200_rf_cy_we_o;
    wire  or1200_cpu_or1200_rf_supv;
    wire  or1200_cpu_or1200_rf_wb_freeze;
    wire [ or1200_cpu_or1200_rf_aw -1:0] or1200_cpu_or1200_rf_addrw;
    wire [ or1200_cpu_or1200_rf_dw -1:0] or1200_cpu_or1200_rf_dataw;
    wire  or1200_cpu_or1200_rf_we;
    wire  or1200_cpu_or1200_rf_flushpipe;
    wire  or1200_cpu_or1200_rf_id_freeze;
    wire [ or1200_cpu_or1200_rf_aw -1:0] or1200_cpu_or1200_rf_addra;
    wire [ or1200_cpu_or1200_rf_aw -1:0] or1200_cpu_or1200_rf_addrb;
    wire [ or1200_cpu_or1200_rf_dw -1:0] or1200_cpu_or1200_rf_dataa;
    wire [ or1200_cpu_or1200_rf_dw -1:0] or1200_cpu_or1200_rf_datab;
    wire  or1200_cpu_or1200_rf_rda;
    wire  or1200_cpu_or1200_rf_rdb;
    wire  or1200_cpu_or1200_rf_spr_cs;
    wire  or1200_cpu_or1200_rf_spr_write;
    wire [31:0] or1200_cpu_or1200_rf_spr_addr;
    wire [31:0] or1200_cpu_or1200_rf_spr_dat_i;
    wire [31:0] or1200_cpu_or1200_rf_spr_dat_o;
    wire  or1200_cpu_or1200_rf_du_read;

    wire[  or1200_cpu_or1200_rf_dw  -1:0]  or1200_cpu_or1200_rf_from_rfa  ;
    wire[  or1200_cpu_or1200_rf_dw  -1:0]  or1200_cpu_or1200_rf_from_rfb  ;
    wire[  or1200_cpu_or1200_rf_aw  -1:0]  or1200_cpu_or1200_rf_rf_addra  ;
    wire[  or1200_cpu_or1200_rf_aw  -1:0]  or1200_cpu_or1200_rf_rf_addrw  ;
    wire[  or1200_cpu_or1200_rf_dw  -1:0]  or1200_cpu_or1200_rf_rf_dataw  ;
    wire  or1200_cpu_or1200_rf_rf_we  ;
    wire  or1200_cpu_or1200_rf_spr_valid  ;
    wire  or1200_cpu_or1200_rf_rf_ena  ;
    wire  or1200_cpu_or1200_rf_rf_enb  ;
    reg  or1200_cpu_or1200_rf_rf_we_allow  ;
    reg  or1200_cpu_or1200_rf_spr_du_cs  ;
    wire  or1200_cpu_or1200_rf_spr_cs_fe  ;
    reg[  or1200_cpu_or1200_rf_aw  -1:0]  or1200_cpu_or1200_rf_addra_last  ;
    always @( posedge   or1200_cpu_or1200_rf_clk  )
        if (  or1200_cpu_or1200_rf_rf_ena  &!(  or1200_cpu_or1200_rf_spr_cs_fe  |(  or1200_cpu_or1200_rf_du_read  &  or1200_cpu_or1200_rf_spr_cs  )))
            or1200_cpu_or1200_rf_addra_last   <=  or1200_cpu_or1200_rf_addra  ;

    always @( posedge   or1200_cpu_or1200_rf_clk  )
        or1200_cpu_or1200_rf_spr_du_cs   <=  or1200_cpu_or1200_rf_spr_cs  &  or1200_cpu_or1200_rf_du_read  ;

    assign   or1200_cpu_or1200_rf_spr_cs_fe  =  or1200_cpu_or1200_rf_spr_du_cs  &!(  or1200_cpu_or1200_rf_spr_cs  &  or1200_cpu_or1200_rf_du_read  );
    assign   or1200_cpu_or1200_rf_spr_valid  =  or1200_cpu_or1200_rf_spr_cs  &(  or1200_cpu_or1200_rf_spr_addr  [10:5]==6'd32);
    assign   or1200_cpu_or1200_rf_spr_dat_o  =  or1200_cpu_or1200_rf_from_rfa  ;
    assign   or1200_cpu_or1200_rf_dataa  =  or1200_cpu_or1200_rf_from_rfa  ;
    assign   or1200_cpu_or1200_rf_datab  =  or1200_cpu_or1200_rf_from_rfb  ;
    assign   or1200_cpu_or1200_rf_rf_addra  =(  or1200_cpu_or1200_rf_spr_valid  &!  or1200_cpu_or1200_rf_spr_write  ) ?   or1200_cpu_or1200_rf_spr_addr  [4:0]:  or1200_cpu_or1200_rf_spr_cs_fe   ?   or1200_cpu_or1200_rf_addra_last  :  or1200_cpu_or1200_rf_addra  ;
    assign   or1200_cpu_or1200_rf_rf_addrw  =(  or1200_cpu_or1200_rf_spr_valid  &  or1200_cpu_or1200_rf_spr_write  ) ?   or1200_cpu_or1200_rf_spr_addr  [4:0]:  or1200_cpu_or1200_rf_addrw  ;
    assign   or1200_cpu_or1200_rf_rf_dataw  =(  or1200_cpu_or1200_rf_spr_valid  &  or1200_cpu_or1200_rf_spr_write  ) ?   or1200_cpu_or1200_rf_spr_dat_i  :  or1200_cpu_or1200_rf_dataw  ;
    always @(  posedge    or1200_cpu_or1200_rf_rst          or  posedge   or1200_cpu_or1200_rf_clk  )
        if (  or1200_cpu_or1200_rf_rst  ==(1'b1))
            or1200_cpu_or1200_rf_rf_we_allow   <=1'b1;
        else
            if (~  or1200_cpu_or1200_rf_wb_freeze  )
                or1200_cpu_or1200_rf_rf_we_allow   <=~  or1200_cpu_or1200_rf_flushpipe  ;

    assign   or1200_cpu_or1200_rf_rf_we  =((  or1200_cpu_or1200_rf_spr_valid  &  or1200_cpu_or1200_rf_spr_write  )|(  or1200_cpu_or1200_rf_we  &~  or1200_cpu_or1200_rf_wb_freeze  ))&  or1200_cpu_or1200_rf_rf_we_allow  ;
    assign   or1200_cpu_or1200_rf_cy_we_o  =  or1200_cpu_or1200_rf_cy_we_i  &&~  or1200_cpu_or1200_rf_wb_freeze  &&  or1200_cpu_or1200_rf_rf_we_allow  ;
    assign   or1200_cpu_or1200_rf_rf_ena  =(  or1200_cpu_or1200_rf_rda  &~  or1200_cpu_or1200_rf_id_freeze  )|(  or1200_cpu_or1200_rf_spr_valid  &!  or1200_cpu_or1200_rf_spr_write  )|  or1200_cpu_or1200_rf_spr_cs_fe  ;
    assign   or1200_cpu_or1200_rf_rf_enb  =  or1200_cpu_or1200_rf_rdb  &~  or1200_cpu_or1200_rf_id_freeze  ;

    wire  or1200_cpu_or1200_rf_rf_a_clk_a;
    wire  or1200_cpu_or1200_rf_rf_a_ce_a;
    wire [ or1200_cpu_or1200_rf_rf_a_aw -1:0] or1200_cpu_or1200_rf_rf_a_addr_a;
    wire [ or1200_cpu_or1200_rf_rf_a_dw -1:0] or1200_cpu_or1200_rf_rf_a_do_a;
    wire  or1200_cpu_or1200_rf_rf_a_clk_b;
    wire  or1200_cpu_or1200_rf_rf_a_ce_b;
    wire  or1200_cpu_or1200_rf_rf_a_we_b;
    wire [ or1200_cpu_or1200_rf_rf_a_aw -1:0] or1200_cpu_or1200_rf_rf_a_addr_b;
    wire [ or1200_cpu_or1200_rf_rf_a_dw -1:0] or1200_cpu_or1200_rf_rf_a_di_b;
    wire  or1200_cpu_or1200_rf_rf_b_clk_a;
    wire  or1200_cpu_or1200_rf_rf_b_ce_a;
    wire [ or1200_cpu_or1200_rf_rf_b_aw -1:0] or1200_cpu_or1200_rf_rf_b_addr_a;
    wire [ or1200_cpu_or1200_rf_rf_b_dw -1:0] or1200_cpu_or1200_rf_rf_b_do_a;
    wire  or1200_cpu_or1200_rf_rf_b_clk_b;
    wire  or1200_cpu_or1200_rf_rf_b_ce_b;
    wire  or1200_cpu_or1200_rf_rf_b_we_b;
    wire [ or1200_cpu_or1200_rf_rf_b_aw -1:0] or1200_cpu_or1200_rf_rf_b_addr_b;
    wire [ or1200_cpu_or1200_rf_rf_b_dw -1:0] or1200_cpu_or1200_rf_rf_b_di_b;

    reg[  or1200_cpu_or1200_rf_rf_a_dw  -1:0]  or1200_cpu_or1200_rf_rf_a_mem  [(1<<  or1200_cpu_or1200_rf_rf_a_aw  )-1:0];
    reg[  or1200_cpu_or1200_rf_rf_a_aw  -1:0]  or1200_cpu_or1200_rf_rf_a_addr_a_reg  ;
    function[31:0]  or1200_cpu_or1200_rf_rf_a_get_gpr  ;
        input[  or1200_cpu_or1200_rf_rf_a_aw  -1:0]  or1200_cpu_or1200_rf_rf_a_gpr_no  ;
        or1200_cpu_or1200_rf_rf_a_get_gpr   =  or1200_cpu_or1200_rf_rf_a_mem  [  or1200_cpu_or1200_rf_rf_a_gpr_no  ];
    endfunction
    function[31:0]  or1200_cpu_or1200_rf_rf_a_set_gpr  ;
        input[  or1200_cpu_or1200_rf_rf_a_aw  -1:0]  or1200_cpu_or1200_rf_rf_a_gpr_no  ;
        input[  or1200_cpu_or1200_rf_rf_a_dw  -1:0]  or1200_cpu_or1200_rf_rf_a_value  ;
        begin
            or1200_cpu_or1200_rf_rf_a_mem   [  or1200_cpu_or1200_rf_rf_a_gpr_no  ]=  or1200_cpu_or1200_rf_rf_a_value  ;
            or1200_cpu_or1200_rf_rf_a_set_gpr   =0;
        end
    endfunction
    assign   or1200_cpu_or1200_rf_rf_a_do_a  =  or1200_cpu_or1200_rf_rf_a_mem  [  or1200_cpu_or1200_rf_rf_a_addr_a_reg  ];
    always @( posedge   or1200_cpu_or1200_rf_rf_a_clk_a  )
        if (  or1200_cpu_or1200_rf_rf_a_ce_a  )
            or1200_cpu_or1200_rf_rf_a_addr_a_reg   <=  or1200_cpu_or1200_rf_rf_a_addr_a  ;

    always @( posedge   or1200_cpu_or1200_rf_rf_a_clk_b  )
        if (  or1200_cpu_or1200_rf_rf_a_ce_b  &  or1200_cpu_or1200_rf_rf_a_we_b  )
            or1200_cpu_or1200_rf_rf_a_mem   [  or1200_cpu_or1200_rf_rf_a_addr_b  ]<=  or1200_cpu_or1200_rf_rf_a_di_b  ;




    reg[  or1200_cpu_or1200_rf_rf_b_dw  -1:0]  or1200_cpu_or1200_rf_rf_b_mem  [(1<<  or1200_cpu_or1200_rf_rf_b_aw  )-1:0];
    reg[  or1200_cpu_or1200_rf_rf_b_aw  -1:0]  or1200_cpu_or1200_rf_rf_b_addr_a_reg  ;
    function[31:0]  or1200_cpu_or1200_rf_rf_b_get_gpr  ;
        input[  or1200_cpu_or1200_rf_rf_b_aw  -1:0]  or1200_cpu_or1200_rf_rf_b_gpr_no  ;
        or1200_cpu_or1200_rf_rf_b_get_gpr   =  or1200_cpu_or1200_rf_rf_b_mem  [  or1200_cpu_or1200_rf_rf_b_gpr_no  ];
    endfunction
    function[31:0]  or1200_cpu_or1200_rf_rf_b_set_gpr  ;
        input[  or1200_cpu_or1200_rf_rf_b_aw  -1:0]  or1200_cpu_or1200_rf_rf_b_gpr_no  ;
        input[  or1200_cpu_or1200_rf_rf_b_dw  -1:0]  or1200_cpu_or1200_rf_rf_b_value  ;
        begin
            or1200_cpu_or1200_rf_rf_b_mem   [  or1200_cpu_or1200_rf_rf_b_gpr_no  ]=  or1200_cpu_or1200_rf_rf_b_value  ;
            or1200_cpu_or1200_rf_rf_b_set_gpr   =0;
        end
    endfunction
    assign   or1200_cpu_or1200_rf_rf_b_do_a  =  or1200_cpu_or1200_rf_rf_b_mem  [  or1200_cpu_or1200_rf_rf_b_addr_a_reg  ];
    always @( posedge   or1200_cpu_or1200_rf_rf_b_clk_a  )
        if (  or1200_cpu_or1200_rf_rf_b_ce_a  )
            or1200_cpu_or1200_rf_rf_b_addr_a_reg   <=  or1200_cpu_or1200_rf_rf_b_addr_a  ;

    always @( posedge   or1200_cpu_or1200_rf_rf_b_clk_b  )
        if (  or1200_cpu_or1200_rf_rf_b_ce_b  &  or1200_cpu_or1200_rf_rf_b_we_b  )
            or1200_cpu_or1200_rf_rf_b_mem   [  or1200_cpu_or1200_rf_rf_b_addr_b  ]<=  or1200_cpu_or1200_rf_rf_b_di_b  ;

    assign or1200_cpu_or1200_rf_rf_a_clk_a = or1200_cpu_or1200_rf_clk;
    assign or1200_cpu_or1200_rf_rf_a_ce_a = or1200_cpu_or1200_rf_rf_ena;
    assign or1200_cpu_or1200_rf_rf_a_addr_a = or1200_cpu_or1200_rf_rf_addra;
    assign or1200_cpu_or1200_rf_from_rfa = or1200_cpu_or1200_rf_rf_a_do_a;
    assign or1200_cpu_or1200_rf_rf_a_clk_b = or1200_cpu_or1200_rf_clk;
    assign or1200_cpu_or1200_rf_rf_a_ce_b = or1200_cpu_or1200_rf_rf_we;
    assign or1200_cpu_or1200_rf_rf_a_we_b = or1200_cpu_or1200_rf_rf_we;
    assign or1200_cpu_or1200_rf_rf_a_addr_b = or1200_cpu_or1200_rf_rf_addrw;
    assign or1200_cpu_or1200_rf_rf_a_di_b = or1200_cpu_or1200_rf_rf_dataw;
    assign or1200_cpu_or1200_rf_rf_b_clk_a = or1200_cpu_or1200_rf_clk;
    assign or1200_cpu_or1200_rf_rf_b_ce_a = or1200_cpu_or1200_rf_rf_enb;
    assign or1200_cpu_or1200_rf_rf_b_addr_a = or1200_cpu_or1200_rf_addrb;
    assign or1200_cpu_or1200_rf_from_rfb = or1200_cpu_or1200_rf_rf_b_do_a;
    assign or1200_cpu_or1200_rf_rf_b_clk_b = or1200_cpu_or1200_rf_clk;
    assign or1200_cpu_or1200_rf_rf_b_ce_b = or1200_cpu_or1200_rf_rf_we;
    assign or1200_cpu_or1200_rf_rf_b_we_b = or1200_cpu_or1200_rf_rf_we;
    assign or1200_cpu_or1200_rf_rf_b_addr_b = or1200_cpu_or1200_rf_rf_addrw;
    assign or1200_cpu_or1200_rf_rf_b_di_b = or1200_cpu_or1200_rf_rf_dataw;

    assign or1200_cpu_or1200_rf_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_rf_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_rf_cy_we_i = or1200_cpu_cy_we_alu;
    assign or1200_cpu_cy_we_rf = or1200_cpu_or1200_rf_cy_we_o;
    assign or1200_cpu_or1200_rf_supv = or1200_cpu_sr[0];
    assign or1200_cpu_or1200_rf_wb_freeze = or1200_cpu_wb_freeze;
    assign or1200_cpu_or1200_rf_addrw = or1200_cpu_rf_addrw;
    assign or1200_cpu_or1200_rf_dataw = or1200_cpu_rf_dataw;
    assign or1200_cpu_or1200_rf_we = or1200_cpu_rfwb_op[0];
    assign or1200_cpu_or1200_rf_flushpipe = or1200_cpu_wb_flushpipe;
    assign or1200_cpu_or1200_rf_id_freeze = or1200_cpu_id_freeze;
    assign or1200_cpu_or1200_rf_addra = or1200_cpu_rf_addra;
    assign or1200_cpu_or1200_rf_addrb = or1200_cpu_rf_addrb;
    assign or1200_cpu_rf_dataa = or1200_cpu_or1200_rf_dataa;
    assign or1200_cpu_rf_datab = or1200_cpu_or1200_rf_datab;
    assign or1200_cpu_or1200_rf_rda = or1200_cpu_rf_rda;
    assign or1200_cpu_or1200_rf_rdb = or1200_cpu_rf_rdb;
    assign or1200_cpu_or1200_rf_spr_cs = or1200_cpu_spr_cs[5'd00];
    assign or1200_cpu_or1200_rf_spr_write = or1200_cpu_spr_we;
    assign or1200_cpu_or1200_rf_spr_addr = or1200_cpu_spr_addr;
    assign or1200_cpu_or1200_rf_spr_dat_i = or1200_cpu_spr_dat_cpu;
    assign or1200_cpu_spr_dat_rf = or1200_cpu_or1200_rf_spr_dat_o;
    assign or1200_cpu_or1200_rf_du_read = or1200_cpu_du_read;


    wire  or1200_cpu_or1200_operandmuxes_clk;
    wire  or1200_cpu_or1200_operandmuxes_rst;
    wire  or1200_cpu_or1200_operandmuxes_id_freeze;
    wire  or1200_cpu_or1200_operandmuxes_ex_freeze;
    wire [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_rf_dataa;
    wire [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_rf_datab;
    wire [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_ex_forw;
    wire [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_wb_forw;
    wire [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_simm;
    wire [2-1:0] or1200_cpu_or1200_operandmuxes_sel_a;
    wire [2-1:0] or1200_cpu_or1200_operandmuxes_sel_b;
    reg [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_operand_a;
    reg [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_operand_b;
    reg [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_muxed_a;
    reg [ or1200_cpu_or1200_operandmuxes_width -1:0] or1200_cpu_or1200_operandmuxes_muxed_b;

    reg  or1200_cpu_or1200_operandmuxes_saved_a  ;
    reg  or1200_cpu_or1200_operandmuxes_saved_b  ;
    always @(  posedge    or1200_cpu_or1200_operandmuxes_clk          or  posedge   or1200_cpu_or1200_operandmuxes_rst  )
    begin
        if (  or1200_cpu_or1200_operandmuxes_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_operandmuxes_operand_a   <=32'd0;
            or1200_cpu_or1200_operandmuxes_saved_a   <=1'b0;
        end
        else
            if (!  or1200_cpu_or1200_operandmuxes_ex_freeze  &&  or1200_cpu_or1200_operandmuxes_id_freeze  &&!  or1200_cpu_or1200_operandmuxes_saved_a  )
            begin
                or1200_cpu_or1200_operandmuxes_operand_a   <=  or1200_cpu_or1200_operandmuxes_muxed_a  ;
                or1200_cpu_or1200_operandmuxes_saved_a   <=1'b1;
            end
            else
                if (!  or1200_cpu_or1200_operandmuxes_ex_freeze  &&!  or1200_cpu_or1200_operandmuxes_saved_a  )
                begin
                    or1200_cpu_or1200_operandmuxes_operand_a   <=  or1200_cpu_or1200_operandmuxes_muxed_a  ;
                end
                else
                    if (!  or1200_cpu_or1200_operandmuxes_ex_freeze  &&!  or1200_cpu_or1200_operandmuxes_id_freeze  )
                        or1200_cpu_or1200_operandmuxes_saved_a   <=1'b0;
    end

    always @(  posedge    or1200_cpu_or1200_operandmuxes_clk          or  posedge   or1200_cpu_or1200_operandmuxes_rst  )
    begin
        if (  or1200_cpu_or1200_operandmuxes_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_operandmuxes_operand_b   <=32'd0;
            or1200_cpu_or1200_operandmuxes_saved_b   <=1'b0;
        end
        else
            if (!  or1200_cpu_or1200_operandmuxes_ex_freeze  &&  or1200_cpu_or1200_operandmuxes_id_freeze  &&!  or1200_cpu_or1200_operandmuxes_saved_b  )
            begin
                or1200_cpu_or1200_operandmuxes_operand_b   <=  or1200_cpu_or1200_operandmuxes_muxed_b  ;
                or1200_cpu_or1200_operandmuxes_saved_b   <=1'b1;
            end
            else
                if (!  or1200_cpu_or1200_operandmuxes_ex_freeze  &&!  or1200_cpu_or1200_operandmuxes_saved_b  )
                begin
                    or1200_cpu_or1200_operandmuxes_operand_b   <=  or1200_cpu_or1200_operandmuxes_muxed_b  ;
                end
                else
                    if (!  or1200_cpu_or1200_operandmuxes_ex_freeze  &&!  or1200_cpu_or1200_operandmuxes_id_freeze  )
                        or1200_cpu_or1200_operandmuxes_saved_b   <=1'b0;
    end

    always @(      or1200_cpu_or1200_operandmuxes_ex_forw                or    or1200_cpu_or1200_operandmuxes_wb_forw            or    or1200_cpu_or1200_operandmuxes_rf_dataa           or    or1200_cpu_or1200_operandmuxes_sel_a   )
    begin
        casez (  or1200_cpu_or1200_operandmuxes_sel_a  )
            2 'd2:
                or1200_cpu_or1200_operandmuxes_muxed_a   =  or1200_cpu_or1200_operandmuxes_ex_forw  ;
            2 'd3:
                or1200_cpu_or1200_operandmuxes_muxed_a   =  or1200_cpu_or1200_operandmuxes_wb_forw  ;
            default :
                or1200_cpu_or1200_operandmuxes_muxed_a   =  or1200_cpu_or1200_operandmuxes_rf_dataa  ;
        endcase
    end

    always @(       or1200_cpu_or1200_operandmuxes_simm                  or    or1200_cpu_or1200_operandmuxes_ex_forw             or    or1200_cpu_or1200_operandmuxes_wb_forw            or    or1200_cpu_or1200_operandmuxes_rf_datab           or    or1200_cpu_or1200_operandmuxes_sel_b   )
    begin
        casez (  or1200_cpu_or1200_operandmuxes_sel_b  )
            2 'd1:
                or1200_cpu_or1200_operandmuxes_muxed_b   =  or1200_cpu_or1200_operandmuxes_simm  ;
            2 'd2:
                or1200_cpu_or1200_operandmuxes_muxed_b   =  or1200_cpu_or1200_operandmuxes_ex_forw  ;
            2 'd3:
                or1200_cpu_or1200_operandmuxes_muxed_b   =  or1200_cpu_or1200_operandmuxes_wb_forw  ;
            default :
                or1200_cpu_or1200_operandmuxes_muxed_b   =  or1200_cpu_or1200_operandmuxes_rf_datab  ;
        endcase
    end

    assign or1200_cpu_or1200_operandmuxes_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_operandmuxes_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_operandmuxes_id_freeze = or1200_cpu_id_freeze;
    assign or1200_cpu_or1200_operandmuxes_ex_freeze = or1200_cpu_ex_freeze;
    assign or1200_cpu_or1200_operandmuxes_rf_dataa = or1200_cpu_rf_dataa;
    assign or1200_cpu_or1200_operandmuxes_rf_datab = or1200_cpu_rf_datab;
    assign or1200_cpu_or1200_operandmuxes_ex_forw = or1200_cpu_rf_dataw;
    assign or1200_cpu_or1200_operandmuxes_wb_forw = or1200_cpu_wb_forw;
    assign or1200_cpu_or1200_operandmuxes_simm = or1200_cpu_id_simm;
    assign or1200_cpu_or1200_operandmuxes_sel_a = or1200_cpu_sel_a;
    assign or1200_cpu_or1200_operandmuxes_sel_b = or1200_cpu_sel_b;
    assign or1200_cpu_operand_a = or1200_cpu_or1200_operandmuxes_operand_a;
    assign or1200_cpu_operand_b = or1200_cpu_or1200_operandmuxes_operand_b;
    assign or1200_cpu_muxed_a = or1200_cpu_or1200_operandmuxes_muxed_a;
    assign or1200_cpu_muxed_b = or1200_cpu_or1200_operandmuxes_muxed_b;


    wire [32-1:0] or1200_cpu_or1200_alu_a;
    wire [32-1:0] or1200_cpu_or1200_alu_b;
    wire [32-1:0] or1200_cpu_or1200_alu_mult_mac_result;
    wire  or1200_cpu_or1200_alu_macrc_op;
    wire [5-1:0] or1200_cpu_or1200_alu_alu_op;
    wire [4-1:0] or1200_cpu_or1200_alu_alu_op2;
    wire [4-1:0] or1200_cpu_or1200_alu_comp_op;
    wire [4:0] or1200_cpu_or1200_alu_cust5_op;
    wire [5:0] or1200_cpu_or1200_alu_cust5_limm;
    reg [32-1:0] or1200_cpu_or1200_alu_result;
    reg  or1200_cpu_or1200_alu_flagforw;
    reg  or1200_cpu_or1200_alu_flag_we;
    reg  or1200_cpu_or1200_alu_ovforw;
    reg  or1200_cpu_or1200_alu_ov_we;
    reg  or1200_cpu_or1200_alu_cyforw;
    reg  or1200_cpu_or1200_alu_cy_we;
    wire  or1200_cpu_or1200_alu_carry;
    wire  or1200_cpu_or1200_alu_flag;

    reg[32-1:0]  or1200_cpu_or1200_alu_shifted_rotated  ;
    reg[32-1:0]  or1200_cpu_or1200_alu_extended  ;
    reg  or1200_cpu_or1200_alu_flagcomp  ;
    wire[32-1:0]  or1200_cpu_or1200_alu_comp_a  ;
    wire[32-1:0]  or1200_cpu_or1200_alu_comp_b  ;
    wire  or1200_cpu_or1200_alu_a_eq_b  ;
    wire  or1200_cpu_or1200_alu_a_lt_b  ;
    wire[32-1:0]  or1200_cpu_or1200_alu_result_sum  ;
    wire[32-1:0]  or1200_cpu_or1200_alu_result_and  ;
    wire  or1200_cpu_or1200_alu_cy_sum  ;
    wire  or1200_cpu_or1200_alu_cy_sub  ;
    wire  or1200_cpu_or1200_alu_ov_sum  ;
    wire[32-1:0]  or1200_cpu_or1200_alu_carry_in  ;
    wire[32-1:0]  or1200_cpu_or1200_alu_b_mux  ;
    assign   or1200_cpu_or1200_alu_comp_a  ={  or1200_cpu_or1200_alu_a  [32-1]^  or1200_cpu_or1200_alu_comp_op  [3],  or1200_cpu_or1200_alu_a  [32-2:0]};
    assign   or1200_cpu_or1200_alu_comp_b  ={  or1200_cpu_or1200_alu_b  [32-1]^  or1200_cpu_or1200_alu_comp_op  [3],  or1200_cpu_or1200_alu_b  [32-2:0]};
    assign   or1200_cpu_or1200_alu_a_eq_b  =!(|  or1200_cpu_or1200_alu_result_sum  );
    assign   or1200_cpu_or1200_alu_a_lt_b  =  or1200_cpu_or1200_alu_comp_op  [3] ? ((  or1200_cpu_or1200_alu_a  [32-1]&!  or1200_cpu_or1200_alu_b  [32-1])|(!  or1200_cpu_or1200_alu_a  [32-1]&!  or1200_cpu_or1200_alu_b  [32-1]&  or1200_cpu_or1200_alu_result_sum  [32-1])|(  or1200_cpu_or1200_alu_a  [32-1]&  or1200_cpu_or1200_alu_b  [32-1]&  or1200_cpu_or1200_alu_result_sum  [32-1])):(  or1200_cpu_or1200_alu_a  <  or1200_cpu_or1200_alu_b  );
    assign   or1200_cpu_or1200_alu_cy_sub  =  or1200_cpu_or1200_alu_a_lt_b  ;
    assign   or1200_cpu_or1200_alu_carry_in  =(  or1200_cpu_or1200_alu_alu_op  ==5'b0_0001) ? {{32-1{1'b0}},  or1200_cpu_or1200_alu_carry  }:{32{1'b0}};
    assign   or1200_cpu_or1200_alu_b_mux  =((  or1200_cpu_or1200_alu_alu_op  ==5'b0_0010)|(  or1200_cpu_or1200_alu_alu_op  ==5'b1_0000)) ? (~  or1200_cpu_or1200_alu_b  )+1:  or1200_cpu_or1200_alu_b  ;
    assign {  or1200_cpu_or1200_alu_cy_sum  ,  or1200_cpu_or1200_alu_result_sum  }=(  or1200_cpu_or1200_alu_a  +  or1200_cpu_or1200_alu_b_mux  )+  or1200_cpu_or1200_alu_carry_in  ;
    assign   or1200_cpu_or1200_alu_ov_sum  =((!  or1200_cpu_or1200_alu_a  [32-1]&!  or1200_cpu_or1200_alu_b_mux  [32-1])&  or1200_cpu_or1200_alu_result_sum  [32-1])|((!  or1200_cpu_or1200_alu_a  [32-1]&  or1200_cpu_or1200_alu_b_mux  [32-1])&  or1200_cpu_or1200_alu_result_sum  [32-1]&  or1200_cpu_or1200_alu_alu_op  ==5'b0_0010)|((  or1200_cpu_or1200_alu_a  [32-1]&  or1200_cpu_or1200_alu_b_mux  [32-1])&!  or1200_cpu_or1200_alu_result_sum  [32-1]);
    assign   or1200_cpu_or1200_alu_result_and  =  or1200_cpu_or1200_alu_a  &  or1200_cpu_or1200_alu_b  ;
    always @(              or1200_cpu_or1200_alu_alu_op                                or    or1200_cpu_or1200_alu_alu_op2                    or    or1200_cpu_or1200_alu_a                   or    or1200_cpu_or1200_alu_b                  or    or1200_cpu_or1200_alu_result_sum                 or    or1200_cpu_or1200_alu_result_and                or    or1200_cpu_or1200_alu_macrc_op               or    or1200_cpu_or1200_alu_shifted_rotated              or    or1200_cpu_or1200_alu_mult_mac_result             or    or1200_cpu_or1200_alu_flag            or    or1200_cpu_or1200_alu_carry           or    or1200_cpu_or1200_alu_extended   )
    begin
        casez (  or1200_cpu_or1200_alu_alu_op  )
            5 'b0_1111:
            begin
                casez (  or1200_cpu_or1200_alu_alu_op2  )
                    0 :
                    begin
                        or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_a  [0] ? 1:  or1200_cpu_or1200_alu_a  [1] ? 2:  or1200_cpu_or1200_alu_a  [2] ? 3:  or1200_cpu_or1200_alu_a  [3] ? 4:  or1200_cpu_or1200_alu_a  [4] ? 5:  or1200_cpu_or1200_alu_a  [5] ? 6:  or1200_cpu_or1200_alu_a  [6] ? 7:  or1200_cpu_or1200_alu_a  [7] ? 8:  or1200_cpu_or1200_alu_a  [8] ? 9:  or1200_cpu_or1200_alu_a  [9] ? 10:  or1200_cpu_or1200_alu_a  [10] ? 11:  or1200_cpu_or1200_alu_a  [11] ? 12:  or1200_cpu_or1200_alu_a  [12] ? 13:  or1200_cpu_or1200_alu_a  [13] ? 14:  or1200_cpu_or1200_alu_a  [14] ? 15:  or1200_cpu_or1200_alu_a  [15] ? 16:  or1200_cpu_or1200_alu_a  [16] ? 17:  or1200_cpu_or1200_alu_a  [17] ? 18:  or1200_cpu_or1200_alu_a  [18] ? 19:  or1200_cpu_or1200_alu_a  [19] ? 20:  or1200_cpu_or1200_alu_a  [20] ? 21:  or1200_cpu_or1200_alu_a  [21] ? 22:  or1200_cpu_or1200_alu_a  [22] ? 23:  or1200_cpu_or1200_alu_a  [23] ? 24:  or1200_cpu_or1200_alu_a  [24] ? 25:  or1200_cpu_or1200_alu_a  [25] ? 26:  or1200_cpu_or1200_alu_a  [26] ? 27:  or1200_cpu_or1200_alu_a  [27] ? 28:  or1200_cpu_or1200_alu_a  [28] ? 29:  or1200_cpu_or1200_alu_a  [29] ? 30:  or1200_cpu_or1200_alu_a  [30] ? 31:  or1200_cpu_or1200_alu_a  [31] ? 32:0;
                    end
                    default :
                    begin
                        or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_a  [31] ? 32:  or1200_cpu_or1200_alu_a  [30] ? 31:  or1200_cpu_or1200_alu_a  [29] ? 30:  or1200_cpu_or1200_alu_a  [28] ? 29:  or1200_cpu_or1200_alu_a  [27] ? 28:  or1200_cpu_or1200_alu_a  [26] ? 27:  or1200_cpu_or1200_alu_a  [25] ? 26:  or1200_cpu_or1200_alu_a  [24] ? 25:  or1200_cpu_or1200_alu_a  [23] ? 24:  or1200_cpu_or1200_alu_a  [22] ? 23:  or1200_cpu_or1200_alu_a  [21] ? 22:  or1200_cpu_or1200_alu_a  [20] ? 21:  or1200_cpu_or1200_alu_a  [19] ? 20:  or1200_cpu_or1200_alu_a  [18] ? 19:  or1200_cpu_or1200_alu_a  [17] ? 18:  or1200_cpu_or1200_alu_a  [16] ? 17:  or1200_cpu_or1200_alu_a  [15] ? 16:  or1200_cpu_or1200_alu_a  [14] ? 15:  or1200_cpu_or1200_alu_a  [13] ? 14:  or1200_cpu_or1200_alu_a  [12] ? 13:  or1200_cpu_or1200_alu_a  [11] ? 12:  or1200_cpu_or1200_alu_a  [10] ? 11:  or1200_cpu_or1200_alu_a  [9] ? 10:  or1200_cpu_or1200_alu_a  [8] ? 9:  or1200_cpu_or1200_alu_a  [7] ? 8:  or1200_cpu_or1200_alu_a  [6] ? 7:  or1200_cpu_or1200_alu_a  [5] ? 6:  or1200_cpu_or1200_alu_a  [4] ? 5:  or1200_cpu_or1200_alu_a  [3] ? 4:  or1200_cpu_or1200_alu_a  [2] ? 3:  or1200_cpu_or1200_alu_a  [1] ? 2:  or1200_cpu_or1200_alu_a  [0] ? 1:0;
                    end
                endcase
            end
            5 'b0_1000:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_shifted_rotated  ;
            end
            5 'b0_0001,5'b0_0010,5'b0_0000:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_result_sum  ;
            end
            5 'b0_0101:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_a  ^  or1200_cpu_or1200_alu_b  ;
            end
            5 'b0_0100:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_a  |  or1200_cpu_or1200_alu_b  ;
            end
            5 'b0_1100:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_extended  ;
            end
            5 'b0_1101:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_a  ;
            end
            5 'b1_0001:
            begin
                if (  or1200_cpu_or1200_alu_macrc_op  )
                begin
                    or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_mult_mac_result  ;
                end
                else
                begin
                    or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_b  <<16;
                end
            end
            5 'b0_1001,5'b0_1010,5'b0_0110,5'b0_1011:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_mult_mac_result  ;
            end
            5 'b0_1110:
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_flag   ?   or1200_cpu_or1200_alu_a  :  or1200_cpu_or1200_alu_b  ;
            end
            default :
            begin
                or1200_cpu_or1200_alu_result   =  or1200_cpu_or1200_alu_result_and  ;
            end
        endcase
    end

    always @(      or1200_cpu_or1200_alu_alu_op                or    or1200_cpu_or1200_alu_result_sum            or    or1200_cpu_or1200_alu_result_and           or    or1200_cpu_or1200_alu_flagcomp   )
    begin
        casez (  or1200_cpu_or1200_alu_alu_op  )
            5 'b1_0000:
            begin
                or1200_cpu_or1200_alu_flagforw   =  or1200_cpu_or1200_alu_flagcomp  ;
                or1200_cpu_or1200_alu_flag_we   =1'b1;
            end
            default :
            begin
                or1200_cpu_or1200_alu_flagforw   =  or1200_cpu_or1200_alu_flagcomp  ;
                or1200_cpu_or1200_alu_flag_we   =1'b0;
            end
        endcase
    end

    always @(     or1200_cpu_or1200_alu_alu_op              or    or1200_cpu_or1200_alu_cy_sum           or    or1200_cpu_or1200_alu_cy_sub   )
    begin
        casez (  or1200_cpu_or1200_alu_alu_op  )
            5 'b0_0001,5'b0_0000:
            begin
                or1200_cpu_or1200_alu_cyforw   =  or1200_cpu_or1200_alu_cy_sum  ;
                or1200_cpu_or1200_alu_cy_we   =1'b1;
            end
            5 'b0_0010:
            begin
                or1200_cpu_or1200_alu_cyforw   =  or1200_cpu_or1200_alu_cy_sub  ;
                or1200_cpu_or1200_alu_cy_we   =1'b1;
            end
            default :
            begin
                or1200_cpu_or1200_alu_cyforw   =1'b0;
                or1200_cpu_or1200_alu_cy_we   =1'b0;
            end
        endcase
    end

    always @(    or1200_cpu_or1200_alu_alu_op            or    or1200_cpu_or1200_alu_ov_sum   )
    begin
        casez (  or1200_cpu_or1200_alu_alu_op  )
            5 'b0_0001,5'b0_0010,5'b0_0000:
            begin
                or1200_cpu_or1200_alu_ovforw   =  or1200_cpu_or1200_alu_ov_sum  ;
                or1200_cpu_or1200_alu_ov_we   =1'b1;
            end
            default :
            begin
                or1200_cpu_or1200_alu_ovforw   =1'b0;
                or1200_cpu_or1200_alu_ov_we   =1'b0;
            end
        endcase
    end

    always @(     or1200_cpu_or1200_alu_alu_op2              or    or1200_cpu_or1200_alu_a           or    or1200_cpu_or1200_alu_b   )
    begin
        case (  or1200_cpu_or1200_alu_alu_op2  )
            4 'd0:
                or1200_cpu_or1200_alu_shifted_rotated   =(  or1200_cpu_or1200_alu_a  <<  or1200_cpu_or1200_alu_b  [4:0]);
            4 'd1:
                or1200_cpu_or1200_alu_shifted_rotated   =(  or1200_cpu_or1200_alu_a  >>  or1200_cpu_or1200_alu_b  [4:0]);
            default :
                or1200_cpu_or1200_alu_shifted_rotated   =({32{  or1200_cpu_or1200_alu_a  [31]}}<<(6'd32-{1'b0,  or1200_cpu_or1200_alu_b  [4:0]}))|  or1200_cpu_or1200_alu_a  >>  or1200_cpu_or1200_alu_b  [4:0];
        endcase
    end

    always @(     or1200_cpu_or1200_alu_comp_op              or    or1200_cpu_or1200_alu_a_eq_b           or    or1200_cpu_or1200_alu_a_lt_b   )
    begin
        case (  or1200_cpu_or1200_alu_comp_op  [2:0])
            3 'b000:
                or1200_cpu_or1200_alu_flagcomp   =  or1200_cpu_or1200_alu_a_eq_b  ;
            3 'b001:
                or1200_cpu_or1200_alu_flagcomp   =~  or1200_cpu_or1200_alu_a_eq_b  ;
            3 'b010:
                or1200_cpu_or1200_alu_flagcomp   =~(  or1200_cpu_or1200_alu_a_eq_b  |  or1200_cpu_or1200_alu_a_lt_b  );
            3 'b011:
                or1200_cpu_or1200_alu_flagcomp   =~  or1200_cpu_or1200_alu_a_lt_b  ;
            3 'b100:
                or1200_cpu_or1200_alu_flagcomp   =  or1200_cpu_or1200_alu_a_lt_b  ;
            3 'b101:
                or1200_cpu_or1200_alu_flagcomp   =  or1200_cpu_or1200_alu_a_eq_b  |  or1200_cpu_or1200_alu_a_lt_b  ;
            default :
                or1200_cpu_or1200_alu_flagcomp   =1'b0;
        endcase
    end

    always @(     or1200_cpu_or1200_alu_alu_op              or    or1200_cpu_or1200_alu_alu_op2           or    or1200_cpu_or1200_alu_a   )
    begin
        casez (  or1200_cpu_or1200_alu_alu_op2  )
            4 'h0:
                or1200_cpu_or1200_alu_extended   ={{16{  or1200_cpu_or1200_alu_a  [15]}},  or1200_cpu_or1200_alu_a  [15:0]};
            4 'h1:
                or1200_cpu_or1200_alu_extended   ={{24{  or1200_cpu_or1200_alu_a  [7]}},  or1200_cpu_or1200_alu_a  [7:0]};
            4 'h2:
                or1200_cpu_or1200_alu_extended   ={16'd0,  or1200_cpu_or1200_alu_a  [15:0]};
            4 'h3:
                or1200_cpu_or1200_alu_extended   ={24'd0,  or1200_cpu_or1200_alu_a  [7:0]};
            default :
                or1200_cpu_or1200_alu_extended   =  or1200_cpu_or1200_alu_a  ;
        endcase
    end

    assign or1200_cpu_or1200_alu_a = or1200_cpu_operand_a;
    assign or1200_cpu_or1200_alu_b = or1200_cpu_operand_b;
    assign or1200_cpu_or1200_alu_mult_mac_result = or1200_cpu_mult_mac_result;
    assign or1200_cpu_or1200_alu_macrc_op = or1200_cpu_ex_macrc_op;
    assign or1200_cpu_or1200_alu_alu_op = or1200_cpu_alu_op;
    assign or1200_cpu_or1200_alu_alu_op2 = or1200_cpu_alu_op2;
    assign or1200_cpu_or1200_alu_comp_op = or1200_cpu_comp_op;
    assign or1200_cpu_or1200_alu_cust5_op = or1200_cpu_cust5_op;
    assign or1200_cpu_or1200_alu_cust5_limm = or1200_cpu_cust5_limm;
    assign or1200_cpu_alu_dataout = or1200_cpu_or1200_alu_result;
    assign or1200_cpu_flagforw_alu = or1200_cpu_or1200_alu_flagforw;
    assign or1200_cpu_flag_we_alu = or1200_cpu_or1200_alu_flag_we;
    assign or1200_cpu_ovforw = or1200_cpu_or1200_alu_ovforw;
    assign or1200_cpu_ov_we_alu = or1200_cpu_or1200_alu_ov_we;
    assign or1200_cpu_cyforw = or1200_cpu_or1200_alu_cyforw;
    assign or1200_cpu_cy_we_alu = or1200_cpu_or1200_alu_cy_we;
    assign or1200_cpu_or1200_alu_carry = or1200_cpu_carry;
    assign or1200_cpu_or1200_alu_flag = or1200_cpu_flag;

    assign   or1200_cpu_fpu_except_started  =  or1200_cpu_except_started  &&(  or1200_cpu_except_type  ==4'hd);

    wire  or1200_cpu_or1200_fpu_clk;
    wire  or1200_cpu_or1200_fpu_rst;
    wire  or1200_cpu_or1200_fpu_ex_freeze;
    wire [ or1200_cpu_or1200_fpu_width -1:0] or1200_cpu_or1200_fpu_a;
    wire [ or1200_cpu_or1200_fpu_width -1:0] or1200_cpu_or1200_fpu_b;
    wire [8-1:0] or1200_cpu_or1200_fpu_fpu_op;
    wire [ or1200_cpu_or1200_fpu_width -1:0] or1200_cpu_or1200_fpu_result;
    wire  or1200_cpu_or1200_fpu_done;
    wire  or1200_cpu_or1200_fpu_flagforw;
    wire  or1200_cpu_or1200_fpu_flag_we;
    wire  or1200_cpu_or1200_fpu_sig_fp;
    wire  or1200_cpu_or1200_fpu_except_started;
    wire  or1200_cpu_or1200_fpu_fpcsr_we;
    wire [12-1:0] or1200_cpu_or1200_fpu_fpcsr;
    wire  or1200_cpu_or1200_fpu_spr_cs;
    wire  or1200_cpu_or1200_fpu_spr_write;
    wire [31:0] or1200_cpu_or1200_fpu_spr_addr;
    wire [31:0] or1200_cpu_or1200_fpu_spr_dat_i;
    wire [31:0] or1200_cpu_or1200_fpu_spr_dat_o;

    assign   or1200_cpu_or1200_fpu_result  =0;
    assign   or1200_cpu_or1200_fpu_flagforw  =0;
    assign   or1200_cpu_or1200_fpu_flag_we  =0;
    assign   or1200_cpu_or1200_fpu_sig_fp  =0;
    assign   or1200_cpu_or1200_fpu_spr_dat_o  =0;
    assign   or1200_cpu_or1200_fpu_fpcsr  =0;
    assign   or1200_cpu_or1200_fpu_done  =1;
    assign or1200_cpu_or1200_fpu_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_fpu_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_fpu_ex_freeze = or1200_cpu_ex_freeze;
    assign or1200_cpu_or1200_fpu_a = or1200_cpu_operand_a;
    assign or1200_cpu_or1200_fpu_b = or1200_cpu_operand_b;
    assign or1200_cpu_or1200_fpu_fpu_op = or1200_cpu_fpu_op;
    assign or1200_cpu_fpu_dataout = or1200_cpu_or1200_fpu_result;
    assign or1200_cpu_fpu_done = or1200_cpu_or1200_fpu_done;
    assign or1200_cpu_flagforw_fpu = or1200_cpu_or1200_fpu_flagforw;
    assign or1200_cpu_flag_we_fpu = or1200_cpu_or1200_fpu_flag_we;
    assign or1200_cpu_sig_fp = or1200_cpu_or1200_fpu_sig_fp;
    assign or1200_cpu_or1200_fpu_except_started = or1200_cpu_fpu_except_started;
    assign or1200_cpu_or1200_fpu_fpcsr_we = or1200_cpu_fpcsr_we;
    assign or1200_cpu_fpcsr = or1200_cpu_or1200_fpu_fpcsr;
    assign or1200_cpu_or1200_fpu_spr_cs = or1200_cpu_spr_cs[5'd11];
    assign or1200_cpu_or1200_fpu_spr_write = or1200_cpu_spr_we;
    assign or1200_cpu_or1200_fpu_spr_addr = or1200_cpu_spr_addr;
    assign or1200_cpu_or1200_fpu_spr_dat_i = or1200_cpu_spr_dat_cpu;
    assign or1200_cpu_spr_dat_fpu = or1200_cpu_or1200_fpu_spr_dat_o;


    wire  or1200_cpu_or1200_mult_mac_clk;
    wire  or1200_cpu_or1200_mult_mac_rst;
    wire  or1200_cpu_or1200_mult_mac_ex_freeze;
    wire  or1200_cpu_or1200_mult_mac_id_macrc_op;
    wire  or1200_cpu_or1200_mult_mac_macrc_op;
    wire [ or1200_cpu_or1200_mult_mac_width -1:0] or1200_cpu_or1200_mult_mac_a;
    wire [ or1200_cpu_or1200_mult_mac_width -1:0] or1200_cpu_or1200_mult_mac_b;
    wire [3-1:0] or1200_cpu_or1200_mult_mac_mac_op;
    wire [5-1:0] or1200_cpu_or1200_mult_mac_alu_op;
    reg [ or1200_cpu_or1200_mult_mac_width -1:0] or1200_cpu_or1200_mult_mac_result;
    wire  or1200_cpu_or1200_mult_mac_mult_mac_stall;
    reg  or1200_cpu_or1200_mult_mac_ovforw;
    reg  or1200_cpu_or1200_mult_mac_ov_we;
    wire  or1200_cpu_or1200_mult_mac_spr_cs;
    wire  or1200_cpu_or1200_mult_mac_spr_write;
    wire [31:0] or1200_cpu_or1200_mult_mac_spr_addr;
    wire [31:0] or1200_cpu_or1200_mult_mac_spr_dat_i;
    wire [31:0] or1200_cpu_or1200_mult_mac_spr_dat_o;

    reg  or1200_cpu_or1200_mult_mac_ex_freeze_r  ;
    wire  or1200_cpu_or1200_mult_mac_alu_op_mul  ;
    wire  or1200_cpu_or1200_mult_mac_alu_op_smul  ;
    reg[2*  or1200_cpu_or1200_mult_mac_width  -1:0]  or1200_cpu_or1200_mult_mac_mul_prod_r  ;
    wire  or1200_cpu_or1200_mult_mac_alu_op_umul  ;
    wire[2*  or1200_cpu_or1200_mult_mac_width  -1:0]  or1200_cpu_or1200_mult_mac_mul_prod  ;
    wire  or1200_cpu_or1200_mult_mac_mul_stall  ;
    reg[1:0]  or1200_cpu_or1200_mult_mac_mul_stall_count  ;
    wire[3-1:0]  or1200_cpu_or1200_mult_mac_mac_op_r1  ;
    wire[3-1:0]  or1200_cpu_or1200_mult_mac_mac_op_r2  ;
    wire[3-1:0]  or1200_cpu_or1200_mult_mac_mac_op_r3  ;
    wire  or1200_cpu_or1200_mult_mac_mac_stall_r  ;
    wire[63:0]  or1200_cpu_or1200_mult_mac_mac_r  ;
    wire[  or1200_cpu_or1200_mult_mac_width  -1:0]  or1200_cpu_or1200_mult_mac_x  ;
    wire[  or1200_cpu_or1200_mult_mac_width  -1:0]  or1200_cpu_or1200_mult_mac_y  ;
    wire  or1200_cpu_or1200_mult_mac_spr_maclo_we  ;
    wire  or1200_cpu_or1200_mult_mac_spr_machi_we  ;
    wire  or1200_cpu_or1200_mult_mac_alu_op_div  ;
    wire  or1200_cpu_or1200_mult_mac_alu_op_udiv  ;
    wire  or1200_cpu_or1200_mult_mac_alu_op_sdiv  ;
    reg  or1200_cpu_or1200_mult_mac_div_free  ;
    wire  or1200_cpu_or1200_mult_mac_div_stall  ;
    reg[2*  or1200_cpu_or1200_mult_mac_width  -1:0]  or1200_cpu_or1200_mult_mac_div_quot_r  ;
    wire[  or1200_cpu_or1200_mult_mac_width  -1:0]  or1200_cpu_or1200_mult_mac_div_tmp  ;
    reg[5:0]  or1200_cpu_or1200_mult_mac_div_cntr  ;
    wire  or1200_cpu_or1200_mult_mac_div_by_zero  ;
    assign   or1200_cpu_or1200_mult_mac_alu_op_smul  =(  or1200_cpu_or1200_mult_mac_alu_op  ==5'b0_0110);
    assign   or1200_cpu_or1200_mult_mac_alu_op_umul  =(  or1200_cpu_or1200_mult_mac_alu_op  ==5'b0_1011);
    assign   or1200_cpu_or1200_mult_mac_alu_op_mul  =  or1200_cpu_or1200_mult_mac_alu_op_smul  |  or1200_cpu_or1200_mult_mac_alu_op_umul  ;
    assign   or1200_cpu_or1200_mult_mac_spr_maclo_we  =1'b0;
    assign   or1200_cpu_or1200_mult_mac_spr_machi_we  =1'b0;
    assign   or1200_cpu_or1200_mult_mac_spr_dat_o  =32'h0000_0000;
    assign   or1200_cpu_or1200_mult_mac_alu_op_sdiv  =(  or1200_cpu_or1200_mult_mac_alu_op  ==5'b0_1001);
    assign   or1200_cpu_or1200_mult_mac_alu_op_udiv  =(  or1200_cpu_or1200_mult_mac_alu_op  ==5'b0_1010);
    assign   or1200_cpu_or1200_mult_mac_alu_op_div  =  or1200_cpu_or1200_mult_mac_alu_op_sdiv  |  or1200_cpu_or1200_mult_mac_alu_op_udiv  ;
    assign   or1200_cpu_or1200_mult_mac_x  =(  or1200_cpu_or1200_mult_mac_alu_op_sdiv  |  or1200_cpu_or1200_mult_mac_alu_op_smul  )&  or1200_cpu_or1200_mult_mac_a  [31] ? ~  or1200_cpu_or1200_mult_mac_a  +32'b1:  or1200_cpu_or1200_mult_mac_alu_op_div  |  or1200_cpu_or1200_mult_mac_alu_op_mul  |(|  or1200_cpu_or1200_mult_mac_mac_op  ) ?   or1200_cpu_or1200_mult_mac_a  :32'd0;
    assign   or1200_cpu_or1200_mult_mac_y  =(  or1200_cpu_or1200_mult_mac_alu_op_sdiv  |  or1200_cpu_or1200_mult_mac_alu_op_smul  )&  or1200_cpu_or1200_mult_mac_b  [31] ? ~  or1200_cpu_or1200_mult_mac_b  +32'b1:  or1200_cpu_or1200_mult_mac_alu_op_div  |  or1200_cpu_or1200_mult_mac_alu_op_mul  |(|  or1200_cpu_or1200_mult_mac_mac_op  ) ?   or1200_cpu_or1200_mult_mac_b  :32'd0;
    assign   or1200_cpu_or1200_mult_mac_div_by_zero  =!(|  or1200_cpu_or1200_mult_mac_b  )&  or1200_cpu_or1200_mult_mac_alu_op_div  ;
    always @(  posedge    or1200_cpu_or1200_mult_mac_clk          or  posedge   or1200_cpu_or1200_mult_mac_rst  )
        if (  or1200_cpu_or1200_mult_mac_rst  ==(1'b1))
            or1200_cpu_or1200_mult_mac_ex_freeze_r   <=1'b1;
        else
            or1200_cpu_or1200_mult_mac_ex_freeze_r   <=  or1200_cpu_or1200_mult_mac_ex_freeze  ;

    always @*
    casez (  or1200_cpu_or1200_mult_mac_alu_op  )
        5 'b0_1001:
        begin
            or1200_cpu_or1200_mult_mac_result   =  or1200_cpu_or1200_mult_mac_a  [31]^  or1200_cpu_or1200_mult_mac_b  [31] ? ~  or1200_cpu_or1200_mult_mac_div_quot_r  [31:0]+32'd1:  or1200_cpu_or1200_mult_mac_div_quot_r  [31:0];
        end
        5 'b0_1010:
        begin
            or1200_cpu_or1200_mult_mac_result   =  or1200_cpu_or1200_mult_mac_div_quot_r  [31:0];
        end
        5 'b0_0110:
        begin
            or1200_cpu_or1200_mult_mac_result   =  or1200_cpu_or1200_mult_mac_a  [31]^  or1200_cpu_or1200_mult_mac_b  [31] ? ~  or1200_cpu_or1200_mult_mac_mul_prod_r  [31:0]+32'd1:  or1200_cpu_or1200_mult_mac_mul_prod_r  [31:0];
        end
        5 'b0_1011:
        begin
            or1200_cpu_or1200_mult_mac_result   =  or1200_cpu_or1200_mult_mac_mul_prod_r  [31:0];
        end
        default :
            or1200_cpu_or1200_mult_mac_result   ={  or1200_cpu_or1200_mult_mac_width  {1'b0}};
    endcase

    always @*
    casez (  or1200_cpu_or1200_mult_mac_alu_op  )
        5 'b0_0110:
        begin
            or1200_cpu_or1200_mult_mac_ovforw   =(  or1200_cpu_or1200_mult_mac_mul_prod_r  [  or1200_cpu_or1200_mult_mac_width  -1]&&!((  or1200_cpu_or1200_mult_mac_a  [  or1200_cpu_or1200_mult_mac_width  -1]^  or1200_cpu_or1200_mult_mac_b  [  or1200_cpu_or1200_mult_mac_width  -1])&&~|  or1200_cpu_or1200_mult_mac_mul_prod_r  [  or1200_cpu_or1200_mult_mac_width  -2:0]))|||  or1200_cpu_or1200_mult_mac_mul_prod_r  [2*  or1200_cpu_or1200_mult_mac_width  -1:32];
            or1200_cpu_or1200_mult_mac_ov_we   =1;
        end
        5 'b0_1011:
        begin
            or1200_cpu_or1200_mult_mac_ovforw   =|  or1200_cpu_or1200_mult_mac_mul_prod_r  [2*  or1200_cpu_or1200_mult_mac_width  -1:32];
            or1200_cpu_or1200_mult_mac_ov_we   =1;
        end
        5 'b0_1010,5'b0_1001:
        begin
            or1200_cpu_or1200_mult_mac_ovforw   =  or1200_cpu_or1200_mult_mac_div_by_zero  ||(  or1200_cpu_or1200_mult_mac_a  ==32'h8000_0000&&  or1200_cpu_or1200_mult_mac_b  ==32'hffff_ffff);
            or1200_cpu_or1200_mult_mac_ov_we   =1;
        end
        default :
        begin
            or1200_cpu_or1200_mult_mac_ovforw   =0;
            or1200_cpu_or1200_mult_mac_ov_we   =0;
        end
    endcase


    wire [32-1:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X;
    wire [32-1:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y;
    wire  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK;
    wire  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST;
    wire [64-1:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P;

    reg[32-1:0]  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved  ;
    reg[32-1:0]  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved  ;
    reg[64-1:0]  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1  ;
    integer  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi  ;
    integer  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi  ;
    always @(   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved   )
        or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi   =  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved  ;

    always @(   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved   )
        or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi   =  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved  ;

    always @(  posedge    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK          or  posedge   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST  )
        if (  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST  ==(1'b1))
        begin
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved   <=32'b0;
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved   <=32'b0;
        end
        else
        begin
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved   <=  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X  ;
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved   <=  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y  ;
        end

    always @(  posedge    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK          or  posedge   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST  )
        if (  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST  ==(1'b1))
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1   <=64'b0;
        else
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1   <=  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi  *  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi  ;

    assign   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P  =  or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1  ;
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X = or1200_cpu_or1200_mult_mac_x;
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y = or1200_cpu_or1200_mult_mac_y;
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK = or1200_cpu_or1200_mult_mac_clk;
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = or1200_cpu_or1200_mult_mac_rst;
    assign or1200_cpu_or1200_mult_mac_mul_prod = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P;

    always @(  posedge    or1200_cpu_or1200_mult_mac_rst          or  posedge   or1200_cpu_or1200_mult_mac_clk  )
        if (  or1200_cpu_or1200_mult_mac_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_mult_mac_mul_prod_r   <=64'h0000_0000_0000_0000;
        end
        else
        begin
            or1200_cpu_or1200_mult_mac_mul_prod_r   <=  or1200_cpu_or1200_mult_mac_mul_prod  [63:0];
        end

    always @(  posedge    or1200_cpu_or1200_mult_mac_rst          or  posedge   or1200_cpu_or1200_mult_mac_clk  )
        if (  or1200_cpu_or1200_mult_mac_rst  ==(1'b1))
            or1200_cpu_or1200_mult_mac_mul_stall_count   <=0;
        else
            if (!(|  or1200_cpu_or1200_mult_mac_mul_stall_count  ))
                or1200_cpu_or1200_mult_mac_mul_stall_count   <={  or1200_cpu_or1200_mult_mac_mul_stall_count  [0],  or1200_cpu_or1200_mult_mac_alu_op_mul  &!  or1200_cpu_or1200_mult_mac_ex_freeze_r  };
            else
                or1200_cpu_or1200_mult_mac_mul_stall_count   <={  or1200_cpu_or1200_mult_mac_mul_stall_count  [0],1'b0};

    assign   or1200_cpu_or1200_mult_mac_mul_stall  =(|  or1200_cpu_or1200_mult_mac_mul_stall_count  )|(!(|  or1200_cpu_or1200_mult_mac_mul_stall_count  )&  or1200_cpu_or1200_mult_mac_alu_op_mul  &!  or1200_cpu_or1200_mult_mac_ex_freeze_r  );
    assign   or1200_cpu_or1200_mult_mac_mac_stall_r  =1'b0;
    assign   or1200_cpu_or1200_mult_mac_mac_r  ={2*  or1200_cpu_or1200_mult_mac_width  {1'b0}};
    assign   or1200_cpu_or1200_mult_mac_mac_op_r1  =3'b0;
    assign   or1200_cpu_or1200_mult_mac_mac_op_r2  =3'b0;
    assign   or1200_cpu_or1200_mult_mac_mac_op_r3  =3'b0;
    assign   or1200_cpu_or1200_mult_mac_div_tmp  =  or1200_cpu_or1200_mult_mac_div_quot_r  [63:32]-  or1200_cpu_or1200_mult_mac_y  ;
    always @(  posedge    or1200_cpu_or1200_mult_mac_rst          or  posedge   or1200_cpu_or1200_mult_mac_clk  )
        if (  or1200_cpu_or1200_mult_mac_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_mult_mac_div_quot_r   <=64'h0000_0000_0000_0000;
            or1200_cpu_or1200_mult_mac_div_free   <=1'b1;
            or1200_cpu_or1200_mult_mac_div_cntr   <=6'b00_0000;
        end
        else
            if (  or1200_cpu_or1200_mult_mac_div_by_zero  )
            begin
                or1200_cpu_or1200_mult_mac_div_quot_r   <=64'h0000_0000_0000_0000;
                or1200_cpu_or1200_mult_mac_div_free   <=1'b1;
                or1200_cpu_or1200_mult_mac_div_cntr   <=6'b00_0000;
            end
            else
                if (|  or1200_cpu_or1200_mult_mac_div_cntr  )
                begin
                    if (  or1200_cpu_or1200_mult_mac_div_tmp  [31])
                        or1200_cpu_or1200_mult_mac_div_quot_r   <={  or1200_cpu_or1200_mult_mac_div_quot_r  [62:0],1'b0};
                    else
                        or1200_cpu_or1200_mult_mac_div_quot_r   <={  or1200_cpu_or1200_mult_mac_div_tmp  [30:0],  or1200_cpu_or1200_mult_mac_div_quot_r  [31:0],1'b1};
                    or1200_cpu_or1200_mult_mac_div_cntr   <=  or1200_cpu_or1200_mult_mac_div_cntr  -6'd1;
                end
                else
                    if (  or1200_cpu_or1200_mult_mac_alu_op_div  &&  or1200_cpu_or1200_mult_mac_div_free  )
                    begin
                        or1200_cpu_or1200_mult_mac_div_quot_r   <={31'b0,  or1200_cpu_or1200_mult_mac_x  [31:0],1'b0};
                        or1200_cpu_or1200_mult_mac_div_cntr   <=6'b10_0000;
                        or1200_cpu_or1200_mult_mac_div_free   <=1'b0;
                    end
                    else
                        if (  or1200_cpu_or1200_mult_mac_div_free  |!  or1200_cpu_or1200_mult_mac_ex_freeze  )
                        begin
                            or1200_cpu_or1200_mult_mac_div_free   <=1'b1;
                        end

    assign   or1200_cpu_or1200_mult_mac_div_stall  =(|  or1200_cpu_or1200_mult_mac_div_cntr  )|(!  or1200_cpu_or1200_mult_mac_ex_freeze_r  &  or1200_cpu_or1200_mult_mac_alu_op_div  );
    assign   or1200_cpu_or1200_mult_mac_mult_mac_stall  =  or1200_cpu_or1200_mult_mac_mac_stall_r  |  or1200_cpu_or1200_mult_mac_div_stall  |  or1200_cpu_or1200_mult_mac_mul_stall  ;
    assign or1200_cpu_or1200_mult_mac_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_mult_mac_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_mult_mac_ex_freeze = or1200_cpu_ex_freeze;
    assign or1200_cpu_or1200_mult_mac_id_macrc_op = or1200_cpu_id_macrc_op;
    assign or1200_cpu_or1200_mult_mac_macrc_op = or1200_cpu_ex_macrc_op;
    assign or1200_cpu_or1200_mult_mac_a = or1200_cpu_operand_a;
    assign or1200_cpu_or1200_mult_mac_b = or1200_cpu_operand_b;
    assign or1200_cpu_or1200_mult_mac_mac_op = or1200_cpu_mac_op;
    assign or1200_cpu_or1200_mult_mac_alu_op = or1200_cpu_alu_op;
    assign or1200_cpu_mult_mac_result = or1200_cpu_or1200_mult_mac_result;
    assign or1200_cpu_mult_mac_stall = or1200_cpu_or1200_mult_mac_mult_mac_stall;
    assign or1200_cpu_ovforw_mult_mac = or1200_cpu_or1200_mult_mac_ovforw;
    assign or1200_cpu_ov_we_mult_mac = or1200_cpu_or1200_mult_mac_ov_we;
    assign or1200_cpu_or1200_mult_mac_spr_cs = or1200_cpu_spr_cs[5'd05];
    assign or1200_cpu_or1200_mult_mac_spr_write = or1200_cpu_spr_we;
    assign or1200_cpu_or1200_mult_mac_spr_addr = or1200_cpu_spr_addr;
    assign or1200_cpu_or1200_mult_mac_spr_dat_i = or1200_cpu_spr_dat_cpu;
    assign or1200_cpu_spr_dat_mac = or1200_cpu_or1200_mult_mac_spr_dat_o;


    wire  or1200_cpu_or1200_sprs_clk;
    wire  or1200_cpu_or1200_sprs_rst;
    wire  or1200_cpu_or1200_sprs_flagforw;
    wire  or1200_cpu_or1200_sprs_flag_we;
    wire  or1200_cpu_or1200_sprs_flag;
    wire  or1200_cpu_or1200_sprs_cyforw;
    wire  or1200_cpu_or1200_sprs_cy_we;
    wire  or1200_cpu_or1200_sprs_carry;
    wire  or1200_cpu_or1200_sprs_ovforw;
    wire  or1200_cpu_or1200_sprs_ov_we;
    wire  or1200_cpu_or1200_sprs_dsx;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_addrbase;
    wire [15:0] or1200_cpu_or1200_sprs_addrofs;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_dat_i;
    wire [3-1:0] or1200_cpu_or1200_sprs_branch_op;
    wire  or1200_cpu_or1200_sprs_ex_spr_read;
    wire  or1200_cpu_or1200_sprs_ex_spr_write;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_epcr;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_eear;
    wire [17-1:0] or1200_cpu_or1200_sprs_esr;
    wire  or1200_cpu_or1200_sprs_except_started;
    reg [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_to_wbmux;
    wire  or1200_cpu_or1200_sprs_epcr_we;
    wire  or1200_cpu_or1200_sprs_eear_we;
    wire  or1200_cpu_or1200_sprs_esr_we;
    wire  or1200_cpu_or1200_sprs_pc_we;
    wire  or1200_cpu_or1200_sprs_sr_we;
    wire [17-1:0] or1200_cpu_or1200_sprs_to_sr;
    reg [17-1:0] or1200_cpu_or1200_sprs_sr;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_cfgr;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_rf;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_npc;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_ppc;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_mac;
    wire  or1200_cpu_or1200_sprs_boot_adr_sel_i;
    wire [12-1:0] or1200_cpu_or1200_sprs_fpcsr;
    wire  or1200_cpu_or1200_sprs_fpcsr_we;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_fpu;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_pic;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_tt;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_pm;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_dmmu;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_immu;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_du;
    wire [31:0] or1200_cpu_or1200_sprs_spr_addr;
    wire [31:0] or1200_cpu_or1200_sprs_spr_dat_o;
    wire [31:0] or1200_cpu_or1200_sprs_spr_cs;
    wire  or1200_cpu_or1200_sprs_spr_we;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_du_addr;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_du_dat_du;
    wire  or1200_cpu_or1200_sprs_du_read;
    wire  or1200_cpu_or1200_sprs_du_write;
    wire [ or1200_cpu_or1200_sprs_width -1:0] or1200_cpu_or1200_sprs_du_dat_cpu;

    reg[17-1:0]  or1200_cpu_or1200_sprs_sr_reg  ;
    reg  or1200_cpu_or1200_sprs_sr_reg_bit_eph  ;
    reg  or1200_cpu_or1200_sprs_sr_reg_bit_eph_select  ;
    wire  or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed  ;
    wire  or1200_cpu_or1200_sprs_cfgr_sel  ;
    wire  or1200_cpu_or1200_sprs_rf_sel  ;
    wire  or1200_cpu_or1200_sprs_npc_sel  ;
    wire  or1200_cpu_or1200_sprs_ppc_sel  ;
    wire  or1200_cpu_or1200_sprs_sr_sel  ;
    wire  or1200_cpu_or1200_sprs_epcr_sel  ;
    wire  or1200_cpu_or1200_sprs_eear_sel  ;
    wire  or1200_cpu_or1200_sprs_esr_sel  ;
    wire  or1200_cpu_or1200_sprs_fpcsr_sel  ;
    wire[31:0]  or1200_cpu_or1200_sprs_sys_data  ;
    wire  or1200_cpu_or1200_sprs_du_access  ;
    reg[31:0]  or1200_cpu_or1200_sprs_unqualified_cs  ;
    assign   or1200_cpu_or1200_sprs_du_access  =  or1200_cpu_or1200_sprs_du_read  |  or1200_cpu_or1200_sprs_du_write  ;
    assign   or1200_cpu_or1200_sprs_spr_addr  =  or1200_cpu_or1200_sprs_du_access   ?   or1200_cpu_or1200_sprs_du_addr  :(  or1200_cpu_or1200_sprs_addrbase  |{16'h0000,  or1200_cpu_or1200_sprs_addrofs  });
    assign   or1200_cpu_or1200_sprs_spr_dat_o  =  or1200_cpu_or1200_sprs_du_write   ?   or1200_cpu_or1200_sprs_du_dat_du  :  or1200_cpu_or1200_sprs_dat_i  ;
    assign   or1200_cpu_or1200_sprs_du_dat_cpu  =  or1200_cpu_or1200_sprs_du_read   ?   or1200_cpu_or1200_sprs_to_wbmux  :  or1200_cpu_or1200_sprs_du_write   ?   or1200_cpu_or1200_sprs_du_dat_du  :  or1200_cpu_or1200_sprs_dat_i  ;
    assign   or1200_cpu_or1200_sprs_spr_we  =  or1200_cpu_or1200_sprs_du_write  |(  or1200_cpu_or1200_sprs_ex_spr_write  &!  or1200_cpu_or1200_sprs_du_access  );
    assign   or1200_cpu_or1200_sprs_spr_cs  =  or1200_cpu_or1200_sprs_unqualified_cs  &{32{  or1200_cpu_or1200_sprs_du_read  |  or1200_cpu_or1200_sprs_du_write  |  or1200_cpu_or1200_sprs_ex_spr_read  |(  or1200_cpu_or1200_sprs_ex_spr_write  &  or1200_cpu_or1200_sprs_sr  [0])}};
    always @(   or1200_cpu_or1200_sprs_spr_addr   )
    case (  or1200_cpu_or1200_sprs_spr_addr  [15:11])
        5 'd00:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_00000001;
        5 'd01:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_00000010;
        5 'd02:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_00000100;
        5 'd03:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_00001000;
        5 'd04:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_00010000;
        5 'd05:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_00100000;
        5 'd06:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_01000000;
        5 'd07:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000000_10000000;
        5 'd08:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000001_00000000;
        5 'd09:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000010_00000000;
        5 'd10:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00000100_00000000;
        5 'd11:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00001000_00000000;
        5 'd12:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00010000_00000000;
        5 'd13:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_00100000_00000000;
        5 'd14:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_01000000_00000000;
        5 'd15:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000000_10000000_00000000;
        5 'd16:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000001_00000000_00000000;
        5 'd17:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000010_00000000_00000000;
        5 'd18:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00000100_00000000_00000000;
        5 'd19:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00001000_00000000_00000000;
        5 'd20:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00010000_00000000_00000000;
        5 'd21:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_00100000_00000000_00000000;
        5 'd22:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_01000000_00000000_00000000;
        5 'd23:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000000_10000000_00000000_00000000;
        5 'd24:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000001_00000000_00000000_00000000;
        5 'd25:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000010_00000000_00000000_00000000;
        5 'd26:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00000100_00000000_00000000_00000000;
        5 'd27:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00001000_00000000_00000000_00000000;
        5 'd28:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00010000_00000000_00000000_00000000;
        5 'd29:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b00100000_00000000_00000000_00000000;
        5 'd30:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b01000000_00000000_00000000_00000000;
        5 'd31:
            or1200_cpu_or1200_sprs_unqualified_cs   =32'b10000000_00000000_00000000_00000000;
    endcase

    assign   or1200_cpu_or1200_sprs_to_sr  [15:12]=(  or1200_cpu_or1200_sprs_except_started  ) ? {  or1200_cpu_or1200_sprs_sr  [15:14],  or1200_cpu_or1200_sprs_dsx  ,1'b0}:(  or1200_cpu_or1200_sprs_branch_op  ==3'd6) ?   or1200_cpu_or1200_sprs_esr  [15:12]:(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  ) ? {1'b1,  or1200_cpu_or1200_sprs_spr_dat_o  [15-1:12]}:  or1200_cpu_or1200_sprs_sr  [15:12];
    assign   or1200_cpu_or1200_sprs_to_sr  [16]=(  or1200_cpu_or1200_sprs_except_started  ) ? 1'b1:(  or1200_cpu_or1200_sprs_branch_op  ==3'd6) ?   or1200_cpu_or1200_sprs_esr  [16]:(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  ) ?   or1200_cpu_or1200_sprs_spr_dat_o  [16]:  or1200_cpu_or1200_sprs_sr  [16];
    assign   or1200_cpu_or1200_sprs_to_sr  [11]=(  or1200_cpu_or1200_sprs_except_started  ) ?   or1200_cpu_or1200_sprs_sr  [11]:(  or1200_cpu_or1200_sprs_branch_op  ==3'd6) ?   or1200_cpu_or1200_sprs_esr  [11]:  or1200_cpu_or1200_sprs_ov_we   ?   or1200_cpu_or1200_sprs_ovforw  :(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  ) ?   or1200_cpu_or1200_sprs_spr_dat_o  [11]:  or1200_cpu_or1200_sprs_sr  [11];
    assign   or1200_cpu_or1200_sprs_to_sr  [10]=(  or1200_cpu_or1200_sprs_except_started  ) ?   or1200_cpu_or1200_sprs_sr  [10]:(  or1200_cpu_or1200_sprs_branch_op  ==3'd6) ?   or1200_cpu_or1200_sprs_esr  [10]:  or1200_cpu_or1200_sprs_cy_we   ?   or1200_cpu_or1200_sprs_cyforw  :(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  ) ?   or1200_cpu_or1200_sprs_spr_dat_o  [10]:  or1200_cpu_or1200_sprs_sr  [10];
    assign   or1200_cpu_or1200_sprs_to_sr  [9]=(  or1200_cpu_or1200_sprs_except_started  ) ?   or1200_cpu_or1200_sprs_sr  [9]:(  or1200_cpu_or1200_sprs_branch_op  ==3'd6) ?   or1200_cpu_or1200_sprs_esr  [9]:  or1200_cpu_or1200_sprs_flag_we   ?   or1200_cpu_or1200_sprs_flagforw  :(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  ) ?   or1200_cpu_or1200_sprs_spr_dat_o  [9]:  or1200_cpu_or1200_sprs_sr  [9];
    assign   or1200_cpu_or1200_sprs_to_sr  [8:0]=(  or1200_cpu_or1200_sprs_except_started  ) ? {  or1200_cpu_or1200_sprs_sr  [8:7],2'b00,  or1200_cpu_or1200_sprs_sr  [4:3],3'b001}:(  or1200_cpu_or1200_sprs_branch_op  ==3'd6) ?   or1200_cpu_or1200_sprs_esr  [8:0]:(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  ) ?   or1200_cpu_or1200_sprs_spr_dat_o  [8:0]:  or1200_cpu_or1200_sprs_sr  [8:0];
    assign   or1200_cpu_or1200_sprs_cfgr_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:4]==7'd0));
    assign   or1200_cpu_or1200_sprs_rf_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:5]==6'd32));
    assign   or1200_cpu_or1200_sprs_npc_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd16));
    assign   or1200_cpu_or1200_sprs_ppc_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd18));
    assign   or1200_cpu_or1200_sprs_sr_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd17));
    assign   or1200_cpu_or1200_sprs_epcr_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd32));
    assign   or1200_cpu_or1200_sprs_eear_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd48));
    assign   or1200_cpu_or1200_sprs_esr_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd64));
    assign   or1200_cpu_or1200_sprs_fpcsr_sel  =(  or1200_cpu_or1200_sprs_spr_cs  [5'd00]&&(  or1200_cpu_or1200_sprs_spr_addr  [10:0]==11'd20));
    assign   or1200_cpu_or1200_sprs_sr_we  =(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_sr_sel  )|(  or1200_cpu_or1200_sprs_branch_op  ==3'd6)|  or1200_cpu_or1200_sprs_flag_we  |  or1200_cpu_or1200_sprs_cy_we  |  or1200_cpu_or1200_sprs_ov_we  ;
    assign   or1200_cpu_or1200_sprs_pc_we  =(  or1200_cpu_or1200_sprs_du_write  &&(  or1200_cpu_or1200_sprs_npc_sel  |  or1200_cpu_or1200_sprs_ppc_sel  ));
    assign   or1200_cpu_or1200_sprs_epcr_we  =(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_epcr_sel  );
    assign   or1200_cpu_or1200_sprs_eear_we  =(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_eear_sel  );
    assign   or1200_cpu_or1200_sprs_esr_we  =(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_esr_sel  );
    assign   or1200_cpu_or1200_sprs_fpcsr_we  =(  or1200_cpu_or1200_sprs_spr_we  &&  or1200_cpu_or1200_sprs_fpcsr_sel  );
    assign   or1200_cpu_or1200_sprs_sys_data  =(  or1200_cpu_or1200_sprs_spr_dat_cfgr  &{32{  or1200_cpu_or1200_sprs_cfgr_sel  }})|(  or1200_cpu_or1200_sprs_spr_dat_rf  &{32{  or1200_cpu_or1200_sprs_rf_sel  }})|(  or1200_cpu_or1200_sprs_spr_dat_npc  &{32{  or1200_cpu_or1200_sprs_npc_sel  }})|(  or1200_cpu_or1200_sprs_spr_dat_ppc  &{32{  or1200_cpu_or1200_sprs_ppc_sel  }})|({{32-17{1'b0}},  or1200_cpu_or1200_sprs_sr  }&{32{  or1200_cpu_or1200_sprs_sr_sel  }})|(  or1200_cpu_or1200_sprs_epcr  &{32{  or1200_cpu_or1200_sprs_epcr_sel  }})|(  or1200_cpu_or1200_sprs_eear  &{32{  or1200_cpu_or1200_sprs_eear_sel  }})|({{32-12{1'b0}},  or1200_cpu_or1200_sprs_fpcsr  }&{32{  or1200_cpu_or1200_sprs_fpcsr_sel  }})|({{32-17{1'b0}},  or1200_cpu_or1200_sprs_esr  }&{32{  or1200_cpu_or1200_sprs_esr_sel  }});
    assign   or1200_cpu_or1200_sprs_flag  =  or1200_cpu_or1200_sprs_sr  [9];
    assign   or1200_cpu_or1200_sprs_carry  =  or1200_cpu_or1200_sprs_sr  [10];
    always @(  posedge    or1200_cpu_or1200_sprs_clk          or  posedge   or1200_cpu_or1200_sprs_rst  )
        if (  or1200_cpu_or1200_sprs_rst  ==(1'b1))
            or1200_cpu_or1200_sprs_sr_reg   <={2'b01,1'b0,{17-4{1'b0}},1'b1};
        else
            if (  or1200_cpu_or1200_sprs_except_started  )
                or1200_cpu_or1200_sprs_sr_reg   <=  or1200_cpu_or1200_sprs_to_sr  [17-1:0];
            else
                if (  or1200_cpu_or1200_sprs_sr_we  )
                    or1200_cpu_or1200_sprs_sr_reg   <=  or1200_cpu_or1200_sprs_to_sr  [17-1:0];

    always @(  posedge    or1200_cpu_or1200_sprs_clk          or  posedge   or1200_cpu_or1200_sprs_rst  )
        if (  or1200_cpu_or1200_sprs_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_sprs_sr_reg_bit_eph   <=1'b0;
            or1200_cpu_or1200_sprs_sr_reg_bit_eph_select   <=1'b1;
        end
        else
            if (  or1200_cpu_or1200_sprs_sr_reg_bit_eph_select  )
            begin
                or1200_cpu_or1200_sprs_sr_reg_bit_eph   <=  or1200_cpu_or1200_sprs_boot_adr_sel_i  ;
                or1200_cpu_or1200_sprs_sr_reg_bit_eph_select   <=1'b0;
            end
            else
                if (  or1200_cpu_or1200_sprs_sr_we  )
                begin
                    or1200_cpu_or1200_sprs_sr_reg_bit_eph   <=  or1200_cpu_or1200_sprs_to_sr  [14];
                end

    assign   or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed  =(  or1200_cpu_or1200_sprs_sr_reg_bit_eph_select  ) ?   or1200_cpu_or1200_sprs_boot_adr_sel_i  :  or1200_cpu_or1200_sprs_sr_reg_bit_eph  ;
    always @(    or1200_cpu_or1200_sprs_sr_reg            or    or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed   )
        or1200_cpu_or1200_sprs_sr   ={  or1200_cpu_or1200_sprs_sr_reg  [17-1:17-2],  or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed  ,  or1200_cpu_or1200_sprs_sr_reg  [17-4:0]};

    always @(            or1200_cpu_or1200_sprs_spr_addr                            or    or1200_cpu_or1200_sprs_sys_data                  or    or1200_cpu_or1200_sprs_spr_dat_mac                 or    or1200_cpu_or1200_sprs_spr_dat_pic                or    or1200_cpu_or1200_sprs_spr_dat_pm               or    or1200_cpu_or1200_sprs_spr_dat_fpu              or    or1200_cpu_or1200_sprs_spr_dat_dmmu             or    or1200_cpu_or1200_sprs_spr_dat_immu            or    or1200_cpu_or1200_sprs_spr_dat_du           or    or1200_cpu_or1200_sprs_spr_dat_tt   )
    begin
        casez (  or1200_cpu_or1200_sprs_spr_addr  [15:11])
            5 'd00:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_sys_data  ;
            5 'd10:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_tt  ;
            5 'd09:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_pic  ;
            5 'd08:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_pm  ;
            5 'd01:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_dmmu  ;
            5 'd02:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_immu  ;
            5 'd05:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_mac  ;
            5 'd11:
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_fpu  ;
            default :
                or1200_cpu_or1200_sprs_to_wbmux   =  or1200_cpu_or1200_sprs_spr_dat_du  ;
        endcase
    end

    assign or1200_cpu_or1200_sprs_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_sprs_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_sprs_flagforw = or1200_cpu_flagforw;
    assign or1200_cpu_or1200_sprs_flag_we = or1200_cpu_flag_we;
    assign or1200_cpu_flag = or1200_cpu_or1200_sprs_flag;
    assign or1200_cpu_or1200_sprs_cyforw = or1200_cpu_cyforw;
    assign or1200_cpu_or1200_sprs_cy_we = or1200_cpu_cy_we_rf;
    assign or1200_cpu_carry = or1200_cpu_or1200_sprs_carry;
    assign or1200_cpu_or1200_sprs_ovforw = or1200_cpu_ovforw|or1200_cpu_ovforw_mult_mac;
    assign or1200_cpu_or1200_sprs_ov_we = or1200_cpu_ov_we_alu|or1200_cpu_ov_we_mult_mac;
    assign or1200_cpu_or1200_sprs_dsx = or1200_cpu_dsx;
    assign or1200_cpu_or1200_sprs_addrbase = or1200_cpu_operand_a;
    assign or1200_cpu_or1200_sprs_addrofs = or1200_cpu_ex_simm[15:0];
    assign or1200_cpu_or1200_sprs_dat_i = or1200_cpu_operand_b;
    assign or1200_cpu_or1200_sprs_branch_op = or1200_cpu_branch_op;
    assign or1200_cpu_or1200_sprs_ex_spr_read = or1200_cpu_ex_spr_read;
    assign or1200_cpu_or1200_sprs_ex_spr_write = or1200_cpu_ex_spr_write;
    assign or1200_cpu_or1200_sprs_epcr = or1200_cpu_epcr;
    assign or1200_cpu_or1200_sprs_eear = or1200_cpu_eear;
    assign or1200_cpu_or1200_sprs_esr = or1200_cpu_esr;
    assign or1200_cpu_or1200_sprs_except_started = or1200_cpu_except_started;
    assign or1200_cpu_sprs_dataout = or1200_cpu_or1200_sprs_to_wbmux;
    assign or1200_cpu_epcr_we = or1200_cpu_or1200_sprs_epcr_we;
    assign or1200_cpu_eear_we = or1200_cpu_or1200_sprs_eear_we;
    assign or1200_cpu_esr_we = or1200_cpu_or1200_sprs_esr_we;
    assign or1200_cpu_pc_we = or1200_cpu_or1200_sprs_pc_we;
    assign or1200_cpu_sr_we = or1200_cpu_or1200_sprs_sr_we;
    assign or1200_cpu_to_sr = or1200_cpu_or1200_sprs_to_sr;
    assign or1200_cpu_sr = or1200_cpu_or1200_sprs_sr;
    assign or1200_cpu_or1200_sprs_spr_dat_cfgr = or1200_cpu_spr_dat_cfgr;
    assign or1200_cpu_or1200_sprs_spr_dat_rf = or1200_cpu_spr_dat_rf;
    assign or1200_cpu_or1200_sprs_spr_dat_npc = or1200_cpu_spr_dat_npc;
    assign or1200_cpu_or1200_sprs_spr_dat_ppc = or1200_cpu_spr_dat_ppc;
    assign or1200_cpu_or1200_sprs_spr_dat_mac = or1200_cpu_spr_dat_mac;
    assign or1200_cpu_or1200_sprs_boot_adr_sel_i = or1200_cpu_boot_adr_sel_i;
    assign or1200_cpu_or1200_sprs_fpcsr = or1200_cpu_fpcsr;
    assign or1200_cpu_fpcsr_we = or1200_cpu_or1200_sprs_fpcsr_we;
    assign or1200_cpu_or1200_sprs_spr_dat_fpu = or1200_cpu_spr_dat_fpu;
    assign or1200_cpu_or1200_sprs_spr_dat_pic = or1200_cpu_spr_dat_pic;
    assign or1200_cpu_or1200_sprs_spr_dat_tt = or1200_cpu_spr_dat_tt;
    assign or1200_cpu_or1200_sprs_spr_dat_pm = or1200_cpu_spr_dat_pm;
    assign or1200_cpu_or1200_sprs_spr_dat_dmmu = or1200_cpu_spr_dat_dmmu;
    assign or1200_cpu_or1200_sprs_spr_dat_immu = or1200_cpu_spr_dat_immu;
    assign or1200_cpu_or1200_sprs_spr_dat_du = or1200_cpu_spr_dat_du;
    assign or1200_cpu_spr_addr = or1200_cpu_or1200_sprs_spr_addr;
    assign or1200_cpu_spr_dat_cpu = or1200_cpu_or1200_sprs_spr_dat_o;
    assign or1200_cpu_spr_cs = or1200_cpu_or1200_sprs_spr_cs;
    assign or1200_cpu_spr_we = or1200_cpu_or1200_sprs_spr_we;
    assign or1200_cpu_or1200_sprs_du_addr = or1200_cpu_du_addr;
    assign or1200_cpu_or1200_sprs_du_dat_du = or1200_cpu_du_dat_du;
    assign or1200_cpu_or1200_sprs_du_read = or1200_cpu_du_read;
    assign or1200_cpu_or1200_sprs_du_write = or1200_cpu_du_write;
    assign or1200_cpu_du_dat_cpu = or1200_cpu_or1200_sprs_du_dat_cpu;


    wire  or1200_cpu_or1200_lsu_clk;
    wire  or1200_cpu_or1200_lsu_rst;
    wire [31:0] or1200_cpu_or1200_lsu_id_addrbase;
    wire [31:0] or1200_cpu_or1200_lsu_ex_addrbase;
    wire [31:0] or1200_cpu_or1200_lsu_id_addrofs;
    wire [31:0] or1200_cpu_or1200_lsu_ex_addrofs;
    wire [4-1:0] or1200_cpu_or1200_lsu_id_lsu_op;
    wire [ or1200_cpu_or1200_lsu_dw -1:0] or1200_cpu_or1200_lsu_lsu_datain;
    wire [ or1200_cpu_or1200_lsu_dw -1:0] or1200_cpu_or1200_lsu_lsu_dataout;
    wire  or1200_cpu_or1200_lsu_lsu_stall;
    wire  or1200_cpu_or1200_lsu_lsu_unstall;
    wire  or1200_cpu_or1200_lsu_du_stall;
    reg  or1200_cpu_or1200_lsu_except_align;
    wire  or1200_cpu_or1200_lsu_except_dtlbmiss;
    wire  or1200_cpu_or1200_lsu_except_dmmufault;
    wire  or1200_cpu_or1200_lsu_except_dbuserr;
    wire  or1200_cpu_or1200_lsu_id_freeze;
    wire  or1200_cpu_or1200_lsu_ex_freeze;
    wire  or1200_cpu_or1200_lsu_flushpipe;
    wire [31:0] or1200_cpu_or1200_lsu_dcpu_adr_o;
    wire  or1200_cpu_or1200_lsu_dcpu_cycstb_o;
    wire  or1200_cpu_or1200_lsu_dcpu_we_o;
    reg [3:0] or1200_cpu_or1200_lsu_dcpu_sel_o;
    wire [3:0] or1200_cpu_or1200_lsu_dcpu_tag_o;
    wire [31:0] or1200_cpu_or1200_lsu_dcpu_dat_o;
    wire [31:0] or1200_cpu_or1200_lsu_dcpu_dat_i;
    wire  or1200_cpu_or1200_lsu_dcpu_ack_i;
    wire  or1200_cpu_or1200_lsu_dcpu_rty_i;
    wire  or1200_cpu_or1200_lsu_dcpu_err_i;
    wire [3:0] or1200_cpu_or1200_lsu_dcpu_tag_i;

    reg[4-1:0]  or1200_cpu_or1200_lsu_ex_lsu_op  ;
    wire[2:0]  or1200_cpu_or1200_lsu_id_precalc_sum  ;
    reg[2:0]  or1200_cpu_or1200_lsu_dcpu_adr_r  ;
    always @(  posedge    or1200_cpu_or1200_lsu_clk          or  posedge   or1200_cpu_or1200_lsu_rst  )
    begin
        if (  or1200_cpu_or1200_lsu_rst  ==(1'b1))
            or1200_cpu_or1200_lsu_ex_lsu_op   <=4'b0000;
        else
            if (!  or1200_cpu_or1200_lsu_ex_freeze  &  or1200_cpu_or1200_lsu_id_freeze  |  or1200_cpu_or1200_lsu_flushpipe  )
                or1200_cpu_or1200_lsu_ex_lsu_op   <=4'b0000;
            else
                if (!  or1200_cpu_or1200_lsu_ex_freeze  )
                    or1200_cpu_or1200_lsu_ex_lsu_op   <=  or1200_cpu_or1200_lsu_id_lsu_op  ;
    end

    assign   or1200_cpu_or1200_lsu_id_precalc_sum  =  or1200_cpu_or1200_lsu_id_addrbase  [2-1:0]+  or1200_cpu_or1200_lsu_id_addrofs  [2-1:0];
    always @(  posedge    or1200_cpu_or1200_lsu_clk          or  posedge   or1200_cpu_or1200_lsu_rst  )
    begin
        if (  or1200_cpu_or1200_lsu_rst  ==(1'b1))
            or1200_cpu_or1200_lsu_dcpu_adr_r   <={2+1{1'b0}};
        else
            if (!  or1200_cpu_or1200_lsu_ex_freeze  )
                or1200_cpu_or1200_lsu_dcpu_adr_r   <=  or1200_cpu_or1200_lsu_id_precalc_sum  ;
    end

    always @(  posedge    or1200_cpu_or1200_lsu_clk          or  posedge   or1200_cpu_or1200_lsu_rst  )
    begin
        if (  or1200_cpu_or1200_lsu_rst  ==(1'b1))
            or1200_cpu_or1200_lsu_except_align   <=1'b0;
        else
            if (!  or1200_cpu_or1200_lsu_ex_freeze  &  or1200_cpu_or1200_lsu_id_freeze  |  or1200_cpu_or1200_lsu_flushpipe  )
                or1200_cpu_or1200_lsu_except_align   <=1'b0;
            else
                if (!  or1200_cpu_or1200_lsu_ex_freeze  )
                    or1200_cpu_or1200_lsu_except_align   <=((  or1200_cpu_or1200_lsu_id_lsu_op  ==4'b1100)|(  or1200_cpu_or1200_lsu_id_lsu_op  ==4'b0100)|(  or1200_cpu_or1200_lsu_id_lsu_op  ==4'b0101))&  or1200_cpu_or1200_lsu_id_precalc_sum  [0]|((  or1200_cpu_or1200_lsu_id_lsu_op  ==4'b1110)|(  or1200_cpu_or1200_lsu_id_lsu_op  ==4'b0110)|(  or1200_cpu_or1200_lsu_id_lsu_op  ==4'b0111))&|  or1200_cpu_or1200_lsu_id_precalc_sum  [1:0];
    end

    assign   or1200_cpu_or1200_lsu_lsu_stall  =  or1200_cpu_or1200_lsu_dcpu_rty_i  &  or1200_cpu_or1200_lsu_dcpu_cycstb_o  ;
    assign   or1200_cpu_or1200_lsu_lsu_unstall  =  or1200_cpu_or1200_lsu_dcpu_ack_i  ;
    assign   or1200_cpu_or1200_lsu_except_dtlbmiss  =  or1200_cpu_or1200_lsu_dcpu_err_i  &(  or1200_cpu_or1200_lsu_dcpu_tag_i  ==4'hd);
    assign   or1200_cpu_or1200_lsu_except_dmmufault  =  or1200_cpu_or1200_lsu_dcpu_err_i  &(  or1200_cpu_or1200_lsu_dcpu_tag_i  ==4'hc);
    assign   or1200_cpu_or1200_lsu_except_dbuserr  =  or1200_cpu_or1200_lsu_dcpu_err_i  &(  or1200_cpu_or1200_lsu_dcpu_tag_i  ==4'hb);
    assign   or1200_cpu_or1200_lsu_dcpu_adr_o  [31:2]=  or1200_cpu_or1200_lsu_ex_addrbase  [31:2]+(  or1200_cpu_or1200_lsu_ex_addrofs  [31:2]+{{(32-2)-1{1'b0}},  or1200_cpu_or1200_lsu_dcpu_adr_r  [2]});
    assign   or1200_cpu_or1200_lsu_dcpu_adr_o  [2-1:0]=  or1200_cpu_or1200_lsu_dcpu_adr_r  [2-1:0];
    assign   or1200_cpu_or1200_lsu_dcpu_cycstb_o  =  or1200_cpu_or1200_lsu_du_stall  |  or1200_cpu_or1200_lsu_lsu_unstall  |  or1200_cpu_or1200_lsu_except_align   ? 1'b0:|  or1200_cpu_or1200_lsu_ex_lsu_op  ;
    assign   or1200_cpu_or1200_lsu_dcpu_we_o  =  or1200_cpu_or1200_lsu_ex_lsu_op  [3];
    assign   or1200_cpu_or1200_lsu_dcpu_tag_o  =  or1200_cpu_or1200_lsu_dcpu_cycstb_o   ? 4'h1:4'h0;
    always @(    or1200_cpu_or1200_lsu_ex_lsu_op            or    or1200_cpu_or1200_lsu_dcpu_adr_o   )
    casez ({  or1200_cpu_or1200_lsu_ex_lsu_op  ,  or1200_cpu_or1200_lsu_dcpu_adr_o  [1:0]})
        { 4'b1010,2'b00}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b1000;
        { 4'b1010,2'b01}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0100;
        { 4'b1010,2'b10}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0010;
        { 4'b1010,2'b11}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0001;
        { 4'b1100,2'b00}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b1100;
        { 4'b1100,2'b10}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0011;
        { 4'b1110,2'b00}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b1111;
        { 4'b0010,2'b00},{4'b0011,2'b00}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b1000;
        { 4'b0010,2'b01},{4'b0011,2'b01}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0100;
        { 4'b0010,2'b10},{4'b0011,2'b10}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0010;
        { 4'b0010,2'b11},{4'b0011,2'b11}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0001;
        { 4'b0100,2'b00},{4'b0101,2'b00}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b1100;
        { 4'b0100,2'b10},{4'b0101,2'b10}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0011;
        { 4'b0110,2'b00},{4'b0111,2'b00}:
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b1111;
        default :
            or1200_cpu_or1200_lsu_dcpu_sel_o   =4'b0000;
    endcase


    wire [1:0] or1200_cpu_or1200_lsu_or1200_mem2reg_addr;
    wire [4-1:0] or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op;
    wire [ or1200_cpu_or1200_lsu_or1200_mem2reg_width -1:0] or1200_cpu_or1200_lsu_or1200_mem2reg_memdata;
    reg [ or1200_cpu_or1200_lsu_or1200_mem2reg_width -1:0] or1200_cpu_or1200_lsu_or1200_mem2reg_regdata;

    reg[  or1200_cpu_or1200_lsu_or1200_mem2reg_width  -1:0]  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  ;
    always @(    or1200_cpu_or1200_lsu_or1200_mem2reg_addr            or    or1200_cpu_or1200_lsu_or1200_mem2reg_memdata   )
    begin
        case (  or1200_cpu_or1200_lsu_or1200_mem2reg_addr  )
            2 'b00:
                or1200_cpu_or1200_lsu_or1200_mem2reg_aligned   =  or1200_cpu_or1200_lsu_or1200_mem2reg_memdata  ;
            2 'b01:
                or1200_cpu_or1200_lsu_or1200_mem2reg_aligned   ={  or1200_cpu_or1200_lsu_or1200_mem2reg_memdata  [23:0],8'b0};
            2 'b10:
                or1200_cpu_or1200_lsu_or1200_mem2reg_aligned   ={  or1200_cpu_or1200_lsu_or1200_mem2reg_memdata  [15:0],16'b0};
            2 'b11:
                or1200_cpu_or1200_lsu_or1200_mem2reg_aligned   ={  or1200_cpu_or1200_lsu_or1200_mem2reg_memdata  [7:0],24'b0};
        endcase
    end

    always @(    or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op            or    or1200_cpu_or1200_lsu_or1200_mem2reg_aligned   )
    begin
        case (  or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op  )
            4 'b0010:
            begin
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [7:0]=  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  [31:24];
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [31:8]=24'b0;
            end
            4 'b0011:
            begin
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [7:0]=  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  [31:24];
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [31:8]={24{  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  [31]}};
            end
            4 'b0100:
            begin
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [15:0]=  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  [31:16];
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [31:16]=16'b0;
            end
            4 'b0101:
            begin
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [15:0]=  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  [31:16];
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   [31:16]={16{  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  [31]}};
            end
            default :
                or1200_cpu_or1200_lsu_or1200_mem2reg_regdata   =  or1200_cpu_or1200_lsu_or1200_mem2reg_aligned  ;
        endcase
    end

    assign or1200_cpu_or1200_lsu_or1200_mem2reg_addr = or1200_cpu_or1200_lsu_dcpu_adr_o[1:0];
    assign or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = or1200_cpu_or1200_lsu_ex_lsu_op;
    assign or1200_cpu_or1200_lsu_or1200_mem2reg_memdata = or1200_cpu_or1200_lsu_dcpu_dat_i;
    assign or1200_cpu_or1200_lsu_lsu_dataout = or1200_cpu_or1200_lsu_or1200_mem2reg_regdata;


    wire [1:0] or1200_cpu_or1200_lsu_or1200_reg2mem_addr;
    wire [4-1:0] or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op;
    wire [ or1200_cpu_or1200_lsu_or1200_reg2mem_width -1:0] or1200_cpu_or1200_lsu_or1200_reg2mem_regdata;
    wire [ or1200_cpu_or1200_lsu_or1200_reg2mem_width -1:0] or1200_cpu_or1200_lsu_or1200_reg2mem_memdata;

    reg[7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh  ;
    reg[7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl  ;
    reg[7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh  ;
    reg[7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll  ;
    assign   or1200_cpu_or1200_lsu_or1200_reg2mem_memdata  ={  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh  ,  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl  ,  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh  ,  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll  };
    always @(     or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op              or    or1200_cpu_or1200_lsu_or1200_reg2mem_addr           or    or1200_cpu_or1200_lsu_or1200_reg2mem_regdata   )
    begin
        casez ({  or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op  ,  or1200_cpu_or1200_lsu_or1200_reg2mem_addr  [1:0]})
            { 4'b1010,2'b00}:
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [7:0];
            { 4'b1100,2'b00}:
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [15:8];
            default :
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [31:24];
        endcase
    end

    always @(     or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op              or    or1200_cpu_or1200_lsu_or1200_reg2mem_addr           or    or1200_cpu_or1200_lsu_or1200_reg2mem_regdata   )
    begin
        casez ({  or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op  ,  or1200_cpu_or1200_lsu_or1200_reg2mem_addr  [1:0]})
            { 4'b1110,2'b00}:
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [23:16];
            default :
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [7:0];
        endcase
    end

    always @(     or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op              or    or1200_cpu_or1200_lsu_or1200_reg2mem_addr           or    or1200_cpu_or1200_lsu_or1200_reg2mem_regdata   )
    begin
        casez ({  or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op  ,  or1200_cpu_or1200_lsu_or1200_reg2mem_addr  [1:0]})
            { 4'b1010,2'b10}:
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [7:0];
            default :
                or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [15:8];
        endcase
    end

    always @(   or1200_cpu_or1200_lsu_or1200_reg2mem_regdata   )
        or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll   =  or1200_cpu_or1200_lsu_or1200_reg2mem_regdata  [7:0];

    assign or1200_cpu_or1200_lsu_or1200_reg2mem_addr = or1200_cpu_or1200_lsu_dcpu_adr_o[1:0];
    assign or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op = or1200_cpu_or1200_lsu_ex_lsu_op;
    assign or1200_cpu_or1200_lsu_or1200_reg2mem_regdata = or1200_cpu_or1200_lsu_lsu_datain;
    assign or1200_cpu_or1200_lsu_dcpu_dat_o = or1200_cpu_or1200_lsu_or1200_reg2mem_memdata;

    assign or1200_cpu_or1200_lsu_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_lsu_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_lsu_id_addrbase = or1200_cpu_muxed_a;
    assign or1200_cpu_or1200_lsu_ex_addrbase = or1200_cpu_operand_a;
    assign or1200_cpu_or1200_lsu_id_addrofs = or1200_cpu_id_simm;
    assign or1200_cpu_or1200_lsu_ex_addrofs = or1200_cpu_ex_simm;
    assign or1200_cpu_or1200_lsu_id_lsu_op = or1200_cpu_id_lsu_op;
    assign or1200_cpu_or1200_lsu_lsu_datain = or1200_cpu_operand_b;
    assign or1200_cpu_lsu_dataout = or1200_cpu_or1200_lsu_lsu_dataout;
    assign or1200_cpu_lsu_stall = or1200_cpu_or1200_lsu_lsu_stall;
    assign or1200_cpu_lsu_unstall = or1200_cpu_or1200_lsu_lsu_unstall;
    assign or1200_cpu_or1200_lsu_du_stall = or1200_cpu_du_stall;
    assign or1200_cpu_except_align = or1200_cpu_or1200_lsu_except_align;
    assign or1200_cpu_except_dtlbmiss = or1200_cpu_or1200_lsu_except_dtlbmiss;
    assign or1200_cpu_except_dmmufault = or1200_cpu_or1200_lsu_except_dmmufault;
    assign or1200_cpu_except_dbuserr = or1200_cpu_or1200_lsu_except_dbuserr;
    assign or1200_cpu_or1200_lsu_id_freeze = or1200_cpu_id_freeze;
    assign or1200_cpu_or1200_lsu_ex_freeze = or1200_cpu_ex_freeze;
    assign or1200_cpu_or1200_lsu_flushpipe = or1200_cpu_ex_flushpipe;
    assign or1200_cpu_dcpu_adr_o = or1200_cpu_or1200_lsu_dcpu_adr_o;
    assign or1200_cpu_dcpu_cycstb_o = or1200_cpu_or1200_lsu_dcpu_cycstb_o;
    assign or1200_cpu_dcpu_we_o = or1200_cpu_or1200_lsu_dcpu_we_o;
    assign or1200_cpu_dcpu_sel_o = or1200_cpu_or1200_lsu_dcpu_sel_o;
    assign or1200_cpu_dcpu_tag_o = or1200_cpu_or1200_lsu_dcpu_tag_o;
    assign or1200_cpu_dcpu_dat_o = or1200_cpu_or1200_lsu_dcpu_dat_o;
    assign or1200_cpu_or1200_lsu_dcpu_dat_i = or1200_cpu_dcpu_dat_i;
    assign or1200_cpu_or1200_lsu_dcpu_ack_i = or1200_cpu_dcpu_ack_i;
    assign or1200_cpu_or1200_lsu_dcpu_rty_i = or1200_cpu_dcpu_rty_i;
    assign or1200_cpu_or1200_lsu_dcpu_err_i = or1200_cpu_dcpu_err_i;
    assign or1200_cpu_or1200_lsu_dcpu_tag_i = or1200_cpu_dcpu_tag_i;


    wire  or1200_cpu_or1200_wbmux_clk;
    wire  or1200_cpu_or1200_wbmux_rst;
    wire  or1200_cpu_or1200_wbmux_wb_freeze;
    wire [4-1:0] or1200_cpu_or1200_wbmux_rfwb_op;
    wire [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxin_a;
    wire [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxin_b;
    wire [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxin_c;
    wire [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxin_d;
    wire [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxin_e;
    reg [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxout;
    reg [ or1200_cpu_or1200_wbmux_width -1:0] or1200_cpu_or1200_wbmux_muxreg;
    reg  or1200_cpu_or1200_wbmux_muxreg_valid;

    always @(  posedge    or1200_cpu_or1200_wbmux_clk          or  posedge   or1200_cpu_or1200_wbmux_rst  )
    begin
        if (  or1200_cpu_or1200_wbmux_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_wbmux_muxreg   <=32'd0;
            or1200_cpu_or1200_wbmux_muxreg_valid   <=1'b0;
        end
        else
            if (!  or1200_cpu_or1200_wbmux_wb_freeze  )
            begin
                or1200_cpu_or1200_wbmux_muxreg   <=  or1200_cpu_or1200_wbmux_muxout  ;
                or1200_cpu_or1200_wbmux_muxreg_valid   <=  or1200_cpu_or1200_wbmux_rfwb_op  [0];
            end
    end

    always @(        or1200_cpu_or1200_wbmux_muxin_a                    or    or1200_cpu_or1200_wbmux_muxin_b              or    or1200_cpu_or1200_wbmux_muxin_c             or    or1200_cpu_or1200_wbmux_muxin_d            or    or1200_cpu_or1200_wbmux_muxin_e           or    or1200_cpu_or1200_wbmux_rfwb_op   )
    begin
        casez (  or1200_cpu_or1200_wbmux_rfwb_op  [4-1:1])
            3 'b000:
                or1200_cpu_or1200_wbmux_muxout   =  or1200_cpu_or1200_wbmux_muxin_a  ;
            3 'b001:
            begin
                or1200_cpu_or1200_wbmux_muxout   =  or1200_cpu_or1200_wbmux_muxin_b  ;
            end
            3 'b010:
            begin
                or1200_cpu_or1200_wbmux_muxout   =  or1200_cpu_or1200_wbmux_muxin_c  ;
            end
            3 'b011:
            begin
                or1200_cpu_or1200_wbmux_muxout   =  or1200_cpu_or1200_wbmux_muxin_d  +32'h8;
            end
            default :
            begin
                or1200_cpu_or1200_wbmux_muxout   =0;
            end
        endcase
    end

    assign or1200_cpu_or1200_wbmux_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_wbmux_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_wbmux_wb_freeze = or1200_cpu_wb_freeze;
    assign or1200_cpu_or1200_wbmux_rfwb_op = or1200_cpu_rfwb_op;
    assign or1200_cpu_or1200_wbmux_muxin_a = or1200_cpu_alu_dataout;
    assign or1200_cpu_or1200_wbmux_muxin_b = or1200_cpu_lsu_dataout;
    assign or1200_cpu_or1200_wbmux_muxin_c = or1200_cpu_sprs_dataout;
    assign or1200_cpu_or1200_wbmux_muxin_d = or1200_cpu_ex_pc;
    assign or1200_cpu_or1200_wbmux_muxin_e = or1200_cpu_fpu_dataout;
    assign or1200_cpu_rf_dataw = or1200_cpu_or1200_wbmux_muxout;
    assign or1200_cpu_wb_forw = or1200_cpu_or1200_wbmux_muxreg;
    assign or1200_cpu_wbforw_valid = or1200_cpu_or1200_wbmux_muxreg_valid;


    wire  or1200_cpu_or1200_freeze_clk;
    wire  or1200_cpu_or1200_freeze_rst;
    wire [3-1:0] or1200_cpu_or1200_freeze_multicycle;
    wire [2-1:0] or1200_cpu_or1200_freeze_wait_on;
    wire  or1200_cpu_or1200_freeze_flushpipe;
    wire  or1200_cpu_or1200_freeze_extend_flush;
    wire  or1200_cpu_or1200_freeze_lsu_stall;
    wire  or1200_cpu_or1200_freeze_if_stall;
    wire  or1200_cpu_or1200_freeze_lsu_unstall;
    wire  or1200_cpu_or1200_freeze_du_stall;
    wire  or1200_cpu_or1200_freeze_mac_stall;
    wire  or1200_cpu_or1200_freeze_force_dslot_fetch;
    wire  or1200_cpu_or1200_freeze_abort_ex;
    wire  or1200_cpu_or1200_freeze_genpc_freeze;
    wire  or1200_cpu_or1200_freeze_if_freeze;
    wire  or1200_cpu_or1200_freeze_id_freeze;
    wire  or1200_cpu_or1200_freeze_ex_freeze;
    wire  or1200_cpu_or1200_freeze_wb_freeze;
    wire  or1200_cpu_or1200_freeze_saving_if_insn;
    wire  or1200_cpu_or1200_freeze_fpu_done;
    wire  or1200_cpu_or1200_freeze_mtspr_done;
    wire  or1200_cpu_or1200_freeze_icpu_ack_i;
    wire  or1200_cpu_or1200_freeze_icpu_err_i;

    wire  or1200_cpu_or1200_freeze_multicycle_freeze  ;
    reg[3-1:0]  or1200_cpu_or1200_freeze_multicycle_cnt  ;
    reg  or1200_cpu_or1200_freeze_flushpipe_r  ;
    reg[2-1:0]  or1200_cpu_or1200_freeze_waiting_on  ;
    assign   or1200_cpu_or1200_freeze_genpc_freeze  =(  or1200_cpu_or1200_freeze_du_stall  &!  or1200_cpu_or1200_freeze_saving_if_insn  )|  or1200_cpu_or1200_freeze_flushpipe_r  ;
    assign   or1200_cpu_or1200_freeze_if_freeze  =  or1200_cpu_or1200_freeze_id_freeze  |  or1200_cpu_or1200_freeze_extend_flush  ;
    assign   or1200_cpu_or1200_freeze_id_freeze  =(  or1200_cpu_or1200_freeze_lsu_stall  |(~  or1200_cpu_or1200_freeze_lsu_unstall  &  or1200_cpu_or1200_freeze_if_stall  )|  or1200_cpu_or1200_freeze_multicycle_freeze  |(|  or1200_cpu_or1200_freeze_waiting_on  )|  or1200_cpu_or1200_freeze_force_dslot_fetch  )|  or1200_cpu_or1200_freeze_du_stall  ;
    assign   or1200_cpu_or1200_freeze_ex_freeze  =  or1200_cpu_or1200_freeze_wb_freeze  ;
    assign   or1200_cpu_or1200_freeze_wb_freeze  =(  or1200_cpu_or1200_freeze_lsu_stall  |(~  or1200_cpu_or1200_freeze_lsu_unstall  &  or1200_cpu_or1200_freeze_if_stall  )|  or1200_cpu_or1200_freeze_multicycle_freeze  |(|  or1200_cpu_or1200_freeze_waiting_on  ))|  or1200_cpu_or1200_freeze_du_stall  |  or1200_cpu_or1200_freeze_abort_ex  ;
    always @(  posedge    or1200_cpu_or1200_freeze_clk          or  posedge   or1200_cpu_or1200_freeze_rst  )
        if (  or1200_cpu_or1200_freeze_rst  ==(1'b1))
            or1200_cpu_or1200_freeze_flushpipe_r   <=1'b0;
        else
            if (  or1200_cpu_or1200_freeze_icpu_ack_i  |  or1200_cpu_or1200_freeze_icpu_err_i  )
                or1200_cpu_or1200_freeze_flushpipe_r   <=  or1200_cpu_or1200_freeze_flushpipe  ;
            else
                if (!  or1200_cpu_or1200_freeze_flushpipe  )
                    or1200_cpu_or1200_freeze_flushpipe_r   <=1'b0;

    assign   or1200_cpu_or1200_freeze_multicycle_freeze  =|  or1200_cpu_or1200_freeze_multicycle_cnt  ;
    always @(  posedge    or1200_cpu_or1200_freeze_clk          or  posedge   or1200_cpu_or1200_freeze_rst  )
        if (  or1200_cpu_or1200_freeze_rst  ==(1'b1))
            or1200_cpu_or1200_freeze_multicycle_cnt   <=3'd0;
        else
            if (|  or1200_cpu_or1200_freeze_multicycle_cnt  )
                or1200_cpu_or1200_freeze_multicycle_cnt   <=  or1200_cpu_or1200_freeze_multicycle_cnt  -3'd1;
            else
                if (|  or1200_cpu_or1200_freeze_multicycle  &!  or1200_cpu_or1200_freeze_ex_freeze  )
                    or1200_cpu_or1200_freeze_multicycle_cnt   <=  or1200_cpu_or1200_freeze_multicycle  ;

    always @(  posedge    or1200_cpu_or1200_freeze_clk          or  posedge   or1200_cpu_or1200_freeze_rst  )
        if (  or1200_cpu_or1200_freeze_rst  ==(1'b1))
            or1200_cpu_or1200_freeze_waiting_on   <=0;
        else
            if ((  or1200_cpu_or1200_freeze_waiting_on  ==2'd1)&!  or1200_cpu_or1200_freeze_mac_stall  )
                or1200_cpu_or1200_freeze_waiting_on   <=0;
            else
                if ((  or1200_cpu_or1200_freeze_waiting_on  ==2'd2)&  or1200_cpu_or1200_freeze_fpu_done  )
                    or1200_cpu_or1200_freeze_waiting_on   <=0;
                else
                    if ((  or1200_cpu_or1200_freeze_waiting_on  ==2'd3)&  or1200_cpu_or1200_freeze_mtspr_done  )
                        or1200_cpu_or1200_freeze_waiting_on   <=0;
                    else
                        if (!  or1200_cpu_or1200_freeze_ex_freeze  )
                            or1200_cpu_or1200_freeze_waiting_on   <=  or1200_cpu_or1200_freeze_wait_on  ;

    assign or1200_cpu_or1200_freeze_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_freeze_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_freeze_multicycle = or1200_cpu_multicycle;
    assign or1200_cpu_or1200_freeze_wait_on = or1200_cpu_wait_on;
    assign or1200_cpu_or1200_freeze_flushpipe = or1200_cpu_wb_flushpipe;
    assign or1200_cpu_or1200_freeze_extend_flush = or1200_cpu_extend_flush;
    assign or1200_cpu_or1200_freeze_lsu_stall = or1200_cpu_lsu_stall;
    assign or1200_cpu_or1200_freeze_if_stall = or1200_cpu_if_stall;
    assign or1200_cpu_or1200_freeze_lsu_unstall = or1200_cpu_lsu_unstall;
    assign or1200_cpu_or1200_freeze_du_stall = or1200_cpu_du_stall;
    assign or1200_cpu_or1200_freeze_mac_stall = or1200_cpu_mult_mac_stall;
    assign or1200_cpu_or1200_freeze_force_dslot_fetch = or1200_cpu_force_dslot_fetch;
    assign or1200_cpu_or1200_freeze_abort_ex = or1200_cpu_abort_ex;
    assign or1200_cpu_genpc_freeze = or1200_cpu_or1200_freeze_genpc_freeze;
    assign or1200_cpu_if_freeze = or1200_cpu_or1200_freeze_if_freeze;
    assign or1200_cpu_id_freeze = or1200_cpu_or1200_freeze_id_freeze;
    assign or1200_cpu_ex_freeze = or1200_cpu_or1200_freeze_ex_freeze;
    assign or1200_cpu_wb_freeze = or1200_cpu_or1200_freeze_wb_freeze;
    assign or1200_cpu_or1200_freeze_saving_if_insn = or1200_cpu_saving_if_insn;
    assign or1200_cpu_or1200_freeze_fpu_done = or1200_cpu_fpu_done;
    assign or1200_cpu_or1200_freeze_mtspr_done = or1200_cpu_mtspr_done;
    assign or1200_cpu_or1200_freeze_icpu_ack_i = or1200_cpu_icpu_ack_i;
    assign or1200_cpu_or1200_freeze_icpu_err_i = or1200_cpu_icpu_err_i;


    wire  or1200_cpu_or1200_except_clk;
    wire  or1200_cpu_or1200_except_rst;
    wire  or1200_cpu_or1200_except_sig_ibuserr;
    wire  or1200_cpu_or1200_except_sig_dbuserr;
    wire  or1200_cpu_or1200_except_sig_illegal;
    wire  or1200_cpu_or1200_except_sig_align;
    wire  or1200_cpu_or1200_except_sig_range;
    wire  or1200_cpu_or1200_except_sig_dtlbmiss;
    wire  or1200_cpu_or1200_except_sig_dmmufault;
    wire  or1200_cpu_or1200_except_sig_int;
    wire  or1200_cpu_or1200_except_sig_syscall;
    wire  or1200_cpu_or1200_except_sig_trap;
    wire  or1200_cpu_or1200_except_sig_itlbmiss;
    wire  or1200_cpu_or1200_except_sig_immufault;
    wire  or1200_cpu_or1200_except_sig_tick;
    wire  or1200_cpu_or1200_except_ex_branch_taken;
    wire  or1200_cpu_or1200_except_genpc_freeze;
    wire  or1200_cpu_or1200_except_id_freeze;
    wire  or1200_cpu_or1200_except_ex_freeze;
    wire  or1200_cpu_or1200_except_wb_freeze;
    wire  or1200_cpu_or1200_except_if_stall;
    wire [31:0] or1200_cpu_or1200_except_if_pc;
    reg [31:0] or1200_cpu_or1200_except_id_pc;
    reg [31:0] or1200_cpu_or1200_except_ex_pc;
    reg [31:0] or1200_cpu_or1200_except_wb_pc;
    wire  or1200_cpu_or1200_except_id_flushpipe;
    wire  or1200_cpu_or1200_except_ex_flushpipe;
    reg  or1200_cpu_or1200_except_extend_flush;
    wire  or1200_cpu_or1200_except_except_flushpipe;
    reg [4-1:0] or1200_cpu_or1200_except_except_type;
    wire  or1200_cpu_or1200_except_except_start;
    wire  or1200_cpu_or1200_except_except_started;
    wire [13:0] or1200_cpu_or1200_except_except_stop;
    wire [13:0] or1200_cpu_or1200_except_except_trig;
    wire  or1200_cpu_or1200_except_ex_void;
    wire  or1200_cpu_or1200_except_abort_mvspr;
    wire [3-1:0] or1200_cpu_or1200_except_branch_op;
    wire [31:0] or1200_cpu_or1200_except_spr_dat_ppc;
    wire [31:0] or1200_cpu_or1200_except_spr_dat_npc;
    wire [31:0] or1200_cpu_or1200_except_datain;
    wire [14-1:0] or1200_cpu_or1200_except_du_dsr;
    wire  or1200_cpu_or1200_except_epcr_we;
    wire  or1200_cpu_or1200_except_eear_we;
    wire  or1200_cpu_or1200_except_esr_we;
    wire  or1200_cpu_or1200_except_pc_we;
    reg [31:0] or1200_cpu_or1200_except_epcr;
    reg [31:0] or1200_cpu_or1200_except_eear;
    wire [24:0] or1200_cpu_or1200_except_du_dmr1;
    wire  or1200_cpu_or1200_except_du_hwbkpt;
    wire  or1200_cpu_or1200_except_du_hwbkpt_ls_r;
    reg [17-1:0] or1200_cpu_or1200_except_esr;
    wire  or1200_cpu_or1200_except_sr_we;
    wire [17-1:0] or1200_cpu_or1200_except_to_sr;
    wire [17-1:0] or1200_cpu_or1200_except_sr;
    wire [31:0] or1200_cpu_or1200_except_lsu_addr;
    wire  or1200_cpu_or1200_except_abort_ex;
    wire  or1200_cpu_or1200_except_icpu_ack_i;
    wire  or1200_cpu_or1200_except_icpu_err_i;
    wire  or1200_cpu_or1200_except_dcpu_ack_i;
    wire  or1200_cpu_or1200_except_dcpu_err_i;
    wire  or1200_cpu_or1200_except_sig_fp;
    wire  or1200_cpu_or1200_except_fpcsr_fpee;
    reg  or1200_cpu_or1200_except_dsx;

    reg  or1200_cpu_or1200_except_id_pc_val  ;
    reg  or1200_cpu_or1200_except_ex_pc_val  ;
    reg[31:0]  or1200_cpu_or1200_except_dl_pc  ;
    reg[2:0]  or1200_cpu_or1200_except_id_exceptflags  ;
    reg[2:0]  or1200_cpu_or1200_except_ex_exceptflags  ;
    reg[3-1:0]  or1200_cpu_or1200_except_state  ;
    reg  or1200_cpu_or1200_except_extend_flush_last  ;
    reg  or1200_cpu_or1200_except_ex_dslot  ;
    reg  or1200_cpu_or1200_except_delayed1_ex_dslot  ;
    reg  or1200_cpu_or1200_except_delayed2_ex_dslot  ;
    reg[2:0]  or1200_cpu_or1200_except_delayed_iee  ;
    reg[2:0]  or1200_cpu_or1200_except_delayed_tee  ;
    wire  or1200_cpu_or1200_except_int_pending  ;
    wire  or1200_cpu_or1200_except_tick_pending  ;
    wire  or1200_cpu_or1200_except_fp_pending  ;
    wire  or1200_cpu_or1200_except_range_pending  ;
    reg  or1200_cpu_or1200_except_trace_trap  ;
    reg  or1200_cpu_or1200_except_ex_freeze_prev  ;
    reg  or1200_cpu_or1200_except_sr_ted_prev  ;
    reg  or1200_cpu_or1200_except_dsr_te_prev  ;
    reg  or1200_cpu_or1200_except_dmr1_st_prev  ;
    reg  or1200_cpu_or1200_except_dmr1_bt_prev  ;
    wire  or1200_cpu_or1200_except_dsr_te  =  or1200_cpu_or1200_except_ex_freeze_prev   ?   or1200_cpu_or1200_except_dsr_te_prev  :  or1200_cpu_or1200_except_du_dsr  [13];
    wire  or1200_cpu_or1200_except_sr_ted  =  or1200_cpu_or1200_except_ex_freeze_prev   ?   or1200_cpu_or1200_except_sr_ted_prev  :  or1200_cpu_or1200_except_sr  [16];
    wire  or1200_cpu_or1200_except_dmr1_st  =  or1200_cpu_or1200_except_ex_freeze_prev   ?   or1200_cpu_or1200_except_dmr1_st_prev  :  or1200_cpu_or1200_except_du_dmr1  [22];
    wire  or1200_cpu_or1200_except_dmr1_bt  =  or1200_cpu_or1200_except_ex_freeze_prev   ?   or1200_cpu_or1200_except_dmr1_bt_prev  :  or1200_cpu_or1200_except_du_dmr1  [23];
    assign   or1200_cpu_or1200_except_except_started  =  or1200_cpu_or1200_except_extend_flush  &  or1200_cpu_or1200_except_except_start  ;
    assign   or1200_cpu_or1200_except_except_start  =(  or1200_cpu_or1200_except_except_type  !=4'h0)&  or1200_cpu_or1200_except_extend_flush  ;
    assign   or1200_cpu_or1200_except_int_pending  =  or1200_cpu_or1200_except_sig_int  &(  or1200_cpu_or1200_except_sr  [2]|(  or1200_cpu_or1200_except_sr_we  &  or1200_cpu_or1200_except_to_sr  [2]))&  or1200_cpu_or1200_except_id_pc_val  &  or1200_cpu_or1200_except_delayed_iee  [2]&~  or1200_cpu_or1200_except_ex_freeze  &~  or1200_cpu_or1200_except_ex_branch_taken  &~  or1200_cpu_or1200_except_ex_dslot  &~(  or1200_cpu_or1200_except_sr_we  &~  or1200_cpu_or1200_except_to_sr  [2]);
    assign   or1200_cpu_or1200_except_tick_pending  =  or1200_cpu_or1200_except_sig_tick  &(  or1200_cpu_or1200_except_sr  [1]|(  or1200_cpu_or1200_except_sr_we  &  or1200_cpu_or1200_except_to_sr  [1]))&  or1200_cpu_or1200_except_id_pc_val  &  or1200_cpu_or1200_except_delayed_tee  [2]&~  or1200_cpu_or1200_except_ex_freeze  &~  or1200_cpu_or1200_except_ex_branch_taken  &~  or1200_cpu_or1200_except_ex_dslot  &~(  or1200_cpu_or1200_except_sr_we  &~  or1200_cpu_or1200_except_to_sr  [1]);
    assign   or1200_cpu_or1200_except_fp_pending  =  or1200_cpu_or1200_except_sig_fp  &  or1200_cpu_or1200_except_fpcsr_fpee  &~  or1200_cpu_or1200_except_ex_freeze  &~  or1200_cpu_or1200_except_ex_branch_taken  &~  or1200_cpu_or1200_except_ex_dslot  ;
    assign   or1200_cpu_or1200_except_range_pending  =  or1200_cpu_or1200_except_sig_range  &  or1200_cpu_or1200_except_sr  [12]&~  or1200_cpu_or1200_except_ex_freeze  &~  or1200_cpu_or1200_except_ex_branch_taken  &~  or1200_cpu_or1200_except_ex_dslot  ;
    assign   or1200_cpu_or1200_except_abort_ex  =  or1200_cpu_or1200_except_sig_dbuserr  |  or1200_cpu_or1200_except_sig_dmmufault  |  or1200_cpu_or1200_except_sig_dtlbmiss  |  or1200_cpu_or1200_except_sig_align  |  or1200_cpu_or1200_except_sig_illegal  |((  or1200_cpu_or1200_except_du_hwbkpt  |  or1200_cpu_or1200_except_trace_trap  )&  or1200_cpu_or1200_except_ex_pc_val  &!  or1200_cpu_or1200_except_sr_ted  &!  or1200_cpu_or1200_except_dsr_te  );
    assign   or1200_cpu_or1200_except_abort_mvspr  =  or1200_cpu_or1200_except_sig_illegal  |((  or1200_cpu_or1200_except_du_hwbkpt  |  or1200_cpu_or1200_except_trace_trap  )&  or1200_cpu_or1200_except_ex_pc_val  &!  or1200_cpu_or1200_except_sr_ted  &!  or1200_cpu_or1200_except_dsr_te  );
    assign   or1200_cpu_or1200_except_spr_dat_ppc  =  or1200_cpu_or1200_except_wb_pc  ;
    assign   or1200_cpu_or1200_except_spr_dat_npc  =  or1200_cpu_or1200_except_ex_void   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_ex_pc  ;
    assign   or1200_cpu_or1200_except_except_trig  ={  or1200_cpu_or1200_except_ex_exceptflags  [1]&~  or1200_cpu_or1200_except_du_dsr  [9],  or1200_cpu_or1200_except_ex_exceptflags  [0]&~  or1200_cpu_or1200_except_du_dsr  [3],  or1200_cpu_or1200_except_ex_exceptflags  [2]&~  or1200_cpu_or1200_except_du_dsr  [1],  or1200_cpu_or1200_except_sig_illegal  &~  or1200_cpu_or1200_except_du_dsr  [6],  or1200_cpu_or1200_except_sig_align  &~  or1200_cpu_or1200_except_du_dsr  [5],  or1200_cpu_or1200_except_sig_dtlbmiss  &~  or1200_cpu_or1200_except_du_dsr  [8],  or1200_cpu_or1200_except_sig_trap  &~  or1200_cpu_or1200_except_du_dsr  [13],  or1200_cpu_or1200_except_sig_syscall  &~  or1200_cpu_or1200_except_du_dsr  [11]&~  or1200_cpu_or1200_except_ex_freeze  ,  or1200_cpu_or1200_except_sig_dmmufault  &~  or1200_cpu_or1200_except_du_dsr  [2],  or1200_cpu_or1200_except_sig_dbuserr  &~  or1200_cpu_or1200_except_du_dsr  [1],  or1200_cpu_or1200_except_range_pending  &~  or1200_cpu_or1200_except_du_dsr  [10],  or1200_cpu_or1200_except_fp_pending  &~  or1200_cpu_or1200_except_du_dsr  [12],  or1200_cpu_or1200_except_int_pending  &~  or1200_cpu_or1200_except_du_dsr  [7],  or1200_cpu_or1200_except_tick_pending  &~  or1200_cpu_or1200_except_du_dsr  [4]};
    wire  or1200_cpu_or1200_except_trace_cond  =!  or1200_cpu_or1200_except_ex_freeze  &&!  or1200_cpu_or1200_except_ex_void  &&(1'b0||  or1200_cpu_or1200_except_dmr1_st  ||((  or1200_cpu_or1200_except_branch_op  !=3'd0)&&(  or1200_cpu_or1200_except_branch_op  !=3'd6)&&  or1200_cpu_or1200_except_dmr1_bt  ));
    assign   or1200_cpu_or1200_except_except_stop  ={  or1200_cpu_or1200_except_tick_pending  &  or1200_cpu_or1200_except_du_dsr  [4],  or1200_cpu_or1200_except_int_pending  &  or1200_cpu_or1200_except_du_dsr  [7],  or1200_cpu_or1200_except_ex_exceptflags  [1]&  or1200_cpu_or1200_except_du_dsr  [9],  or1200_cpu_or1200_except_ex_exceptflags  [0]&  or1200_cpu_or1200_except_du_dsr  [3],  or1200_cpu_or1200_except_ex_exceptflags  [2]&  or1200_cpu_or1200_except_du_dsr  [1],  or1200_cpu_or1200_except_sig_illegal  &  or1200_cpu_or1200_except_du_dsr  [6],  or1200_cpu_or1200_except_sig_align  &  or1200_cpu_or1200_except_du_dsr  [5],  or1200_cpu_or1200_except_sig_dtlbmiss  &  or1200_cpu_or1200_except_du_dsr  [8],  or1200_cpu_or1200_except_sig_dmmufault  &  or1200_cpu_or1200_except_du_dsr  [2],  or1200_cpu_or1200_except_sig_dbuserr  &  or1200_cpu_or1200_except_du_dsr  [1],  or1200_cpu_or1200_except_range_pending  &  or1200_cpu_or1200_except_du_dsr  [10],  or1200_cpu_or1200_except_sig_trap  &  or1200_cpu_or1200_except_du_dsr  [13],  or1200_cpu_or1200_except_fp_pending  &  or1200_cpu_or1200_except_du_dsr  [12],  or1200_cpu_or1200_except_sig_syscall  &  or1200_cpu_or1200_except_du_dsr  [11]&~  or1200_cpu_or1200_except_ex_freeze  };
    always @(  posedge    or1200_cpu_or1200_except_clk          or  posedge   or1200_cpu_or1200_except_rst  )
    begin
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_except_trace_trap   <=1'b0;
        end
        else
            if (!(  or1200_cpu_or1200_except_trace_trap  &&!  or1200_cpu_or1200_except_ex_pc_val  ))
            begin
                or1200_cpu_or1200_except_trace_trap   <=  or1200_cpu_or1200_except_trace_cond  &!  or1200_cpu_or1200_except_dsr_te  &!  or1200_cpu_or1200_except_sr_ted  ;
            end
    end

    always @(  posedge    or1200_cpu_or1200_except_clk          or  posedge   or1200_cpu_or1200_except_rst  )
    begin
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_except_ex_freeze_prev   <=1'b0;
            or1200_cpu_or1200_except_sr_ted_prev   <=1'b0;
            or1200_cpu_or1200_except_dsr_te_prev   <=1'b0;
            or1200_cpu_or1200_except_dmr1_st_prev   <=1'b0;
            or1200_cpu_or1200_except_dmr1_bt_prev   <=1'b0;
        end
        else
        begin
            or1200_cpu_or1200_except_ex_freeze_prev   <=  or1200_cpu_or1200_except_ex_freeze  ;
            if (!  or1200_cpu_or1200_except_ex_freeze_prev  ||  or1200_cpu_or1200_except_ex_void  )
            begin
                or1200_cpu_or1200_except_sr_ted_prev   <=  or1200_cpu_or1200_except_sr  [16];
                or1200_cpu_or1200_except_dsr_te_prev   <=  or1200_cpu_or1200_except_du_dsr  [13];
                or1200_cpu_or1200_except_dmr1_st_prev   <=  or1200_cpu_or1200_except_du_dmr1  [22];
                or1200_cpu_or1200_except_dmr1_bt_prev   <=  or1200_cpu_or1200_except_du_dmr1  [23];
            end
        end
    end

    always @(  posedge    or1200_cpu_or1200_except_clk          or  posedge   or1200_cpu_or1200_except_rst  )
    begin
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_except_id_pc   <=32'd0;
            or1200_cpu_or1200_except_id_pc_val   <=1'b0;
            or1200_cpu_or1200_except_id_exceptflags   <=3'b000;
        end
        else
            if (  or1200_cpu_or1200_except_id_flushpipe  )
            begin
                or1200_cpu_or1200_except_id_pc_val   <=1'b0;
                or1200_cpu_or1200_except_id_exceptflags   <=3'b000;
            end
            else
                if (!  or1200_cpu_or1200_except_id_freeze  )
                begin
                    or1200_cpu_or1200_except_id_pc   <=  or1200_cpu_or1200_except_if_pc  ;
                    or1200_cpu_or1200_except_id_pc_val   <=1'b1;
                    or1200_cpu_or1200_except_id_exceptflags   <={  or1200_cpu_or1200_except_sig_ibuserr  ,  or1200_cpu_or1200_except_sig_itlbmiss  ,  or1200_cpu_or1200_except_sig_immufault  };
                end
    end

    always @(  posedge    or1200_cpu_or1200_except_rst          or  posedge   or1200_cpu_or1200_except_clk  )
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
            or1200_cpu_or1200_except_delayed_iee   <=3'b000;
        else
            if (!  or1200_cpu_or1200_except_sr  [2])
                or1200_cpu_or1200_except_delayed_iee   <=3'b000;
            else
                or1200_cpu_or1200_except_delayed_iee   <={  or1200_cpu_or1200_except_delayed_iee  [1:0],1'b1};

    always @(  posedge    or1200_cpu_or1200_except_rst          or  posedge   or1200_cpu_or1200_except_clk  )
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
            or1200_cpu_or1200_except_delayed_tee   <=3'b000;
        else
            if (!  or1200_cpu_or1200_except_sr  [1])
                or1200_cpu_or1200_except_delayed_tee   <=3'b000;
            else
                or1200_cpu_or1200_except_delayed_tee   <={  or1200_cpu_or1200_except_delayed_tee  [1:0],1'b1};

    always @(  posedge    or1200_cpu_or1200_except_clk          or  posedge   or1200_cpu_or1200_except_rst  )
    begin
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_except_ex_dslot   <=1'b0;
            or1200_cpu_or1200_except_ex_pc   <=32'd0;
            or1200_cpu_or1200_except_ex_pc_val   <=1'b0;
            or1200_cpu_or1200_except_ex_exceptflags   <=3'b000;
            or1200_cpu_or1200_except_delayed1_ex_dslot   <=1'b0;
            or1200_cpu_or1200_except_delayed2_ex_dslot   <=1'b0;
        end
        else
            if (  or1200_cpu_or1200_except_ex_flushpipe  )
            begin
                or1200_cpu_or1200_except_ex_dslot   <=1'b0;
                or1200_cpu_or1200_except_ex_pc_val   <=1'b0;
                or1200_cpu_or1200_except_ex_exceptflags   <=3'b000;
                or1200_cpu_or1200_except_delayed1_ex_dslot   <=1'b0;
                or1200_cpu_or1200_except_delayed2_ex_dslot   <=1'b0;
            end
            else
                if (!  or1200_cpu_or1200_except_ex_freeze  &  or1200_cpu_or1200_except_id_freeze  )
                begin
                    or1200_cpu_or1200_except_ex_dslot   <=1'b0;
                    or1200_cpu_or1200_except_ex_pc   <=  or1200_cpu_or1200_except_id_pc  ;
                    or1200_cpu_or1200_except_ex_pc_val   <=  or1200_cpu_or1200_except_id_pc_val  ;
                    or1200_cpu_or1200_except_ex_exceptflags   <=3'b000;
                    or1200_cpu_or1200_except_delayed1_ex_dslot   <=  or1200_cpu_or1200_except_ex_dslot  ;
                    or1200_cpu_or1200_except_delayed2_ex_dslot   <=  or1200_cpu_or1200_except_delayed1_ex_dslot  ;
                end
                else
                    if (!  or1200_cpu_or1200_except_ex_freeze  )
                    begin
                        or1200_cpu_or1200_except_ex_dslot   <=  or1200_cpu_or1200_except_ex_branch_taken  ;
                        or1200_cpu_or1200_except_ex_pc   <=  or1200_cpu_or1200_except_id_pc  ;
                        or1200_cpu_or1200_except_ex_pc_val   <=  or1200_cpu_or1200_except_id_pc_val  ;
                        or1200_cpu_or1200_except_ex_exceptflags   <=  or1200_cpu_or1200_except_id_exceptflags  ;
                        or1200_cpu_or1200_except_delayed1_ex_dslot   <=  or1200_cpu_or1200_except_ex_dslot  ;
                        or1200_cpu_or1200_except_delayed2_ex_dslot   <=  or1200_cpu_or1200_except_delayed1_ex_dslot  ;
                    end
    end

    always @(  posedge    or1200_cpu_or1200_except_clk          or  posedge   or1200_cpu_or1200_except_rst  )
    begin
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_except_wb_pc   <=32'd0;
            or1200_cpu_or1200_except_dl_pc   <=32'd0;
        end
        else
            if (!  or1200_cpu_or1200_except_wb_freeze  )
            begin
                or1200_cpu_or1200_except_wb_pc   <=  or1200_cpu_or1200_except_ex_pc  ;
                or1200_cpu_or1200_except_dl_pc   <=  or1200_cpu_or1200_except_wb_pc  ;
            end
    end

    assign   or1200_cpu_or1200_except_except_flushpipe  =|  or1200_cpu_or1200_except_except_trig  &~|  or1200_cpu_or1200_except_state  ;
    always @(  posedge    or1200_cpu_or1200_except_clk          or  posedge   or1200_cpu_or1200_except_rst  )
    begin
        if (  or1200_cpu_or1200_except_rst  ==(1'b1))
        begin
            or1200_cpu_or1200_except_state   <=3'd0;
            or1200_cpu_or1200_except_except_type   <=4'h0;
            or1200_cpu_or1200_except_extend_flush   <=1'b0;
            or1200_cpu_or1200_except_epcr   <=32'b0;
            or1200_cpu_or1200_except_eear   <=32'b0;
            or1200_cpu_or1200_except_esr   <={2'h1,{17-3{1'b0}},1'b1};
            or1200_cpu_or1200_except_extend_flush_last   <=1'b0;
            or1200_cpu_or1200_except_dsx   <=1'b0;
        end
        else
        begin
            case (  or1200_cpu_or1200_except_state  )
                3 'd0:
                    if (  or1200_cpu_or1200_except_except_flushpipe  )
                    begin
                        or1200_cpu_or1200_except_state   <=3'd1;
                        or1200_cpu_or1200_except_extend_flush   <=1'b1;
                        or1200_cpu_or1200_except_esr   <=  or1200_cpu_or1200_except_sr_we   ?   or1200_cpu_or1200_except_to_sr  :  or1200_cpu_or1200_except_sr  ;
                        casez (  or1200_cpu_or1200_except_except_trig  )
                            14 'b1?_????_????_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'ha;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_ex_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b01_????_????_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h4;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_ex_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_delayed2_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_id_pc  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_delayed2_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_id_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_1???_????_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h2;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_01??_????_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h7;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_001?_????_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h6;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_lsu_addr  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0001_????_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h9;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_lsu_addr  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_dl_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_1???_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'he;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_01??_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'hc;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_delayed2_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_id_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_001?_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h3;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_lsu_addr  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_dl_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_0001_????:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h2;
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_lsu_addr  ;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_dl_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_0000_1???:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'hb;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_ex_dslot   ?   or1200_cpu_or1200_except_wb_pc  :  or1200_cpu_or1200_except_delayed1_ex_dslot   ?   or1200_cpu_or1200_except_dl_pc  :  or1200_cpu_or1200_except_delayed2_ex_dslot   ?   or1200_cpu_or1200_except_id_pc  :  or1200_cpu_or1200_except_ex_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_0000_01??:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'hd;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_id_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_0000_001?:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h8;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_id_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            14 'b00_0000_0000_0001:
                            begin
                                or1200_cpu_or1200_except_except_type   <=4'h5;
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_id_pc  ;
                                or1200_cpu_or1200_except_dsx   <=  or1200_cpu_or1200_except_ex_dslot  ;
                            end
                            default :
                                or1200_cpu_or1200_except_except_type   <=4'h0;
                        endcase
                    end
                    else
                        if (  or1200_cpu_or1200_except_pc_we  )
                        begin
                            or1200_cpu_or1200_except_state   <=3'd1;
                            or1200_cpu_or1200_except_extend_flush   <=1'b1;
                        end
                        else
                        begin
                            if (  or1200_cpu_or1200_except_epcr_we  )
                                or1200_cpu_or1200_except_epcr   <=  or1200_cpu_or1200_except_datain  ;
                            if (  or1200_cpu_or1200_except_eear_we  )
                                or1200_cpu_or1200_except_eear   <=  or1200_cpu_or1200_except_datain  ;
                            if (  or1200_cpu_or1200_except_esr_we  )
                                or1200_cpu_or1200_except_esr   <={  or1200_cpu_or1200_except_datain  [17-1],1'b1,  or1200_cpu_or1200_except_datain  [17-3:0]};
                        end
                3 'd1:
                    if (  or1200_cpu_or1200_except_icpu_ack_i  |  or1200_cpu_or1200_except_icpu_err_i  |  or1200_cpu_or1200_except_genpc_freeze  )
                        or1200_cpu_or1200_except_state   <=3'd2;
                3 'd2:
                    if (  or1200_cpu_or1200_except_except_type  ==4'he)
                    begin
                        or1200_cpu_or1200_except_state   <=3'd0;
                        or1200_cpu_or1200_except_extend_flush   <=1'b0;
                        or1200_cpu_or1200_except_extend_flush_last   <=1'b0;
                        or1200_cpu_or1200_except_except_type   <=4'h0;
                    end
                    else
                        or1200_cpu_or1200_except_state   <=3'd3;
                3 'd3:
                begin
                    or1200_cpu_or1200_except_state   <=3'd4;
                end
                3 'd4:
                begin
                    or1200_cpu_or1200_except_state   <=3'd5;
                    or1200_cpu_or1200_except_extend_flush   <=1'b0;
                    or1200_cpu_or1200_except_extend_flush_last   <=1'b0;
                end
                default :
                begin
                    if (!  or1200_cpu_or1200_except_if_stall  &&!  or1200_cpu_or1200_except_id_freeze  )
                    begin
                        or1200_cpu_or1200_except_state   <=3'd0;
                        or1200_cpu_or1200_except_except_type   <=4'h0;
                        or1200_cpu_or1200_except_extend_flush_last   <=1'b0;
                    end
                end
            endcase
        end
    end

    assign or1200_cpu_or1200_except_clk = or1200_cpu_clk;
    assign or1200_cpu_or1200_except_rst = or1200_cpu_rst;
    assign or1200_cpu_or1200_except_sig_ibuserr = or1200_cpu_except_ibuserr;
    assign or1200_cpu_or1200_except_sig_dbuserr = or1200_cpu_except_dbuserr;
    assign or1200_cpu_or1200_except_sig_illegal = or1200_cpu_except_illegal;
    assign or1200_cpu_or1200_except_sig_align = or1200_cpu_except_align;
    assign or1200_cpu_or1200_except_sig_range = or1200_cpu_sig_range;
    assign or1200_cpu_or1200_except_sig_dtlbmiss = or1200_cpu_except_dtlbmiss;
    assign or1200_cpu_or1200_except_sig_dmmufault = or1200_cpu_except_dmmufault;
    assign or1200_cpu_or1200_except_sig_int = or1200_cpu_sig_int;
    assign or1200_cpu_or1200_except_sig_syscall = or1200_cpu_sig_syscall;
    assign or1200_cpu_or1200_except_sig_trap = or1200_cpu_sig_trap;
    assign or1200_cpu_or1200_except_sig_itlbmiss = or1200_cpu_except_itlbmiss;
    assign or1200_cpu_or1200_except_sig_immufault = or1200_cpu_except_immufault;
    assign or1200_cpu_or1200_except_sig_tick = or1200_cpu_sig_tick;
    assign or1200_cpu_or1200_except_ex_branch_taken = or1200_cpu_ex_branch_taken;
    assign or1200_cpu_or1200_except_genpc_freeze = or1200_cpu_genpc_freeze;
    assign or1200_cpu_or1200_except_id_freeze = or1200_cpu_id_freeze;
    assign or1200_cpu_or1200_except_ex_freeze = or1200_cpu_ex_freeze;
    assign or1200_cpu_or1200_except_wb_freeze = or1200_cpu_wb_freeze;
    assign or1200_cpu_or1200_except_if_stall = or1200_cpu_if_stall;
    assign or1200_cpu_or1200_except_if_pc = or1200_cpu_if_pc;
    assign or1200_cpu_id_pc = or1200_cpu_or1200_except_id_pc;
    assign or1200_cpu_ex_pc = or1200_cpu_or1200_except_ex_pc;
    assign or1200_cpu_wb_pc = or1200_cpu_or1200_except_wb_pc;
    assign or1200_cpu_or1200_except_id_flushpipe = or1200_cpu_id_flushpipe;
    assign or1200_cpu_or1200_except_ex_flushpipe = or1200_cpu_ex_flushpipe;
    assign or1200_cpu_extend_flush = or1200_cpu_or1200_except_extend_flush;
    assign or1200_cpu_except_flushpipe = or1200_cpu_or1200_except_except_flushpipe;
    assign or1200_cpu_except_type = or1200_cpu_or1200_except_except_type;
    assign or1200_cpu_except_start = or1200_cpu_or1200_except_except_start;
    assign or1200_cpu_except_started = or1200_cpu_or1200_except_except_started;
    assign or1200_cpu_except_stop = or1200_cpu_or1200_except_except_stop;
    assign or1200_cpu_except_trig = or1200_cpu_or1200_except_except_trig;
    assign or1200_cpu_or1200_except_ex_void = or1200_cpu_ex_void;
    assign or1200_cpu_abort_mvspr = or1200_cpu_or1200_except_abort_mvspr;
    assign or1200_cpu_or1200_except_branch_op = or1200_cpu_branch_op;
    assign or1200_cpu_spr_dat_ppc = or1200_cpu_or1200_except_spr_dat_ppc;
    assign or1200_cpu_spr_dat_npc = or1200_cpu_or1200_except_spr_dat_npc;
    assign or1200_cpu_or1200_except_datain = or1200_cpu_spr_dat_cpu;
    assign or1200_cpu_or1200_except_du_dsr = or1200_cpu_du_dsr;
    assign or1200_cpu_or1200_except_epcr_we = or1200_cpu_epcr_we;
    assign or1200_cpu_or1200_except_eear_we = or1200_cpu_eear_we;
    assign or1200_cpu_or1200_except_esr_we = or1200_cpu_esr_we;
    assign or1200_cpu_or1200_except_pc_we = or1200_cpu_pc_we;
    assign or1200_cpu_epcr = or1200_cpu_or1200_except_epcr;
    assign or1200_cpu_eear = or1200_cpu_or1200_except_eear;
    assign or1200_cpu_or1200_except_du_dmr1 = or1200_cpu_du_dmr1;
    assign or1200_cpu_or1200_except_du_hwbkpt = or1200_cpu_du_hwbkpt;
    assign or1200_cpu_or1200_except_du_hwbkpt_ls_r = or1200_cpu_du_hwbkpt_ls_r;
    assign or1200_cpu_esr = or1200_cpu_or1200_except_esr;
    assign or1200_cpu_or1200_except_sr_we = or1200_cpu_sr_we;
    assign or1200_cpu_or1200_except_to_sr = or1200_cpu_to_sr;
    assign or1200_cpu_or1200_except_sr = or1200_cpu_sr;
    assign or1200_cpu_or1200_except_lsu_addr = or1200_cpu_dcpu_adr_o;
    assign or1200_cpu_abort_ex = or1200_cpu_or1200_except_abort_ex;
    assign or1200_cpu_or1200_except_icpu_ack_i = or1200_cpu_icpu_ack_i;
    assign or1200_cpu_or1200_except_icpu_err_i = or1200_cpu_icpu_err_i;
    assign or1200_cpu_or1200_except_dcpu_ack_i = or1200_cpu_dcpu_ack_i;
    assign or1200_cpu_or1200_except_dcpu_err_i = or1200_cpu_dcpu_err_i;
    assign or1200_cpu_or1200_except_sig_fp = or1200_cpu_sig_fp;
    assign or1200_cpu_or1200_except_fpcsr_fpee = or1200_cpu_fpcsr[0];
    assign or1200_cpu_dsx = or1200_cpu_or1200_except_dsx;


    wire [31:0] or1200_cpu_or1200_cfgr_spr_addr;
    reg [31:0] or1200_cpu_or1200_cfgr_spr_dat_o;

    always @(   or1200_cpu_or1200_cfgr_spr_addr   )
        if (~|  or1200_cpu_or1200_cfgr_spr_addr  [31:4])
        case (  or1200_cpu_or1200_cfgr_spr_addr  [3:0])
            4 'h0:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [5:0]=6'h08;
                or1200_cpu_or1200_cfgr_spr_dat_o   [15:6]=10'h000;
                or1200_cpu_or1200_cfgr_spr_dat_o   [23:16]=8'h00;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:24]=8'h13;
            end
            4 'h1:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [0]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [1]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [2]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [3]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [4]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [5]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [6]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [7]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [8]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [9]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [10]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [11]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [23:12]=12'h000;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:24]=8'h00;
            end
            4 'h2:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [3:0]=4'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [4]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [5]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [6]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [7]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [8]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [9]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:10]=22'h000000;
            end
            4 'h3:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [1:0]=2'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [4:2]=3'h6;
                or1200_cpu_or1200_cfgr_spr_dat_o   [7:5]=3'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [8]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [9]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [10]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [11]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:12]=20'h00000;
            end
            4 'h4:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [1:0]=2'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [4:2]=3'h6;
                or1200_cpu_or1200_cfgr_spr_dat_o   [7:5]=3'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [8]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [9]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [10]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [11]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:12]=20'h00000;
            end
            4 'h5:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [2:0]=3'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [6:3]=(13-4);
                or1200_cpu_or1200_cfgr_spr_dat_o   [7]=4==4 ? 1'b0:1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [8]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [9]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [10]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [11]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [12]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [13]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [14]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:15]=17'h00000;
            end
            4 'h6:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [2:0]=3'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [6:3]=(13-4);
                or1200_cpu_or1200_cfgr_spr_dat_o   [7]=4==4 ? 1'b0:1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [8]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [9]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [10]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [11]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [12]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [13]=1'b1;
                or1200_cpu_or1200_cfgr_spr_dat_o   [14]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:15]=17'h00000;
            end
            4 'h7:
            begin
                or1200_cpu_or1200_cfgr_spr_dat_o   [3:0]=4'h0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [4]=1'b0;
                or1200_cpu_or1200_cfgr_spr_dat_o   [31:5]=27'd0;
            end
            default :
                or1200_cpu_or1200_cfgr_spr_dat_o   =32'h0000_0000;
        endcase
        else
            or1200_cpu_or1200_cfgr_spr_dat_o   =32'h0000_0000;

    assign or1200_cpu_or1200_cfgr_spr_addr = or1200_cpu_spr_addr;
    assign or1200_cpu_spr_dat_cfgr = or1200_cpu_or1200_cfgr_spr_dat_o;

    assign or1200_cpu_clk = clk_i;
    assign or1200_cpu_rst = rst_i;
    assign ic_en = or1200_cpu_ic_en;
    assign icpu_adr_cpu = or1200_cpu_icpu_adr_o;
    assign icpu_cycstb_cpu = or1200_cpu_icpu_cycstb_o;
    assign icpu_sel_cpu = or1200_cpu_icpu_sel_o;
    assign icpu_tag_cpu = or1200_cpu_icpu_tag_o;
    assign or1200_cpu_icpu_dat_i = icpu_dat_qmem;
    assign or1200_cpu_icpu_ack_i = icpu_ack_qmem;
    assign or1200_cpu_icpu_rty_i = icpu_rty_immu;
    assign or1200_cpu_icpu_err_i = icpu_err_immu;
    assign or1200_cpu_icpu_adr_i = icpu_adr_immu;
    assign or1200_cpu_icpu_tag_i = icpu_tag_immu;
    assign immu_en = or1200_cpu_immu_en;
    assign id_void = or1200_cpu_id_void;
    assign id_insn = or1200_cpu_id_insn;
    assign ex_void = or1200_cpu_ex_void;
    assign ex_insn = or1200_cpu_ex_insn;
    assign ex_freeze = or1200_cpu_ex_freeze;
    assign wb_insn = or1200_cpu_wb_insn;
    assign wb_freeze = or1200_cpu_wb_freeze;
    assign id_pc = or1200_cpu_id_pc;
    assign ex_pc = or1200_cpu_ex_pc;
    assign wb_pc = or1200_cpu_wb_pc;
    assign branch_op = or1200_cpu_branch_op;
    assign spr_dat_npc = or1200_cpu_spr_dat_npc;
    assign rf_dataw = or1200_cpu_rf_dataw;
    assign flushpipe = or1200_cpu_ex_flushpipe;
    assign or1200_cpu_du_stall = du_stall;
    assign or1200_cpu_du_addr = du_addr;
    assign or1200_cpu_du_dat_du = du_dat_du;
    assign or1200_cpu_du_read = du_read;
    assign or1200_cpu_du_write = du_write;
    assign du_except_stop = or1200_cpu_du_except_stop;
    assign or1200_cpu_du_flush_pipe = du_flush_pipe;
    assign du_except_trig = or1200_cpu_du_except_trig;
    assign or1200_cpu_du_dsr = du_dsr;
    assign or1200_cpu_du_dmr1 = du_dmr1;
    assign or1200_cpu_du_hwbkpt = du_hwbkpt;
    assign or1200_cpu_du_hwbkpt_ls_r = du_hwbkpt_ls_r;
    assign du_dat_cpu = or1200_cpu_du_dat_cpu;
    assign du_lsu_store_dat = or1200_cpu_du_lsu_store_dat;
    assign du_lsu_load_dat = or1200_cpu_du_lsu_load_dat;
    assign abort_mvspr = or1200_cpu_abort_mvspr;
    assign abort_ex = or1200_cpu_abort_ex;
    assign dc_en = or1200_cpu_dc_en;
    assign dcpu_adr_cpu = or1200_cpu_dcpu_adr_o;
    assign dcpu_cycstb_cpu = or1200_cpu_dcpu_cycstb_o;
    assign dcpu_we_cpu = or1200_cpu_dcpu_we_o;
    assign dcpu_sel_cpu = or1200_cpu_dcpu_sel_o;
    assign dcpu_tag_cpu = or1200_cpu_dcpu_tag_o;
    assign dcpu_dat_cpu = or1200_cpu_dcpu_dat_o;
    assign or1200_cpu_dcpu_dat_i = dcpu_dat_qmem;
    assign or1200_cpu_dcpu_ack_i = dcpu_ack_qmem;
    assign or1200_cpu_dcpu_rty_i = dcpu_rty_qmem;
    assign or1200_cpu_dcpu_err_i = dcpu_err_dmmu;
    assign or1200_cpu_dcpu_tag_i = dcpu_tag_dmmu;
    assign sb_en = or1200_cpu_sb_en;
    assign dmmu_en = or1200_cpu_dmmu_en;
    assign dc_no_writethrough = or1200_cpu_dc_no_writethrough;
    assign or1200_cpu_boot_adr_sel_i = boot_adr_sel;
    assign or1200_cpu_sig_int = sig_int;
    assign or1200_cpu_sig_tick = sig_tick;
    assign supv = or1200_cpu_supv;
    assign spr_addr = or1200_cpu_spr_addr;
    assign spr_dat_cpu = or1200_cpu_spr_dat_cpu;
    assign or1200_cpu_spr_dat_pic = spr_dat_pic;
    assign or1200_cpu_spr_dat_tt = spr_dat_tt;
    assign or1200_cpu_spr_dat_pm = spr_dat_pm;
    assign or1200_cpu_spr_dat_dmmu = spr_dat_dmmu;
    assign or1200_cpu_spr_dat_immu = spr_dat_immu;
    assign or1200_cpu_spr_dat_du = spr_dat_du;
    assign spr_cs = or1200_cpu_spr_cs;
    assign spr_we = or1200_cpu_spr_we;
    assign or1200_cpu_mtspr_dc_done = mtspr_dc_done;


    wire  or1200_dmmu_top_clk;
    wire  or1200_dmmu_top_rst;
    wire  or1200_dmmu_top_dc_en;
    wire  or1200_dmmu_top_dmmu_en;
    wire  or1200_dmmu_top_supv;
    wire [ or1200_dmmu_top_aw -1:0] or1200_dmmu_top_dcpu_adr_i;
    wire  or1200_dmmu_top_dcpu_cycstb_i;
    wire  or1200_dmmu_top_dcpu_we_i;
    wire [3:0] or1200_dmmu_top_dcpu_tag_o;
    wire  or1200_dmmu_top_dcpu_err_o;
    wire  or1200_dmmu_top_spr_cs;
    wire  or1200_dmmu_top_spr_write;
    wire [ or1200_dmmu_top_aw -1:0] or1200_dmmu_top_spr_addr;
    wire [31:0] or1200_dmmu_top_spr_dat_i;
    wire [31:0] or1200_dmmu_top_spr_dat_o;
    wire  or1200_dmmu_top_qmemdmmu_err_i;
    wire [3:0] or1200_dmmu_top_qmemdmmu_tag_i;
    wire [ or1200_dmmu_top_aw -1:0] or1200_dmmu_top_qmemdmmu_adr_o;
    wire  or1200_dmmu_top_qmemdmmu_cycstb_o;
    wire  or1200_dmmu_top_qmemdmmu_ci_o;

    wire  or1200_dmmu_top_dtlb_spr_access  ;
    wire[31:13]  or1200_dmmu_top_dtlb_ppn  ;
    wire  or1200_dmmu_top_dtlb_hit  ;
    wire  or1200_dmmu_top_dtlb_uwe  ;
    wire  or1200_dmmu_top_dtlb_ure  ;
    wire  or1200_dmmu_top_dtlb_swe  ;
    wire  or1200_dmmu_top_dtlb_sre  ;
    wire[31:0]  or1200_dmmu_top_dtlb_dat_o  ;
    wire  or1200_dmmu_top_dtlb_en  ;
    wire  or1200_dmmu_top_dtlb_ci  ;
    wire  or1200_dmmu_top_fault  ;
    wire  or1200_dmmu_top_miss  ;
    reg  or1200_dmmu_top_dtlb_done  ;
    reg[31:13]  or1200_dmmu_top_dcpu_vpn_r  ;
    assign   or1200_dmmu_top_dtlb_spr_access  =  or1200_dmmu_top_spr_cs  ;
    assign   or1200_dmmu_top_dcpu_tag_o  =  or1200_dmmu_top_miss   ? 4'hd:  or1200_dmmu_top_fault   ? 4'hc:  or1200_dmmu_top_qmemdmmu_tag_i  ;
    assign   or1200_dmmu_top_dcpu_err_o  =  or1200_dmmu_top_miss  |  or1200_dmmu_top_fault  |  or1200_dmmu_top_qmemdmmu_err_i  ;
    always @(  posedge    or1200_dmmu_top_clk          or  posedge   or1200_dmmu_top_rst  )
        if (  or1200_dmmu_top_rst  ==(1'b1))
            or1200_dmmu_top_dtlb_done   <=1'b0;
        else
            if (  or1200_dmmu_top_dtlb_en  )
                or1200_dmmu_top_dtlb_done   <=  or1200_dmmu_top_dcpu_cycstb_i  ;
            else
                or1200_dmmu_top_dtlb_done   <=1'b0;

    assign   or1200_dmmu_top_qmemdmmu_cycstb_o  =(  or1200_dmmu_top_dc_en  &  or1200_dmmu_top_dmmu_en  ) ? !(  or1200_dmmu_top_miss  |  or1200_dmmu_top_fault  )&  or1200_dmmu_top_dtlb_done  &  or1200_dmmu_top_dcpu_cycstb_i  :!(  or1200_dmmu_top_miss  |  or1200_dmmu_top_fault  )&  or1200_dmmu_top_dcpu_cycstb_i  ;
    assign   or1200_dmmu_top_qmemdmmu_ci_o  =  or1200_dmmu_top_dmmu_en   ?   or1200_dmmu_top_dtlb_ci  :  or1200_dmmu_top_dcpu_adr_i  [31];
    always @(  posedge    or1200_dmmu_top_clk          or  posedge   or1200_dmmu_top_rst  )
        if (  or1200_dmmu_top_rst  ==(1'b1))
            or1200_dmmu_top_dcpu_vpn_r   <={32-13{1'b0}};
        else
            or1200_dmmu_top_dcpu_vpn_r   <=  or1200_dmmu_top_dcpu_adr_i  [31:13];

    assign   or1200_dmmu_top_qmemdmmu_adr_o  =  or1200_dmmu_top_dmmu_en   ? {  or1200_dmmu_top_dtlb_ppn  ,  or1200_dmmu_top_dcpu_adr_i  [13-1:0]}:  or1200_dmmu_top_dcpu_adr_i  ;
    assign   or1200_dmmu_top_spr_dat_o  =  or1200_dmmu_top_dtlb_spr_access   ?   or1200_dmmu_top_dtlb_dat_o  :32'h00000000;
    assign   or1200_dmmu_top_fault  =  or1200_dmmu_top_dtlb_done  &((!  or1200_dmmu_top_dcpu_we_i  &!  or1200_dmmu_top_supv  &!  or1200_dmmu_top_dtlb_ure  )||(!  or1200_dmmu_top_dcpu_we_i  &  or1200_dmmu_top_supv  &!  or1200_dmmu_top_dtlb_sre  )||(  or1200_dmmu_top_dcpu_we_i  &!  or1200_dmmu_top_supv  &!  or1200_dmmu_top_dtlb_uwe  )||(  or1200_dmmu_top_dcpu_we_i  &  or1200_dmmu_top_supv  &!  or1200_dmmu_top_dtlb_swe  ));
    assign   or1200_dmmu_top_miss  =  or1200_dmmu_top_dtlb_done  &!  or1200_dmmu_top_dtlb_hit  ;
    assign   or1200_dmmu_top_dtlb_en  =  or1200_dmmu_top_dmmu_en  &  or1200_dmmu_top_dcpu_cycstb_i  ;

    wire  or1200_dmmu_top_or1200_dmmu_tlb_clk;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_rst;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_tlb_en;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_aw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_vaddr;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_hit;
    wire [31:13] or1200_dmmu_top_or1200_dmmu_tlb_ppn;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_uwe;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_ure;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_swe;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_sre;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_ci;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_spr_write;
    wire [31:0] or1200_dmmu_top_or1200_dmmu_tlb_spr_addr;
    wire [31:0] or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i;
    wire [31:0] or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o;

    wire[31:13+6-1+1]  or1200_dmmu_top_or1200_dmmu_tlb_vpn  ;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_v  ;
    wire[6-1:0]  or1200_dmmu_top_or1200_dmmu_tlb_tlb_index  ;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en  ;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we  ;
    wire[32-6-13+1-1:0]  or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in  ;
    wire[32-6-13+1-1:0]  or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out  ;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en  ;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we  ;
    wire[32-13+5-1:0]  or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in  ;
    wire[32-13+5-1:0]  or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out  ;
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en  =  or1200_dmmu_top_or1200_dmmu_tlb_tlb_en  |(  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs  &!  or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [7]);
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we  =  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs  &  or1200_dmmu_top_or1200_dmmu_tlb_spr_write  &!  or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [7];
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en  =  or1200_dmmu_top_or1200_dmmu_tlb_tlb_en  |(  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs  &  or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [7]);
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we  =  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs  &  or1200_dmmu_top_or1200_dmmu_tlb_spr_write  &  or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [7];
    assign   or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o  =(  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs  &!  or1200_dmmu_top_or1200_dmmu_tlb_spr_write  &!  or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [7]) ? {  or1200_dmmu_top_or1200_dmmu_tlb_vpn  ,  or1200_dmmu_top_or1200_dmmu_tlb_tlb_index  ,{32-6-13-7{1'b0}},1'b0,5'b00000,  or1200_dmmu_top_or1200_dmmu_tlb_v  }:(  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs  &!  or1200_dmmu_top_or1200_dmmu_tlb_spr_write  &  or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [7]) ? {  or1200_dmmu_top_or1200_dmmu_tlb_ppn  ,{13-10{1'b0}},  or1200_dmmu_top_or1200_dmmu_tlb_swe  ,  or1200_dmmu_top_or1200_dmmu_tlb_sre  ,  or1200_dmmu_top_or1200_dmmu_tlb_uwe  ,  or1200_dmmu_top_or1200_dmmu_tlb_ure  ,{4{1'b0}},  or1200_dmmu_top_or1200_dmmu_tlb_ci  ,1'b0}:32'h00000000;
    assign {  or1200_dmmu_top_or1200_dmmu_tlb_vpn  ,  or1200_dmmu_top_or1200_dmmu_tlb_v  }=  or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out  ;
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in  ={  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [31:13+6-1+1],  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [0]};
    assign {  or1200_dmmu_top_or1200_dmmu_tlb_ppn  ,  or1200_dmmu_top_or1200_dmmu_tlb_swe  ,  or1200_dmmu_top_or1200_dmmu_tlb_sre  ,  or1200_dmmu_top_or1200_dmmu_tlb_uwe  ,  or1200_dmmu_top_or1200_dmmu_tlb_ure  ,  or1200_dmmu_top_or1200_dmmu_tlb_ci  }=  or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out  ;
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in  ={  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [31:13],  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [9],  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [8],  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [7],  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [6],  or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i  [1]};
    assign   or1200_dmmu_top_or1200_dmmu_tlb_hit  =(  or1200_dmmu_top_or1200_dmmu_tlb_vpn  ==  or1200_dmmu_top_or1200_dmmu_tlb_vaddr  [31:13+6-1+1])&  or1200_dmmu_top_or1200_dmmu_tlb_v  ;
    assign   or1200_dmmu_top_or1200_dmmu_tlb_tlb_index  =  or1200_dmmu_top_or1200_dmmu_tlb_spr_cs   ?   or1200_dmmu_top_or1200_dmmu_tlb_spr_addr  [6-1:0]:  or1200_dmmu_top_or1200_dmmu_tlb_vaddr  [13+6-1:13];

    wire  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_aw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_dw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_dw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_doq;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce;
    wire  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_aw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_dw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di;
    wire [ or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_dw -1:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_doq;

    reg[  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_dw  -1:0]  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_mem  [(1<<  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_aw  )-1:0];
    reg[  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_aw  -1:0]  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr_reg  ;
    assign   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_doq  =  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_mem  [  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr_reg  ];
    always @( posedge   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk  )
        if (  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce  )
            or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr_reg   <=  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr  ;

    always @( posedge   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk  )
        if (  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we  &&  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce  )
            or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_mem   [  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr  ]<=  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di  ;




    reg[  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_dw  -1:0]  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_mem  [(1<<  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_aw  )-1:0];
    reg[  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_aw  -1:0]  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr_reg  ;
    assign   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_doq  =  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_mem  [  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr_reg  ];
    always @( posedge   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk  )
        if (  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce  )
            or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr_reg   <=  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr  ;

    always @( posedge   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk  )
        if (  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we  &&  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce  )
            or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_mem   [  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr  ]<=  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di  ;

    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk = or1200_dmmu_top_or1200_dmmu_tlb_clk;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr = or1200_dmmu_top_or1200_dmmu_tlb_tlb_index;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in;
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_doq;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk = or1200_dmmu_top_or1200_dmmu_tlb_clk;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr = or1200_dmmu_top_or1200_dmmu_tlb_tlb_index;
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in;
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_doq;

    assign or1200_dmmu_top_or1200_dmmu_tlb_clk = or1200_dmmu_top_clk;
    assign or1200_dmmu_top_or1200_dmmu_tlb_rst = or1200_dmmu_top_rst;
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_en = or1200_dmmu_top_dtlb_en;
    assign or1200_dmmu_top_or1200_dmmu_tlb_vaddr = or1200_dmmu_top_dcpu_adr_i;
    assign or1200_dmmu_top_dtlb_hit = or1200_dmmu_top_or1200_dmmu_tlb_hit;
    assign or1200_dmmu_top_dtlb_ppn = or1200_dmmu_top_or1200_dmmu_tlb_ppn;
    assign or1200_dmmu_top_dtlb_uwe = or1200_dmmu_top_or1200_dmmu_tlb_uwe;
    assign or1200_dmmu_top_dtlb_ure = or1200_dmmu_top_or1200_dmmu_tlb_ure;
    assign or1200_dmmu_top_dtlb_swe = or1200_dmmu_top_or1200_dmmu_tlb_swe;
    assign or1200_dmmu_top_dtlb_sre = or1200_dmmu_top_or1200_dmmu_tlb_sre;
    assign or1200_dmmu_top_dtlb_ci = or1200_dmmu_top_or1200_dmmu_tlb_ci;
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_cs = or1200_dmmu_top_dtlb_spr_access;
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_write = or1200_dmmu_top_spr_write;
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_addr = or1200_dmmu_top_spr_addr;
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i = or1200_dmmu_top_spr_dat_i;
    assign or1200_dmmu_top_dtlb_dat_o = or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o;

    assign or1200_dmmu_top_clk = clk_i;
    assign or1200_dmmu_top_rst = rst_i;
    assign or1200_dmmu_top_dc_en = dc_en;
    assign or1200_dmmu_top_dmmu_en = dmmu_en;
    assign or1200_dmmu_top_supv = supv;
    assign or1200_dmmu_top_dcpu_adr_i = dcpu_adr_cpu;
    assign or1200_dmmu_top_dcpu_cycstb_i = dcpu_cycstb_cpu;
    assign or1200_dmmu_top_dcpu_we_i = dcpu_we_cpu;
    assign dcpu_tag_dmmu = or1200_dmmu_top_dcpu_tag_o;
    assign dcpu_err_dmmu = or1200_dmmu_top_dcpu_err_o;
    assign or1200_dmmu_top_spr_cs = spr_cs[5'd01];
    assign or1200_dmmu_top_spr_write = spr_we;
    assign or1200_dmmu_top_spr_addr = spr_addr;
    assign or1200_dmmu_top_spr_dat_i = spr_dat_cpu;
    assign spr_dat_dmmu = or1200_dmmu_top_spr_dat_o;
    assign or1200_dmmu_top_qmemdmmu_err_i = qmemdmmu_err_qmem;
    assign or1200_dmmu_top_qmemdmmu_tag_i = qmemdmmu_tag_qmem;
    assign qmemdmmu_adr_dmmu = or1200_dmmu_top_qmemdmmu_adr_o;
    assign qmemdmmu_cycstb_dmmu = or1200_dmmu_top_qmemdmmu_cycstb_o;
    assign qmemdmmu_ci_dmmu = or1200_dmmu_top_qmemdmmu_ci_o;


    wire  or1200_dc_top_clk;
    wire  or1200_dc_top_rst;
    wire [ or1200_dc_top_dw -1:0] or1200_dc_top_dcsb_dat_o;
    wire [31:0] or1200_dc_top_dcsb_adr_o;
    wire  or1200_dc_top_dcsb_cyc_o;
    wire  or1200_dc_top_dcsb_stb_o;
    wire  or1200_dc_top_dcsb_we_o;
    wire [3:0] or1200_dc_top_dcsb_sel_o;
    wire  or1200_dc_top_dcsb_cab_o;
    wire [ or1200_dc_top_dw -1:0] or1200_dc_top_dcsb_dat_i;
    wire  or1200_dc_top_dcsb_ack_i;
    wire  or1200_dc_top_dcsb_err_i;
    wire  or1200_dc_top_dc_en;
    wire [31:0] or1200_dc_top_dcqmem_adr_i;
    wire  or1200_dc_top_dcqmem_cycstb_i;
    wire  or1200_dc_top_dcqmem_ci_i;
    wire  or1200_dc_top_dcqmem_we_i;
    wire [3:0] or1200_dc_top_dcqmem_sel_i;
    wire [3:0] or1200_dc_top_dcqmem_tag_i;
    wire [ or1200_dc_top_dw -1:0] or1200_dc_top_dcqmem_dat_i;
    wire [ or1200_dc_top_dw -1:0] or1200_dc_top_dcqmem_dat_o;
    wire  or1200_dc_top_dcqmem_ack_o;
    wire  or1200_dc_top_dcqmem_rty_o;
    wire  or1200_dc_top_dcqmem_err_o;
    wire [3:0] or1200_dc_top_dcqmem_tag_o;
    wire  or1200_dc_top_dc_no_writethrough;
    wire  or1200_dc_top_spr_cs;
    wire  or1200_dc_top_spr_write;
    wire [31:0] or1200_dc_top_spr_dat_i;
    wire [ or1200_dc_top_aw -1:0] or1200_dc_top_spr_addr;
    wire  or1200_dc_top_mtspr_dc_done;

    wire  or1200_dc_top_tag_v  ;
    wire[20-2:0]  or1200_dc_top_tag  ;
    wire  or1200_dc_top_dirty  ;
    wire[  or1200_dc_top_dw  -1:0]  or1200_dc_top_to_dcram  ;
    wire[  or1200_dc_top_dw  -1:0]  or1200_dc_top_from_dcram  ;
    wire[3:0]  or1200_dc_top_dcram_we  ;
    wire  or1200_dc_top_dctag_we  ;
    wire[31:0]  or1200_dc_top_dc_addr  ;
    wire  or1200_dc_top_dcfsm_biu_read  ;
    wire  or1200_dc_top_dcfsm_biu_write  ;
    wire  or1200_dc_top_dcfsm_dcram_di_sel  ;
    wire  or1200_dc_top_dcfsm_biu_do_sel  ;
    reg  or1200_dc_top_tagcomp_miss  ;
    wire[13-1:4]  or1200_dc_top_dctag_addr  ;
    wire  or1200_dc_top_dctag_en  ;
    wire  or1200_dc_top_dctag_v  ;
    wire  or1200_dc_top_dctag_dirty  ;
    wire  or1200_dc_top_dc_block_invalidate  ;
    wire  or1200_dc_top_dc_block_flush  ;
    wire  or1200_dc_top_dc_block_writeback  ;
    wire  or1200_dc_top_dcfsm_first_hit_ack  ;
    wire  or1200_dc_top_dcfsm_first_miss_ack  ;
    wire  or1200_dc_top_dcfsm_first_miss_err  ;
    wire  or1200_dc_top_dcfsm_burst  ;
    wire  or1200_dc_top_dcfsm_tag_we  ;
    wire  or1200_dc_top_dcfsm_tag_valid  ;
    wire  or1200_dc_top_dcfsm_tag_dirty  ;
    assign   or1200_dc_top_dcsb_adr_o  =  or1200_dc_top_dc_addr  ;
    assign   or1200_dc_top_dc_block_invalidate  =  or1200_dc_top_spr_cs  &  or1200_dc_top_spr_write  &((  or1200_dc_top_spr_addr  [3-1:0]==3'd3)|(  or1200_dc_top_spr_addr  [3-1:0]==3'd2));
    assign   or1200_dc_top_dc_block_flush  =0;
    assign   or1200_dc_top_dc_block_writeback  =0;
    assign   or1200_dc_top_dctag_we  =  or1200_dc_top_dcfsm_tag_we  |  or1200_dc_top_dc_block_invalidate  ;
    assign   or1200_dc_top_dctag_addr  =  or1200_dc_top_dc_block_invalidate   ?   or1200_dc_top_spr_dat_i  [13-1:4]:  or1200_dc_top_dc_addr  [13-1:4];
    assign   or1200_dc_top_dctag_en  =  or1200_dc_top_dc_block_invalidate  |  or1200_dc_top_dc_en  ;
    assign   or1200_dc_top_dctag_v  =  or1200_dc_top_dc_block_invalidate   ? 1'b0:  or1200_dc_top_dcfsm_tag_valid  ;
    assign   or1200_dc_top_dctag_dirty  =  or1200_dc_top_dc_block_invalidate   ? 1'b0:  or1200_dc_top_dcfsm_tag_dirty  ;
    assign   or1200_dc_top_dcsb_dat_o  =  or1200_dc_top_dcfsm_biu_do_sel   ?   or1200_dc_top_from_dcram  :  or1200_dc_top_dcqmem_dat_i  ;
    assign   or1200_dc_top_dcsb_cyc_o  =(  or1200_dc_top_dc_en  ) ?   or1200_dc_top_dcfsm_biu_read  |  or1200_dc_top_dcfsm_biu_write  :  or1200_dc_top_dcqmem_cycstb_i  ;
    assign   or1200_dc_top_dcsb_stb_o  =(  or1200_dc_top_dc_en  ) ?   or1200_dc_top_dcfsm_biu_read  |  or1200_dc_top_dcfsm_biu_write  :  or1200_dc_top_dcqmem_cycstb_i  ;
    assign   or1200_dc_top_dcsb_we_o  =(  or1200_dc_top_dc_en  ) ?   or1200_dc_top_dcfsm_biu_write  :  or1200_dc_top_dcqmem_we_i  ;
    assign   or1200_dc_top_dcsb_sel_o  =(  or1200_dc_top_dc_en  &  or1200_dc_top_dcfsm_burst  ) ? 4'b1111:  or1200_dc_top_dcqmem_sel_i  ;
    assign   or1200_dc_top_dcsb_cab_o  =  or1200_dc_top_dc_en  &  or1200_dc_top_dcfsm_burst  &  or1200_dc_top_dcsb_cyc_o  ;
    assign   or1200_dc_top_dcqmem_rty_o  =~  or1200_dc_top_dcqmem_ack_o  ;
    assign   or1200_dc_top_dcqmem_tag_o  =  or1200_dc_top_dcqmem_err_o   ? 4'hb:  or1200_dc_top_dcqmem_tag_i  ;
    assign   or1200_dc_top_dcqmem_ack_o  =  or1200_dc_top_dc_en   ?   or1200_dc_top_dcfsm_first_hit_ack  |  or1200_dc_top_dcfsm_first_miss_ack  :  or1200_dc_top_dcsb_ack_i  ;
    assign   or1200_dc_top_dcqmem_err_o  =  or1200_dc_top_dc_en   ?   or1200_dc_top_dcfsm_first_miss_err  :  or1200_dc_top_dcsb_err_i  ;
    assign   or1200_dc_top_to_dcram  =(  or1200_dc_top_dcfsm_dcram_di_sel  ) ?   or1200_dc_top_dcsb_dat_i  :  or1200_dc_top_dcqmem_dat_i  ;
    assign   or1200_dc_top_dcqmem_dat_o  =  or1200_dc_top_dcfsm_first_miss_ack  |!  or1200_dc_top_dc_en   ?   or1200_dc_top_dcsb_dat_i  :  or1200_dc_top_from_dcram  ;
    wire[31:13-1+1]  or1200_dc_top_dcqmem_adr_i_tag  ;
    assign   or1200_dc_top_dcqmem_adr_i_tag  =  or1200_dc_top_dcqmem_adr_i  [31:13-1+1];
    always @(     or1200_dc_top_tag              or    or1200_dc_top_dcqmem_adr_i_tag           or    or1200_dc_top_tag_v   )
    begin
        if ((  or1200_dc_top_tag  !=  or1200_dc_top_dcqmem_adr_i_tag  )||!  or1200_dc_top_tag_v  )
            or1200_dc_top_tagcomp_miss   =1'b1;
        else
            or1200_dc_top_tagcomp_miss   =1'b0;
    end


    wire  or1200_dc_top_or1200_dc_fsm_clk;
    wire  or1200_dc_top_or1200_dc_fsm_rst;
    wire  or1200_dc_top_or1200_dc_fsm_dc_en;
    wire  or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i;
    wire  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i;
    wire  or1200_dc_top_or1200_dc_fsm_dcqmem_we_i;
    wire [3:0] or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i;
    wire  or1200_dc_top_or1200_dc_fsm_tagcomp_miss;
    wire  or1200_dc_top_or1200_dc_fsm_biudata_valid;
    wire  or1200_dc_top_or1200_dc_fsm_biudata_error;
    wire [31:0] or1200_dc_top_or1200_dc_fsm_lsu_addr;
    wire [3:0] or1200_dc_top_or1200_dc_fsm_dcram_we;
    wire  or1200_dc_top_or1200_dc_fsm_biu_read;
    wire  or1200_dc_top_or1200_dc_fsm_biu_write;
    wire  or1200_dc_top_or1200_dc_fsm_biu_do_sel;
    wire  or1200_dc_top_or1200_dc_fsm_dcram_di_sel;
    wire  or1200_dc_top_or1200_dc_fsm_first_hit_ack;
    wire  or1200_dc_top_or1200_dc_fsm_first_miss_ack;
    wire  or1200_dc_top_or1200_dc_fsm_first_miss_err;
    wire  or1200_dc_top_or1200_dc_fsm_burst;
    wire  or1200_dc_top_or1200_dc_fsm_tag_we;
    wire  or1200_dc_top_or1200_dc_fsm_tag_valid;
    wire [31:0] or1200_dc_top_or1200_dc_fsm_dc_addr;
    wire  or1200_dc_top_or1200_dc_fsm_dc_no_writethrough;
    wire  or1200_dc_top_or1200_dc_fsm_tag_dirty;
    wire  or1200_dc_top_or1200_dc_fsm_dirty;
    wire [20-2:0] or1200_dc_top_or1200_dc_fsm_tag;
    wire  or1200_dc_top_or1200_dc_fsm_tag_v;
    wire  or1200_dc_top_or1200_dc_fsm_dc_block_flush;
    wire  or1200_dc_top_or1200_dc_fsm_dc_block_writeback;
    wire [31:0] or1200_dc_top_or1200_dc_fsm_spr_dat_i;
    wire  or1200_dc_top_or1200_dc_fsm_mtspr_dc_done;
    wire  or1200_dc_top_or1200_dc_fsm_spr_cswe;

    reg[31:0]  or1200_dc_top_or1200_dc_fsm_addr_r  ;
    reg[2:0]  or1200_dc_top_or1200_dc_fsm_state  ;
    reg[4-1:0]  or1200_dc_top_or1200_dc_fsm_cnt  ;
    reg  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  ;
    reg  or1200_dc_top_or1200_dc_fsm_store  ;
    reg  or1200_dc_top_or1200_dc_fsm_load  ;
    reg  or1200_dc_top_or1200_dc_fsm_cache_inhibit  ;
    reg  or1200_dc_top_or1200_dc_fsm_cache_miss  ;
    reg  or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback  ;
    reg  or1200_dc_top_or1200_dc_fsm_did_early_load_ack  ;
    reg  or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush  ;
    reg  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback  ;
    reg  or1200_dc_top_or1200_dc_fsm_cache_wb  ;
    wire  or1200_dc_top_or1200_dc_fsm_load_hit_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_load_miss_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_load_inhibit_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_store_hit_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_store_inhibit_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_store_miss_ack  ;
    wire  or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load  ;
    wire  or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load  ;
    wire  or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop  ;
    wire  or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set  ;
    wire  or1200_dc_top_or1200_dc_fsm_writethrough  ;
    wire  or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval  ;
    wire[(4-1)-2:0]  or1200_dc_top_or1200_dc_fsm_next_addr_word  ;
    assign   or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval  =(  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i  )|(!  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &  or1200_dc_top_or1200_dc_fsm_cache_inhibit  );
    assign   or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd3)&  or1200_dc_top_or1200_dc_fsm_dcqmem_we_i  &!  or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback  &!  or1200_dc_top_or1200_dc_fsm_did_early_load_ack  ;
    assign   or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd2)&  or1200_dc_top_or1200_dc_fsm_load  &  or1200_dc_top_or1200_dc_fsm_biudata_valid  ;
    assign   or1200_dc_top_or1200_dc_fsm_dcram_we  =(({4{  or1200_dc_top_or1200_dc_fsm_store_hit_ack  |  or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack  }}|{4{  or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load  }})&  or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i  )|{4{  or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load  }};
    assign   or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop  =((  or1200_dc_top_or1200_dc_fsm_state  ==3'd2)&  or1200_dc_top_or1200_dc_fsm_biudata_valid  &!(|  or1200_dc_top_or1200_dc_fsm_cnt  ));
    assign   or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set  =0;
    assign   or1200_dc_top_or1200_dc_fsm_mtspr_dc_done  =1'b1;
    assign   or1200_dc_top_or1200_dc_fsm_tag_dirty  =  or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set  ;
    assign   or1200_dc_top_or1200_dc_fsm_tag_we  =  or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop  |  or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set  |(  or1200_dc_top_or1200_dc_fsm_state  ==3'd6);
    assign   or1200_dc_top_or1200_dc_fsm_tag_valid  =(  or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop  &(  or1200_dc_top_or1200_dc_fsm_load  |(  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback  )))|  or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set  ;
    assign   or1200_dc_top_or1200_dc_fsm_biu_read  =((  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&(((  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  &!  or1200_dc_top_or1200_dc_fsm_dirty  &!(  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_writethrough  ))|(  or1200_dc_top_or1200_dc_fsm_load  &  or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval  ))&  or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i  ))|((  or1200_dc_top_or1200_dc_fsm_state  ==3'd2)&  or1200_dc_top_or1200_dc_fsm_load  );
    assign   or1200_dc_top_or1200_dc_fsm_biu_write  =((  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&(((  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  &  or1200_dc_top_or1200_dc_fsm_dirty  )|(  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_writethrough  ))|(  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval  ))&  or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i  )|((  or1200_dc_top_or1200_dc_fsm_state  ==3'd2)&  or1200_dc_top_or1200_dc_fsm_store  );
    assign   or1200_dc_top_or1200_dc_fsm_dcram_di_sel  =  or1200_dc_top_or1200_dc_fsm_load  ;
    assign   or1200_dc_top_or1200_dc_fsm_biu_do_sel  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd2)&  or1200_dc_top_or1200_dc_fsm_store  ;
    assign   or1200_dc_top_or1200_dc_fsm_next_addr_word  =  or1200_dc_top_or1200_dc_fsm_addr_r  [4-1:2]+1;
    assign   or1200_dc_top_or1200_dc_fsm_dc_addr  =((  or1200_dc_top_or1200_dc_fsm_dc_block_flush  &!  or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush  )|(  or1200_dc_top_or1200_dc_fsm_dc_block_writeback  &!  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback  )) ?   or1200_dc_top_or1200_dc_fsm_spr_dat_i  :(  or1200_dc_top_or1200_dc_fsm_state  ==3'd5) ?   or1200_dc_top_or1200_dc_fsm_addr_r  :(  or1200_dc_top_or1200_dc_fsm_state  ==3'd0|  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  ) ?   or1200_dc_top_or1200_dc_fsm_lsu_addr  :(  or1200_dc_top_or1200_dc_fsm_state  ==3'd2&  or1200_dc_top_or1200_dc_fsm_biudata_valid  &  or1200_dc_top_or1200_dc_fsm_store  ) ? {  or1200_dc_top_or1200_dc_fsm_addr_r  [31:4],  or1200_dc_top_or1200_dc_fsm_next_addr_word  ,2'b00}:  or1200_dc_top_or1200_dc_fsm_addr_r  ;
    assign   or1200_dc_top_or1200_dc_fsm_writethrough  =1;
    assign   or1200_dc_top_or1200_dc_fsm_first_hit_ack  =  or1200_dc_top_or1200_dc_fsm_load_hit_ack  |  or1200_dc_top_or1200_dc_fsm_store_hit_ack  |  or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack  |  or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack  |  or1200_dc_top_or1200_dc_fsm_store_inhibit_ack  |  or1200_dc_top_or1200_dc_fsm_store_miss_ack  ;
    assign   or1200_dc_top_or1200_dc_fsm_first_miss_ack  =~  or1200_dc_top_or1200_dc_fsm_first_hit_ack  &(  or1200_dc_top_or1200_dc_fsm_load_miss_ack  |  or1200_dc_top_or1200_dc_fsm_load_inhibit_ack  );
    assign   or1200_dc_top_or1200_dc_fsm_load_hit_ack  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &!  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  &!  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i  &  or1200_dc_top_or1200_dc_fsm_load  ;
    assign   or1200_dc_top_or1200_dc_fsm_store_hit_ack  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &!  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  &!  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i  &  or1200_dc_top_or1200_dc_fsm_store  &!  or1200_dc_top_or1200_dc_fsm_writethrough  ;
    assign   or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&!  or1200_dc_top_or1200_dc_fsm_cache_miss  &!  or1200_dc_top_or1200_dc_fsm_cache_inhibit  &  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_writethrough  &  or1200_dc_top_or1200_dc_fsm_biudata_valid  ;
    assign   or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&  or1200_dc_top_or1200_dc_fsm_cache_miss  &!  or1200_dc_top_or1200_dc_fsm_cache_inhibit  &  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_writethrough  &  or1200_dc_top_or1200_dc_fsm_biudata_valid  ;
    assign   or1200_dc_top_or1200_dc_fsm_store_inhibit_ack  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_cache_inhibit  &  or1200_dc_top_or1200_dc_fsm_biudata_valid  ;
    assign   or1200_dc_top_or1200_dc_fsm_load_miss_ack  =((  or1200_dc_top_or1200_dc_fsm_state  ==3'd2)&  or1200_dc_top_or1200_dc_fsm_load  &(  or1200_dc_top_or1200_dc_fsm_cnt  ==((1<<4)-4))&  or1200_dc_top_or1200_dc_fsm_biudata_valid  &!(  or1200_dc_top_or1200_dc_fsm_dcqmem_we_i  &!  or1200_dc_top_or1200_dc_fsm_writethrough  ));
    assign   or1200_dc_top_or1200_dc_fsm_load_inhibit_ack  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd1)&  or1200_dc_top_or1200_dc_fsm_load  &  or1200_dc_top_or1200_dc_fsm_cache_inhibit  &  or1200_dc_top_or1200_dc_fsm_biudata_valid  ;
    assign   or1200_dc_top_or1200_dc_fsm_store_miss_ack  =  or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load  ;
    assign   or1200_dc_top_or1200_dc_fsm_first_miss_err  =  or1200_dc_top_or1200_dc_fsm_biudata_error  &  or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i  ;
    assign   or1200_dc_top_or1200_dc_fsm_burst  =(  or1200_dc_top_or1200_dc_fsm_state  ==3'd2);
    always @(  posedge    or1200_dc_top_or1200_dc_fsm_clk          or  posedge   or1200_dc_top_or1200_dc_fsm_rst  )
    begin
        if (  or1200_dc_top_or1200_dc_fsm_rst  ==(1'b1))
        begin
            or1200_dc_top_or1200_dc_fsm_state   <=3'd0;
            or1200_dc_top_or1200_dc_fsm_addr_r   <=32'd0;
            or1200_dc_top_or1200_dc_fsm_hitmiss_eval   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_store   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_load   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_cnt   <=4'd0;
            or1200_dc_top_or1200_dc_fsm_cache_miss   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_cache_inhibit   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_did_early_load_ack   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush   <=1'b0;
            or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback   <=1'b0;
        end
        else
        case (  or1200_dc_top_or1200_dc_fsm_state  )
            3 'd0:
            begin
                if (  or1200_dc_top_or1200_dc_fsm_dc_en  &(  or1200_dc_top_or1200_dc_fsm_dc_block_flush  |  or1200_dc_top_or1200_dc_fsm_dc_block_writeback  ))
                begin
                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush   <=  or1200_dc_top_or1200_dc_fsm_dc_block_flush  ;
                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback   <=  or1200_dc_top_or1200_dc_fsm_dc_block_writeback  ;
                    or1200_dc_top_or1200_dc_fsm_hitmiss_eval   <=1'b1;
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd5;
                    or1200_dc_top_or1200_dc_fsm_addr_r   <=  or1200_dc_top_or1200_dc_fsm_spr_dat_i  ;
                end
                else
                    if (  or1200_dc_top_or1200_dc_fsm_dc_en  &  or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i  )
                    begin
                        or1200_dc_top_or1200_dc_fsm_state   <=3'd1;
                        or1200_dc_top_or1200_dc_fsm_hitmiss_eval   <=1'b1;
                        or1200_dc_top_or1200_dc_fsm_store   <=  or1200_dc_top_or1200_dc_fsm_dcqmem_we_i  ;
                        or1200_dc_top_or1200_dc_fsm_load   <=!  or1200_dc_top_or1200_dc_fsm_dcqmem_we_i  ;
                    end
            end
            3 'd1:
            begin
                or1200_dc_top_or1200_dc_fsm_hitmiss_eval   <=1'b0;
                if (  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  )
                begin
                    or1200_dc_top_or1200_dc_fsm_cache_inhibit   <=  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i  ;
                    or1200_dc_top_or1200_dc_fsm_cache_miss   <=  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  ;
                    or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback   <=  or1200_dc_top_or1200_dc_fsm_dirty  ;
                    or1200_dc_top_or1200_dc_fsm_addr_r   <=  or1200_dc_top_or1200_dc_fsm_lsu_addr  ;
                end
                if (  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  &!(  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_writethrough  )&!  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i  )
                begin
                    if (  or1200_dc_top_or1200_dc_fsm_dirty  )
                    begin
                        or1200_dc_top_or1200_dc_fsm_addr_r   <={  or1200_dc_top_or1200_dc_fsm_tag  ,  or1200_dc_top_or1200_dc_fsm_lsu_addr  [13-1:2],2'd0};
                        or1200_dc_top_or1200_dc_fsm_load   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_store   <=1'b1;
                    end
                    else
                    begin
                        or1200_dc_top_or1200_dc_fsm_addr_r   <=  or1200_dc_top_or1200_dc_fsm_lsu_addr  ;
                        or1200_dc_top_or1200_dc_fsm_load   <=1'b1;
                        or1200_dc_top_or1200_dc_fsm_store   <=1'b0;
                    end
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd2;
                    or1200_dc_top_or1200_dc_fsm_cnt   <=((1<<4)-4);
                end
                else
                    if (!  or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i  |(!  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &(  or1200_dc_top_or1200_dc_fsm_biudata_valid  |  or1200_dc_top_or1200_dc_fsm_biudata_error  ))|(  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &!  or1200_dc_top_or1200_dc_fsm_tagcomp_miss  &!  or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i  &!(  or1200_dc_top_or1200_dc_fsm_store  &  or1200_dc_top_or1200_dc_fsm_writethrough  )))
                    begin
                        or1200_dc_top_or1200_dc_fsm_state   <=3'd0;
                        or1200_dc_top_or1200_dc_fsm_load   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_store   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_cache_inhibit   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback   <=1'b0;
                    end
            end
            3 'd2:
            begin
                if (!  or1200_dc_top_or1200_dc_fsm_dc_en  |  or1200_dc_top_or1200_dc_fsm_biudata_error  )
                begin
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd0;
                    or1200_dc_top_or1200_dc_fsm_load   <=1'b0;
                    or1200_dc_top_or1200_dc_fsm_store   <=1'b0;
                    or1200_dc_top_or1200_dc_fsm_cnt   <=4'd0;
                end
                if (  or1200_dc_top_or1200_dc_fsm_biudata_valid  &(|  or1200_dc_top_or1200_dc_fsm_cnt  ))
                begin
                    or1200_dc_top_or1200_dc_fsm_cnt   <=  or1200_dc_top_or1200_dc_fsm_cnt  -4;
                    or1200_dc_top_or1200_dc_fsm_addr_r   [4-1:2]<=  or1200_dc_top_or1200_dc_fsm_addr_r  [4-1:2]+1;
                end
                else
                    if (  or1200_dc_top_or1200_dc_fsm_biudata_valid  &!(|  or1200_dc_top_or1200_dc_fsm_cnt  ))
                    begin
                        or1200_dc_top_or1200_dc_fsm_state   <=3'd3;
                        or1200_dc_top_or1200_dc_fsm_addr_r   <=  or1200_dc_top_or1200_dc_fsm_lsu_addr  ;
                        or1200_dc_top_or1200_dc_fsm_load   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_store   <=1'b0;
                    end
                if (  or1200_dc_top_or1200_dc_fsm_load_miss_ack  )
                    or1200_dc_top_or1200_dc_fsm_did_early_load_ack   <=1'b1;
            end
            3 'd3:
            begin
                if (  or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback  )
                begin
                    or1200_dc_top_or1200_dc_fsm_load   <=1'b1;
                    or1200_dc_top_or1200_dc_fsm_cnt   <=((1<<4)-4);
                    or1200_dc_top_or1200_dc_fsm_addr_r   <=  or1200_dc_top_or1200_dc_fsm_lsu_addr  ;
                    or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback   <=1'b0;
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd2;
                end
                else
                    if (  or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush  |  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback  )
                    begin
                        or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_state   <=3'd7;
                    end
                    else
                    begin
                        or1200_dc_top_or1200_dc_fsm_did_early_load_ack   <=1'b0;
                        or1200_dc_top_or1200_dc_fsm_state   <=3'd4;
                    end
            end
            3 'd4:
            begin
                or1200_dc_top_or1200_dc_fsm_state   <=3'd0;
            end
            3 'd5:
            begin
                or1200_dc_top_or1200_dc_fsm_hitmiss_eval   <=1'b0;
                if (  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &!  or1200_dc_top_or1200_dc_fsm_tag_v  )
                begin
                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush   <=1'b0;
                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback   <=1'b0;
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd7;
                end
                else
                    if (  or1200_dc_top_or1200_dc_fsm_hitmiss_eval  &  or1200_dc_top_or1200_dc_fsm_tag_v  )
                    begin
                        if ((  or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush  |  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback  )&  or1200_dc_top_or1200_dc_fsm_dirty  )
                        begin
                            or1200_dc_top_or1200_dc_fsm_addr_r   <={  or1200_dc_top_or1200_dc_fsm_tag  ,  or1200_dc_top_or1200_dc_fsm_addr_r  [13-1:2],2'd0};
                            or1200_dc_top_or1200_dc_fsm_load   <=1'b0;
                            or1200_dc_top_or1200_dc_fsm_store   <=1'b1;
                            or1200_dc_top_or1200_dc_fsm_state   <=3'd2;
                            or1200_dc_top_or1200_dc_fsm_cnt   <=((1<<4)-4);
                        end
                        else
                            if (  or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush  &!  or1200_dc_top_or1200_dc_fsm_dirty  )
                            begin
                                or1200_dc_top_or1200_dc_fsm_state   <=3'd6;
                            end
                            else
                                if (  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback  &!  or1200_dc_top_or1200_dc_fsm_dirty  )
                                begin
                                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback   <=1'b0;
                                    or1200_dc_top_or1200_dc_fsm_state   <=3'd7;
                                end
                    end
            end
            3 'd6:
            begin
                or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush   <=1'b0;
                if (!  or1200_dc_top_or1200_dc_fsm_spr_cswe  )
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd0;
            end
            3 'd7:
            begin
                if (!  or1200_dc_top_or1200_dc_fsm_spr_cswe  )
                    or1200_dc_top_or1200_dc_fsm_state   <=3'd0;
            end
        endcase
    end

    assign or1200_dc_top_or1200_dc_fsm_clk = or1200_dc_top_clk;
    assign or1200_dc_top_or1200_dc_fsm_rst = or1200_dc_top_rst;
    assign or1200_dc_top_or1200_dc_fsm_dc_en = or1200_dc_top_dc_en;
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i = or1200_dc_top_dcqmem_cycstb_i;
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i = or1200_dc_top_dcqmem_ci_i;
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_we_i = or1200_dc_top_dcqmem_we_i;
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i = or1200_dc_top_dcqmem_sel_i;
    assign or1200_dc_top_or1200_dc_fsm_tagcomp_miss = or1200_dc_top_tagcomp_miss;
    assign or1200_dc_top_or1200_dc_fsm_biudata_valid = or1200_dc_top_dcsb_ack_i;
    assign or1200_dc_top_or1200_dc_fsm_biudata_error = or1200_dc_top_dcsb_err_i;
    assign or1200_dc_top_or1200_dc_fsm_lsu_addr = or1200_dc_top_dcqmem_adr_i;
    assign or1200_dc_top_dcram_we = or1200_dc_top_or1200_dc_fsm_dcram_we;
    assign or1200_dc_top_dcfsm_biu_read = or1200_dc_top_or1200_dc_fsm_biu_read;
    assign or1200_dc_top_dcfsm_biu_write = or1200_dc_top_or1200_dc_fsm_biu_write;
    assign or1200_dc_top_dcfsm_biu_do_sel = or1200_dc_top_or1200_dc_fsm_biu_do_sel;
    assign or1200_dc_top_dcfsm_dcram_di_sel = or1200_dc_top_or1200_dc_fsm_dcram_di_sel;
    assign or1200_dc_top_dcfsm_first_hit_ack = or1200_dc_top_or1200_dc_fsm_first_hit_ack;
    assign or1200_dc_top_dcfsm_first_miss_ack = or1200_dc_top_or1200_dc_fsm_first_miss_ack;
    assign or1200_dc_top_dcfsm_first_miss_err = or1200_dc_top_or1200_dc_fsm_first_miss_err;
    assign or1200_dc_top_dcfsm_burst = or1200_dc_top_or1200_dc_fsm_burst;
    assign or1200_dc_top_dcfsm_tag_we = or1200_dc_top_or1200_dc_fsm_tag_we;
    assign or1200_dc_top_dcfsm_tag_valid = or1200_dc_top_or1200_dc_fsm_tag_valid;
    assign or1200_dc_top_dc_addr = or1200_dc_top_or1200_dc_fsm_dc_addr;
    assign or1200_dc_top_or1200_dc_fsm_dc_no_writethrough = or1200_dc_top_dc_no_writethrough;
    assign or1200_dc_top_dcfsm_tag_dirty = or1200_dc_top_or1200_dc_fsm_tag_dirty;
    assign or1200_dc_top_or1200_dc_fsm_dirty = or1200_dc_top_dirty;
    assign or1200_dc_top_or1200_dc_fsm_tag = or1200_dc_top_tag;
    assign or1200_dc_top_or1200_dc_fsm_tag_v = or1200_dc_top_tag_v;
    assign or1200_dc_top_or1200_dc_fsm_dc_block_flush = or1200_dc_top_dc_block_flush;
    assign or1200_dc_top_or1200_dc_fsm_dc_block_writeback = or1200_dc_top_dc_block_writeback;
    assign or1200_dc_top_or1200_dc_fsm_spr_dat_i = or1200_dc_top_spr_dat_i;
    assign or1200_dc_top_mtspr_dc_done = or1200_dc_top_or1200_dc_fsm_mtspr_dc_done;
    assign or1200_dc_top_or1200_dc_fsm_spr_cswe = or1200_dc_top_spr_cs&or1200_dc_top_spr_write;


    wire  or1200_dc_top_or1200_dc_ram_clk;
    wire  or1200_dc_top_or1200_dc_ram_rst;
    wire [ or1200_dc_top_or1200_dc_ram_aw -1:0] or1200_dc_top_or1200_dc_ram_addr;
    wire  or1200_dc_top_or1200_dc_ram_en;
    wire [3:0] or1200_dc_top_or1200_dc_ram_we;
    wire [ or1200_dc_top_or1200_dc_ram_dw -1:0] or1200_dc_top_or1200_dc_ram_datain;
    wire [ or1200_dc_top_or1200_dc_ram_dw -1:0] or1200_dc_top_or1200_dc_ram_dataout;


    wire  or1200_dc_top_or1200_dc_ram_dc_ram_clk;
    wire  or1200_dc_top_or1200_dc_ram_dc_ram_ce;
    wire [3:0] or1200_dc_top_or1200_dc_ram_dc_ram_we;
    wire [ or1200_dc_top_or1200_dc_ram_dc_ram_aw -1:0] or1200_dc_top_or1200_dc_ram_dc_ram_addr;
    wire [ or1200_dc_top_or1200_dc_ram_dc_ram_dw -1:0] or1200_dc_top_or1200_dc_ram_dc_ram_di;
    wire [ or1200_dc_top_or1200_dc_ram_dc_ram_dw -1:0] or1200_dc_top_or1200_dc_ram_dc_ram_doq;

    reg[7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem0  [(1<<  or1200_dc_top_or1200_dc_ram_dc_ram_aw  )-1:0];
    reg[7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem1  [(1<<  or1200_dc_top_or1200_dc_ram_dc_ram_aw  )-1:0];
    reg[7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem2  [(1<<  or1200_dc_top_or1200_dc_ram_dc_ram_aw  )-1:0];
    reg[7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem3  [(1<<  or1200_dc_top_or1200_dc_ram_dc_ram_aw  )-1:0];
    reg[  or1200_dc_top_or1200_dc_ram_dc_ram_aw  -1:0]  or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg  ;
    assign   or1200_dc_top_or1200_dc_ram_dc_ram_doq  ={  or1200_dc_top_or1200_dc_ram_dc_ram_mem0  [  or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg  ],  or1200_dc_top_or1200_dc_ram_dc_ram_mem1  [  or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg  ],  or1200_dc_top_or1200_dc_ram_dc_ram_mem2  [  or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg  ],  or1200_dc_top_or1200_dc_ram_dc_ram_mem3  [  or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg  ]};
    always @( posedge   or1200_dc_top_or1200_dc_ram_dc_ram_clk  )
        if (  or1200_dc_top_or1200_dc_ram_dc_ram_ce  )
            or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg   <=  or1200_dc_top_or1200_dc_ram_dc_ram_addr  ;

    always @( posedge   or1200_dc_top_or1200_dc_ram_dc_ram_clk  )
        if (  or1200_dc_top_or1200_dc_ram_dc_ram_ce  )
        begin
            if (  or1200_dc_top_or1200_dc_ram_dc_ram_we  [3])
                or1200_dc_top_or1200_dc_ram_dc_ram_mem0   [  or1200_dc_top_or1200_dc_ram_dc_ram_addr  ]<=  or1200_dc_top_or1200_dc_ram_dc_ram_di  [31:24];
            if (  or1200_dc_top_or1200_dc_ram_dc_ram_we  [2])
                or1200_dc_top_or1200_dc_ram_dc_ram_mem1   [  or1200_dc_top_or1200_dc_ram_dc_ram_addr  ]<=  or1200_dc_top_or1200_dc_ram_dc_ram_di  [23:16];
            if (  or1200_dc_top_or1200_dc_ram_dc_ram_we  [1])
                or1200_dc_top_or1200_dc_ram_dc_ram_mem2   [  or1200_dc_top_or1200_dc_ram_dc_ram_addr  ]<=  or1200_dc_top_or1200_dc_ram_dc_ram_di  [15:08];
            if (  or1200_dc_top_or1200_dc_ram_dc_ram_we  [0])
                or1200_dc_top_or1200_dc_ram_dc_ram_mem3   [  or1200_dc_top_or1200_dc_ram_dc_ram_addr  ]<=  or1200_dc_top_or1200_dc_ram_dc_ram_di  [07:00];
        end

    assign or1200_dc_top_or1200_dc_ram_dc_ram_clk = or1200_dc_top_or1200_dc_ram_clk;
    assign or1200_dc_top_or1200_dc_ram_dc_ram_ce = or1200_dc_top_or1200_dc_ram_en;
    assign or1200_dc_top_or1200_dc_ram_dc_ram_we = or1200_dc_top_or1200_dc_ram_we;
    assign or1200_dc_top_or1200_dc_ram_dc_ram_addr = or1200_dc_top_or1200_dc_ram_addr;
    assign or1200_dc_top_or1200_dc_ram_dc_ram_di = or1200_dc_top_or1200_dc_ram_datain;
    assign or1200_dc_top_or1200_dc_ram_dataout = or1200_dc_top_or1200_dc_ram_dc_ram_doq;

    assign or1200_dc_top_or1200_dc_ram_clk = or1200_dc_top_clk;
    assign or1200_dc_top_or1200_dc_ram_rst = or1200_dc_top_rst;
    assign or1200_dc_top_or1200_dc_ram_addr = or1200_dc_top_dc_addr[13-1:2];
    assign or1200_dc_top_or1200_dc_ram_en = or1200_dc_top_dc_en;
    assign or1200_dc_top_or1200_dc_ram_we = or1200_dc_top_dcram_we;
    assign or1200_dc_top_or1200_dc_ram_datain = or1200_dc_top_to_dcram;
    assign or1200_dc_top_from_dcram = or1200_dc_top_or1200_dc_ram_dataout;


    wire  or1200_dc_top_or1200_dc_tag_clk;
    wire  or1200_dc_top_or1200_dc_tag_rst;
    wire [ or1200_dc_top_or1200_dc_tag_aw -1:0] or1200_dc_top_or1200_dc_tag_addr;
    wire  or1200_dc_top_or1200_dc_tag_en;
    wire  or1200_dc_top_or1200_dc_tag_we;
    wire [ or1200_dc_top_or1200_dc_tag_dw -1:0] or1200_dc_top_or1200_dc_tag_datain;
    wire  or1200_dc_top_or1200_dc_tag_tag_v;
    wire [ or1200_dc_top_or1200_dc_tag_dw -3:0] or1200_dc_top_or1200_dc_tag_tag;
    wire  or1200_dc_top_or1200_dc_tag_dirty;


    wire  or1200_dc_top_or1200_dc_tag_dc_tag0_clk;
    wire  or1200_dc_top_or1200_dc_tag_dc_tag0_ce;
    wire  or1200_dc_top_or1200_dc_tag_dc_tag0_we;
    wire [ or1200_dc_top_or1200_dc_tag_dc_tag0_aw -1:0] or1200_dc_top_or1200_dc_tag_dc_tag0_addr;
    wire [ or1200_dc_top_or1200_dc_tag_dc_tag0_dw -1:0] or1200_dc_top_or1200_dc_tag_dc_tag0_di;
    wire [ or1200_dc_top_or1200_dc_tag_dc_tag0_dw -1:0] or1200_dc_top_or1200_dc_tag_dc_tag0_doq;

    reg[  or1200_dc_top_or1200_dc_tag_dc_tag0_dw  -1:0]  or1200_dc_top_or1200_dc_tag_dc_tag0_mem  [(1<<  or1200_dc_top_or1200_dc_tag_dc_tag0_aw  )-1:0];
    reg[  or1200_dc_top_or1200_dc_tag_dc_tag0_aw  -1:0]  or1200_dc_top_or1200_dc_tag_dc_tag0_addr_reg  ;
    assign   or1200_dc_top_or1200_dc_tag_dc_tag0_doq  =  or1200_dc_top_or1200_dc_tag_dc_tag0_mem  [  or1200_dc_top_or1200_dc_tag_dc_tag0_addr_reg  ];
    always @( posedge   or1200_dc_top_or1200_dc_tag_dc_tag0_clk  )
        if (  or1200_dc_top_or1200_dc_tag_dc_tag0_ce  )
            or1200_dc_top_or1200_dc_tag_dc_tag0_addr_reg   <=  or1200_dc_top_or1200_dc_tag_dc_tag0_addr  ;

    always @( posedge   or1200_dc_top_or1200_dc_tag_dc_tag0_clk  )
        if (  or1200_dc_top_or1200_dc_tag_dc_tag0_we  &&  or1200_dc_top_or1200_dc_tag_dc_tag0_ce  )
            or1200_dc_top_or1200_dc_tag_dc_tag0_mem   [  or1200_dc_top_or1200_dc_tag_dc_tag0_addr  ]<=  or1200_dc_top_or1200_dc_tag_dc_tag0_di  ;

    assign or1200_dc_top_or1200_dc_tag_dc_tag0_clk = or1200_dc_top_or1200_dc_tag_clk;
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_ce = or1200_dc_top_or1200_dc_tag_en;
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_we = or1200_dc_top_or1200_dc_tag_we;
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_addr = or1200_dc_top_or1200_dc_tag_addr;
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_di = or1200_dc_top_or1200_dc_tag_datain;
    assign {or1200_dc_top_or1200_dc_tag_tag,or1200_dc_top_or1200_dc_tag_tag_v,or1200_dc_top_or1200_dc_tag_dirty} = or1200_dc_top_or1200_dc_tag_dc_tag0_doq;

    assign or1200_dc_top_or1200_dc_tag_clk = or1200_dc_top_clk;
    assign or1200_dc_top_or1200_dc_tag_rst = or1200_dc_top_rst;
    assign or1200_dc_top_or1200_dc_tag_addr = or1200_dc_top_dctag_addr;
    assign or1200_dc_top_or1200_dc_tag_en = or1200_dc_top_dctag_en;
    assign or1200_dc_top_or1200_dc_tag_we = or1200_dc_top_dctag_we;
    assign or1200_dc_top_or1200_dc_tag_datain = {or1200_dc_top_dc_addr[31:13-1+1],or1200_dc_top_dctag_v,or1200_dc_top_dctag_dirty};
    assign or1200_dc_top_tag_v = or1200_dc_top_or1200_dc_tag_tag_v;
    assign or1200_dc_top_tag = or1200_dc_top_or1200_dc_tag_tag;
    assign or1200_dc_top_dirty = or1200_dc_top_or1200_dc_tag_dirty;

    assign or1200_dc_top_clk = clk_i;
    assign or1200_dc_top_rst = rst_i;
    assign dcsb_dat_dc = or1200_dc_top_dcsb_dat_o;
    assign dcsb_adr_dc = or1200_dc_top_dcsb_adr_o;
    assign dcsb_cyc_dc = or1200_dc_top_dcsb_cyc_o;
    assign dcsb_stb_dc = or1200_dc_top_dcsb_stb_o;
    assign dcsb_we_dc = or1200_dc_top_dcsb_we_o;
    assign dcsb_sel_dc = or1200_dc_top_dcsb_sel_o;
    assign dcsb_cab_dc = or1200_dc_top_dcsb_cab_o;
    assign or1200_dc_top_dcsb_dat_i = dcsb_dat_sb;
    assign or1200_dc_top_dcsb_ack_i = dcsb_ack_sb;
    assign or1200_dc_top_dcsb_err_i = dcsb_err_sb;
    assign or1200_dc_top_dc_en = dc_en;
    assign or1200_dc_top_dcqmem_adr_i = dcqmem_adr_qmem;
    assign or1200_dc_top_dcqmem_cycstb_i = dcqmem_cycstb_qmem;
    assign or1200_dc_top_dcqmem_ci_i = dcqmem_ci_qmem;
    assign or1200_dc_top_dcqmem_we_i = dcqmem_we_qmem;
    assign or1200_dc_top_dcqmem_sel_i = dcqmem_sel_qmem;
    assign or1200_dc_top_dcqmem_tag_i = dcqmem_tag_qmem;
    assign or1200_dc_top_dcqmem_dat_i = dcqmem_dat_qmem;
    assign dcqmem_dat_dc = or1200_dc_top_dcqmem_dat_o;
    assign dcqmem_ack_dc = or1200_dc_top_dcqmem_ack_o;
    assign dcqmem_rty_dc = or1200_dc_top_dcqmem_rty_o;
    assign dcqmem_err_dc = or1200_dc_top_dcqmem_err_o;
    assign dcqmem_tag_dc = or1200_dc_top_dcqmem_tag_o;
    assign or1200_dc_top_dc_no_writethrough = dc_no_writethrough;
    assign or1200_dc_top_spr_cs = spr_cs[5'd03];
    assign or1200_dc_top_spr_write = spr_we;
    assign or1200_dc_top_spr_dat_i = spr_dat_cpu;
    assign or1200_dc_top_spr_addr = spr_addr;
    assign mtspr_dc_done = or1200_dc_top_mtspr_dc_done;


    wire  or1200_qmem_top_clk;
    wire  or1200_qmem_top_rst;
    wire [31:0] or1200_qmem_top_qmemimmu_adr_i;
    wire  or1200_qmem_top_qmemimmu_cycstb_i;
    wire  or1200_qmem_top_qmemimmu_ci_i;
    wire [3:0] or1200_qmem_top_qmemicpu_sel_i;
    wire [3:0] or1200_qmem_top_qmemicpu_tag_i;
    wire [31:0] or1200_qmem_top_qmemicpu_dat_o;
    wire  or1200_qmem_top_qmemicpu_ack_o;
    wire  or1200_qmem_top_qmemimmu_rty_o;
    wire  or1200_qmem_top_qmemimmu_err_o;
    wire [3:0] or1200_qmem_top_qmemimmu_tag_o;
    wire [31:0] or1200_qmem_top_icqmem_adr_o;
    wire  or1200_qmem_top_icqmem_cycstb_o;
    wire  or1200_qmem_top_icqmem_ci_o;
    wire [3:0] or1200_qmem_top_icqmem_sel_o;
    wire [3:0] or1200_qmem_top_icqmem_tag_o;
    wire [31:0] or1200_qmem_top_icqmem_dat_i;
    wire  or1200_qmem_top_icqmem_ack_i;
    wire  or1200_qmem_top_icqmem_rty_i;
    wire  or1200_qmem_top_icqmem_err_i;
    wire [3:0] or1200_qmem_top_icqmem_tag_i;
    wire [31:0] or1200_qmem_top_qmemdmmu_adr_i;
    wire  or1200_qmem_top_qmemdmmu_cycstb_i;
    wire  or1200_qmem_top_qmemdmmu_ci_i;
    wire  or1200_qmem_top_qmemdcpu_we_i;
    wire [3:0] or1200_qmem_top_qmemdcpu_sel_i;
    wire [3:0] or1200_qmem_top_qmemdcpu_tag_i;
    wire [31:0] or1200_qmem_top_qmemdcpu_dat_i;
    wire [31:0] or1200_qmem_top_qmemdcpu_dat_o;
    wire  or1200_qmem_top_qmemdcpu_ack_o;
    wire  or1200_qmem_top_qmemdcpu_rty_o;
    wire  or1200_qmem_top_qmemdmmu_err_o;
    wire [3:0] or1200_qmem_top_qmemdmmu_tag_o;
    wire [31:0] or1200_qmem_top_dcqmem_adr_o;
    wire  or1200_qmem_top_dcqmem_cycstb_o;
    wire  or1200_qmem_top_dcqmem_ci_o;
    wire  or1200_qmem_top_dcqmem_we_o;
    wire [3:0] or1200_qmem_top_dcqmem_sel_o;
    wire [3:0] or1200_qmem_top_dcqmem_tag_o;
    wire [ or1200_qmem_top_dw -1:0] or1200_qmem_top_dcqmem_dat_o;
    wire [ or1200_qmem_top_dw -1:0] or1200_qmem_top_dcqmem_dat_i;
    wire  or1200_qmem_top_dcqmem_ack_i;
    wire  or1200_qmem_top_dcqmem_rty_i;
    wire  or1200_qmem_top_dcqmem_err_i;
    wire [3:0] or1200_qmem_top_dcqmem_tag_i;

    assign   or1200_qmem_top_qmemicpu_dat_o  =  or1200_qmem_top_icqmem_dat_i  ;
    assign   or1200_qmem_top_qmemicpu_ack_o  =  or1200_qmem_top_icqmem_ack_i  ;
    assign   or1200_qmem_top_qmemimmu_rty_o  =  or1200_qmem_top_icqmem_rty_i  ;
    assign   or1200_qmem_top_qmemimmu_err_o  =  or1200_qmem_top_icqmem_err_i  ;
    assign   or1200_qmem_top_qmemimmu_tag_o  =  or1200_qmem_top_icqmem_tag_i  ;
    assign   or1200_qmem_top_icqmem_adr_o  =  or1200_qmem_top_qmemimmu_adr_i  ;
    assign   or1200_qmem_top_icqmem_cycstb_o  =  or1200_qmem_top_qmemimmu_cycstb_i  ;
    assign   or1200_qmem_top_icqmem_ci_o  =  or1200_qmem_top_qmemimmu_ci_i  ;
    assign   or1200_qmem_top_icqmem_sel_o  =  or1200_qmem_top_qmemicpu_sel_i  ;
    assign   or1200_qmem_top_icqmem_tag_o  =  or1200_qmem_top_qmemicpu_tag_i  ;
    assign   or1200_qmem_top_qmemdcpu_dat_o  =  or1200_qmem_top_dcqmem_dat_i  ;
    assign   or1200_qmem_top_qmemdcpu_ack_o  =  or1200_qmem_top_dcqmem_ack_i  ;
    assign   or1200_qmem_top_qmemdcpu_rty_o  =  or1200_qmem_top_dcqmem_rty_i  ;
    assign   or1200_qmem_top_qmemdmmu_err_o  =  or1200_qmem_top_dcqmem_err_i  ;
    assign   or1200_qmem_top_qmemdmmu_tag_o  =  or1200_qmem_top_dcqmem_tag_i  ;
    assign   or1200_qmem_top_dcqmem_adr_o  =  or1200_qmem_top_qmemdmmu_adr_i  ;
    assign   or1200_qmem_top_dcqmem_cycstb_o  =  or1200_qmem_top_qmemdmmu_cycstb_i  ;
    assign   or1200_qmem_top_dcqmem_ci_o  =  or1200_qmem_top_qmemdmmu_ci_i  ;
    assign   or1200_qmem_top_dcqmem_we_o  =  or1200_qmem_top_qmemdcpu_we_i  ;
    assign   or1200_qmem_top_dcqmem_sel_o  =  or1200_qmem_top_qmemdcpu_sel_i  ;
    assign   or1200_qmem_top_dcqmem_tag_o  =  or1200_qmem_top_qmemdcpu_tag_i  ;
    assign   or1200_qmem_top_dcqmem_dat_o  =  or1200_qmem_top_qmemdcpu_dat_i  ;
    assign or1200_qmem_top_clk = clk_i;
    assign or1200_qmem_top_rst = rst_i;
    assign or1200_qmem_top_qmemimmu_adr_i = qmemimmu_adr_immu;
    assign or1200_qmem_top_qmemimmu_cycstb_i = qmemimmu_cycstb_immu;
    assign or1200_qmem_top_qmemimmu_ci_i = qmemimmu_ci_immu;
    assign or1200_qmem_top_qmemicpu_sel_i = icpu_sel_cpu;
    assign or1200_qmem_top_qmemicpu_tag_i = icpu_tag_cpu;
    assign icpu_dat_qmem = or1200_qmem_top_qmemicpu_dat_o;
    assign icpu_ack_qmem = or1200_qmem_top_qmemicpu_ack_o;
    assign qmemimmu_rty_qmem = or1200_qmem_top_qmemimmu_rty_o;
    assign qmemimmu_err_qmem = or1200_qmem_top_qmemimmu_err_o;
    assign qmemimmu_tag_qmem = or1200_qmem_top_qmemimmu_tag_o;
    assign icqmem_adr_qmem = or1200_qmem_top_icqmem_adr_o;
    assign icqmem_cycstb_qmem = or1200_qmem_top_icqmem_cycstb_o;
    assign icqmem_ci_qmem = or1200_qmem_top_icqmem_ci_o;
    assign icqmem_sel_qmem = or1200_qmem_top_icqmem_sel_o;
    assign icqmem_tag_qmem = or1200_qmem_top_icqmem_tag_o;
    assign or1200_qmem_top_icqmem_dat_i = icqmem_dat_ic;
    assign or1200_qmem_top_icqmem_ack_i = icqmem_ack_ic;
    assign or1200_qmem_top_icqmem_rty_i = icqmem_rty_ic;
    assign or1200_qmem_top_icqmem_err_i = icqmem_err_ic;
    assign or1200_qmem_top_icqmem_tag_i = icqmem_tag_ic;
    assign or1200_qmem_top_qmemdmmu_adr_i = qmemdmmu_adr_dmmu;
    assign or1200_qmem_top_qmemdmmu_cycstb_i = qmemdmmu_cycstb_dmmu;
    assign or1200_qmem_top_qmemdmmu_ci_i = qmemdmmu_ci_dmmu;
    assign or1200_qmem_top_qmemdcpu_we_i = dcpu_we_cpu;
    assign or1200_qmem_top_qmemdcpu_sel_i = dcpu_sel_cpu;
    assign or1200_qmem_top_qmemdcpu_tag_i = dcpu_tag_cpu;
    assign or1200_qmem_top_qmemdcpu_dat_i = dcpu_dat_cpu;
    assign dcpu_dat_qmem = or1200_qmem_top_qmemdcpu_dat_o;
    assign dcpu_ack_qmem = or1200_qmem_top_qmemdcpu_ack_o;
    assign dcpu_rty_qmem = or1200_qmem_top_qmemdcpu_rty_o;
    assign qmemdmmu_err_qmem = or1200_qmem_top_qmemdmmu_err_o;
    assign qmemdmmu_tag_qmem = or1200_qmem_top_qmemdmmu_tag_o;
    assign dcqmem_adr_qmem = or1200_qmem_top_dcqmem_adr_o;
    assign dcqmem_cycstb_qmem = or1200_qmem_top_dcqmem_cycstb_o;
    assign dcqmem_ci_qmem = or1200_qmem_top_dcqmem_ci_o;
    assign dcqmem_we_qmem = or1200_qmem_top_dcqmem_we_o;
    assign dcqmem_sel_qmem = or1200_qmem_top_dcqmem_sel_o;
    assign dcqmem_tag_qmem = or1200_qmem_top_dcqmem_tag_o;
    assign dcqmem_dat_qmem = or1200_qmem_top_dcqmem_dat_o;
    assign or1200_qmem_top_dcqmem_dat_i = dcqmem_dat_dc;
    assign or1200_qmem_top_dcqmem_ack_i = dcqmem_ack_dc;
    assign or1200_qmem_top_dcqmem_rty_i = dcqmem_rty_dc;
    assign or1200_qmem_top_dcqmem_err_i = dcqmem_err_dc;
    assign or1200_qmem_top_dcqmem_tag_i = dcqmem_tag_dc;


    wire  or1200_sb_clk;
    wire  or1200_sb_rst;
    wire  or1200_sb_sb_en;
    wire [ or1200_sb_dw -1:0] or1200_sb_dcsb_dat_i;
    wire [ or1200_sb_aw -1:0] or1200_sb_dcsb_adr_i;
    wire  or1200_sb_dcsb_cyc_i;
    wire  or1200_sb_dcsb_stb_i;
    wire  or1200_sb_dcsb_we_i;
    wire [3:0] or1200_sb_dcsb_sel_i;
    wire  or1200_sb_dcsb_cab_i;
    wire [ or1200_sb_dw -1:0] or1200_sb_dcsb_dat_o;
    wire  or1200_sb_dcsb_ack_o;
    wire  or1200_sb_dcsb_err_o;
    wire [ or1200_sb_dw -1:0] or1200_sb_sbbiu_dat_o;
    wire [ or1200_sb_aw -1:0] or1200_sb_sbbiu_adr_o;
    wire  or1200_sb_sbbiu_cyc_o;
    wire  or1200_sb_sbbiu_stb_o;
    wire  or1200_sb_sbbiu_we_o;
    wire [3:0] or1200_sb_sbbiu_sel_o;
    wire  or1200_sb_sbbiu_cab_o;
    wire [ or1200_sb_dw -1:0] or1200_sb_sbbiu_dat_i;
    wire  or1200_sb_sbbiu_ack_i;
    wire  or1200_sb_sbbiu_err_i;

    assign   or1200_sb_sbbiu_dat_o  =  or1200_sb_dcsb_dat_i  ;
    assign   or1200_sb_sbbiu_adr_o  =  or1200_sb_dcsb_adr_i  ;
    assign   or1200_sb_sbbiu_cyc_o  =  or1200_sb_dcsb_cyc_i  ;
    assign   or1200_sb_sbbiu_stb_o  =  or1200_sb_dcsb_stb_i  ;
    assign   or1200_sb_sbbiu_we_o  =  or1200_sb_dcsb_we_i  ;
    assign   or1200_sb_sbbiu_cab_o  =  or1200_sb_dcsb_cab_i  ;
    assign   or1200_sb_sbbiu_sel_o  =  or1200_sb_dcsb_sel_i  ;
    assign   or1200_sb_dcsb_dat_o  =  or1200_sb_sbbiu_dat_i  ;
    assign   or1200_sb_dcsb_ack_o  =  or1200_sb_sbbiu_ack_i  ;
    assign   or1200_sb_dcsb_err_o  =  or1200_sb_sbbiu_err_i  ;
    assign or1200_sb_clk = clk_i;
    assign or1200_sb_rst = rst_i;
    assign or1200_sb_sb_en = sb_en;
    assign or1200_sb_dcsb_dat_i = dcsb_dat_dc;
    assign or1200_sb_dcsb_adr_i = dcsb_adr_dc;
    assign or1200_sb_dcsb_cyc_i = dcsb_cyc_dc;
    assign or1200_sb_dcsb_stb_i = dcsb_stb_dc;
    assign or1200_sb_dcsb_we_i = dcsb_we_dc;
    assign or1200_sb_dcsb_sel_i = dcsb_sel_dc;
    assign or1200_sb_dcsb_cab_i = dcsb_cab_dc;
    assign dcsb_dat_sb = or1200_sb_dcsb_dat_o;
    assign dcsb_ack_sb = or1200_sb_dcsb_ack_o;
    assign dcsb_err_sb = or1200_sb_dcsb_err_o;
    assign sbbiu_dat_sb = or1200_sb_sbbiu_dat_o;
    assign sbbiu_adr_sb = or1200_sb_sbbiu_adr_o;
    assign sbbiu_cyc_sb = or1200_sb_sbbiu_cyc_o;
    assign sbbiu_stb_sb = or1200_sb_sbbiu_stb_o;
    assign sbbiu_we_sb = or1200_sb_sbbiu_we_o;
    assign sbbiu_sel_sb = or1200_sb_sbbiu_sel_o;
    assign sbbiu_cab_sb = or1200_sb_sbbiu_cab_o;
    assign or1200_sb_sbbiu_dat_i = sbbiu_dat_biu;
    assign or1200_sb_sbbiu_ack_i = sbbiu_ack_biu;
    assign or1200_sb_sbbiu_err_i = sbbiu_err_biu;


    wire  or1200_du_clk;
    wire  or1200_du_rst;
    wire  or1200_du_dcpu_cycstb_i;
    wire  or1200_du_dcpu_we_i;
    wire [31:0] or1200_du_dcpu_adr_i;
    wire [31:0] or1200_du_dcpu_dat_lsu;
    wire [31:0] or1200_du_dcpu_dat_dc;
    wire [1-1:0] or1200_du_icpu_cycstb_i;
    wire  or1200_du_ex_freeze;
    wire [3-1:0] or1200_du_branch_op;
    wire [ or1200_du_dw -1:0] or1200_du_ex_insn;
    wire [31:0] or1200_du_id_pc;
    wire [31:0] or1200_du_spr_dat_npc;
    wire [31:0] or1200_du_rf_dataw;
    wire [14-1:0] or1200_du_du_dsr;
    wire [24:0] or1200_du_du_dmr1;
    wire  or1200_du_du_stall;
    wire [ or1200_du_aw -1:0] or1200_du_du_addr;
    wire [ or1200_du_dw -1:0] or1200_du_du_dat_i;
    wire [ or1200_du_dw -1:0] or1200_du_du_dat_o;
    wire  or1200_du_du_read;
    wire  or1200_du_du_write;
    wire [13:0] or1200_du_du_except_stop;
    wire  or1200_du_du_hwbkpt;
    wire  or1200_du_du_flush_pipe;
    wire  or1200_du_spr_cs;
    wire  or1200_du_spr_write;
    wire [ or1200_du_aw -1:0] or1200_du_spr_addr;
    wire [ or1200_du_dw -1:0] or1200_du_spr_dat_i;
    reg [ or1200_du_dw -1:0] or1200_du_spr_dat_o;
    wire  or1200_du_dbg_stall_i;
    wire  or1200_du_dbg_ewt_i;
    wire [3:0] or1200_du_dbg_lss_o;
    reg [1:0] or1200_du_dbg_is_o;
    wire [10:0] or1200_du_dbg_wp_o;
    wire  or1200_du_dbg_bp_o;
    wire  or1200_du_dbg_stb_i;
    wire  or1200_du_dbg_we_i;
    wire [ or1200_du_aw -1:0] or1200_du_dbg_adr_i;
    wire [ or1200_du_dw -1:0] or1200_du_dbg_dat_i;
    reg [ or1200_du_dw -1:0] or1200_du_dbg_dat_o;
    reg  or1200_du_dbg_ack_o;

    assign   or1200_du_dbg_lss_o  =4'b0000;
    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
        if (  or1200_du_rst  ==(1'b1))
            or1200_du_dbg_is_o   <=2'b00;
        else
            if (!  or1200_du_ex_freeze  &~((  or1200_du_ex_insn  [31:26]==6'b000101)&  or1200_du_ex_insn  [16]))
                or1200_du_dbg_is_o   <=~  or1200_du_dbg_is_o  ;

    assign   or1200_du_dbg_wp_o  =11'b000_0000_0000;
    assign   or1200_du_du_stall  =  or1200_du_dbg_stall_i  ;
    assign   or1200_du_du_addr  =  or1200_du_dbg_adr_i  ;
    assign   or1200_du_du_dat_o  =  or1200_du_dbg_dat_i  ;
    assign   or1200_du_du_read  =  or1200_du_dbg_stb_i  &&!  or1200_du_dbg_we_i  ;
    assign   or1200_du_du_write  =  or1200_du_dbg_stb_i  &&  or1200_du_dbg_we_i  ;
    reg  or1200_du_du_flush_pipe_r  ;
    reg  or1200_du_dbg_stall_i_r  ;
    assign   or1200_du_du_flush_pipe  =  or1200_du_du_flush_pipe_r  ;
    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
    begin
        if (  or1200_du_rst  ==(1'b1))
        begin
            or1200_du_du_flush_pipe_r   <=1'b0;
        end
        else
        begin
            or1200_du_du_flush_pipe_r   <=(  or1200_du_dbg_stall_i_r  &&!  or1200_du_dbg_stall_i  &&|  or1200_du_du_except_stop  );
        end
    end

    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
    begin
        if (  or1200_du_rst  ==(1'b1))
        begin
            or1200_du_dbg_stall_i_r   <=1'b0;
        end
        else
        begin
            or1200_du_dbg_stall_i_r   <=  or1200_du_dbg_stall_i  ;
        end
    end

    reg  or1200_du_dbg_ack  ;
    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
    begin
        if (  or1200_du_rst  ==(1'b1))
        begin
            or1200_du_dbg_ack   <=1'b0;
            or1200_du_dbg_ack_o   <=1'b0;
        end
        else
        begin
            or1200_du_dbg_ack   <=  or1200_du_dbg_stb_i  ;
            or1200_du_dbg_ack_o   <=  or1200_du_dbg_ack  &  or1200_du_dbg_stb_i  ;
        end
    end

    always @( posedge   or1200_du_clk  )
        or1200_du_dbg_dat_o   <=  or1200_du_du_dat_i  ;

    reg[24:0]  or1200_du_dmr1  ;
    assign   or1200_du_du_dmr1  =  or1200_du_dmr1  ;
    wire[23:0]  or1200_du_dmr2  ;
    reg[14-1:0]  or1200_du_dsr  ;
    reg[13:0]  or1200_du_drr  ;
    wire[31:0]  or1200_du_dvr0  ;
    wire[31:0]  or1200_du_dvr1  ;
    wire[31:0]  or1200_du_dvr2  ;
    wire[31:0]  or1200_du_dvr3  ;
    wire[31:0]  or1200_du_dvr4  ;
    wire[31:0]  or1200_du_dvr5  ;
    wire[31:0]  or1200_du_dvr6  ;
    wire[31:0]  or1200_du_dvr7  ;
    wire[7:0]  or1200_du_dcr0  ;
    wire[7:0]  or1200_du_dcr1  ;
    wire[7:0]  or1200_du_dcr2  ;
    wire[7:0]  or1200_du_dcr3  ;
    wire[7:0]  or1200_du_dcr4  ;
    wire[7:0]  or1200_du_dcr5  ;
    wire[7:0]  or1200_du_dcr6  ;
    wire[7:0]  or1200_du_dcr7  ;
    wire[31:0]  or1200_du_dwcr0  ;
    wire[31:0]  or1200_du_dwcr1  ;
    wire  or1200_du_dmr1_sel  ;
    wire  or1200_du_dmr2_sel  ;
    wire  or1200_du_dsr_sel  ;
    wire  or1200_du_drr_sel  ;
    wire  or1200_du_dvr0_sel  ;
    wire  or1200_du_dvr1_sel  ;
    wire  or1200_du_dvr2_sel  ;
    wire  or1200_du_dvr3_sel  ;
    wire  or1200_du_dvr4_sel  ;
    wire  or1200_du_dvr5_sel  ;
    wire  or1200_du_dvr6_sel  ;
    wire  or1200_du_dvr7_sel  ;
    wire  or1200_du_dcr0_sel  ;
    wire  or1200_du_dcr1_sel  ;
    wire  or1200_du_dcr2_sel  ;
    wire  or1200_du_dcr3_sel  ;
    wire  or1200_du_dcr4_sel  ;
    wire  or1200_du_dcr5_sel  ;
    wire  or1200_du_dcr6_sel  ;
    wire  or1200_du_dcr7_sel  ;
    wire  or1200_du_dwcr0_sel  ;
    wire  or1200_du_dwcr1_sel  ;
    reg  or1200_du_dbg_bp_r  ;
    reg  or1200_du_ex_freeze_q  ;
    reg  or1200_du_du_hwbkpt_hold  ;
    reg[13:0]  or1200_du_except_stop  ;
    wire[31:0]  or1200_du_tbia_dat_o  ;
    wire[31:0]  or1200_du_tbim_dat_o  ;
    wire[31:0]  or1200_du_tbar_dat_o  ;
    wire[31:0]  or1200_du_tbts_dat_o  ;
    assign   or1200_du_dmr1_sel  =(  or1200_du_spr_cs  &&(  or1200_du_spr_addr  [10:0]==11'd16));
    assign   or1200_du_dsr_sel  =(  or1200_du_spr_cs  &&(  or1200_du_spr_addr  [10:0]==11'd20));
    assign   or1200_du_drr_sel  =(  or1200_du_spr_cs  &&(  or1200_du_spr_addr  [10:0]==11'd21));
    always @( posedge   or1200_du_clk  )
        or1200_du_ex_freeze_q   <=  or1200_du_ex_freeze  ;

    always @(    or1200_du_du_except_stop            or    or1200_du_ex_freeze_q   )
    begin
        or1200_du_except_stop   =14'b00_0000_0000_0000;
        casez (  or1200_du_du_except_stop  )
            14 'b1?_????_????_????:
                or1200_du_except_stop   [4]=1'b1;
            14 'b01_????_????_????:
            begin
                or1200_du_except_stop   [7]=1'b1;
            end
            14 'b00_1???_????_????:
            begin
                or1200_du_except_stop   [9]=1'b1;
            end
            14 'b00_01??_????_????:
                or1200_du_except_stop   [3]=1'b1;
            14 'b00_001?_????_????:
            begin
                or1200_du_except_stop   [1]=1'b1;
            end
            14 'b00_0001_????_????:
                or1200_du_except_stop   [6]=1'b1;
            14 'b00_0000_1???_????:
            begin
                or1200_du_except_stop   [5]=1'b1;
            end
            14 'b00_0000_01??_????:
            begin
                or1200_du_except_stop   [8]=1'b1;
            end
            14 'b00_0000_001?_????:
                or1200_du_except_stop   [2]=1'b1;
            14 'b00_0000_0001_????:
                or1200_du_except_stop   [1]=1'b1;
            14 'b00_0000_0000_1???:
            begin
                or1200_du_except_stop   [10]=1'b1;
            end
            14 'b00_0000_0000_01??:
            begin
                or1200_du_except_stop   [13]=1'b1&~  or1200_du_ex_freeze_q  ;
            end
            14 'b00_0000_0000_001?:
            begin
                or1200_du_except_stop   [12]=1'b1;
            end
            14 'b00_0000_0000_0001:
                or1200_du_except_stop   [11]=1'b1&~  or1200_du_ex_freeze_q  ;
            default :
                or1200_du_except_stop   =14'b00_0000_0000_0000;
        endcase
    end

    assign   or1200_du_dbg_bp_o  =  or1200_du_dbg_bp_r  ;
    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
        if (  or1200_du_rst  ==(1'b1))
            or1200_du_dbg_bp_r   <=1'b0;
        else
            if (!  or1200_du_ex_freeze  )
                or1200_du_dbg_bp_r   <=|  or1200_du_except_stop  |~((  or1200_du_ex_insn  [31:26]==6'b000101)&  or1200_du_ex_insn  [16])&  or1200_du_dmr1  [22]|(  or1200_du_branch_op  !=3'd0)&(  or1200_du_branch_op  !=3'd6)&  or1200_du_dmr1  [23];
            else
                or1200_du_dbg_bp_r   <=|  or1200_du_except_stop  ;

    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
        if (  or1200_du_rst  ==(1'b1))
            or1200_du_dmr1   <=25'h000_0000;
        else
            if (  or1200_du_dmr1_sel  &&  or1200_du_spr_write  )
                or1200_du_dmr1   <={1'b0,  or1200_du_spr_dat_i  [23:22],22'h00_0000};

    assign   or1200_du_dmr2  =24'h00_0000;
    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
        if (  or1200_du_rst  ==(1'b1))
            or1200_du_dsr   <={14{1'b0}};
        else
            if (  or1200_du_dsr_sel  &&  or1200_du_spr_write  )
                or1200_du_dsr   <=  or1200_du_spr_dat_i  [14-1:0];

    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
        if (  or1200_du_rst  ==(1'b1))
            or1200_du_drr   <=14'b0;
        else
            if (  or1200_du_drr_sel  &&  or1200_du_spr_write  )
                or1200_du_drr   <=  or1200_du_spr_dat_i  [13:0];
            else
                or1200_du_drr   <=  or1200_du_drr  |  or1200_du_except_stop  ;

    assign   or1200_du_dvr0  =32'h0000_0000;
    assign   or1200_du_dvr1  =32'h0000_0000;
    assign   or1200_du_dvr2  =32'h0000_0000;
    assign   or1200_du_dvr3  =32'h0000_0000;
    assign   or1200_du_dvr4  =32'h0000_0000;
    assign   or1200_du_dvr5  =32'h0000_0000;
    assign   or1200_du_dvr6  =32'h0000_0000;
    assign   or1200_du_dvr7  =32'h0000_0000;
    assign   or1200_du_dcr0  =8'h00;
    assign   or1200_du_dcr1  =8'h00;
    assign   or1200_du_dcr2  =8'h00;
    assign   or1200_du_dcr3  =8'h00;
    assign   or1200_du_dcr4  =8'h00;
    assign   or1200_du_dcr5  =8'h00;
    assign   or1200_du_dcr6  =8'h00;
    assign   or1200_du_dcr7  =8'h00;
    assign   or1200_du_dwcr0  =32'h0000_0000;
    assign   or1200_du_dwcr1  =32'h0000_0000;
    always @(                         or1200_du_spr_addr                                                      or    or1200_du_dsr                               or    or1200_du_drr                              or    or1200_du_dmr1                             or    or1200_du_dmr2                            or    or1200_du_dvr0                           or    or1200_du_dvr1                          or    or1200_du_dvr2                         or    or1200_du_dvr3                        or    or1200_du_dvr4                       or    or1200_du_dvr5                      or    or1200_du_dvr6                     or    or1200_du_dvr7                    or    or1200_du_dcr0                   or    or1200_du_dcr1                  or    or1200_du_dcr2                 or    or1200_du_dcr3                or    or1200_du_dcr4               or    or1200_du_dcr5              or    or1200_du_dcr6             or    or1200_du_dcr7            or    or1200_du_dwcr0           or    or1200_du_dwcr1   )
    casez (  or1200_du_spr_addr  [10:0])
        11 'd16:
            or1200_du_spr_dat_o   ={7'h00,  or1200_du_dmr1  };
        11 'd20:
            or1200_du_spr_dat_o   ={18'b0,  or1200_du_dsr  };
        11 'd21:
            or1200_du_spr_dat_o   ={18'b0,  or1200_du_drr  };
        default :
            or1200_du_spr_dat_o   =32'h0000_0000;
    endcase

    assign   or1200_du_du_dsr  =  or1200_du_dsr  ;
    assign   or1200_du_du_hwbkpt  =1'b0;
    always @(  posedge    or1200_du_clk          or  posedge   or1200_du_rst  )
        if (  or1200_du_rst  ==(1'b1))
            or1200_du_du_hwbkpt_hold   <=1'b0;
        else
            if (  or1200_du_du_hwbkpt  &  or1200_du_ex_freeze  )
                or1200_du_du_hwbkpt_hold   <=1'b1;
            else
                if (!  or1200_du_ex_freeze  )
                    or1200_du_du_hwbkpt_hold   <=1'b0;

    assign   or1200_du_tbia_dat_o  =32'h0000_0000;
    assign   or1200_du_tbim_dat_o  =32'h0000_0000;
    assign   or1200_du_tbar_dat_o  =32'h0000_0000;
    assign   or1200_du_tbts_dat_o  =32'h0000_0000;
    assign or1200_du_clk = clk_i;
    assign or1200_du_rst = rst_i;
    assign or1200_du_dcpu_cycstb_i = dcpu_cycstb_cpu;
    assign or1200_du_dcpu_we_i = dcpu_we_cpu;
    assign or1200_du_dcpu_adr_i = dcpu_adr_cpu;
    assign or1200_du_dcpu_dat_lsu = dcpu_dat_cpu;
    assign or1200_du_dcpu_dat_dc = dcpu_dat_qmem;
    assign or1200_du_icpu_cycstb_i = icpu_cycstb_cpu;
    assign or1200_du_ex_freeze = ex_freeze;
    assign or1200_du_branch_op = branch_op;
    assign or1200_du_ex_insn = ex_insn;
    assign or1200_du_id_pc = id_pc;
    assign or1200_du_spr_dat_npc = spr_dat_npc;
    assign or1200_du_rf_dataw = rf_dataw;
    assign du_dsr = or1200_du_du_dsr;
    assign du_dmr1 = or1200_du_du_dmr1;
    assign du_stall = or1200_du_du_stall;
    assign du_addr = or1200_du_du_addr;
    assign or1200_du_du_dat_i = du_dat_cpu;
    assign du_dat_du = or1200_du_du_dat_o;
    assign du_read = or1200_du_du_read;
    assign du_write = or1200_du_du_write;
    assign or1200_du_du_except_stop = du_except_stop;
    assign du_hwbkpt = or1200_du_du_hwbkpt;
    assign du_flush_pipe = or1200_du_du_flush_pipe;
    assign or1200_du_spr_cs = spr_cs[5'd06];
    assign or1200_du_spr_write = spr_we;
    assign or1200_du_spr_addr = spr_addr;
    assign or1200_du_spr_dat_i = spr_dat_cpu;
    assign spr_dat_du = or1200_du_spr_dat_o;
    assign or1200_du_dbg_stall_i = dbg_stall_i;
    assign or1200_du_dbg_ewt_i = dbg_ewt_i;
    assign dbg_lss_o = or1200_du_dbg_lss_o;
    assign dbg_is_o = or1200_du_dbg_is_o;
    assign dbg_wp_o = or1200_du_dbg_wp_o;
    assign dbg_bp_o = or1200_du_dbg_bp_o;
    assign or1200_du_dbg_stb_i = dbg_stb_i;
    assign or1200_du_dbg_we_i = dbg_we_i;
    assign or1200_du_dbg_adr_i = dbg_adr_i;
    assign or1200_du_dbg_dat_i = dbg_dat_i;
    assign dbg_dat_o = or1200_du_dbg_dat_o;
    assign dbg_ack_o = or1200_du_dbg_ack_o;


    wire  or1200_pic_clk;
    wire  or1200_pic_rst;
    wire  or1200_pic_spr_cs;
    wire  or1200_pic_spr_write;
    wire [31:0] or1200_pic_spr_addr;
    wire [31:0] or1200_pic_spr_dat_i;
    reg [31:0] or1200_pic_spr_dat_o;
    wire  or1200_pic_pic_wakeup;
    wire  or1200_pic_intr;
    wire [20-1:0] or1200_pic_pic_int;

    reg[20-1:2]  or1200_pic_picmr  ;
    reg[20-1:0]  or1200_pic_picsr  ;
    wire  or1200_pic_picmr_sel  ;
    wire  or1200_pic_picsr_sel  ;
    wire[20-1:0]  or1200_pic_um_ints  ;
    assign   or1200_pic_picmr_sel  =(  or1200_pic_spr_cs  &&(  or1200_pic_spr_addr  [1:0]==2'd0)) ? 1'b1:1'b0;
    assign   or1200_pic_picsr_sel  =(  or1200_pic_spr_cs  &&(  or1200_pic_spr_addr  [1:0]==2'd2)) ? 1'b1:1'b0;
    always @(  posedge    or1200_pic_clk          or  posedge   or1200_pic_rst  )
        if (  or1200_pic_rst  ==(1'b1))
            or1200_pic_picmr   <={1'b1,{20-3{1'b0}}};
        else
            if (  or1200_pic_picmr_sel  &&  or1200_pic_spr_write  )
            begin
                or1200_pic_picmr   <=  or1200_pic_spr_dat_i  [20-1:2];
            end

    always @(  posedge    or1200_pic_clk          or  posedge   or1200_pic_rst  )
        if (  or1200_pic_rst  ==(1'b1))
            or1200_pic_picsr   <={20{1'b0}};
        else
            if (  or1200_pic_picsr_sel  &&  or1200_pic_spr_write  )
            begin
                or1200_pic_picsr   <=  or1200_pic_spr_dat_i  [20-1:0]|  or1200_pic_um_ints  ;
            end
            else
                or1200_pic_picsr   <=  or1200_pic_picsr  |  or1200_pic_um_ints  ;

    always @(     or1200_pic_spr_addr              or    or1200_pic_picmr           or    or1200_pic_picsr   )
    case (  or1200_pic_spr_addr  [1:0])
        2 'd0:
        begin
            or1200_pic_spr_dat_o   [20-1:0]={  or1200_pic_picmr  ,2'b11};
            or1200_pic_spr_dat_o   [31:20]={32-20{1'b0}};
        end
        default :
        begin
            or1200_pic_spr_dat_o   [20-1:0]=  or1200_pic_picsr  ;
            or1200_pic_spr_dat_o   [31:20]={32-20{1'b0}};
        end
    endcase

    assign   or1200_pic_um_ints  =  or1200_pic_pic_int  &{  or1200_pic_picmr  ,2'b11};
    assign   or1200_pic_intr  =|  or1200_pic_um_ints  ;
    assign   or1200_pic_pic_wakeup  =  or1200_pic_intr  ;
    assign or1200_pic_clk = clk_i;
    assign or1200_pic_rst = rst_i;
    assign or1200_pic_spr_cs = spr_cs[5'd09];
    assign or1200_pic_spr_write = spr_we;
    assign or1200_pic_spr_addr = spr_addr;
    assign or1200_pic_spr_dat_i = spr_dat_cpu;
    assign spr_dat_pic = or1200_pic_spr_dat_o;
    assign pic_wakeup = or1200_pic_pic_wakeup;
    assign sig_int = or1200_pic_intr;
    assign or1200_pic_pic_int = pic_ints_i;


    wire  or1200_tt_clk;
    wire  or1200_tt_rst;
    wire  or1200_tt_du_stall;
    wire  or1200_tt_spr_cs;
    wire  or1200_tt_spr_write;
    wire [31:0] or1200_tt_spr_addr;
    wire [31:0] or1200_tt_spr_dat_i;
    reg [31:0] or1200_tt_spr_dat_o;
    wire  or1200_tt_intr;

    reg[31:0]  or1200_tt_ttmr  ;
    reg[31:0]  or1200_tt_ttcr  ;
    wire  or1200_tt_ttmr_sel  ;
    wire  or1200_tt_ttcr_sel  ;
    wire  or1200_tt_match  ;
    wire  or1200_tt_restart  ;
    wire  or1200_tt_stop  ;
    assign   or1200_tt_ttmr_sel  =(  or1200_tt_spr_cs  &&(  or1200_tt_spr_addr  [0]==1'd0)) ? 1'b1:1'b0;
    assign   or1200_tt_ttcr_sel  =(  or1200_tt_spr_cs  &&(  or1200_tt_spr_addr  [0]==1'd1)) ? 1'b1:1'b0;
    always @(  posedge    or1200_tt_clk          or  posedge   or1200_tt_rst  )
        if (  or1200_tt_rst  ==(1'b1))
            or1200_tt_ttmr   <=32'b0;
        else
            if (  or1200_tt_ttmr_sel  &&  or1200_tt_spr_write  )
                or1200_tt_ttmr   <=  or1200_tt_spr_dat_i  ;
            else
                if (  or1200_tt_ttmr  [29])
                    or1200_tt_ttmr   [28]<=  or1200_tt_ttmr  [28]|(  or1200_tt_match  &  or1200_tt_ttmr  [29]);

    always @(  posedge    or1200_tt_clk          or  posedge   or1200_tt_rst  )
        if (  or1200_tt_rst  ==(1'b1))
            or1200_tt_ttcr   <=32'b0;
        else
            if (  or1200_tt_restart  )
                or1200_tt_ttcr   <=32'b0;
            else
                if (  or1200_tt_ttcr_sel  &&  or1200_tt_spr_write  )
                    or1200_tt_ttcr   <=  or1200_tt_spr_dat_i  ;
                else
                    if (!  or1200_tt_stop  )
                        or1200_tt_ttcr   <=  or1200_tt_ttcr  +32'd1;

    always @(     or1200_tt_spr_addr              or    or1200_tt_ttmr           or    or1200_tt_ttcr   )
    case (  or1200_tt_spr_addr  [0])
        1 'd0:
            or1200_tt_spr_dat_o   =  or1200_tt_ttmr  ;
        default :
            or1200_tt_spr_dat_o   =  or1200_tt_ttcr  ;
    endcase

    assign   or1200_tt_match  =(  or1200_tt_ttmr  [27:0]==  or1200_tt_ttcr  [27:0]) ? 1'b1:1'b0;
    assign   or1200_tt_restart  =  or1200_tt_match  &&(  or1200_tt_ttmr  [31:30]==2'b01);
    assign   or1200_tt_stop  =  or1200_tt_match  &(  or1200_tt_ttmr  [31:30]==2'b10)|(  or1200_tt_ttmr  [31:30]==2'b00)|  or1200_tt_du_stall  ;
    assign   or1200_tt_intr  =  or1200_tt_ttmr  [28];
    assign or1200_tt_clk = clk_i;
    assign or1200_tt_rst = rst_i;
    assign or1200_tt_du_stall = du_stall;
    assign or1200_tt_spr_cs = spr_cs[5'd10];
    assign or1200_tt_spr_write = spr_we;
    assign or1200_tt_spr_addr = spr_addr;
    assign or1200_tt_spr_dat_i = spr_dat_cpu;
    assign spr_dat_tt = or1200_tt_spr_dat_o;
    assign sig_tick = or1200_tt_intr;


    wire  or1200_pm_clk;
    wire  or1200_pm_rst;
    wire  or1200_pm_pic_wakeup;
    wire  or1200_pm_spr_write;
    wire [31:0] or1200_pm_spr_addr;
    wire [31:0] or1200_pm_spr_dat_i;
    wire [31:0] or1200_pm_spr_dat_o;
    wire [3:0] or1200_pm_pm_clksd;
    wire  or1200_pm_pm_cpustall;
    wire  or1200_pm_pm_dc_gate;
    wire  or1200_pm_pm_ic_gate;
    wire  or1200_pm_pm_dmmu_gate;
    wire  or1200_pm_pm_immu_gate;
    wire  or1200_pm_pm_tt_gate;
    wire  or1200_pm_pm_cpu_gate;
    wire  or1200_pm_pm_wakeup;
    wire  or1200_pm_pm_lvolt;

    assign   or1200_pm_pm_clksd  =4'b0;
    assign   or1200_pm_pm_cpu_gate  =1'b0;
    assign   or1200_pm_pm_dc_gate  =1'b0;
    assign   or1200_pm_pm_ic_gate  =1'b0;
    assign   or1200_pm_pm_dmmu_gate  =1'b0;
    assign   or1200_pm_pm_immu_gate  =1'b0;
    assign   or1200_pm_pm_tt_gate  =1'b0;
    assign   or1200_pm_pm_wakeup  =1'b1;
    assign   or1200_pm_pm_lvolt  =1'b0;
    assign   or1200_pm_spr_dat_o  [3:0]=4'b0;
    assign   or1200_pm_spr_dat_o  [4]=1'b0;
    assign   or1200_pm_spr_dat_o  [5]=1'b0;
    assign   or1200_pm_spr_dat_o  [6]=1'b0;
    assign   or1200_pm_spr_dat_o  [31:7]=25'b0;
    assign or1200_pm_clk = clk_i;
    assign or1200_pm_rst = rst_i;
    assign or1200_pm_pic_wakeup = pic_wakeup;
    assign or1200_pm_spr_write = spr_we;
    assign or1200_pm_spr_addr = spr_addr;
    assign or1200_pm_spr_dat_i = spr_dat_cpu;
    assign spr_dat_pm = or1200_pm_spr_dat_o;
    assign pm_clksd_o = or1200_pm_pm_clksd;
    assign or1200_pm_pm_cpustall = pm_cpustall_i;
    assign pm_dc_gate_o = or1200_pm_pm_dc_gate;
    assign pm_ic_gate_o = or1200_pm_pm_ic_gate;
    assign pm_dmmu_gate_o = or1200_pm_pm_dmmu_gate;
    assign pm_immu_gate_o = or1200_pm_pm_immu_gate;
    assign pm_tt_gate_o = or1200_pm_pm_tt_gate;
    assign pm_cpu_gate_o = or1200_pm_pm_cpu_gate;
    assign pm_wakeup_o = or1200_pm_pm_wakeup;
    assign pm_lvolt_o = or1200_pm_pm_lvolt;

endmodule
