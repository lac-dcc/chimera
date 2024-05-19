// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// bilinear
module jelly_texture_bilinear
        #(
            parameter   COMPONENT_NUM       = 3,
            parameter   DATA_WIDTH          = 8,
            parameter   USER_WIDTH          = 0,
            parameter   X_INT_WIDTH         = 10,
            parameter   X_FRAC_WIDTH        = 4,
            parameter   Y_INT_WIDTH         = 10,
            parameter   Y_FRAC_WIDTH        = 4,
            parameter   COEFF_INT_WIDTH     = 1,
            parameter   COEFF_FRAC_WIDTH    = X_FRAC_WIDTH + Y_FRAC_WIDTH,
            parameter   S_REGS              = 1,
            parameter   M_REGS              = 1,
            parameter   DEVICE              = "RTL",
            
            parameter   USER_FIFO_PTR_WIDTH = 5,
            parameter   USER_FIFO_RAM_TYPE  = "distributed",
            parameter   USER_FIFO_M_REGS    = 0,
            
            parameter   X_WIDTH             = X_INT_WIDTH + X_FRAC_WIDTH,
            parameter   Y_WIDTH             = Y_INT_WIDTH + Y_FRAC_WIDTH,
            parameter   COEFF_WIDTH         = COEFF_INT_WIDTH + COEFF_FRAC_WIDTH,
            parameter   USER_BITS           = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
