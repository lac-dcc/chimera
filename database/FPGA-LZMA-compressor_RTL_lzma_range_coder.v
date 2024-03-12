
module lzma_range_coder (
    input  wire        rstn,
    input  wire        clk,
    
    output wire        i_ready,
    input  wire        i_valid,
    input  wire        i_last,
    input  wire [ 3:0] i_pos_state,
    input  wire [ 2:0] i_type,
    input  wire [ 8:0] i_len_or_byte,
    input  wire [16:0] i_dist_or_bytes,
    
    output wire        o_valid,
    output wire [ 7:0] o_data,
    output wire        o_last
);



function  [ 4:0] countBit;
    input [16:0] x;
    reg   [ 4:0] i;
begin
    countBit = 5'd0;
    for (i=5'd0; i<=5'd16; i=i+5'd1)
        if (x[i])
            countBit = i;
end
endfunction



localparam         LC                             = 4;
localparam         PB                             = 2;

localparam         N_PREV_BYTE_LC_MSBS            = (1 << LC);
localparam         N_POS_STATES                   = (1 << PB);
localparam         N_STATES                       = 16;         // actual range of lzma_st1 : 0~11

localparam  [10:0] HALF_PROB                      = 11'd1024;


localparam [ 2:0] PKT_LIT      = 3'd0,
                  PKT_MATCH    = 3'd1,
                  PKT_SHORTREP = 3'd3,
                  PKT_REP0     = 3'd4,
                  PKT_REP1     = 3'd5,
                  PKT_REP2     = 3'd6,
                  PKT_REP3     = 3'd7;


// probability array's base addresses ---------------------------------------
localparam [13:0] PROB_LIT_BASE           = 14'd0;
localparam [13:0] PROB_DIST_SLOT_BASE     = PROB_LIT_BASE          +  3 * N_PREV_BYTE_LC_MSBS * (1<<8);
localparam [13:0] PROB_DIST_SPECIAL_BASE  = PROB_DIST_SLOT_BASE    +  4 * (1<<6);
localparam [13:0] PROB_DIST_ALIGN_BASE    = PROB_DIST_SPECIAL_BASE + 16 * (1<<5);
localparam [13:0] PROB_LEN_CHOICE_BASE    = PROB_DIST_ALIGN_BASE   + 16;
localparam [13:0] PROB_LEN_CHOICE2_BASE   = PROB_LEN_CHOICE_BASE   + 2;
localparam [13:0] PROB_LEN_LOW_BASE       = PROB_LEN_CHOICE2_BASE  + 2;
localparam [13:0] PROB_LEN_MID_BASE       = PROB_LEN_LOW_BASE      + 2 * N_POS_STATES * (1<<3);
localparam [13:0] PROB_LEN_HIGH_BASE      = PROB_LEN_MID_BASE      + 2 * N_POS_STATES * (1<<3);
localparam [13:0] PROB_IS_MATCH_BASE      = PROB_LEN_HIGH_BASE     + 2 * (1<<8);
localparam [13:0] PROB_IS_REP_BASE        = PROB_IS_MATCH_BASE     + N_STATES * N_POS_STATES;
localparam [13:0] PROB_IS_REP0_BASE       = PROB_IS_REP_BASE       + N_STATES;
localparam [13:0] PROB_IS_REP0LONG_BASE   = PROB_IS_REP0_BASE      + N_STATES;
localparam [13:0] PROB_IS_REP1_BASE       = PROB_IS_REP0LONG_BASE  + N_STATES * N_POS_STATES;
localparam [13:0] PROB_IS_REP2_BASE       = PROB_IS_REP1_BASE      + N_STATES;
localparam [13:0] PROB_TOTAL_COUNT        = PROB_IS_REP2_BASE      + N_STATES + 32;


localparam [4:0] S_INIT_PROB          = 5'd0,
                 S_IDLE               = 5'd1,
                 S_BIT_ISMATCH        = 5'd2,
                 S_BIT_ISREP          = 5'd3,
                 S_BIT_ISREP0         = 5'd4,
                 S_BIT_ISREP0LONG     = 5'd5,
                 S_BIT_ISREP1         = 5'd6,
                 S_BIT_ISREP2         = 5'd7,
                 S_LIT                = 5'd8,
                 S_LEN_CHOICE         = 5'd9,
                 S_LEN_CHOICE2        = 5'd10,
                 S_LEN_LOW_MID        = 5'd11,
                 S_LEN_HIGH           = 5'd12,
                 S_DIST_SLOT          = 5'd13,
                 S_DIST_SPECIAL       = 5'd14,
                 S_DIST_FIX_PROB      = 5'd15,
                 S_DIST_ALIGN         = 5'd16,
                 S_END_MARK           = 5'd17,
                 S_END_DIST_SLOT      = 5'd18,
                 S_END_DIST_FIX_PROB  = 5'd19,
                 S_END_DIST_FIX_PROB2 = 5'd20,
                 S_END_DIST_ALIGN     = 5'd21,
                 S_END_NORMALIZE      = 5'd22;
reg        [4:0] state = S_INIT_PROB;


assign i_ready = (state == S_IDLE);


reg  [   3:0] lzma_st1 = 4'd0;
reg  [   3:0] lzma_st2 = 4'd0;

reg  [  13:0] init_cnt = 14'd0;
reg  [   3:0] cnt      = 4'd0;
reg  [   7:0] treepos  = 8'h1;
reg           off      = 1'b1;


localparam [1:0] BTYPE_INIT_PROB  = 2'd0,
                 BTYPE_DUMMY_NORM = 2'd1,
                 BTYPE_NORMAL     = 2'd2,
                 BTYPE_FIX_PROB   = 2'd3;

// pipeline registers ----------------------------------
reg           b_valid     = 1'b0;
reg  [   1:0] b_btype     = BTYPE_INIT_PROB;       // 1:fixed probability   0:normal
reg           b_bit       = 1'b0;                  // bit to be encoded
reg  [  13:0] b_prob_addr = 14'd0;

reg         c_valid       = 1'b0;
reg         d_valid       = 1'b0;
wire        rc_busy;


// saved info for FSM ----------------------------------
reg           s_end_mark  = 1'b0;
reg           s_tlast     = 1'b0;
reg  [PB-1:0] s_pos_state = 0;
reg  [   2:0] s_type      = PKT_LIT;
reg  [   7:0] s_byte      = 8'd0;
reg  [   7:0] s_matchbyte = 8'd0;
reg  [LC-1:0] s_lc_msbs   = 0;
reg  [   8:0] s_len       = 9'd0;
reg  [  16:0] s_dist      = 17'd0;
reg  [  16:0] s_dist_fixp = 17'd0;

wire [PB-1:0] pos_state_1 = 1;
wire [PB-1:0] s_pos_state_a1 = s_pos_state + pos_state_1;

wire          s_is_rep      = ((s_type != PKT_LIT) && (s_type != PKT_MATCH)) ? 1'b1 : 1'b0;

wire          s_len_choice  = (s_len >= 9'd8 ) ? 1'b1 : 1'b0;
wire          s_len_choice2 = (s_len >= 9'd16) ? 1'b1 : 1'b0;
wire [   2:0] s_len_low_mid =  s_len[2:0];                         // when s_len=0~7 or s_len=8~15, map to 0~7
wire [   7:0] s_len_high    = (s_len[7:0] - 8'd16);                // when s_len=16~271, map to 0~255
wire [   1:0] s_len_min3    = (s_len < 9'd4) ? s_len[1:0] : 2'd3;

wire [   4:0] s_dist_slot_msb = countBit(s_dist);
wire [   4:0] s_dist_bcnt     = s_dist_slot_msb - 5'd1;
wire [  16:0] s_dist_tmp_shift= (s_dist >> s_dist_bcnt);
wire          s_dist_slot_lsb = s_dist_tmp_shift[0];
wire          s_dist_near     = (s_dist < 17'd4) ? 1'b1 : 1'b0;
wire [   5:0] s_dist_slot     = s_dist_near ? s_dist[5:0] : {s_dist_slot_msb, s_dist_slot_lsb};
wire          s_dist_spec     = (s_dist_slot < 6'd14) ? 1'b1 : 1'b0;
wire [   3:0] s_dist_spec_ctx = s_dist_slot[3:0];

wire [   4:0] cnt_add1        = {1'b0, cnt} + 5'd1;
wire [   4:0] cnt_add5        = {1'b0, cnt} + 5'd5;

reg           tbit;                                // not real register


always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        state <= S_INIT_PROB;
        
        lzma_st1 <= 4'd0;
        lzma_st2 <= 4'd0;
        
        init_cnt <= 14'd0;
        cnt      <= 4'd0;
        treepos  <= 8'd1;
        off      <= 1'b1;
        
        s_end_mark  <= 1'b0;
        s_tlast     <= 1'b0;
        s_pos_state <= 0;
        s_type      <= PKT_LIT;
        s_byte      <= 8'd0;
        s_matchbyte <= 8'd0;
        s_lc_msbs   <= 0;
        s_len       <= 9'd0;
        s_dist      <= 17'd0;
        s_dist_fixp <= 17'd0;
        
        b_valid     <= 1'b0;
        b_btype     <= BTYPE_INIT_PROB;
        b_bit       <= 1'b0;
        b_prob_addr <= 14'd0;
    end else begin
        if (state == S_IDLE) begin
            if (i_valid) begin
                state <= S_BIT_ISMATCH;
                lzma_st2 <= lzma_st1;
                case (lzma_st1)
                    4'd0   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd0 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd1   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd0 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd2   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd0 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd3   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd0 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd4   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd1 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd5   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd2 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd6   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd3 : (i_type==PKT_MATCH) ? 4'd7 : (i_type==PKT_SHORTREP) ? 4'd9 : 4'd8;
                    4'd7   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd4 : (i_type==PKT_MATCH) ? 4'd10: (i_type==PKT_SHORTREP) ? 4'd11: 4'd11;
                    4'd8   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd5 : (i_type==PKT_MATCH) ? 4'd10: (i_type==PKT_SHORTREP) ? 4'd11: 4'd11;
                    4'd9   : lzma_st1 <= (i_type==PKT_LIT) ? 4'd6 : (i_type==PKT_MATCH) ? 4'd10: (i_type==PKT_SHORTREP) ? 4'd11: 4'd11;
                    4'd10  : lzma_st1 <= (i_type==PKT_LIT) ? 4'd4 : (i_type==PKT_MATCH) ? 4'd10: (i_type==PKT_SHORTREP) ? 4'd11: 4'd11;
                    default: lzma_st1 <= (i_type==PKT_LIT) ? 4'd5 : (i_type==PKT_MATCH) ? 4'd10: (i_type==PKT_SHORTREP) ? 4'd11: 4'd11;
                endcase
            end
            
            init_cnt <= 14'd0;
            cnt      <= 4'd0;
            treepos  <= 8'd1;
            off      <= 1'b1;
            
            s_end_mark  <= 1'b0;
            s_tlast     <= i_last;
            s_pos_state <= i_pos_state[PB-1:0];
            s_type      <= i_type;
            s_byte      <= i_len_or_byte[7:0];
            s_lc_msbs   <= i_dist_or_bytes[7:8-LC];
            s_matchbyte <= i_dist_or_bytes[15:8];
            s_len       <= i_len_or_byte - 9'd2;
            s_dist      <= i_dist_or_bytes - 17'd1;
            
            if (~c_valid | ~d_valid | ~rc_busy)
                b_valid <= 1'b0;
            
        end else if (~b_valid | ~c_valid | ~d_valid | ~rc_busy) begin
            b_valid <= 1'b1;
            b_btype <= BTYPE_NORMAL;
            
            case (state)
                S_INIT_PROB : begin
                    if (init_cnt < PROB_TOTAL_COUNT) begin
                        init_cnt <= init_cnt + 14'd1;
                    end else begin
                        init_cnt <= 14'd0;
                        state <= S_IDLE;
                    end
                    
                    lzma_st1 <= 4'd0;
                    lzma_st2 <= 4'd0;
                    
                    b_btype <= BTYPE_INIT_PROB;
                    b_prob_addr <= init_cnt;
                end
                
                S_BIT_ISMATCH : begin
                    tbit = (s_type != PKT_LIT);
                    state <= tbit ? S_BIT_ISREP : S_LIT;
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_IS_MATCH_BASE + {lzma_st2, s_pos_state};
                end
                
                S_BIT_ISREP : begin
                    tbit = s_is_rep;
                    state <= tbit ? S_BIT_ISREP0 : S_LEN_CHOICE;
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_IS_REP_BASE + lzma_st2;
                end
                
                S_BIT_ISREP0 : begin
                    tbit = ((s_type != PKT_SHORTREP) && (s_type != PKT_REP0));
                    state <= tbit ? S_BIT_ISREP1 : S_BIT_ISREP0LONG;
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_IS_REP0_BASE + lzma_st2;
                end
                
                S_BIT_ISREP0LONG : begin
                    tbit = (s_type == PKT_REP0);
                    state <= tbit ? S_LEN_CHOICE : s_tlast ? S_END_MARK : S_IDLE;
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_IS_REP0LONG_BASE + {lzma_st2, s_pos_state};
                end
                
                S_BIT_ISREP1 : begin
                    tbit = (s_type != PKT_REP1);
                    state <= tbit ? S_BIT_ISREP2 : S_LEN_CHOICE;
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_IS_REP1_BASE + lzma_st2;
                end
                
                S_BIT_ISREP2 : begin
                    tbit = (s_type != PKT_REP2);
                    state <= S_LEN_CHOICE;
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_IS_REP2_BASE + lzma_st2;
                end
                
                S_LIT : begin
                    tbit = s_byte[7];
                    s_byte <= s_byte << 1;
                    s_matchbyte <= s_matchbyte << 1;
                    off <= (off & s_matchbyte[7]) ^ (off & ~tbit);
                    
                    if (cnt < 4'd7) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], tbit};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= s_tlast ? S_END_MARK : S_IDLE;
                    end
                    
                    b_bit <= tbit;
                    if      ((~off && ~(off&s_matchbyte[7])) || lzma_st2<4'd7)
                        b_prob_addr <= PROB_LIT_BASE + {2'd0, s_lc_msbs, treepos};
                    else if (  off &&  (off&s_matchbyte[7]))
                        b_prob_addr <= PROB_LIT_BASE + {2'd1, s_lc_msbs, treepos};
                    else
                        b_prob_addr <= PROB_LIT_BASE + {2'd2, s_lc_msbs, treepos};
                end
                
                S_LEN_CHOICE : begin
                    tbit = s_len_choice;
                    state <= tbit ? S_LEN_CHOICE2 : S_LEN_LOW_MID;
                    s_byte <= {s_len_low_mid, 5'd0};
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_LEN_CHOICE_BASE + s_is_rep;
                end
                
                S_LEN_CHOICE2 : begin
                    tbit = s_len_choice2;
                    state <= tbit ? S_LEN_HIGH : S_LEN_LOW_MID;
                    s_byte <= tbit ? s_len_high : {s_len_low_mid, 5'd0};
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_LEN_CHOICE2_BASE + s_is_rep;
                end
                
                S_LEN_LOW_MID : begin
                    tbit = s_byte[7];
                    s_byte <= s_byte << 1;
                    
                    if (cnt < 4'd2) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], tbit};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= s_is_rep ? (s_tlast ? S_END_MARK : S_IDLE) : (s_end_mark ? S_END_DIST_SLOT : S_DIST_SLOT);
                        s_byte <= {s_dist_slot, 2'h0};
                    end
                    
                    b_bit <= tbit;
                    b_prob_addr <= (s_len_choice ? PROB_LEN_MID_BASE : PROB_LEN_LOW_BASE) + {s_is_rep, s_pos_state, treepos[2:0]};
                end
                
                S_LEN_HIGH : begin
                    tbit = s_byte[7];
                    s_byte <= s_byte << 1;
                    
                    if (cnt < 4'd7) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], tbit};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= s_is_rep ? (s_tlast ? S_END_MARK : S_IDLE) : (s_end_mark ? S_END_DIST_SLOT : S_DIST_SLOT);
                        s_byte <= {s_dist_slot, 2'h0};
                    end
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_LEN_HIGH_BASE + {s_is_rep, treepos};
                end
                
                S_DIST_SLOT : begin
                    tbit = s_byte[7];
                    s_byte <= s_byte << 1;
                    
                    if (cnt < 4'd5) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], tbit};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        if (s_dist_near)
                            state <= s_tlast ? S_END_MARK : S_IDLE;
                        else if (s_dist_spec)
                            state <= S_DIST_SPECIAL;
                        else
                            state <= S_DIST_FIX_PROB;
                        s_byte <= s_dist[7:0];
                        s_dist_fixp <= s_dist << (5'd17 - s_dist_bcnt);
                    end
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_DIST_SLOT_BASE + {s_len_min3, treepos[5:0]};
                end
                
                S_DIST_SPECIAL : begin
                    tbit = s_byte[0];
                    s_byte <= s_byte >> 1;
                    
                    if (cnt_add1 != s_dist_bcnt) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], tbit};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= s_tlast ? S_END_MARK : S_IDLE;
                    end
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_DIST_SPECIAL_BASE + {s_dist_spec_ctx, treepos[4:0]};
                end
                
                S_DIST_FIX_PROB : begin
                    if (cnt_add5 != s_dist_bcnt) begin
                        cnt <= cnt + 4'd1;
                    end else begin
                        cnt <= 4'd0;
                        state <= S_DIST_ALIGN;
                    end
                    
                    s_dist_fixp <= s_dist_fixp << 1;
                    b_bit <= s_dist_fixp[16];
                    b_btype <= BTYPE_FIX_PROB;
                end
                
                S_DIST_ALIGN : begin
                    tbit = s_byte[0];
                    s_byte <= s_byte >> 1;
                    
                    if (cnt < 4'd3) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], tbit};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= s_tlast ? S_END_MARK : S_IDLE;
                    end
                    
                    b_bit <= tbit;
                    b_prob_addr <= PROB_DIST_ALIGN_BASE + treepos[3:0];
                end
                
                
                S_END_MARK : begin
                    state <= S_BIT_ISREP;
                    b_bit <= 1'b1;
                    b_prob_addr <= PROB_IS_MATCH_BASE + {lzma_st1, s_pos_state_a1};
                    
                    lzma_st2    <= lzma_st1;
                    s_end_mark  <= 1'b1;
                    s_pos_state <= s_pos_state_a1;
                    s_type      <= PKT_MATCH;
                    s_len       <= 9'd1;
                end
                
                S_END_DIST_SLOT : begin
                    if (cnt < 4'd5) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], 1'b1};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= S_END_DIST_FIX_PROB;
                    end
                    b_bit <= 1'b1;
                    b_prob_addr <= PROB_DIST_SLOT_BASE + {s_len_min3, treepos[5:0]};
                end
                
                S_END_DIST_FIX_PROB : begin
                    if (cnt < 4'd15) begin
                        cnt <= cnt + 4'd1;
                    end else begin
                        cnt <= 4'd0;
                        state <= S_END_DIST_FIX_PROB2;
                    end
                    b_bit <= 1'b1;
                    b_btype <= BTYPE_FIX_PROB;
                end
                
                S_END_DIST_FIX_PROB2 : begin
                    if (cnt < 4'd9) begin
                        cnt <= cnt + 4'd1;
                    end else begin
                        cnt <= 4'd0;
                        state <= S_END_DIST_ALIGN;
                    end
                    b_bit <= 1'b1;
                    b_btype <= BTYPE_FIX_PROB;
                end
                
                S_END_DIST_ALIGN : begin
                    if (cnt < 4'd3) begin
                        cnt <= cnt + 4'd1;
                        treepos <= {treepos[6:0], 1'b1};
                    end else begin
                        cnt <= 4'd0;
                        treepos <= 8'd1;
                        state <= S_END_NORMALIZE;
                    end
                    b_bit <= 1'b1;
                    b_prob_addr <= PROB_DIST_ALIGN_BASE + treepos[3:0];
                end
                
                default : begin  // S_END_NORMALIZE : begin
                    if (cnt < 4'd4) begin
                        cnt <= cnt + 4'd1;
                    end else begin
                        cnt <= 4'd0;
                        state <= S_INIT_PROB;
                    end
                    b_btype <= BTYPE_DUMMY_NORM;
                end
            endcase
        end
    end




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// stage C : read the probability array
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

reg  [ 1:0] c_btype     = BTYPE_INIT_PROB;
reg         c_bit       = 1'b0;
reg  [13:0] c_prob_addr = 14'd0;
reg         c_prob_ramout_en = 1'b0;
reg  [10:0] c_prob_ramout;
reg  [10:0] c_prob_keep = 11'd0;
wire [10:0] c_prob      = c_prob_ramout_en ? c_prob_ramout : c_prob_keep;

reg  [10:0] prob_array [16383:0];

always @ (posedge clk)
    c_prob_ramout <= prob_array[b_prob_addr];

always @ (posedge clk)
    if (c_prob_ramout_en)
        c_prob_keep <= c_prob_ramout;

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        c_valid     <= 1'b0;
        c_btype     <= BTYPE_INIT_PROB;
        c_bit       <= 1'b0;
        c_prob_addr <= 14'd0;
        c_prob_ramout_en <= 1'b0;
    end else begin
        c_prob_ramout_en <= 1'b0;
        if (~c_valid | ~d_valid | ~rc_busy) begin
            c_valid     <= b_valid;
            c_btype     <= b_btype;
            c_bit       <= b_bit;
            c_prob_addr <= b_prob_addr;
            c_prob_ramout_en <= 1'b1;
        end
    end




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// stage D : calculate new probability
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

reg  [ 1:0] d_btype      = BTYPE_INIT_PROB;
reg         d_bit        = 1'b0;
reg  [13:0] d_prob_addr  = 14'd0;
reg  [10:0] d_prob       = 11'd0;
reg         d_prob_wen   = 1'b0;
reg  [10:0] d_prob_wdata = 11'd0;

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        d_valid      <= 1'b0;
        d_btype      <= BTYPE_INIT_PROB;
        d_bit        <= 1'b0;
        d_prob_addr  <= 14'd0;
        d_prob       <= 11'd0;
        d_prob_wen   <= 1'b0;
        d_prob_wdata <= 11'd0;
    end else begin
        if (~d_valid | ~rc_busy) begin
            d_valid     <= c_valid;
            d_btype     <= c_btype;
            d_bit       <= c_bit;
            d_prob_addr <= c_prob_addr;
            d_prob      <= c_prob;
            case (c_btype)
                BTYPE_INIT_PROB : begin
                    d_prob_wen   <= c_valid;
                    d_prob_wdata <= HALF_PROB;
                end
                BTYPE_NORMAL : begin
                    d_prob_wen   <= c_valid;
                    //d_prob_wdata <= c_bit ? (c_prob - (c_prob >> 5)) : (c_prob + ((11'd0 - c_prob) >> 5));
                    d_prob_wdata <= c_prob;
                end
                default : begin
                    d_prob_wen   <= 1'b0;
                    d_prob_wdata <= 11'd0;
                end
            endcase
        end
    end




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// stage C : write back the new probability, and range coding
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

reg  [32:0] low   = 33'h0;
reg  [31:0] range = 32'hFFFFFFFF;
reg  [ 7:0] cache = 8'h0;
reg  [31:0] csize = 32'h0;

wire [31:0] bound = {11'h0, range[31:11]} * {21'h0, d_prob};

wire        need_normalize = (d_btype==BTYPE_INIT_PROB ) ? 1'b0 :
                             (d_btype==BTYPE_DUMMY_NORM) ? 1'b1 :
                                  (range[31:24] == 8'h0) ? 1'b1 : 1'b0;

reg  [31:0] range_new;        // not real register, "range" value that updated by data bit
reg  [32:0] low_new;          // not real register, "low"   value that updated by data bit

always @ (*)                  // update "low" and "range" using data bit
    case (d_btype)
        BTYPE_INIT_PROB : begin
            range_new = 32'hFFFFFFFF;
            low_new   = 33'h0;
        end
        
        BTYPE_DUMMY_NORM : begin
            range_new = range;
            low_new   = low;
        end
        
        BTYPE_NORMAL :
            if (d_bit) begin
                range_new = range - bound;
                low_new   = low + {1'b0, bound};
            end else begin
                range_new = bound;
                low_new   = low;
            end
        
        default : begin   // BTYPE_FIX_PROB : begin
            range_new = range >> 1;
            if (d_bit)
                low_new = low + {2'b0, range[31:1]};
            else
                low_new = low;
        end
    endcase

localparam [1:0] S_RC_IDLE = 2'd0,
                 S_RC_NORM = 2'd1,
                 S_RC_ACT  = 2'd2;
                 
reg        [1:0] rc_state = S_RC_IDLE;

assign rc_busy = (rc_state==S_RC_IDLE) ? need_normalize : (rc_state==S_RC_NORM) ? 1'b1 : 1'b0;

reg        last_dummy_norm = 1'b0;

reg        e_valid = 1'b0;
reg [ 7:0] e_byte  = 8'h00;
reg        e_last  = 1'b0;

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        last_dummy_norm <= 1'b0;
        e_valid  <= 1'b0;
        e_byte   <= 8'h0;
        e_last   <= 1'b0;
        low      <= 33'h0;
        range    <= 32'hFFFFFFFF;
        cache    <= 8'h0;
        csize    <= 32'h0;
        rc_state <= S_RC_IDLE;
    end else begin
        e_valid  <= 1'b0;
        e_byte   <= 8'h0;
        e_last   <= 1'b0;
        
        case (rc_state)
            S_RC_IDLE :
                if (d_valid) begin
                    last_dummy_norm <= (d_btype == BTYPE_DUMMY_NORM) ? 1'b1 : 1'b0;
                    if (need_normalize) begin
                        if (low[32] || (low[31:24] != 8'hFF)) begin
                            e_valid  <= 1'b1;
                            e_byte   <= cache + (low[32] ? 8'd1 : 8'd0);
                            cache    <= low[31:24];
                            rc_state <= S_RC_NORM;
                        end else begin
                            csize    <= csize + 32'd1;
                            low      <= {1'b0, low[23:0], 8'h0};
                            range    <= range << 8;
                            rc_state <= S_RC_ACT;
                        end
                    end else begin
                        low   <= low_new;
                        range <= range_new;
                        if (d_btype == BTYPE_INIT_PROB) begin
                            cache <= 8'h0;
                            csize <= 32'h0;
                            e_valid <= last_dummy_norm;
                            e_last  <= last_dummy_norm;
                        end
                    end
                end
            
            S_RC_NORM :
                if (csize > 32'd1) begin
                    e_valid  <= 1'b1;
                    e_byte   <= (low[32] ? 8'h00 : 8'hFF);
                    csize    <= csize - 32'd1;
                end else begin
                    csize    <= 32'd1;
                    low      <= {1'b0, low[23:0], 8'h0};
                    range    <= range << 8;
                    rc_state <= S_RC_ACT;
                end
            
            default : begin   // S_RC_ACT : begin
                low      <= low_new;
                range    <= range_new;
                rc_state <= S_RC_IDLE;
            end
        endcase
    end


wire [10:0] d_prob_wdata_updated = (d_btype == BTYPE_NORMAL) ? ( d_bit ? (d_prob_wdata - (d_prob_wdata >> 5)) : (d_prob_wdata + ((11'd0 - d_prob_wdata) >> 5)) ) : d_prob_wdata;

always @ (posedge clk)
    if (d_prob_wen & ~rc_busy)
        prob_array[d_prob_addr] <= d_prob_wdata_updated;

//always @ (posedge clk)
//    if (d_prob_wen & ~rc_busy)
//        if (d_prob_wdata == 11'd0) begin $display("probability mustn't be zero"); $stop; end


assign o_valid = e_valid;
assign o_data  = e_byte;
assign o_last  = e_last;


endmodule

