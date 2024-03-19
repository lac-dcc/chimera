// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_data_logger_fifo
        #(
            parameter   CORE_ID          = 32'h527a_f001,
            parameter   CORE_VERSION     = 32'h0000_0000,
            parameter   DATA_WIDTH       = 32,
            parameter   TIMER_WIDTH      = 0,
            parameter   FIFO_ASYNC       = 1,
            parameter   FIFO_PTR_WIDTH   = 10,
            parameter   FIFO_RAM_TYPE    = "block",
            parameter   WB_ADR_WIDTH     = 8,
            parameter   WB_DAT_WIDTH     = 32,
            parameter   WB_SEL_WIDTH     = (WB_DAT_WIDTH / 8),
            parameter   INIT_CTL_CONTROL = 2'b00
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            input   wire                        s_wb_rst_i,
            input   wire                        s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o
        );
    
    localparam  TIMER_BITS = TIMER_WIDTH > 0 ? TIMER_WIDTH : 1;
    
    
    
    // -------------------------------------
    //  FIFO
    // -------------------------------------
    
    wire    [TIMER_BITS-1:0]                fifo_s_timer;
    
    wire    [TIMER_BITS-1:0]                fifo_m_timer;
    wire    [DATA_WIDTH-1:0]                fifo_m_data;
    wire                                    fifo_m_valid;
    wire                                    fifo_m_ready;
    wire    [FIFO_PTR_WIDTH:0]              fifo_m_data_count;
    
    wire    [TIMER_WIDTH+DATA_WIDTH-1:0]    fifo_s_pack;
    wire    [TIMER_WIDTH+DATA_WIDTH-1:0]    fifo_m_pack;
    
    assign fifo_s_pack = {fifo_s_timer, s_data};
    assign {fifo_m_timer, fifo_m_data} = {1'b0, fifo_m_pack};
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (FIFO_ASYNC),
                .DATA_WIDTH     (TIMER_WIDTH+DATA_WIDTH),
                .PTR_WIDTH      (FIFO_PTR_WIDTH),
                .DOUT_REGS      (1),
                .RAM_TYPE       (FIFO_RAM_TYPE),
                .LOW_DEALY      (0),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (1)
            )
        i_fifo_generic_fwtf
            (
                .s_reset        (reset),
                .s_clk          (clk),
                .s_data         (fifo_s_pack),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                .s_free_count   (),
                
                .m_reset        (s_wb_rst_i),
                .m_clk          (s_wb_clk_i),
                .m_data         (fifo_m_pack),
                .m_valid        (fifo_m_valid),
                .m_ready        (fifo_m_ready),
                .m_data_count   (fifo_m_data_count)
            );
    
    
    
    // -------------------------------------
    //  Timer
    // -------------------------------------
    
    reg [TIMER_BITS-1:0]    reg_timer;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_timer <= 0;
        end
        else begin
            reg_timer <= reg_timer + 1'b1;
        end
    end
    
    assign fifo_s_timer = reg_timer;
    
    
    
    // -------------------------------------
    //  Register
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID        = 8'h00;
    localparam  ADR_CORE_VERSION   = 8'h01;
    localparam  ADR_CTL_CONTROL    = 8'h04;
    localparam  ADR_CTL_STATUS     = 8'h05;
    localparam  ADR_CTL_COUNT      = 8'h07;
    localparam  ADR_READ_DATA      = 8'h10;
    localparam  ADR_POL_TIMER0     = 8'h18;
    localparam  ADR_POL_TIMER1     = 8'h19;
    localparam  ADR_POL_DATA0      = 8'h20;
    localparam  ADR_POL_DATA1      = 8'h21;
    localparam  ADR_POL_DATA2      = 8'h22;
    localparam  ADR_POL_DATA3      = 8'h23;
    localparam  ADR_POL_DATA4      = 8'h24;
    localparam  ADR_POL_DATA5      = 8'h25;
    localparam  ADR_POL_DATA6      = 8'h26;
    localparam  ADR_POL_DATA7      = 8'h27;
    localparam  ADR_POL_DATA8      = 8'h28;
    localparam  ADR_POL_DATA9      = 8'h29;
    localparam  ADR_POL_DATA10     = 8'h2a;
    localparam  ADR_POL_DATA11     = 8'h2b;
    localparam  ADR_POL_DATA12     = 8'h2c;
    localparam  ADR_POL_DATA13     = 8'h2d;
    localparam  ADR_POL_DATA14     = 8'h2e;
    localparam  ADR_POL_DATA15     = 8'h2f;
    
    // registers
    reg                             reg_force_read;
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_force_read <= INIT_CTL_CONTROL[1];
        end
        else begin
            // register write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                if ( (s_wb_adr_i == ADR_CTL_CONTROL) && s_wb_sel_i[0] ) begin
                    reg_force_read <= s_wb_dat_i[1];
                end
            end
        end
    end
    
    // register read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)      ? CORE_ID                          :
                        (s_wb_adr_i == ADR_CORE_VERSION) ? CORE_VERSION                     :
                        (s_wb_adr_i == ADR_CTL_CONTROL)  ? {reg_force_read, 1'b0}           :
                        (s_wb_adr_i == ADR_CTL_STATUS)   ? fifo_m_valid                     :
                        (s_wb_adr_i == ADR_CTL_COUNT)    ? fifo_m_data_count                :
                        (s_wb_adr_i == ADR_POL_TIMER0)   ? fifo_m_timer >> (0*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_TIMER1)   ? fifo_m_timer >> (1*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_DATA0)    ? fifo_m_data >> (0*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA1)    ? fifo_m_data >> (1*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA2)    ? fifo_m_data >> (2*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA3)    ? fifo_m_data >> (3*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA4)    ? fifo_m_data >> (4*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA5)    ? fifo_m_data >> (5*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA6)    ? fifo_m_data >> (6*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA7)    ? fifo_m_data >> (7*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA8)    ? fifo_m_data >> (8*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA9)    ? fifo_m_data >> (9*WB_DAT_WIDTH)  :
                        (s_wb_adr_i == ADR_POL_DATA10)   ? fifo_m_data >> (10*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_DATA11)   ? fifo_m_data >> (11*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_DATA12)   ? fifo_m_data >> (12*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_DATA13)   ? fifo_m_data >> (13*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_DATA14)   ? fifo_m_data >> (14*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_POL_DATA15)   ? fifo_m_data >> (15*WB_DAT_WIDTH) :
                        (s_wb_adr_i == ADR_READ_DATA)    ? fifo_m_data                      :
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    // CTL_CONTROL[0] への 1 書き込み or READ_DATA で読み進む
    assign fifo_m_ready = (s_wb_stb_i && (s_wb_adr_i == ADR_CTL_CONTROL) && s_wb_we_i && s_wb_sel_i[0] && s_wb_dat_i[0])
                        | (s_wb_stb_i && (s_wb_adr_i == ADR_READ_DATA) && ~s_wb_we_i)
                        | reg_force_read;
    
    
    
endmodule


`default_nettype wire


// end of file
