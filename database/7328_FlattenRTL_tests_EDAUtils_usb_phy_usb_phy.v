// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module usb_phy(
        clk,
        rst,
        phy_tx_mode,
        usb_rst,
        txdp,
        txdn,
        txoe,
        rxd,
        rxdp,
        rxdn,
        DataOut_i,
        TxValid_i,
        TxReady_o,
        RxValid_o,
        RxActive_o,
        RxError_o,
        DataIn_o,
        LineState_o
    );
    parameter \i_tx_phy.IDLE   = 3'd0;
    parameter \i_tx_phy.SOP   = 3'h1;
    parameter \i_tx_phy.DATA   = 3'h2;
    parameter \i_tx_phy.EOP1   = 3'h3;
    parameter \i_tx_phy.EOP2   = 3'h4;
    parameter \i_tx_phy.WAIT   = 3'h5;
    parameter \i_rx_phy.FS_IDLE   = 3'h0;
    parameter \i_rx_phy.K1   = 3'h1;
    parameter \i_rx_phy.J1   = 3'h2;
    parameter \i_rx_phy.K2   = 3'h3;
    parameter \i_rx_phy.J2   = 3'h4;
    parameter \i_rx_phy.K3   = 3'h5;
    parameter \i_rx_phy.J3   = 3'h6;
    parameter \i_rx_phy.K4   = 3'h7;
    input clk;
    input rst;
    input phy_tx_mode;
    output reg  usb_rst;
    output txdp;
    output txdn;
    output txoe;
    input rxd;
    input rxdp;
    input rxdn;
    input [7:0] DataOut_i;
    input TxValid_i;
    output TxReady_o;
    output [7:0] DataIn_o;
    output RxValid_o;
    output RxActive_o;
    output RxError_o;
    output [1:0] LineState_o;
    reg [4:0] rst_cnt;
    wire fs_ce;
    wire \i_tx_phy.clk ;
    wire \i_tx_phy.rst ;
    wire \i_tx_phy.fs_ce ;
    wire \i_tx_phy.phy_mode ;
    reg  \i_tx_phy.txdp ;
    reg  \i_tx_phy.txdn ;
    reg  \i_tx_phy.txoe ;
    wire [7:0] \i_tx_phy.DataOut_i ;
    wire \i_tx_phy.TxValid_i ;
    reg  \i_tx_phy.TxReady_o ;
    reg [2:0] \i_tx_phy.state ;
    reg [2:0] \i_tx_phy.next_state ;
    reg  \i_tx_phy.tx_ready_d ;
    reg  \i_tx_phy.ld_sop_d ;
    reg  \i_tx_phy.ld_data_d ;
    reg  \i_tx_phy.ld_eop_d ;
    reg  \i_tx_phy.tx_ip ;
    reg  \i_tx_phy.tx_ip_sync ;
    reg [2:0] \i_tx_phy.bit_cnt ;
    reg [7:0] \i_tx_phy.hold_reg ;
    reg [7:0] \i_tx_phy.hold_reg_d ;
    reg  \i_tx_phy.sd_raw_o ;
    wire \i_tx_phy.hold ;
    reg  \i_tx_phy.data_done ;
    reg  \i_tx_phy.sft_done ;
    reg  \i_tx_phy.sft_done_r ;
    wire \i_tx_phy.sft_done_e ;
    reg  \i_tx_phy.ld_data ;
    wire \i_tx_phy.eop_done ;
    reg [2:0] \i_tx_phy.one_cnt ;
    wire \i_tx_phy.stuff ;
    reg  \i_tx_phy.sd_bs_o ;
    reg  \i_tx_phy.sd_nrzi_o ;
    reg  \i_tx_phy.append_eop ;
    reg  \i_tx_phy.append_eop_sync1 ;
    reg  \i_tx_phy.append_eop_sync2 ;
    reg  \i_tx_phy.append_eop_sync3 ;
    reg  \i_tx_phy.append_eop_sync4 ;
    reg  \i_tx_phy.txoe_r1 ;
    reg  \i_tx_phy.txoe_r2 ;
    wire \i_rx_phy.clk ;
    wire \i_rx_phy.rst ;
    reg  \i_rx_phy.fs_ce ;
    wire \i_rx_phy.rxd ;
    wire \i_rx_phy.rxdp ;
    wire \i_rx_phy.rxdn ;
    wire [7:0] \i_rx_phy.DataIn_o ;
    wire \i_rx_phy.RxValid_o ;
    wire \i_rx_phy.RxActive_o ;
    wire \i_rx_phy.RxError_o ;
    wire \i_rx_phy.RxEn_i ;
    wire [1:0] \i_rx_phy.LineState ;
    reg  \i_rx_phy.rxd_s0 ;
    reg  \i_rx_phy.rxd_s1 ;
    reg  \i_rx_phy.rxd_s ;
    reg  \i_rx_phy.rxdp_s0 ;
    reg  \i_rx_phy.rxdp_s1 ;
    reg  \i_rx_phy.rxdp_s ;
    reg  \i_rx_phy.rxdp_s_r ;
    reg  \i_rx_phy.rxdn_s0 ;
    reg  \i_rx_phy.rxdn_s1 ;
    reg  \i_rx_phy.rxdn_s ;
    reg  \i_rx_phy.rxdn_s_r ;
    reg  \i_rx_phy.synced_d ;
    wire \i_rx_phy.k ;
    wire \i_rx_phy.j ;
    wire \i_rx_phy.se0 ;
    reg  \i_rx_phy.rxd_r ;
    reg  \i_rx_phy.rx_en ;
    reg  \i_rx_phy.rx_active ;
    reg [2:0] \i_rx_phy.bit_cnt ;
    reg  \i_rx_phy.rx_valid1 ;
    reg  \i_rx_phy.rx_valid ;
    reg  \i_rx_phy.shift_en ;
    reg  \i_rx_phy.sd_r ;
    reg  \i_rx_phy.sd_nrzi ;
    reg [7:0] \i_rx_phy.hold_reg ;
    wire \i_rx_phy.drop_bit ;
    reg [2:0] \i_rx_phy.one_cnt ;
    reg [1:0] \i_rx_phy.dpll_state ;
    reg [1:0] \i_rx_phy.dpll_next_state ;
    reg  \i_rx_phy.fs_ce_d ;
    wire \i_rx_phy.change ;
    wire \i_rx_phy.lock_en ;
    reg [2:0] \i_rx_phy.fs_state ;
    reg [2:0] \i_rx_phy.fs_next_state ;
    reg  \i_rx_phy.rx_valid_r ;
    reg  \i_rx_phy.sync_err_d ;
    reg  \i_rx_phy.sync_err ;
    reg  \i_rx_phy.bit_stuff_err ;
    reg  \i_rx_phy.se0_r ;
    reg  \i_rx_phy.byte_err ;
    reg  \i_rx_phy.se0_s ;
    reg  \i_rx_phy.fs_ce_r1 ;
    reg  \i_rx_phy.fs_ce_r2 ;
    always @ (  posedge clk or  negedge rst)
    begin
        if (  !( rst) ) 
        begin
            rst_cnt <= 5'h0;
        end
        else
        begin 
            if ( LineState_o != 2'h0 ) 
            begin
                rst_cnt <= 5'h0;
            end
            else
            begin 
                if (  !( usb_rst) && fs_ce ) 
                begin
                    rst_cnt <= ( rst_cnt + 5'h1 );
                end
            end
        end
    end
    always @ (  posedge clk or  negedge rst)
    begin
        if (  !( rst) ) 
        begin
            usb_rst <= 1'b0;
        end
        else
        begin 
            usb_rst <= ( rst_cnt == 5'h1f );
        end
    end
    assign \i_tx_phy.clk  = clk;
    assign \i_tx_phy.rst  = rst;
    assign \i_tx_phy.fs_ce  = fs_ce;
    assign \i_tx_phy.phy_mode  = phy_tx_mode;
    assign txdp = \i_tx_phy.txdp ;
    assign txdn = \i_tx_phy.txdn ;
    assign txoe = \i_tx_phy.txoe ;
    assign \i_tx_phy.DataOut_i  = DataOut_i;
    assign \i_tx_phy.TxValid_i  = TxValid_i;
    assign TxReady_o = \i_tx_phy.TxReady_o ;
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.TxReady_o  <= 1'b0;
        end
        else
        begin 
            \i_tx_phy.TxReady_o  <= ( \i_tx_phy.tx_ready_d  & \i_tx_phy.TxValid_i  );
        end
    end
    always @ (  posedge \i_tx_phy.clk )
    begin
        \i_tx_phy.ld_data  <= \i_tx_phy.ld_data_d ;
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.tx_ip  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.ld_sop_d  ) 
            begin
                \i_tx_phy.tx_ip  <= 1'b1;
            end
            else
            begin 
                if ( \i_tx_phy.eop_done  ) 
                begin
                    \i_tx_phy.tx_ip  <= 1'b0;
                end
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.tx_ip_sync  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.tx_ip_sync  <= \i_tx_phy.tx_ip ;
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.data_done  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.TxValid_i  &&  !( \i_tx_phy.tx_ip ) ) 
            begin
                \i_tx_phy.data_done  <= 1'b1;
            end
            else
            begin 
                if (  !( \i_tx_phy.TxValid_i ) ) 
                begin
                    \i_tx_phy.data_done  <= 1'b0;
                end
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.bit_cnt  <= 3'h0;
        end
        else
        begin 
            if (  !( \i_tx_phy.tx_ip_sync ) ) 
            begin
                \i_tx_phy.bit_cnt  <= 3'h0;
            end
            else
            begin 
                if ( \i_tx_phy.fs_ce  &&  !( \i_tx_phy.hold ) ) 
                begin
                    \i_tx_phy.bit_cnt  <= ( \i_tx_phy.bit_cnt  + 3'h1 );
                end
            end
        end
    end
    assign \i_tx_phy.hold  = \i_tx_phy.stuff ;
    always @ (  posedge \i_tx_phy.clk )
    begin
        if (  !( \i_tx_phy.tx_ip_sync ) ) 
        begin
            \i_tx_phy.sd_raw_o  <= 1'b0;
        end
        else
        begin 
            case ( \i_tx_phy.bit_cnt  ) 
            3'h0:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [0];
            end
            3'h1:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [1];
            end
            3'h2:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [2];
            end
            3'h3:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [3];
            end
            3'h4:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [4];
            end
            3'h5:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [5];
            end
            3'h6:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [6];
            end
            3'h7:
            begin
                \i_tx_phy.sd_raw_o  <= \i_tx_phy.hold_reg_d [7];
            end
            endcase
        end
    end
    always @ (  posedge \i_tx_phy.clk )
    begin
        \i_tx_phy.sft_done  <= (  !( \i_tx_phy.hold ) & ( \i_tx_phy.bit_cnt  == 3'h7 ) );
    end
    always @ (  posedge \i_tx_phy.clk )
    begin
        \i_tx_phy.sft_done_r  <= \i_tx_phy.sft_done ;
    end
    assign \i_tx_phy.sft_done_e  = ( \i_tx_phy.sft_done  &  !( \i_tx_phy.sft_done_r ) );
    always @ (  posedge \i_tx_phy.clk )
    begin
        if ( \i_tx_phy.ld_sop_d  ) 
        begin
            \i_tx_phy.hold_reg  <= 8'h80;
        end
        else
        begin 
            if ( \i_tx_phy.ld_data  ) 
            begin
                \i_tx_phy.hold_reg  <= \i_tx_phy.DataOut_i ;
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk )
    begin
        \i_tx_phy.hold_reg_d  <= \i_tx_phy.hold_reg ;
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.one_cnt  <= 3'h0;
        end
        else
        begin 
            if (  !( \i_tx_phy.tx_ip_sync ) ) 
            begin
                \i_tx_phy.one_cnt  <= 3'h0;
            end
            else
            begin 
                if ( \i_tx_phy.fs_ce  ) 
                begin
                    if (  !( \i_tx_phy.sd_raw_o ) || \i_tx_phy.stuff  ) 
                    begin
                        \i_tx_phy.one_cnt  <= 3'h0;
                    end
                    else
                    begin 
                        \i_tx_phy.one_cnt  <= ( \i_tx_phy.one_cnt  + 3'h1 );
                    end
                end
            end
        end
    end
    assign \i_tx_phy.stuff  = ( \i_tx_phy.one_cnt  == 3'h6 );
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.sd_bs_o  <= 1'h0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.sd_bs_o  <= ( (  !( \i_tx_phy.tx_ip_sync ) ) ? ( 1'b0 ) : ( ( ( \i_tx_phy.stuff  ) ? ( 1'b0 ) : ( \i_tx_phy.sd_raw_o  ) ) ) );
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.sd_nrzi_o  <= 1'b1;
        end
        else
        begin 
            if (  !( \i_tx_phy.tx_ip_sync ) ||  !( \i_tx_phy.txoe_r1 ) ) 
            begin
                \i_tx_phy.sd_nrzi_o  <= 1'b1;
            end
            else
            begin 
                if ( \i_tx_phy.fs_ce  ) 
                begin
                    \i_tx_phy.sd_nrzi_o  <= ( ( \i_tx_phy.sd_bs_o  ) ? ( \i_tx_phy.sd_nrzi_o  ) : (  ~( \i_tx_phy.sd_nrzi_o ) ) );
                end
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.append_eop  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.ld_eop_d  ) 
            begin
                \i_tx_phy.append_eop  <= 1'b1;
            end
            else
            begin 
                if ( \i_tx_phy.append_eop_sync2  ) 
                begin
                    \i_tx_phy.append_eop  <= 1'b0;
                end
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.append_eop_sync1  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.append_eop_sync1  <= \i_tx_phy.append_eop ;
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.append_eop_sync2  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.append_eop_sync2  <= \i_tx_phy.append_eop_sync1 ;
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.append_eop_sync3  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.append_eop_sync3  <= ( \i_tx_phy.append_eop_sync2  | ( \i_tx_phy.append_eop_sync3  &  !( \i_tx_phy.append_eop_sync4 ) ) );
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.append_eop_sync4  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.append_eop_sync4  <= \i_tx_phy.append_eop_sync3 ;
            end
        end
    end
    assign \i_tx_phy.eop_done  = \i_tx_phy.append_eop_sync3 ;
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.txoe_r1  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.txoe_r1  <= \i_tx_phy.tx_ip_sync ;
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.txoe_r2  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.txoe_r2  <= \i_tx_phy.txoe_r1 ;
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.txoe  <= 1'b1;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.txoe  <=  !( ( \i_tx_phy.txoe_r1  | \i_tx_phy.txoe_r2  ));
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.txdp  <= 1'b1;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.txdp  <= ( ( \i_tx_phy.phy_mode  ) ? ( (  !( \i_tx_phy.append_eop_sync3 ) & \i_tx_phy.sd_nrzi_o  ) ) : ( \i_tx_phy.sd_nrzi_o  ) );
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.txdn  <= 1'b0;
        end
        else
        begin 
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.txdn  <= ( ( \i_tx_phy.phy_mode  ) ? ( (  !( \i_tx_phy.append_eop_sync3 ) &  ~( \i_tx_phy.sd_nrzi_o ) ) ) : ( \i_tx_phy.append_eop_sync3  ) );
            end
        end
    end
    always @ (  posedge \i_tx_phy.clk  or  negedge \i_tx_phy.rst )
    begin
        if (  !( \i_tx_phy.rst ) ) 
        begin
            \i_tx_phy.state  <= \i_tx_phy.IDLE ;
        end
        else
        begin 
            \i_tx_phy.state  <= \i_tx_phy.next_state ;
        end
    end
    always @ (  \i_tx_phy.state  or  \i_tx_phy.TxValid_i  or  \i_tx_phy.data_done  or  \i_tx_phy.sft_done_e  or  \i_tx_phy.eop_done  or  \i_tx_phy.fs_ce )
    begin
        \i_tx_phy.next_state  = \i_tx_phy.state ;
        \i_tx_phy.tx_ready_d  = 1'b0;
        \i_tx_phy.ld_sop_d  = 1'b0;
        \i_tx_phy.ld_data_d  = 1'b0;
        \i_tx_phy.ld_eop_d  = 1'b0;
        case ( \i_tx_phy.state  ) 
        \i_tx_phy.IDLE :
        begin
            if ( \i_tx_phy.TxValid_i  ) 
            begin
                \i_tx_phy.ld_sop_d  = 1'b1;
                \i_tx_phy.next_state  = \i_tx_phy.SOP ;
            end
        end
        \i_tx_phy.SOP :
        begin
            if ( \i_tx_phy.sft_done_e  ) 
            begin
                \i_tx_phy.tx_ready_d  = 1'b1;
                \i_tx_phy.ld_data_d  = 1'b1;
                \i_tx_phy.next_state  = \i_tx_phy.DATA ;
            end
        end
        \i_tx_phy.DATA :
        begin
            if (  !( \i_tx_phy.data_done ) && \i_tx_phy.sft_done_e  ) 
            begin
                \i_tx_phy.ld_eop_d  = 1'b1;
                \i_tx_phy.next_state  = \i_tx_phy.EOP1 ;
            end
            if ( \i_tx_phy.data_done  && \i_tx_phy.sft_done_e  ) 
            begin
                \i_tx_phy.tx_ready_d  = 1'b1;
                \i_tx_phy.ld_data_d  = 1'b1;
            end
        end
        \i_tx_phy.EOP1 :
        begin
            if ( \i_tx_phy.eop_done  ) 
            begin
                \i_tx_phy.next_state  = \i_tx_phy.EOP2 ;
            end
        end
        \i_tx_phy.EOP2 :
        begin
            if (  !( \i_tx_phy.eop_done ) && \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.next_state  = \i_tx_phy.WAIT ;
            end
        end
        \i_tx_phy.WAIT :
        begin
            if ( \i_tx_phy.fs_ce  ) 
            begin
                \i_tx_phy.next_state  = \i_tx_phy.IDLE ;
            end
        end
        endcase
    end
    assign \i_rx_phy.clk  = clk;
    assign \i_rx_phy.rst  = rst;
    assign fs_ce = \i_rx_phy.fs_ce ;
    assign \i_rx_phy.rxd  = rxd;
    assign \i_rx_phy.rxdp  = rxdp;
    assign \i_rx_phy.rxdn  = rxdn;
    assign DataIn_o = \i_rx_phy.DataIn_o ;
    assign RxValid_o = \i_rx_phy.RxValid_o ;
    assign RxActive_o = \i_rx_phy.RxActive_o ;
    assign RxError_o = \i_rx_phy.RxError_o ;
    assign \i_rx_phy.RxEn_i  = txoe;
    assign LineState_o = \i_rx_phy.LineState ;
    assign \i_rx_phy.RxActive_o  = \i_rx_phy.rx_active ;
    assign \i_rx_phy.RxValid_o  = \i_rx_phy.rx_valid ;
    assign \i_rx_phy.RxError_o  = ( ( \i_rx_phy.sync_err  | \i_rx_phy.bit_stuff_err  ) | \i_rx_phy.byte_err  );
    assign \i_rx_phy.DataIn_o  = \i_rx_phy.hold_reg ;
    assign \i_rx_phy.LineState  = { \i_rx_phy.rxdn_s1 , \i_rx_phy.rxdp_s1  };
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rx_en  <= \i_rx_phy.RxEn_i ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.sync_err  <= (  !( \i_rx_phy.rx_active ) & \i_rx_phy.sync_err_d  );
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxd_s0  <= \i_rx_phy.rxd ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxd_s1  <= \i_rx_phy.rxd_s0 ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        if ( \i_rx_phy.rxd_s0  && \i_rx_phy.rxd_s1  ) 
        begin
            \i_rx_phy.rxd_s  <= 1'b1;
        end
        else
        begin 
            if (  !( \i_rx_phy.rxd_s0 ) &&  !( \i_rx_phy.rxd_s1 ) ) 
            begin
                \i_rx_phy.rxd_s  <= 1'b0;
            end
        end
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdp_s0  <= \i_rx_phy.rxdp ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdp_s1  <= \i_rx_phy.rxdp_s0 ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdp_s_r  <= ( \i_rx_phy.rxdp_s0  & \i_rx_phy.rxdp_s1  );
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdp_s  <= ( ( \i_rx_phy.rxdp_s0  & \i_rx_phy.rxdp_s1  ) | \i_rx_phy.rxdp_s_r  );
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdn_s0  <= \i_rx_phy.rxdn ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdn_s1  <= \i_rx_phy.rxdn_s0 ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdn_s_r  <= ( \i_rx_phy.rxdn_s0  & \i_rx_phy.rxdn_s1  );
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxdn_s  <= ( ( \i_rx_phy.rxdn_s0  & \i_rx_phy.rxdn_s1  ) | \i_rx_phy.rxdn_s_r  );
    end
    assign \i_rx_phy.k  = (  !( \i_rx_phy.rxdp_s ) & \i_rx_phy.rxdn_s  );
    assign \i_rx_phy.j  = ( \i_rx_phy.rxdp_s  &  !( \i_rx_phy.rxdn_s ) );
    assign \i_rx_phy.se0  = (  !( \i_rx_phy.rxdp_s ) &  !( \i_rx_phy.rxdn_s ) );
    always @ (  posedge \i_rx_phy.clk )
    begin
        if ( \i_rx_phy.fs_ce  ) 
        begin
            \i_rx_phy.se0_s  <= \i_rx_phy.se0 ;
        end
    end
    assign \i_rx_phy.lock_en  = \i_rx_phy.rx_en ;
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rxd_r  <= \i_rx_phy.rxd_s ;
    end
    assign \i_rx_phy.change  = ( \i_rx_phy.rxd_r  != \i_rx_phy.rxd_s  );
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.dpll_state  <= 2'h1;
        end
        else
        begin 
            \i_rx_phy.dpll_state  <= \i_rx_phy.dpll_next_state ;
        end
    end
    always @ (  \i_rx_phy.dpll_state  or  \i_rx_phy.lock_en  or  \i_rx_phy.change )
    begin
        \i_rx_phy.fs_ce_d  = 1'b0;
        case ( \i_rx_phy.dpll_state  ) 
        2'h0:
        begin
            if ( \i_rx_phy.lock_en  && \i_rx_phy.change  ) 
            begin
                \i_rx_phy.dpll_next_state  = 2'h0;
            end
            else
            begin 
                \i_rx_phy.dpll_next_state  = 2'h1;
            end
        end
        2'h1:
        begin
            \i_rx_phy.fs_ce_d  = 1'b1;
            if ( \i_rx_phy.lock_en  && \i_rx_phy.change  ) 
            begin
                \i_rx_phy.dpll_next_state  = 2'h3;
            end
            else
            begin 
                \i_rx_phy.dpll_next_state  = 2'h2;
            end
        end
        2'h2:
        begin
            if ( \i_rx_phy.lock_en  && \i_rx_phy.change  ) 
            begin
                \i_rx_phy.dpll_next_state  = 2'h0;
            end
            else
            begin 
                \i_rx_phy.dpll_next_state  = 2'h3;
            end
        end
        2'h3:
        begin
            if ( \i_rx_phy.lock_en  && \i_rx_phy.change  ) 
            begin
                \i_rx_phy.dpll_next_state  = 2'h0;
            end
            else
            begin 
                \i_rx_phy.dpll_next_state  = 2'h0;
            end
        end
        endcase
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.fs_ce_r1  <= \i_rx_phy.fs_ce_d ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.fs_ce_r2  <= \i_rx_phy.fs_ce_r1 ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.fs_ce  <= \i_rx_phy.fs_ce_r2 ;
    end
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.fs_state  <= \i_rx_phy.FS_IDLE ;
        end
        else
        begin 
            \i_rx_phy.fs_state  <= \i_rx_phy.fs_next_state ;
        end
    end
    always @ (  \i_rx_phy.fs_state  or  \i_rx_phy.fs_ce  or  \i_rx_phy.k  or  \i_rx_phy.j  or  \i_rx_phy.rx_en  or  \i_rx_phy.rx_active  or  \i_rx_phy.se0  or  \i_rx_phy.se0_s )
    begin
        \i_rx_phy.synced_d  = 1'b0;
        \i_rx_phy.sync_err_d  = 1'b0;
        \i_rx_phy.fs_next_state  = \i_rx_phy.fs_state ;
        if ( ( ( \i_rx_phy.fs_ce  &&  !( \i_rx_phy.rx_active ) ) &&  !( \i_rx_phy.se0 ) ) &&  !( \i_rx_phy.se0_s ) ) 
        begin
            case ( \i_rx_phy.fs_state  ) 
            \i_rx_phy.FS_IDLE :
            begin
                if ( \i_rx_phy.k  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.K1 ;
                end
            end
            \i_rx_phy.K1 :
            begin
                if ( \i_rx_phy.j  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.J1 ;
                end
                else
                begin
                    \i_rx_phy.sync_err_d  = 1'b1;
                    \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                end
            end
            \i_rx_phy.J1 :
            begin
                if ( \i_rx_phy.k  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.K2 ;
                end
                else
                begin
                    \i_rx_phy.sync_err_d  = 1'b1;
                    \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                end
            end
            \i_rx_phy.K2 :
            begin
                if ( \i_rx_phy.j  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.J2 ;
                end
                else
                begin
                    \i_rx_phy.sync_err_d  = 1'b1;
                    \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                end
            end
            \i_rx_phy.J2 :
            begin
                if ( \i_rx_phy.k  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.K3 ;
                end
                else
                begin
                    \i_rx_phy.sync_err_d  = 1'b1;
                    \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                end
            end
            \i_rx_phy.K3 :
            begin
                if ( \i_rx_phy.j  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.J3 ;
                end
                else
                begin 
                    if ( \i_rx_phy.k  && \i_rx_phy.rx_en  ) 
                    begin
                        \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                        \i_rx_phy.synced_d  = 1'b1;
                    end
                    else
                    begin
                        \i_rx_phy.sync_err_d  = 1'b1;
                        \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                    end
                end
            end
            \i_rx_phy.J3 :
            begin
                if ( \i_rx_phy.k  && \i_rx_phy.rx_en  ) 
                begin
                    \i_rx_phy.fs_next_state  = \i_rx_phy.K4 ;
                end
                else
                begin
                    \i_rx_phy.sync_err_d  = 1'b1;
                    \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
                end
            end
            \i_rx_phy.K4 :
            begin
                if ( \i_rx_phy.k  ) 
                begin
                    \i_rx_phy.synced_d  = 1'b1;
                end
                \i_rx_phy.fs_next_state  = \i_rx_phy.FS_IDLE ;
            end
            endcase
        end
    end
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.rx_active  <= 1'b0;
        end
        else
        begin 
            if ( \i_rx_phy.synced_d  && \i_rx_phy.rx_en  ) 
            begin
                \i_rx_phy.rx_active  <= 1'b1;
            end
            else
            begin 
                if ( \i_rx_phy.se0  && \i_rx_phy.rx_valid_r  ) 
                begin
                    \i_rx_phy.rx_active  <= 1'b0;
                end
            end
        end
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        if ( \i_rx_phy.rx_valid  ) 
        begin
            \i_rx_phy.rx_valid_r  <= 1'b1;
        end
        else
        begin 
            if ( \i_rx_phy.fs_ce  ) 
            begin
                \i_rx_phy.rx_valid_r  <= 1'b0;
            end
        end
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        if ( \i_rx_phy.fs_ce  ) 
        begin
            \i_rx_phy.sd_r  <= \i_rx_phy.rxd_s ;
        end
    end
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.sd_nrzi  <= 1'b0;
        end
        else
        begin 
            if (  !( \i_rx_phy.rx_active ) ) 
            begin
                \i_rx_phy.sd_nrzi  <= 1'b1;
            end
            else
            begin 
                if ( \i_rx_phy.rx_active  && \i_rx_phy.fs_ce  ) 
                begin
                    \i_rx_phy.sd_nrzi  <=  !( ( \i_rx_phy.rxd_s  ^ \i_rx_phy.sd_r  ));
                end
            end
        end
    end
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.one_cnt  <= 3'h0;
        end
        else
        begin 
            if (  !( \i_rx_phy.shift_en ) ) 
            begin
                \i_rx_phy.one_cnt  <= 3'h0;
            end
            else
            begin 
                if ( \i_rx_phy.fs_ce  ) 
                begin
                    if (  !( \i_rx_phy.sd_nrzi ) || \i_rx_phy.drop_bit  ) 
                    begin
                        \i_rx_phy.one_cnt  <= 3'h0;
                    end
                    else
                    begin 
                        \i_rx_phy.one_cnt  <= ( \i_rx_phy.one_cnt  + 3'h1 );
                    end
                end
            end
        end
    end
    assign \i_rx_phy.drop_bit  = ( \i_rx_phy.one_cnt  == 3'h6 );
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.bit_stuff_err  <= ( ( ( ( \i_rx_phy.drop_bit  & \i_rx_phy.sd_nrzi  ) & \i_rx_phy.fs_ce  ) &  !( \i_rx_phy.se0 ) ) & \i_rx_phy.rx_active  );
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        if ( \i_rx_phy.fs_ce  ) 
        begin
            \i_rx_phy.shift_en  <= ( \i_rx_phy.synced_d  | \i_rx_phy.rx_active  );
        end
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        if ( ( \i_rx_phy.fs_ce  && \i_rx_phy.shift_en  ) &&  !( \i_rx_phy.drop_bit ) ) 
        begin
            \i_rx_phy.hold_reg  <= { \i_rx_phy.sd_nrzi , \i_rx_phy.hold_reg [7:1] };
        end
    end
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.bit_cnt  <= 3'b0;
        end
        else
        begin 
            if (  !( \i_rx_phy.shift_en ) ) 
            begin
                \i_rx_phy.bit_cnt  <= 3'h0;
            end
            else
            begin 
                if ( \i_rx_phy.fs_ce  &&  !( \i_rx_phy.drop_bit ) ) 
                begin
                    \i_rx_phy.bit_cnt  <= ( \i_rx_phy.bit_cnt  + 3'h1 );
                end
            end
        end
    end
    always @ (  posedge \i_rx_phy.clk  or  negedge \i_rx_phy.rst )
    begin
        if (  !( \i_rx_phy.rst ) ) 
        begin
            \i_rx_phy.rx_valid1  <= 1'b0;
        end
        else
        begin 
            if ( ( \i_rx_phy.fs_ce  &&  !( \i_rx_phy.drop_bit ) ) && ( \i_rx_phy.bit_cnt  == 3'h7 ) ) 
            begin
                \i_rx_phy.rx_valid1  <= 1'b1;
            end
            else
            begin 
                if ( ( \i_rx_phy.rx_valid1  && \i_rx_phy.fs_ce  ) &&  !( \i_rx_phy.drop_bit ) ) 
                begin
                    \i_rx_phy.rx_valid1  <= 1'b0;
                end
            end
        end
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.rx_valid  <= ( (  !( \i_rx_phy.drop_bit ) & \i_rx_phy.rx_valid1  ) & \i_rx_phy.fs_ce  );
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.se0_r  <= \i_rx_phy.se0 ;
    end
    always @ (  posedge \i_rx_phy.clk )
    begin
        \i_rx_phy.byte_err  <= ( ( ( \i_rx_phy.se0  &  !( \i_rx_phy.se0_r ) ) &  |( \i_rx_phy.bit_cnt [2:1]) ) & \i_rx_phy.rx_active  );
    end
endmodule 