//          input   wire                                    cke,
            
            input   wire                                    param_nearestneighbor,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  param_blank_value,
            
            input   wire    [USER_BITS-1:0]                 s_user,
            input   wire    [X_WIDTH-1:0]                   s_x,
            input   wire    [Y_WIDTH-1:0]                   s_y,
            input   wire                                    s_strb,
            input   wire                                    s_valid,
            output  wire                                    s_ready,
            
            output  wire    [USER_BITS-1:0]                 m_user,
            output  wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_data,
            output  wire                                    m_strb,
            output  wire                                    m_valid,
            input   wire                                    m_ready,
            
            
            // memory
            output  wire    [X_INT_WIDTH-1:0]               m_mem_araddrx,
            output  wire    [Y_INT_WIDTH-1:0]               m_mem_araddry,
            output  wire                                    m_mem_arstrb,
            output  wire                                    m_mem_arvalid,
            input   wire                                    m_mem_arready,
            
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_mem_rdata,
            input   wire                                    m_mem_rstrb,
            input   wire                                    m_mem_rvalid,
            output  wire                                    m_mem_rready
        );
        
    wire                                    cke = 1;
    
    // -------------------------------------
    //  Insert FF
    // -------------------------------------
    
    // slave port
    wire    [USER_BITS-1:0]                 s_ff_user;
    wire    [X_WIDTH-1:0]                   s_ff_x;
    wire    [Y_WIDTH-1:0]                   s_ff_y;
    wire                                    s_ff_strb;
    wire                                    s_ff_valid;
    wire                                    s_ff_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (USER_BITS+1+Y_WIDTH+X_WIDTH),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (0)
            )
        i_pipeline_insert_ff_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({s_user, s_strb, s_y, s_x}),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         ({s_ff_user, s_ff_strb, s_ff_y, s_ff_x}),
                .m_valid        (s_ff_valid),
                .m_ready        (s_ff_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    // master port
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_ff_data;
    wire                                    m_ff_strb;
    wire                                    m_ff_valid;
    wire                                    m_ff_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1+COMPONENT_NUM*DATA_WIDTH),
                .SLAVE_REGS     (M_REGS),
                .MASTER_REGS    (0)
            )
        i_pipeline_insert_ff_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({m_ff_strb, m_ff_data}),
                .s_valid        (m_ff_valid),
                .s_ready        (m_ff_ready),
                
                .m_data         ({m_strb, m_data}),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    // -------------------------------------
    //  memory access
    // -------------------------------------
    
    wire    [X_INT_WIDTH-1:0]               s_ff_x_int;
    wire    [X_FRAC_WIDTH-1:0]              s_ff_x_frac;
    wire    [Y_INT_WIDTH-1:0]               s_ff_y_int;
    wire    [Y_FRAC_WIDTH-1:0]              s_ff_y_frac;
    
    assign {s_ff_x_int, s_ff_x_frac} = s_ff_x;
    assign {s_ff_y_int, s_ff_y_frac} = s_ff_y;
    
    wire                                    mem_cke;
    
    // slave phase
    reg     [1:0]                           s_ff_phase;
    always @(posedge clk) begin
        if ( reset ) begin
            s_ff_phase <= 2'b00;
        end
        else if ( mem_cke ) begin
            // input stage
            if ( s_ff_valid ) begin
                s_ff_phase <= s_ff_phase + (!param_nearestneighbor && s_ff_strb ? 1'b1 : 1'b0);
            end
        end
    end
    
    
    // user fifo
    wire        fifo_user_s_valid = s_ff_valid & s_ff_ready;
    wire        fifo_user_s_ready;
    generate
    if ( USER_WIDTH > 0 ) begin : blk_user
        jelly_fifo_fwtf
                #(
                    .DATA_WIDTH     (USER_WIDTH),
                    .PTR_WIDTH      (USER_FIFO_PTR_WIDTH),
                    .DOUT_REGS      (0),
                    .RAM_TYPE       (USER_FIFO_RAM_TYPE),
                    .MASTER_REGS    (USER_FIFO_M_REGS)
                )
            jelly_fifo_fwtf_user
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .s_data         (s_ff_user),
                    .s_valid        (fifo_user_s_valid & mem_cke),
                    .s_ready        (fifo_user_s_ready),
                    .s_free_count   (),
                    
                    .m_data         (m_user),
                    .m_valid        (),
                    .m_ready        (m_valid & m_ready & cke),
                    .m_data_count   ()
                );
    end
    else begin
        assign fifo_user_s_ready = 1'b1;
        assign m_user            = 1'bx;
    end
    endgenerate
    
    // x rate fifo
    wire                        fifo_x_s_valid = s_ff_valid & (s_ff_phase == 2'b00);
    wire                        fifo_x_s_ready;
    
    wire    [X_FRAC_WIDTH-1:0]  fifo_x_m_rate;
    wire                        fifo_x_m_ready;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH     (X_FRAC_WIDTH),
                .PTR_WIDTH      (USER_FIFO_PTR_WIDTH),
                .DOUT_REGS      (0),
                .RAM_TYPE       (USER_FIFO_RAM_TYPE),
                .MASTER_REGS    (USER_FIFO_M_REGS)
            )
        jelly_fifo_fwtf_x
            (
                .reset          (reset),
                .clk            (clk),
                
                .s_data         (s_ff_x_frac),
                .s_valid        (fifo_x_s_valid & mem_cke),
                .s_ready        (fifo_x_s_ready),
                .s_free_count   (),
                
                .m_data         (fifo_x_m_rate),
                .m_valid        (),
                .m_ready        (fifo_x_m_ready & cke),
                .m_data_count   ()
            );
    
    // y rate fifo
    wire                        fifo_y_s_valid = s_ff_valid & (s_ff_phase == 2'b00) & mem_cke;
    wire                        fifo_y_s_ready;
    
    wire    [X_FRAC_WIDTH-1:0]  fifo_y_m_rate;
    wire                        fifo_y_m_ready;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH     (Y_FRAC_WIDTH),
                .PTR_WIDTH      (USER_FIFO_PTR_WIDTH),
                .DOUT_REGS      (0),
                .RAM_TYPE       (USER_FIFO_RAM_TYPE),
                .MASTER_REGS    (USER_FIFO_M_REGS)
            )
        jelly_fifo_fwtf_y
            (
                .reset          (reset),
                .clk            (clk),
                
                .s_data         (s_ff_y_frac),
                .s_valid        (fifo_y_s_valid & cke),
                .s_ready        (fifo_y_s_ready),
                .s_free_count   (),
                
                .m_data         (fifo_y_m_rate),
                .m_valid        (),
                .m_ready        (fifo_y_m_ready),
                .m_data_count   ()
            );
    
    
    // memory access
    reg     [X_FRAC_WIDTH-1:0]              mem_ratex;
    reg     [Y_FRAC_WIDTH-1:0]              mem_ratey;
    reg     [X_INT_WIDTH-1:0]               mem_x;
    reg     [Y_INT_WIDTH-1:0]               mem_y;
    reg                                     mem_strb;
    reg                                     mem_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            mem_ratex  <= {(X_FRAC_WIDTH+1){1'bx}};
            mem_ratey  <= {(Y_FRAC_WIDTH+1){1'bx}};
            mem_x      <= {X_INT_WIDTH{1'bx}};
            mem_y      <= {Y_INT_WIDTH{1'bx}};
            mem_strb   <= 1'bx;
            mem_valid  <= 1'b0;
        end
        else if ( mem_cke ) begin
            // memory access stage
            mem_ratex <= s_ff_x_frac;
            mem_ratey <= s_ff_y_frac;
            mem_x     <= s_ff_x_int + (param_nearestneighbor ? s_ff_x_frac[X_FRAC_WIDTH-1] : s_ff_phase[0]);
            mem_y     <= s_ff_y_int + (param_nearestneighbor ? s_ff_y_frac[Y_FRAC_WIDTH-1] : s_ff_phase[1]);
            mem_strb  <= s_ff_strb;
            mem_valid <= s_ff_valid;
        end
    end
    
    
    assign  mem_cke       = cke
                             && (!m_mem_arvalid     || m_mem_arready    )
                             && (!fifo_user_s_valid || fifo_user_s_ready)
                             && (!fifo_x_s_valid    || fifo_x_s_ready   )
                             && (!fifo_y_s_valid    || fifo_y_s_ready   );
    
    assign  s_ff_ready    = ((s_ff_phase == 2'b11) || param_nearestneighbor) & mem_cke;
    
    assign  m_mem_araddrx = mem_x;
    assign  m_mem_araddry = mem_y;
    assign  m_mem_arstrb  = mem_strb;
    assign  m_mem_arvalid = mem_valid;
    
    
    
    
    // -------------------------------------
    //  interpolate
    // -------------------------------------
    
    wire                                    intr_cke;
    
    // mem read port
    reg     [1:0]                           m_mem_rphase;
    always @(posedge clk) begin
        if ( reset ) begin
            m_mem_rphase <= 2'b00;
        end
        else if ( intr_cke ) begin
            if ( m_mem_rvalid && m_mem_rready ) begin
                m_mem_rphase <= m_mem_rphase + (!param_nearestneighbor && m_mem_rstrb ? 1'b1 : 1'b0);
            end
        end
    end
    
    assign m_mem_rready = intr_cke;
    
    
    // interpolate
    localparam  RATE_WIDTH = X_FRAC_WIDTH > Y_FRAC_WIDTH ? X_FRAC_WIDTH : Y_FRAC_WIDTH;
    
    wire    [RATE_WIDTH-1:0]    intr_rate_x = (fifo_x_m_rate << (RATE_WIDTH - X_FRAC_WIDTH));
    wire    [RATE_WIDTH-1:0]    intr_rate_y = (fifo_y_m_rate << (RATE_WIDTH - Y_FRAC_WIDTH));
    
    
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]  intr_data_x,  next_intr_data_x;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]  intr_data_y0, next_intr_data_y0;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]  intr_data_y1, next_intr_data_y1;
    reg                                     intr_y_valid, next_intr_y_valid;
    
    reg     [1:0]                           intr_s_phase, next_intr_s_phase;
    reg     [RATE_WIDTH-1:0]                intr_s_rate,  next_intr_s_rate;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]  intr_s_data0, next_intr_s_data0;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]  intr_s_data1, next_intr_s_data1;
    reg                                     intr_s_valid, next_intr_s_valid;
    
    reg                                     tmp_fifo_x_m_ready;
    reg                                     tmp_fifo_y_m_ready;
    
    wire    [1:0]                           intr_m_phase;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  intr_m_data;
    wire                                    intr_m_valid;
    
    
    jelly_linear_interpolation
            #(
                .USER_WIDTH         (2),
                .RATE_WIDTH         (RATE_WIDTH),
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .DATA_SIGNED        (0),
                .ROUNDING           (0),
                .COMPACT            (1)
            )
        i_linear_interpolation
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (intr_cke),
                
                .s_user             (intr_s_phase),
                .s_rate             (intr_s_rate),
                .s_data0            (intr_s_data0),
                .s_data1            (intr_s_data1),
                .s_valid            (intr_s_valid),
                
                .m_user             (intr_m_phase),
                .m_data             (intr_m_data),
                .m_valid            (intr_m_valid)
            );
    
    always @* begin
        next_intr_data_x   = intr_data_x;
        next_intr_data_y0  = intr_data_y0;
        next_intr_data_y1  = intr_data_y1;
        next_intr_y_valid  = 1'b0;
        next_intr_s_phase  = 2'bxx;
        next_intr_s_rate   = {RATE_WIDTH{1'bx}};
        next_intr_s_data0  = {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
        next_intr_s_data1  = {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
        next_intr_s_valid  = 1'b0;
        tmp_fifo_x_m_ready = 1'b0;
        tmp_fifo_y_m_ready = 1'b0;
        
        if ( intr_m_valid && intr_m_phase[1] == 1'b0 ) begin
            if ( intr_m_phase[0] == 1'b0 ) begin
                next_intr_data_y0 = m_mem_rdata;
            end
            else begin
                next_intr_s_phase  = 2'b1x;
                next_intr_s_rate   = intr_rate_y;
                next_intr_s_data0  = intr_data_y0;
                next_intr_s_data1  = m_mem_rdata;
                next_intr_s_valid  = 1'b1;
                tmp_fifo_y_m_ready = 1'b1;
            end
        end
        
        if ( m_mem_rvalid && m_mem_rready && m_mem_rstrb ) begin
            if ( m_mem_rphase[0] == 1'b0 ) begin
                next_intr_data_x = m_mem_rdata;
            end
            else begin
                if ( next_intr_s_valid ) begin
                    next_intr_data_y1  = m_mem_rdata;
                    next_intr_y_valid  = 1'b1;
                    tmp_fifo_y_m_ready = 1'b0;
                end
                
                next_intr_s_phase  = {1'b0, m_mem_rphase[1]};
                next_intr_s_rate   = intr_rate_x;
                next_intr_s_data0  = intr_data_x;
                next_intr_s_data1  = m_mem_rdata;
                next_intr_s_valid  = 1'b1;
                tmp_fifo_x_m_ready = 1'b1;
            end
        end
        
        if ( intr_y_valid ) begin
            next_intr_s_phase  = 2'b1x;
            next_intr_s_rate   = intr_rate_y;
            next_intr_s_data0  = intr_data_y0;
            next_intr_s_data1  = intr_data_y1;
            next_intr_s_valid  = 1'b1;
            tmp_fifo_y_m_ready = 1'b1;
        end
    end
    
    assign fifo_x_m_ready = tmp_fifo_x_m_ready & intr_cke;
    assign fifo_y_m_ready = tmp_fifo_y_m_ready & intr_cke;
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            intr_data_x  <= {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
            intr_data_y0 <= {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
            intr_data_y1 <= {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
            intr_y_valid <= 1'b0;
            intr_s_phase <= 2'bxx;
            intr_s_rate  <= {RATE_WIDTH{1'bx}};
            intr_s_data0 <= {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
            intr_s_data1 <= {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
            intr_s_valid <= 1'b0;
        end
        else if ( intr_cke ) begin
            intr_data_x  <= next_intr_data_x;
            intr_data_y0 <= next_intr_data_y0;
            intr_data_y1 <= next_intr_data_y1;
            intr_y_valid <= next_intr_y_valid;
            intr_s_phase <= next_intr_s_phase;
            intr_s_rate  <= next_intr_s_rate;
            intr_s_data0 <= next_intr_s_data0;
            intr_s_data1 <= next_intr_s_data1;
            intr_s_valid <= next_intr_s_valid;
        end
    end
    
    assign intr_cke   = (!m_ff_valid || m_ff_ready) & cke;
    
    assign m_ff_data  = intr_m_data;
    assign m_ff_strb  = 1;
    assign m_ff_valid = intr_m_valid && intr_m_phase[1];
    
    
endmodule


`default_nettype wire


// end of file
