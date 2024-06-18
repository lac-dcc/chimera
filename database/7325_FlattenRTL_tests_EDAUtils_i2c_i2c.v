// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module i2c_master_top(
        wb_clk_i,
        wb_rst_i,
        arst_i,
        wb_adr_i,
        wb_dat_i,
        wb_dat_o,
        wb_we_i,
        wb_stb_i,
        wb_cyc_i,
        wb_ack_o,
        wb_inta_o,
        scl_pad_i,
        scl_pad_o,
        scl_padoen_o,
        sda_pad_i,
        sda_pad_o,
        sda_padoen_o
    );
    parameter ARST_LVL  = 1'b0;
    parameter [4:0]byte_controller_ST_IDLE  = 5'b0_0000;
    parameter [4:0]byte_controller_ST_START  = 5'b0_0001;
    parameter [4:0]byte_controller_ST_READ  = 5'b0_0010;
    parameter [4:0]byte_controller_ST_WRITE  = 5'b0_0100;
    parameter [4:0]byte_controller_ST_ACK  = 5'b0_1000;
    parameter [4:0]byte_controller_ST_STOP  = 5'b1_0000;
    parameter [17:0]byte_controller_bit_controller_idle  = 18'b0_0000_0000_0000_0000;
    parameter [17:0]byte_controller_bit_controller_start_a  = 18'b0_0000_0000_0000_0001;
    parameter [17:0]byte_controller_bit_controller_start_b  = 18'b0_0000_0000_0000_0010;
    parameter [17:0]byte_controller_bit_controller_start_c  = 18'b0_0000_0000_0000_0100;
    parameter [17:0]byte_controller_bit_controller_start_d  = 18'b0_0000_0000_0000_1000;
    parameter [17:0]byte_controller_bit_controller_start_e  = 18'b0_0000_0000_0001_0000;
    parameter [17:0]byte_controller_bit_controller_stop_a  = 18'b0_0000_0000_0010_0000;
    parameter [17:0]byte_controller_bit_controller_stop_b  = 18'b0_0000_0000_0100_0000;
    parameter [17:0]byte_controller_bit_controller_stop_c  = 18'b0_0000_0000_1000_0000;
    parameter [17:0]byte_controller_bit_controller_stop_d  = 18'b0_0000_0001_0000_0000;
    parameter [17:0]byte_controller_bit_controller_rd_a  = 18'b0_0000_0010_0000_0000;
    parameter [17:0]byte_controller_bit_controller_rd_b  = 18'b0_0000_0100_0000_0000;
    parameter [17:0]byte_controller_bit_controller_rd_c  = 18'b0_0000_1000_0000_0000;
    parameter [17:0]byte_controller_bit_controller_rd_d  = 18'b0_0001_0000_0000_0000;
    parameter [17:0]byte_controller_bit_controller_wr_a  = 18'b0_0010_0000_0000_0000;
    parameter [17:0]byte_controller_bit_controller_wr_b  = 18'b0_0100_0000_0000_0000;
    parameter [17:0]byte_controller_bit_controller_wr_c  = 18'b0_1000_0000_0000_0000;
    parameter [17:0]byte_controller_bit_controller_wr_d  = 18'b1_0000_0000_0000_0000;
    input wb_clk_i;
    input wb_rst_i;
    input arst_i;
    input [2:0] wb_adr_i;
    input [7:0] wb_dat_i;
    output reg [7:0] wb_dat_o;
    input wb_we_i;
    input wb_stb_i;
    input wb_cyc_i;
    output reg  wb_ack_o;
    output reg  wb_inta_o;
    input scl_pad_i;
    output scl_pad_o;
    output scl_padoen_o;
    input sda_pad_i;
    output sda_pad_o;
    output sda_padoen_o;
    reg [15:0] prer;
    reg [7:0] ctr;
    reg [7:0] txr;
    wire [7:0] rxr;
    reg [7:0] cr;
    wire [7:0] sr;
    wire done;
    wire core_en;
    wire ien;
    wire irxack;
    reg  rxack;
    reg  tip;
    reg  irq_flag;
    wire i2c_busy;
    wire i2c_al;
    reg  al;
    wire rst_i = ( arst_i ^ ARST_LVL );
    wire wb_wacc = ( wb_we_i & wb_ack_o );
    wire sta = cr[7];
    wire sto = cr[6];
    wire rd = cr[5];
    wire wr = cr[4];
    wire ack = cr[3];
    wire iack = cr[0];
    wire byte_controller_clk;
    wire byte_controller_rst;
    wire byte_controller_nReset;
    wire byte_controller_ena;
    wire [15:0] byte_controller_clk_cnt;
    wire byte_controller_start;
    wire byte_controller_stop;
    wire byte_controller_read;
    wire byte_controller_write;
    wire byte_controller_ack_in;
    wire [7:0] byte_controller_din;
    reg  byte_controller_cmd_ack;
    reg  byte_controller_ack_out;
    wire [7:0] byte_controller_dout;
    wire byte_controller_i2c_busy;
    wire byte_controller_i2c_al;
    wire byte_controller_scl_i;
    wire byte_controller_scl_o;
    wire byte_controller_scl_oen;
    wire byte_controller_sda_i;
    wire byte_controller_sda_o;
    wire byte_controller_sda_oen;
    reg [3:0] byte_controller_core_cmd;
    reg  byte_controller_core_txd;
    wire byte_controller_core_ack;
    wire byte_controller_core_rxd;
    reg [7:0] byte_controller_sr;
    reg  byte_controller_shift;
    reg  byte_controller_ld;
    wire byte_controller_go;
    reg [2:0] byte_controller_dcnt;
    wire byte_controller_cnt_done;
    reg [4:0] byte_controller_c_state;
    wire byte_controller_bit_controller_clk;
    wire byte_controller_bit_controller_rst;
    wire byte_controller_bit_controller_nReset;
    wire byte_controller_bit_controller_ena;
    wire [15:0] byte_controller_bit_controller_clk_cnt;
    wire [3:0] byte_controller_bit_controller_cmd;
    reg  byte_controller_bit_controller_cmd_ack;
    reg  byte_controller_bit_controller_busy;
    reg  byte_controller_bit_controller_al;
    wire byte_controller_bit_controller_din;
    reg  byte_controller_bit_controller_dout;
    wire byte_controller_bit_controller_scl_i;
    wire byte_controller_bit_controller_scl_o;
    reg  byte_controller_bit_controller_scl_oen;
    wire byte_controller_bit_controller_sda_i;
    wire byte_controller_bit_controller_sda_o;
    reg  byte_controller_bit_controller_sda_oen;
    reg [1:0] byte_controller_bit_controller_cSCL;
    reg [1:0] byte_controller_bit_controller_cSDA;
    reg [2:0] byte_controller_bit_controller_fSCL;
    reg [2:0] byte_controller_bit_controller_fSDA;
    reg  byte_controller_bit_controller_sSCL;
    reg  byte_controller_bit_controller_sSDA;
    reg  byte_controller_bit_controller_dSCL;
    reg  byte_controller_bit_controller_dSDA;
    reg  byte_controller_bit_controller_dscl_oen;
    reg  byte_controller_bit_controller_sda_chk;
    reg  byte_controller_bit_controller_clk_en;
    reg  byte_controller_bit_controller_slave_wait;
    reg [15:0] byte_controller_bit_controller_cnt;
    reg [13:0] byte_controller_bit_controller_filter_cnt;
    reg [17:0] byte_controller_bit_controller_c_state;
    wire byte_controller_bit_controller_scl_sync = ( ( byte_controller_bit_controller_dSCL &  ~( byte_controller_bit_controller_sSCL) ) & byte_controller_bit_controller_scl_oen );
    reg  byte_controller_bit_controller_sta_condition;
    reg  byte_controller_bit_controller_sto_condition;
    reg  byte_controller_bit_controller_cmd_stop;
    always @ (  posedge wb_clk_i)
    begin
        wb_ack_o <= #1 ( ( wb_cyc_i & wb_stb_i ) &  ~( wb_ack_o) );
    end
    always @ (  posedge wb_clk_i)
    begin
        case ( wb_adr_i ) 
        3'b000:
        begin
            wb_dat_o <= #1 prer[7:0];
        end
        3'b001:
        begin
            wb_dat_o <= #1 prer[15:8];
        end
        3'b010:
        begin
            wb_dat_o <= #1 ctr;
        end
        3'b011:
        begin
            wb_dat_o <= #1 rxr;
        end
        3'b100:
        begin
            wb_dat_o <= #1 sr;
        end
        3'b101:
        begin
            wb_dat_o <= #1 txr;
        end
        3'b110:
        begin
            wb_dat_o <= #1 cr;
        end
        3'b111:
        begin
            wb_dat_o <= #1 0;
        end
        endcase
    end
    always @ (  posedge wb_clk_i or  negedge rst_i)
    begin
        if (  !( rst_i) ) 
        begin
            prer <= #1 16'hffff;
            ctr <= #1 8'h0;
            txr <= #1 8'h0;
        end
        else
        begin
            if ( wb_rst_i ) 
            begin
                prer <= #1 16'hffff;
                ctr <= #1 8'h0;
                txr <= #1 8'h0;
            end
            else
            begin
                if ( wb_wacc ) 
                begin
                    case ( wb_adr_i ) 
                    3'b000:
                    begin
                        prer[7:0] <= #1 wb_dat_i;
                    end
                    3'b001:
                    begin
                        prer[15:8] <= #1 wb_dat_i;
                    end
                    3'b010:
                    begin
                        ctr <= #1 wb_dat_i;
                    end
                    3'b011:
                    begin
                        txr <= #1 wb_dat_i;
                    end
                    default :
                    begin
                        /* Empty Sequential Block */
                    end
                    endcase
                end
            end
        end
    end
    always @ (  posedge wb_clk_i or  negedge rst_i)
    begin
        if (  !( rst_i) ) 
        begin
            cr <= #1 8'h0;
        end
        else
        begin
            if ( wb_rst_i ) 
            begin
                cr <= #1 8'h0;
            end
            else
            begin
                if ( wb_wacc ) 
                begin
                    if ( core_en & ( wb_adr_i == 3'b100 ) ) 
                    begin
                        cr <= #1 wb_dat_i;
                    end
                end
                else
                begin
                    if ( done | i2c_al ) 
                    begin
                        cr[7:4] <= #1 4'h0;
                    end
                    cr[2:1] <= #1 2'b0;
                    cr[0] <= #1 1'b0;
                end
            end
        end
    end
    assign core_en = ctr[7];
    assign ien = ctr[6];
    always @ (  posedge wb_clk_i or  negedge rst_i)
    begin
        if (  !( rst_i) ) 
        begin
            al <= #1 1'b0;
            rxack <= #1 1'b0;
            tip <= #1 1'b0;
            irq_flag <= #1 1'b0;
        end
        else
        begin
            if ( wb_rst_i ) 
            begin
                al <= #1 1'b0;
                rxack <= #1 1'b0;
                tip <= #1 1'b0;
                irq_flag <= #1 1'b0;
            end
            else
            begin
                al <= #1 ( i2c_al | ( al &  ~( sta) ) );
                rxack <= #1 irxack;
                tip <= #1 ( rd | wr );
                irq_flag <= #1 ( ( ( done | i2c_al ) | irq_flag ) &  ~( iack) );
            end
        end
    end
    always @ (  posedge wb_clk_i or  negedge rst_i)
    begin
        if (  !( rst_i) ) 
        begin
            wb_inta_o <= #1 1'b0;
        end
        else
        begin
            if ( wb_rst_i ) 
            begin
                wb_inta_o <= #1 1'b0;
            end
            else
            begin
                wb_inta_o <= #1 ( irq_flag && ien );
            end
        end
    end
    assign sr[7] = rxack;
    assign sr[6] = i2c_busy;
    assign sr[5] = al;
    assign sr[4:2] = 3'h0;
    assign sr[1] = tip;
    assign sr[0] = irq_flag;
    assign byte_controller_clk = wb_clk_i;
    assign byte_controller_rst = wb_rst_i;
    assign byte_controller_nReset = rst_i;
    assign byte_controller_ena = core_en;
    assign byte_controller_clk_cnt = prer;
    assign byte_controller_start = sta;
    assign byte_controller_stop = sto;
    assign byte_controller_read = rd;
    assign byte_controller_write = wr;
    assign byte_controller_ack_in = ack;
    assign byte_controller_din = txr;
    assign done = byte_controller_cmd_ack;
    assign irxack = byte_controller_ack_out;
    assign rxr = byte_controller_dout;
    assign i2c_busy = byte_controller_i2c_busy;
    assign i2c_al = byte_controller_i2c_al;
    assign byte_controller_scl_i = scl_pad_i;
    assign scl_pad_o = byte_controller_scl_o;
    assign scl_padoen_o = byte_controller_scl_oen;
    assign byte_controller_sda_i = sda_pad_i;
    assign sda_pad_o = byte_controller_sda_o;
    assign sda_padoen_o = byte_controller_sda_oen;
    assign byte_controller_bit_controller_clk = byte_controller_clk;
    assign byte_controller_bit_controller_rst = byte_controller_rst;
    assign byte_controller_bit_controller_nReset = byte_controller_nReset;
    assign byte_controller_bit_controller_ena = byte_controller_ena;
    assign byte_controller_bit_controller_clk_cnt = byte_controller_clk_cnt;
    assign byte_controller_bit_controller_cmd = byte_controller_core_cmd;
    assign byte_controller_core_ack = byte_controller_bit_controller_cmd_ack;
    assign byte_controller_i2c_busy = byte_controller_bit_controller_busy;
    assign byte_controller_i2c_al = byte_controller_bit_controller_al;
    assign byte_controller_bit_controller_din = byte_controller_core_txd;
    assign byte_controller_core_rxd = byte_controller_bit_controller_dout;
    assign byte_controller_bit_controller_scl_i = byte_controller_scl_i;
    assign byte_controller_scl_o = byte_controller_bit_controller_scl_o;
    assign byte_controller_scl_oen = byte_controller_bit_controller_scl_oen;
    assign byte_controller_bit_controller_sda_i = byte_controller_sda_i;
    assign byte_controller_sda_o = byte_controller_bit_controller_sda_o;
    assign byte_controller_sda_oen = byte_controller_bit_controller_sda_oen;
    always @ (  posedge byte_controller_bit_controller_clk)
    begin
        byte_controller_bit_controller_dscl_oen <= byte_controller_bit_controller_scl_oen;
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  !( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_slave_wait <= 1'b0;
        end
        else
        begin
            byte_controller_bit_controller_slave_wait <= ( ( ( byte_controller_bit_controller_scl_oen &  ~( byte_controller_bit_controller_dscl_oen) ) &  ~( byte_controller_bit_controller_sSCL) ) | ( byte_controller_bit_controller_slave_wait &  ~( byte_controller_bit_controller_sSCL) ) );
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  ~( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_cnt <= 16'h0;
            byte_controller_bit_controller_clk_en <= 1'b1;
        end
        else
        begin
            if ( ( ( byte_controller_bit_controller_rst ||  ~|( byte_controller_bit_controller_cnt) ) ||  !( byte_controller_bit_controller_ena) ) || byte_controller_bit_controller_scl_sync ) 
            begin
                byte_controller_bit_controller_cnt <= byte_controller_bit_controller_clk_cnt;
                byte_controller_bit_controller_clk_en <= 1'b1;
            end
            else
            begin
                if ( byte_controller_bit_controller_slave_wait ) 
                begin
                    byte_controller_bit_controller_cnt <= byte_controller_bit_controller_cnt;
                    byte_controller_bit_controller_clk_en <= 1'b0;
                end
                else
                begin
                    byte_controller_bit_controller_cnt <= ( byte_controller_bit_controller_cnt - 16'h1 );
                    byte_controller_bit_controller_clk_en <= 1'b0;
                end
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  !( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_cSCL <= 2'b00;
            byte_controller_bit_controller_cSDA <= 2'b00;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_cSCL <= 2'b00;
                byte_controller_bit_controller_cSDA <= 2'b00;
            end
            else
            begin
                byte_controller_bit_controller_cSCL <= { byte_controller_bit_controller_cSCL[0], byte_controller_bit_controller_scl_i };
                byte_controller_bit_controller_cSDA <= { byte_controller_bit_controller_cSDA[0], byte_controller_bit_controller_sda_i };
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  !( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_filter_cnt <= 14'h0;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ||  !( byte_controller_bit_controller_ena) ) 
            begin
                byte_controller_bit_controller_filter_cnt <= 14'h0;
            end
            else
            begin
                if (  ~|( byte_controller_bit_controller_filter_cnt) ) 
                begin
                    byte_controller_bit_controller_filter_cnt <= ( byte_controller_bit_controller_clk_cnt >> 2 );
                end
                else
                begin
                    byte_controller_bit_controller_filter_cnt <= ( byte_controller_bit_controller_filter_cnt - 1 );
                end
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  !( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_fSCL <= 3'b111;
            byte_controller_bit_controller_fSDA <= 3'b111;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_fSCL <= 3'b111;
                byte_controller_bit_controller_fSDA <= 3'b111;
            end
            else
            begin
                if (  ~|( byte_controller_bit_controller_filter_cnt) ) 
                begin
                    byte_controller_bit_controller_fSCL <= { byte_controller_bit_controller_fSCL[1:0], byte_controller_bit_controller_cSCL[1] };
                    byte_controller_bit_controller_fSDA <= { byte_controller_bit_controller_fSDA[1:0], byte_controller_bit_controller_cSDA[1] };
                end
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  ~( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_sSCL <= 1'b1;
            byte_controller_bit_controller_sSDA <= 1'b1;
            byte_controller_bit_controller_dSCL <= 1'b1;
            byte_controller_bit_controller_dSDA <= 1'b1;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_sSCL <= 1'b1;
                byte_controller_bit_controller_sSDA <= 1'b1;
                byte_controller_bit_controller_dSCL <= 1'b1;
                byte_controller_bit_controller_dSDA <= 1'b1;
            end
            else
            begin
                byte_controller_bit_controller_sSCL <= ( (  &( byte_controller_bit_controller_fSCL[2:1]) |  &( byte_controller_bit_controller_fSCL[1:0]) ) | ( byte_controller_bit_controller_fSCL[2] & byte_controller_bit_controller_fSCL[0] ) );
                byte_controller_bit_controller_sSDA <= ( (  &( byte_controller_bit_controller_fSDA[2:1]) |  &( byte_controller_bit_controller_fSDA[1:0]) ) | ( byte_controller_bit_controller_fSDA[2] & byte_controller_bit_controller_fSDA[0] ) );
                byte_controller_bit_controller_dSCL <= byte_controller_bit_controller_sSCL;
                byte_controller_bit_controller_dSDA <= byte_controller_bit_controller_sSDA;
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  ~( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_sta_condition <= 1'b0;
            byte_controller_bit_controller_sto_condition <= 1'b0;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_sta_condition <= 1'b0;
                byte_controller_bit_controller_sto_condition <= 1'b0;
            end
            else
            begin
                byte_controller_bit_controller_sta_condition <= ( (  ~( byte_controller_bit_controller_sSDA) & byte_controller_bit_controller_dSDA ) & byte_controller_bit_controller_sSCL );
                byte_controller_bit_controller_sto_condition <= ( ( byte_controller_bit_controller_sSDA &  ~( byte_controller_bit_controller_dSDA) ) & byte_controller_bit_controller_sSCL );
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  !( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_busy <= 1'b0;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_busy <= 1'b0;
            end
            else
            begin
                byte_controller_bit_controller_busy <= ( ( byte_controller_bit_controller_sta_condition | byte_controller_bit_controller_busy ) &  ~( byte_controller_bit_controller_sto_condition) );
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  ~( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_cmd_stop <= 1'b0;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_cmd_stop <= 1'b0;
            end
            else
            begin
                if ( byte_controller_bit_controller_clk_en ) 
                begin
                    byte_controller_bit_controller_cmd_stop <= ( byte_controller_bit_controller_cmd == 4'b0010 );
                end
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  ~( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_al <= 1'b0;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst ) 
            begin
                byte_controller_bit_controller_al <= 1'b0;
            end
            else
            begin
                byte_controller_bit_controller_al <= ( ( ( byte_controller_bit_controller_sda_chk &  ~( byte_controller_bit_controller_sSDA) ) & byte_controller_bit_controller_sda_oen ) | ( (  |( byte_controller_bit_controller_c_state) & byte_controller_bit_controller_sto_condition ) &  ~( byte_controller_bit_controller_cmd_stop) ) );
            end
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk)
    begin
        if ( byte_controller_bit_controller_sSCL &  ~( byte_controller_bit_controller_dSCL) ) 
        begin
            byte_controller_bit_controller_dout <= byte_controller_bit_controller_sSDA;
        end
    end
    always @ (  posedge byte_controller_bit_controller_clk or  negedge byte_controller_bit_controller_nReset)
    begin
        if (  !( byte_controller_bit_controller_nReset) ) 
        begin
            byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
            byte_controller_bit_controller_cmd_ack <= 1'b0;
            byte_controller_bit_controller_scl_oen <= 1'b1;
            byte_controller_bit_controller_sda_oen <= 1'b1;
            byte_controller_bit_controller_sda_chk <= 1'b0;
        end
        else
        begin
            if ( byte_controller_bit_controller_rst | byte_controller_bit_controller_al ) 
            begin
                byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
                byte_controller_bit_controller_cmd_ack <= 1'b0;
                byte_controller_bit_controller_scl_oen <= 1'b1;
                byte_controller_bit_controller_sda_oen <= 1'b1;
                byte_controller_bit_controller_sda_chk <= 1'b0;
            end
            else
            begin
                byte_controller_bit_controller_cmd_ack <= 1'b0;
                if ( byte_controller_bit_controller_clk_en ) 
                begin
                    case ( byte_controller_bit_controller_c_state ) 
                    byte_controller_bit_controller_idle:
                    begin
                        case ( byte_controller_bit_controller_cmd ) 
                        4'b0001:
                        begin
                            byte_controller_bit_controller_c_state <= byte_controller_bit_controller_start_a;
                        end
                        4'b0010:
                        begin
                            byte_controller_bit_controller_c_state <= byte_controller_bit_controller_stop_a;
                        end
                        4'b0100:
                        begin
                            byte_controller_bit_controller_c_state <= byte_controller_bit_controller_wr_a;
                        end
                        4'b1000:
                        begin
                            byte_controller_bit_controller_c_state <= byte_controller_bit_controller_rd_a;
                        end
                        default :
                        begin
                            byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
                        end
                        endcase
                        byte_controller_bit_controller_scl_oen <= byte_controller_bit_controller_scl_oen;
                        byte_controller_bit_controller_sda_oen <= byte_controller_bit_controller_sda_oen;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_start_a:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_start_b;
                        byte_controller_bit_controller_scl_oen <= byte_controller_bit_controller_scl_oen;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_start_b:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_start_c;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_start_c:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_start_d;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b0;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_start_d:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_start_e;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b0;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_start_e:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
                        byte_controller_bit_controller_cmd_ack <= 1'b1;
                        byte_controller_bit_controller_scl_oen <= 1'b0;
                        byte_controller_bit_controller_sda_oen <= 1'b0;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_stop_a:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_stop_b;
                        byte_controller_bit_controller_scl_oen <= 1'b0;
                        byte_controller_bit_controller_sda_oen <= 1'b0;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_stop_b:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_stop_c;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b0;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_stop_c:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_stop_d;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b0;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_stop_d:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
                        byte_controller_bit_controller_cmd_ack <= 1'b1;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_rd_a:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_rd_b;
                        byte_controller_bit_controller_scl_oen <= 1'b0;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_rd_b:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_rd_c;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_rd_c:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_rd_d;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_rd_d:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
                        byte_controller_bit_controller_cmd_ack <= 1'b1;
                        byte_controller_bit_controller_scl_oen <= 1'b0;
                        byte_controller_bit_controller_sda_oen <= 1'b1;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_wr_a:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_wr_b;
                        byte_controller_bit_controller_scl_oen <= 1'b0;
                        byte_controller_bit_controller_sda_oen <= byte_controller_bit_controller_din;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_wr_b:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_wr_c;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= byte_controller_bit_controller_din;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    byte_controller_bit_controller_wr_c:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_wr_d;
                        byte_controller_bit_controller_scl_oen <= 1'b1;
                        byte_controller_bit_controller_sda_oen <= byte_controller_bit_controller_din;
                        byte_controller_bit_controller_sda_chk <= 1'b1;
                    end
                    byte_controller_bit_controller_wr_d:
                    begin
                        byte_controller_bit_controller_c_state <= byte_controller_bit_controller_idle;
                        byte_controller_bit_controller_cmd_ack <= 1'b1;
                        byte_controller_bit_controller_scl_oen <= 1'b0;
                        byte_controller_bit_controller_sda_oen <= byte_controller_bit_controller_din;
                        byte_controller_bit_controller_sda_chk <= 1'b0;
                    end
                    endcase
                end
            end
        end
    end
    assign byte_controller_bit_controller_scl_o = 1'b0;
    assign byte_controller_bit_controller_sda_o = 1'b0;
    assign byte_controller_go = ( ( ( byte_controller_read | byte_controller_write ) | byte_controller_stop ) &  ~( byte_controller_cmd_ack) );
    assign byte_controller_dout = byte_controller_sr;
    always @ (  posedge byte_controller_clk or  negedge byte_controller_nReset)
    begin
        if (  !( byte_controller_nReset) ) 
        begin
            byte_controller_sr <= 8'h0;
        end
        else
        begin
            if ( byte_controller_rst ) 
            begin
                byte_controller_sr <= 8'h0;
            end
            else
            begin
                if ( byte_controller_ld ) 
                begin
                    byte_controller_sr <= byte_controller_din;
                end
                else
                begin
                    if ( byte_controller_shift ) 
                    begin
                        byte_controller_sr <= { byte_controller_sr[6:0], byte_controller_core_rxd };
                    end
                end
            end
        end
    end
    always @ (  posedge byte_controller_clk or  negedge byte_controller_nReset)
    begin
        if (  !( byte_controller_nReset) ) 
        begin
            byte_controller_dcnt <= 3'h0;
        end
        else
        begin
            if ( byte_controller_rst ) 
            begin
                byte_controller_dcnt <= 3'h0;
            end
            else
            begin
                if ( byte_controller_ld ) 
                begin
                    byte_controller_dcnt <= 3'h7;
                end
                else
                begin
                    if ( byte_controller_shift ) 
                    begin
                        byte_controller_dcnt <= ( byte_controller_dcnt - 3'h1 );
                    end
                end
            end
        end
    end
    assign byte_controller_cnt_done =  ~(  |( byte_controller_dcnt));
    always @ (  posedge byte_controller_clk or  negedge byte_controller_nReset)
    begin
        if (  !( byte_controller_nReset) ) 
        begin
            byte_controller_core_cmd <= 4'b0000;
            byte_controller_core_txd <= 1'b0;
            byte_controller_shift <= 1'b0;
            byte_controller_ld <= 1'b0;
            byte_controller_cmd_ack <= 1'b0;
            byte_controller_c_state <= byte_controller_ST_IDLE;
            byte_controller_ack_out <= 1'b0;
        end
        else
        begin
            if ( byte_controller_rst | byte_controller_i2c_al ) 
            begin
                byte_controller_core_cmd <= 4'b0000;
                byte_controller_core_txd <= 1'b0;
                byte_controller_shift <= 1'b0;
                byte_controller_ld <= 1'b0;
                byte_controller_cmd_ack <= 1'b0;
                byte_controller_c_state <= byte_controller_ST_IDLE;
                byte_controller_ack_out <= 1'b0;
            end
            else
            begin
                byte_controller_core_txd <= byte_controller_sr[7];
                byte_controller_shift <= 1'b0;
                byte_controller_ld <= 1'b0;
                byte_controller_cmd_ack <= 1'b0;
                case ( byte_controller_c_state ) 
                byte_controller_ST_IDLE:
                begin
                    if ( byte_controller_go ) 
                    begin
                        if ( byte_controller_start ) 
                        begin
                            byte_controller_c_state <= byte_controller_ST_START;
                            byte_controller_core_cmd <= 4'b0001;
                        end
                        else
                        begin
                            if ( byte_controller_read ) 
                            begin
                                byte_controller_c_state <= byte_controller_ST_READ;
                                byte_controller_core_cmd <= 4'b1000;
                            end
                            else
                            begin
                                if ( byte_controller_write ) 
                                begin
                                    byte_controller_c_state <= byte_controller_ST_WRITE;
                                    byte_controller_core_cmd <= 4'b0100;
                                end
                                else
                                begin
                                    byte_controller_c_state <= byte_controller_ST_STOP;
                                    byte_controller_core_cmd <= 4'b0010;
                                end
                            end
                        end
                        byte_controller_ld <= 1'b1;
                    end
                end
                byte_controller_ST_START:
                begin
                    if ( byte_controller_core_ack ) 
                    begin
                        if ( byte_controller_read ) 
                        begin
                            byte_controller_c_state <= byte_controller_ST_READ;
                            byte_controller_core_cmd <= 4'b1000;
                        end
                        else
                        begin
                            byte_controller_c_state <= byte_controller_ST_WRITE;
                            byte_controller_core_cmd <= 4'b0100;
                        end
                        byte_controller_ld <= 1'b1;
                    end
                end
                byte_controller_ST_WRITE:
                begin
                    if ( byte_controller_core_ack ) 
                    begin
                        if ( byte_controller_cnt_done ) 
                        begin
                            byte_controller_c_state <= byte_controller_ST_ACK;
                            byte_controller_core_cmd <= 4'b1000;
                        end
                        else
                        begin
                            byte_controller_c_state <= byte_controller_ST_WRITE;
                            byte_controller_core_cmd <= 4'b0100;
                            byte_controller_shift <= 1'b1;
                        end
                    end
                end
                byte_controller_ST_READ:
                begin
                    if ( byte_controller_core_ack ) 
                    begin
                        if ( byte_controller_cnt_done ) 
                        begin
                            byte_controller_c_state <= byte_controller_ST_ACK;
                            byte_controller_core_cmd <= 4'b0100;
                        end
                        else
                        begin
                            byte_controller_c_state <= byte_controller_ST_READ;
                            byte_controller_core_cmd <= 4'b1000;
                        end
                        byte_controller_shift <= 1'b1;
                        byte_controller_core_txd <= byte_controller_ack_in;
                    end
                end
                byte_controller_ST_ACK:
                begin
                    if ( byte_controller_core_ack ) 
                    begin
                        if ( byte_controller_stop ) 
                        begin
                            byte_controller_c_state <= byte_controller_ST_STOP;
                            byte_controller_core_cmd <= 4'b0010;
                        end
                        else
                        begin
                            byte_controller_c_state <= byte_controller_ST_IDLE;
                            byte_controller_core_cmd <= 4'b0000;
                            byte_controller_cmd_ack <= 1'b1;
                        end
                        byte_controller_ack_out <= byte_controller_core_rxd;
                        byte_controller_core_txd <= 1'b1;
                    end
                    else
                    begin
                        byte_controller_core_txd <= byte_controller_ack_in;
                    end
                end
                byte_controller_ST_STOP:
                begin
                    if ( byte_controller_core_ack ) 
                    begin
                        byte_controller_c_state <= byte_controller_ST_IDLE;
                        byte_controller_core_cmd <= 4'b0000;
                        byte_controller_cmd_ack <= 1'b1;
                    end
                end
                endcase
            end
        end
    end
endmodule 


