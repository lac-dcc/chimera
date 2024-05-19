// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// reciprocal
module jelly_float_reciprocal
        #(
            parameter   EXP_WIDTH       = 8,
            parameter   EXP_OFFSET      = (1 << (EXP_WIDTH-1)) - 1,
            parameter   FRAC_WIDTH      = 23,
            parameter   FLOAT_WIDTH     = 1 + EXP_WIDTH + FRAC_WIDTH,   // sign + exp + frac
            
            parameter   USER_WIDTH      = 0,
            
            parameter   D_WIDTH         = 8,                            // interpolation table addr bits
            parameter   K_WIDTH         = FRAC_WIDTH - D_WIDTH,
            parameter   GRAD_WIDTH      = FRAC_WIDTH,
            
            parameter   MASTER_IN_REGS  = 1,
            parameter   MASTER_OUT_REGS = 1,
            
            parameter   RAM_TYPE        = "block",
            
            parameter   MAKE_TABLE      = 1,
            parameter   WRITE_TABLE     = 0,
            parameter   READ_TABLE      = 0,
            parameter   FILE_NAME       = "float_reciprocal.hex",
            
            parameter   USER_BITS       = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [FLOAT_WIDTH-1:0]   s_float,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [FLOAT_WIDTH-1:0]   m_float,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  PIPELINE_STAGES = 5;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [USER_BITS-1:0]         src_user;
    wire                            src_sign;
    wire    [EXP_WIDTH-1:0]         src_exp;
    wire    [FRAC_WIDTH-1:0]        src_frac;
    
    wire    [USER_BITS-1:0]         sink_user;
    wire                            sink_sign;
    wire    [EXP_WIDTH-1:0]         sink_exp;
    wire    [FRAC_WIDTH-1:0]        sink_frac;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+FLOAT_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+FLOAT_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_float}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_float}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_sign, src_exp, src_frac}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_sign, sink_exp, sink_frac}),
                .buffered           ()
            );
    
    wire    [FRAC_WIDTH-1:0]    st1_frac;
    wire    [FRAC_WIDTH-1:0]    st1_grad;
    
    generate
    if ( FRAC_WIDTH == 23 && D_WIDTH == 6 && GRAD_WIDTH == 23 && !MAKE_TABLE && !WRITE_TABLE && !READ_TABLE ) begin
        // どんな合成器でも１種類は動くようにテーブル化
        jelly_float_reciprocal_frac23_d6
            i_float_reciprocal_frac23_d6
                (
                    .clk            (clk),
                    
                    .cke            (stage_cke[1:0]),
                    
                    .in_d           (src_frac[FRAC_WIDTH-1 -: D_WIDTH]),
                    
                    .out_frac       (st1_frac),
                    .out_grad       (st1_grad)
                );
    end
    else begin
        // テーブル生成
        jelly_float_reciprocal_table
                #(
                    .FRAC_WIDTH     (FRAC_WIDTH),
                    .D_WIDTH        (D_WIDTH),
                    .K_WIDTH        (K_WIDTH),
                    .GRAD_WIDTH     (GRAD_WIDTH),
                    .OUT_REGS       (1),
                    .RAM_TYPE       (RAM_TYPE),
                    
                    .WRITE_TABLE    (WRITE_TABLE),
                    .READ_TABLE     (READ_TABLE),
                    .FILE_NAME      (FILE_NAME)
                )
            i_float_reciprocal_table
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (stage_cke[1:0]),
                    
                    .in_d           (src_frac[FRAC_WIDTH-1 -: D_WIDTH]),
                    
                    .out_frac       (st1_frac),
                    .out_grad       (st1_grad)
                );
    end
    endgenerate
    
    reg     [USER_BITS-1:0]     st0_user;
    reg                         st0_sign;
    reg     [EXP_WIDTH-1:0]     st0_exp;
    reg                         st0_frac_one;
    reg     [K_WIDTH-1:0]       st0_k;
    
    reg     [USER_BITS-1:0]     st1_user;
    reg                         st1_sign;
    reg     [EXP_WIDTH-1:0]     st1_exp;
    reg     [K_WIDTH-1:0]       st1_k;
    
    reg     [USER_BITS-1:0]     st2_user;
    reg                         st2_sign;
    reg     [EXP_WIDTH-1:0]     st2_exp;
    reg     [FRAC_WIDTH-1:0]    st2_frac;
    reg     [K_WIDTH-1:0]       st2_k;
    reg     [GRAD_WIDTH-1:0]    st2_grad;
    
    reg     [USER_BITS-1:0]     st3_user;
    reg                         st3_sign;
    reg     [EXP_WIDTH-1:0]     st3_exp;
    reg     [FRAC_WIDTH-1:0]    st3_frac;
    reg     [GRAD_WIDTH-1:0]    st3_diff;
    
    reg     [USER_BITS-1:0]     st4_user;
    reg                         st4_sign;
    reg     [EXP_WIDTH-1:0]     st4_exp;
    reg     [FRAC_WIDTH-1:0]    st4_frac;
    
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin
            st0_user     <= src_user;
            st0_sign     <= src_sign;
            st0_exp      <= src_exp;
            st0_frac_one <= (src_frac == {FRAC_WIDTH{1'b0}});
            st0_k        <= src_frac[0 +: K_WIDTH];
        end
        
        if ( stage_cke[1] ) begin
            st1_user     <= st0_user;
            st1_sign     <= st0_sign;
            st1_exp      <= -(st0_exp - EXP_OFFSET) + st0_frac_one + EXP_OFFSET - 1;
            st1_k        <= st0_k;
        end
        
        if ( stage_cke[2] ) begin
            st2_user <= st1_user;
            st2_sign <= st1_sign;
            st2_exp  <= st1_exp;
            st2_frac <= st1_frac;
            st2_grad <= st1_grad;
            st2_k    <= st1_k;
        end
        
        if ( stage_cke[3] ) begin
            st3_user <= st2_user;
            st3_sign <= st2_sign;
            st3_exp  <= st2_exp;
            st3_frac <= st2_frac;
            st3_diff <= (({{GRAD_WIDTH{1'b0}}, st2_grad} * {{K_WIDTH{1'b0}}, st2_k}) >> K_WIDTH);
        end
        
        if ( stage_cke[4] ) begin
            st4_user <= st3_user;
            st4_sign <= st3_sign;
            st4_exp  <= st3_exp;
            st4_frac <= st3_frac - st3_diff;
        end
    end
    
    assign sink_user = st4_user;
    assign sink_sign = st4_sign;
    assign sink_exp  = st4_exp;
    assign sink_frac = st4_frac;
    
endmodule



module jelly_float_reciprocal_table
        #(
            parameter   FRAC_WIDTH  = 23,
            parameter   D_WIDTH     = 6,
            parameter   K_WIDTH     = FRAC_WIDTH - D_WIDTH,
            parameter   GRAD_WIDTH  = FRAC_WIDTH,
            parameter   OUT_REGS    = 1,
            parameter   RAM_TYPE    = "distributed",
            
            parameter   WRITE_TABLE = 0,
            parameter   READ_TABLE  = 0,
            parameter   FILE_NAME   = "float_reciprocal.hex"
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire    [1:0]               cke,
            
            input   wire    [D_WIDTH-1:0]       in_d,
            
            output  wire    [FRAC_WIDTH-1:0]    out_frac,
            output  wire    [GRAD_WIDTH-1:0]    out_grad
        );
    
    
    // テーブル定義
    localparam  TBL_WIDTH = FRAC_WIDTH + GRAD_WIDTH;
    localparam  TBL_SIZE  = (1 << D_WIDTH);
    
    (* RAM_STYLE=RAM_TYPE *)    reg     [TBL_WIDTH-1:0]     mem [0:TBL_SIZE-1];
    
    
    // テーブル初期化
    integer                     i;
    integer                     fp;
    
    reg     [FRAC_WIDTH+1:0]    step;
    reg     [FRAC_WIDTH+1:0]    base, base_recip;
    reg     [FRAC_WIDTH+1:0]    next, next_recip;
    
    reg     [FRAC_WIDTH:0]      base_frac;
    reg     [FRAC_WIDTH:0]      next_frac;
    reg     [FRAC_WIDTH-1:0]    grad;
    reg     [FRAC_WIDTH-1:0]    grad_max;
    
    
    initial begin
        step                     = {(FRAC_WIDTH+2){1'b0}};
        step[FRAC_WIDTH-D_WIDTH] = 1'b1;
        
        base      = {2'b01, {FRAC_WIDTH{1'b0}}};
        base_frac = {2'b10, {(FRAC_WIDTH*2){1'b0}}} / base;
        
        grad_max = 0;
        for ( i = 0; i < TBL_SIZE; i = i+1 ) begin
            next      = base + step;
            next_frac = {2'b10, {(FRAC_WIDTH*2){1'b0}}} / next;
            
            grad       = base_frac - next_frac;
            if ( grad > grad_max ) grad_max = grad;
            
            mem[i] = {base_frac[0 +: FRAC_WIDTH], grad[0 +: GRAD_WIDTH]};
            
            base       = next;
            base_frac  = next_frac;
        end
