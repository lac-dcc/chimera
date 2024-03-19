// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// bilinear
module jelly_texture_bilinear_unit
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
            
            parameter   USER_FIFO_PTR_WIDTH = 6,
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
            input   wire                                    cke,
            
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
            output  wire    [COEFF_WIDTH-1:0]               m_mem_arcoeff,
            output  wire    [X_INT_WIDTH-1:0]               m_mem_araddrx,
            output  wire    [Y_INT_WIDTH-1:0]               m_mem_araddry,
            output  wire                                    m_mem_arstrb,
            output  wire                                    m_mem_arvalid,
            input   wire                                    m_mem_arready,
            
            input   wire    [COEFF_WIDTH-1:0]               m_mem_rcoeff,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_mem_rdata,
            input   wire                                    m_mem_rstrb,
            input   wire                                    m_mem_rvalid,
            output  wire                                    m_mem_rready
        );
    
    
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
    
    localparam  ROUND_X = X_FRAC_WIDTH > 0 ? (1 << (X_FRAC_WIDTH-1)) : 0;
    localparam  ROUND_Y = X_FRAC_WIDTH > 0 ? (1 << (Y_FRAC_WIDTH-1)) : 0;
    
    wire    [X_INT_WIDTH-1:0]               s_ff_x_int;
    wire    [X_FRAC_WIDTH-1:0]              s_ff_x_frac;
    wire    [Y_INT_WIDTH-1:0]               s_ff_y_int;
    wire    [Y_FRAC_WIDTH-1:0]              s_ff_y_frac;
    
    wire    [X_FRAC_WIDTH:0]                s_ff_coeffx0;
    wire    [X_FRAC_WIDTH:0]                s_ff_coeffx1;
    wire    [Y_FRAC_WIDTH:0]                s_ff_coeffy0;
    wire    [Y_FRAC_WIDTH:0]                s_ff_coeffy1;
    
    assign {s_ff_x_int, s_ff_x_frac} = s_ff_x;
    assign {s_ff_y_int, s_ff_y_frac} = s_ff_y;
    
    // バイリニア
    assign s_ff_coeffx0 = {1'b1, {X_FRAC_WIDTH{1'b0}}} - s_ff_x_frac;
    assign s_ff_coeffx1 = {1'b0, s_ff_x_frac};
    assign s_ff_coeffy0 = {1'b1, {Y_FRAC_WIDTH{1'b0}}} - s_ff_y_frac;
    assign s_ff_coeffy1 = {1'b0, s_ff_y_frac};
    
    wire                                    mem_cke;
    
    reg     [1:0]                           s_ff_phase;
    
    reg     [X_FRAC_WIDTH:0]                mem_st0_coeffx;
    reg     [Y_FRAC_WIDTH:0]                mem_st0_coeffy;
    reg     [X_INT_WIDTH-1:0]               mem_st0_x;
    reg     [Y_INT_WIDTH-1:0]               mem_st0_y;
    reg                                     mem_st0_strb;
    reg                                     mem_st0_valid;
    
    reg     [X_FRAC_WIDTH:0]                mem_st1_coeffx;
    reg     [Y_FRAC_WIDTH:0]                mem_st1_coeffy;
    reg     [X_INT_WIDTH:-10]               mem_st1_x;
    reg     [Y_INT_WIDTH-1:0]               mem_st1_y;
    reg                                     mem_st1_strb;
    reg                                     mem_st1_valid;
    
    reg     [Y_FRAC_WIDTH+X_FRAC_WIDTH:0]   mem_st2_coeff;
    reg     [X_INT_WIDTH-1:0]               mem_st2_x;
    reg     [Y_INT_WIDTH-1:0]               mem_st2_y;
    reg                                     mem_st2_strb;
    reg                                     mem_st2_valid;
    
    reg     [COEFF_WIDTH:0]                 mem_st3_coeff;
    reg     [X_INT_WIDTH-1:0]               mem_st3_x;
    reg     [Y_INT_WIDTH-1:0]               mem_st3_y;
    reg                                     mem_st3_strb;
    reg                                     mem_st3_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_ff_phase     <= 2'b00;
            
            mem_st0_coeffx <= {(X_FRAC_WIDTH+1){1'bx}};
            mem_st0_coeffy <= {(Y_FRAC_WIDTH+1){1'bx}};
            mem_st0_x      <= {X_INT_WIDTH{1'bx}};
            mem_st0_y      <= {Y_INT_WIDTH{1'bx}};
            mem_st0_strb   <= 1'bx;
            mem_st0_valid  <= 1'b0;
            
            mem_st1_coeffx <= {(X_FRAC_WIDTH+1){1'bx}};
            mem_st1_coeffy <= {(Y_FRAC_WIDTH+1){1'bx}};
            mem_st1_x      <= {X_INT_WIDTH{1'bx}};
            mem_st1_y      <= {Y_INT_WIDTH{1'bx}};
            mem_st1_strb   <= 1'bx;
            mem_st1_valid  <= 1'b0;
            
            mem_st2_coeff  <= {(1+Y_FRAC_WIDTH+X_FRAC_WIDTH){1'bx}};
            mem_st2_x      <= {X_INT_WIDTH{1'bx}};
            mem_st2_y      <= {Y_INT_WIDTH{1'bx}};
            mem_st2_strb   <= 1'bx;
            mem_st2_valid  <= 1'b0;
            
            mem_st3_coeff  <= {COEFF_WIDTH{1'bx}};
            mem_st3_x      <= {X_INT_WIDTH{1'bx}};
            mem_st3_y      <= {Y_INT_WIDTH{1'bx}};
            mem_st3_strb   <= 1'bx;
            mem_st3_valid  <= 1'b0;
        end
        else if ( mem_cke && cke ) begin
            // input stage
            if ( s_ff_valid ) begin
                s_ff_phase <= s_ff_phase + 1'b1;
            end
            
            // stage 0
            case ( s_ff_phase )
            2'b00: begin mem_st0_coeffx <= s_ff_coeffx0; mem_st0_coeffy <= s_ff_coeffy0; end
            2'b01: begin mem_st0_coeffx <= s_ff_coeffx1; mem_st0_coeffy <= s_ff_coeffy0; end
            2'b10: begin mem_st0_coeffx <= s_ff_coeffx0; mem_st0_coeffy <= s_ff_coeffy1; end
            2'b11: begin mem_st0_coeffx <= s_ff_coeffx1; mem_st0_coeffy <= s_ff_coeffy1; end
            endcase
            if ( param_nearestneighbor ) begin
        //      mem_st0_coeffx <= {1'b1, {X_FRAC_WIDTH{1'b0}}};
        //      mem_st0_coeffy <= {1'b1, {Y_FRAC_WIDTH{1'b0}}};
                mem_st0_coeffx <= {(X_FRAC_WIDTH+1){1'bx}};
                mem_st0_coeffy <= {(Y_FRAC_WIDTH+1){1'bx}};
            end
            
            mem_st0_x <= s_ff_x_int + s_ff_phase[0];
            mem_st0_y <= s_ff_y_int + s_ff_phase[1];
            if ( param_nearestneighbor ) begin
                mem_st0_x <= (s_ff_x_frac >= ROUND_X) ? s_ff_x_int + 1'b1 : s_ff_x_int;
                mem_st0_y <= (s_ff_y_frac >= ROUND_Y) ? s_ff_y_int + 1'b1 : s_ff_y_int;
            end
            
            mem_st0_strb   <= s_ff_strb;
            mem_st0_valid  <= s_ff_valid;
            
            
            // stage 1
            mem_st1_coeffx <= mem_st0_coeffx;
            mem_st1_coeffy <= mem_st0_coeffy;
            mem_st1_x      <= mem_st0_x;
            mem_st1_y      <= mem_st0_y;
            mem_st1_strb   <= mem_st0_strb;
            mem_st1_valid  <= mem_st0_valid;
            
            
            // stage 2
            mem_st2_coeff  <= mem_st1_coeffy * mem_st1_coeffx;
            mem_st2_x      <= mem_st1_x;
            mem_st2_y      <= mem_st1_y;
            mem_st2_strb   <= mem_st1_strb;
            mem_st2_valid  <= mem_st1_valid;
            
            
            // stage 3
            mem_st3_coeff  <= mem_st2_coeff;
            if ( COEFF_FRAC_WIDTH < (X_FRAC_WIDTH + Y_FRAC_WIDTH) ) begin
                mem_st3_coeff <= (mem_st2_coeff >> ((X_FRAC_WIDTH + Y_FRAC_WIDTH) - COEFF_FRAC_WIDTH));
            end
            mem_st3_x      <= mem_st2_x;
            mem_st3_y      <= mem_st2_y;
            mem_st3_strb   <= mem_st2_strb;
            mem_st3_valid  <= mem_st2_valid;
        end
    end
    
    
    assign  mem_cke       = (!m_mem_arvalid || m_mem_arready);
    
    assign  s_ff_ready    = mem_cke && ((s_ff_phase == 2'b11) || param_nearestneighbor);
    
    assign  m_mem_arcoeff = mem_st3_coeff;
    assign  m_mem_araddrx = mem_st3_x;
    assign  m_mem_araddry = mem_st3_y;
    assign  m_mem_arstrb  = mem_st3_strb;
    assign  m_mem_arvalid = mem_st3_valid;
    
    
    
    
    // -------------------------------------
    //  accumulate
    // -------------------------------------
    
    wire                                    acc_cke;
    
    reg     [1:0]                           m_mem_rphase;
    
    reg                                     acc_st0_load;
    reg     [COEFF_WIDTH-1:0]               acc_st0_coeff;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]  acc_st0_data;
    reg                                     acc_st0_strb;
    reg                                     acc_st0_valid;
    
    reg                                     acc_st1_load;
    reg                                     acc_st1_strb;
    reg                                     acc_st1_valid;
    
    reg                                     acc_st2_strb;
    reg                                     acc_st2_valid;
    
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  acc_st3_data;
    reg                                     acc_st3_strb;
    reg                                     acc_st3_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            m_mem_rphase   <= 2'b00;
            
            acc_st0_load   <= 1'b0;
            acc_st0_coeff  <= {COEFF_WIDTH{1'bx}};
            acc_st0_data   <= {(COMPONENT_NUM*DATA_WIDTH){1'bx}};
            acc_st0_strb   <= 1'bx;
            acc_st0_valid  <= 1'b0;
            
            acc_st1_load   <= 1'b0;
            acc_st1_strb   <= 1'bx;
            acc_st1_valid  <= 1'b0;
            
            acc_st3_strb   <= 1'bx;
            acc_st2_valid  <= 1'b0;
            
            acc_st3_strb   <= 1'bx;
            acc_st3_valid  <= 1'b0;
        end
        else if ( acc_cke && cke ) begin
            // read stage
            if ( m_mem_rvalid && m_mem_rready ) begin
                m_mem_rphase <= m_mem_rphase + 1'b1;
            end
            
            
            // stage 0
            acc_st0_load  <= 1'b0;
            acc_st0_coeff <= {COEFF_WIDTH{1'b0}};
            acc_st0_data  <= {(COMPONENT_NUM*DATA_WIDTH){1'b0}};    // m_mem_rdata;
            acc_st0_strb  <= 1'b0;
            acc_st0_valid <= 1'b0;
            
            if ( m_mem_rvalid && m_mem_rready ) begin
                if ( m_mem_rphase == 2'b00 ) begin
                    acc_st0_load   <= 1'b1;
                end
                
                acc_st0_coeff <= m_mem_rcoeff;
                acc_st0_data  <= m_mem_rdata;
                acc_st0_strb  <= m_mem_rstrb;
                
                if ( m_mem_rphase == 2'b11 ) begin
                    acc_st0_valid <= 1'b1;
                end
            end
            
            if ( param_nearestneighbor ) begin
                acc_st0_load  <= 1'b1;
                acc_st0_coeff <= {1'b1, {COEFF_FRAC_WIDTH{1'b0}}};
                acc_st0_data  <= m_mem_rdata;
                acc_st0_strb  <= m_mem_rstrb;
                acc_st0_valid <= m_mem_rvalid && m_mem_rready;
            end
            
            
            // stage 1
            acc_st1_load   <= acc_st0_load;
            acc_st1_strb   <= acc_st0_strb;
            acc_st1_valid  <= acc_st0_valid;
            
            
            // stage 2
            acc_st2_strb   <= acc_st1_strb;
            acc_st2_valid  <= acc_st1_valid;
            
            
            // stage 3
            acc_st3_strb   <= acc_st2_strb;
            acc_st3_valid  <= acc_st2_valid;
        end
    end
    
    
    genvar  i;
    
    generate
    for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin : loop_dsp
        
        wire    [COEFF_WIDTH+DATA_WIDTH-1:0]    acc_st3_p;
        
        jelly_mul_add_dsp48e1
                #(
                    .A_WIDTH        (1+COEFF_WIDTH),
                    .B_WIDTH        (1+DATA_WIDTH),
                    .C_WIDTH        (1+DATA_WIDTH),
                    .P_WIDTH        (COEFF_WIDTH + DATA_WIDTH),
                    
                    .OPMODEREG      (1),
                    .ALUMODEREG     (0),
                    .AREG           (1),
                    .BREG           (1),
                    .CREG           (0),
                    .MREG           (1),
                    .PREG           (1),
                    
                    .USE_PCIN       (0),
                    .USE_PCOUT      (0),
                    
                    .DEVICE         (DEVICE)
                )
            i_mul_add_dsp48e1
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .cke_ctrl       (acc_cke & cke),
                    .cke_alumode    (1'b0),
                    .cke_a0         (1'b0),
                    .cke_a1         (acc_cke & cke),
                    .cke_b0         (1'b0),
                    .cke_b1         (acc_cke & cke),
                    .cke_c          (1'b0),
                    .cke_m          (acc_cke & cke),
                    .cke_p          (acc_cke & cke),
                    
                    .op_load        (acc_st1_load),
                    .alu_sub        (1'b0),
                    
                    .a              ({1'b0, acc_st0_coeff}),
                    .b              ({1'b0, acc_st0_data[i*DATA_WIDTH +: DATA_WIDTH]}),
                    .c              ({(1+DATA_WIDTH){1'b0}}),
                    .p              (acc_st3_p),
                    
                    .pcin           (),
                    .pcout          ()
                );
        
        assign acc_st3_data[i*DATA_WIDTH +: DATA_WIDTH] = (acc_st3_p >> COEFF_FRAC_WIDTH);
    end
    endgenerate

    assign acc_cke      = M_REGS ? m_ff_ready : (!m_ff_valid || m_ff_ready);

    assign m_mem_rready = acc_cke;
    
    assign m_ff_data    = acc_st3_strb ? acc_st3_data : param_blank_value;
    assign m_ff_strb    = acc_st3_strb;
    assign m_ff_valid   = acc_st3_valid;
    
    
    
    // -------------------------------------
    //  User data
    // -------------------------------------
    
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
            jelly_fifo_fwtf
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .s_data         (s_user),
                    .s_valid        (cke & s_valid & s_ready),
                    .s_ready        (),
                    .s_free_count   (),
                    
                    .m_data         (m_user),
                    .m_valid        (),
                    .m_ready        (cke & m_valid & m_ready),
                    .m_data_count   ()
                );
    end
    else begin
        assign m_user = 1'bx;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