//      $display("grad_max:%h", grad_max);
        
        // テーブルをファイル出力
        if ( WRITE_TABLE ) begin
            fp = $fopen(FILE_NAME, "w");
            for ( i = 0; i < TBL_SIZE; i = i+1 ) begin
                $fdisplay(fp, "%h", mem[i]);
            end
            $fclose(fp);
        end
        
        // テーブルをファイルから入力
        if ( READ_TABLE) begin
            $readmemh(FILE_NAME, mem);
        end
    end
    
    // read memory
    reg     [TBL_WIDTH-1:0]     tbl_out;
    always @(posedge clk) begin
        if ( cke[0] ) begin
            tbl_out <= mem[in_d];
        end
    end
    
    
    
    generate
    if ( OUT_REGS ) begin
        // output register
        reg     [TBL_WIDTH-1:0]     tbl_reg;
        always @(posedge clk) begin
            if ( cke[1] ) begin
                tbl_reg <= tbl_out;
            end
        end
        
        assign out_frac = tbl_reg[GRAD_WIDTH +: FRAC_WIDTH];
        assign out_grad = tbl_reg[0          +: GRAD_WIDTH];
    end
    else begin
        assign out_frac = tbl_out[GRAD_WIDTH +: FRAC_WIDTH];
        assign out_grad = tbl_out[0          +: GRAD_WIDTH];
    end
    endgenerate
    
    
endmodule



// 固定テーブル
module jelly_float_reciprocal_frac23_d6
        (
            input   wire                reset,
            input   wire                clk,
            input   wire    [1:0]       cke,
            
            input   wire    [5:0]       in_d,
            
            output  wire    [22:0]      out_frac,
            output  wire    [22:0]      out_grad
        );
    
    (* rom_style = "distributed" *)     reg     [45:0]      mem_dout;
    
    always @(posedge clk) begin
        if ( cke[0] ) begin
            case ( in_d )
            6'h00:  mem_dout <= 46'h00000003f040;
            6'h01:  mem_dout <= 46'h3e07e003d1b1;
            6'h02:  mem_dout <= 46'h3c1f0783b482;
            6'h03:  mem_dout <= 46'h3a44c683989d;
            6'h04:  mem_dout <= 46'h387878037ded;
            6'h05:  mem_dout <= 46'h36b981836463;
            6'h06:  mem_dout <= 46'h350750034bec;
            6'h07:  mem_dout <= 46'h33615a03347c;
            6'h08:  mem_dout <= 46'h31c71c031e00;
            6'h09:  mem_dout <= 46'h30381c030870;
            6'h0a:  mem_dout <= 46'h2eb3e402f3bb;
            6'h0b:  mem_dout <= 46'h2d3a0682dfd8;
            6'h0c:  mem_dout <= 46'h2bca1a82ccba;
            6'h0d:  mem_dout <= 46'h2a63bd82ba5b;
            6'h0e:  mem_dout <= 46'h29069002a8ac;
            6'h0f:  mem_dout <= 46'h27b23a0297a8;
            6'h10:  mem_dout <= 46'h266666028745;
            6'h11:  mem_dout <= 46'h2522c382777b;
            6'h12:  mem_dout <= 46'h23e706026844;
            6'h13:  mem_dout <= 46'h22b2e4025998;
            6'h14:  mem_dout <= 46'h218618024b70;
            6'h15:  mem_dout <= 46'h206060023dc6;
            6'h16:  mem_dout <= 46'h1f417d023096;
            6'h17:  mem_dout <= 46'h1e29320223d9;
            6'h18:  mem_dout <= 46'h1d1745821789;
            6'h19:  mem_dout <= 46'h1c0b81020ba2;
            6'h1a:  mem_dout <= 46'h1b05b0020020;
            6'h1b:  mem_dout <= 46'h1a05a001f4fe;
            6'h1c:  mem_dout <= 46'h190b2101ea37;
            6'h1d:  mem_dout <= 46'h18160581dfca;
            6'h1e:  mem_dout <= 46'h17262081d5b0;
            6'h1f:  mem_dout <= 46'h163b4881cbe7;
            6'h20:  mem_dout <= 46'h15555501c26b;
            6'h21:  mem_dout <= 46'h14741f81b93a;
            6'h22:  mem_dout <= 46'h13978281b050;
            6'h23:  mem_dout <= 46'h12bf5a81a7ab;
            6'h24:  mem_dout <= 46'h11eb85019f47;
            6'h25:  mem_dout <= 46'h111be1819723;
            6'h26:  mem_dout <= 46'h105050018f3b;
            6'h27:  mem_dout <= 46'h0f88b281878d;
            6'h28:  mem_dout <= 46'h0ec4ec018018;
            6'h29:  mem_dout <= 46'h0e04e00178d9;
            6'h2a:  mem_dout <= 46'h0d48738171cd;
            6'h2b:  mem_dout <= 46'h0c8f8d016af5;
            6'h2c:  mem_dout <= 46'h0bda1281644b;
            6'h2d:  mem_dout <= 46'h0b27ed015dd1;
            6'h2e:  mem_dout <= 46'h0a7904815784;
            6'h2f:  mem_dout <= 46'h09cd42815161;
            6'h30:  mem_dout <= 46'h092492014b68;
            6'h31:  mem_dout <= 46'h087ede014599;
            6'h32:  mem_dout <= 46'h07dc11813fee;
            6'h33:  mem_dout <= 46'h073c1a813a6a;
            6'h34:  mem_dout <= 46'h069ee581350b;
            6'h35:  mem_dout <= 46'h060460012fce;
            6'h36:  mem_dout <= 46'h056c79012ab2;
            6'h37:  mem_dout <= 46'h04d7200125b8;
            6'h38:  mem_dout <= 46'h0444440120dd;
            6'h39:  mem_dout <= 46'h03b3d5811c21;
            6'h3a:  mem_dout <= 46'h0325c5011782;
            6'h3b:  mem_dout <= 46'h029a04011300;
            6'h3c:  mem_dout <= 46'h021084010e9a;
            6'h3d:  mem_dout <= 46'h018937010a4e;
            6'h3e:  mem_dout <= 46'h01041001061c;
            6'h3f:  mem_dout <= 46'h008102010204;
            endcase
        end
    end
    
    reg     [22:0]      reg_frac;
    reg     [22:0]      reg_grad;
    
    always @(posedge clk) begin
        if ( cke[1] ) begin
            {reg_frac, reg_grad} <= mem_dout;
        end
    end
    
    assign out_frac = reg_frac;
    assign out_grad = reg_grad;
    
    
endmodule



`default_nettype wire



// end of file
