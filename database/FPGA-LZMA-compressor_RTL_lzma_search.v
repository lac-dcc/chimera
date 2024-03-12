
module lzma_search (
    input  wire        rstn,
    input  wire        clk,
    
    output wire        i_ready,
    input  wire        i_valid,
    input  wire        i_last,
    input  wire [ 7:0] i_data,
    
    input  wire        o_ready,
    output wire        o_valid,
    output wire        o_last,
    output wire [16:0] o_pos,
    output wire [ 2:0] o_type,         // 0:lit  1:match  3:shortrep  4:rep0  5:rep1  6:rep2  7:rep3
    output wire [ 7:0] o_byte,
    output wire [ 7:0] o_prevbyte,
    output wire [ 7:0] o_matchbyte,
    output wire [ 8:0] o_len,
    output wire [16:0] o_dist
);



integer i;


reg  [ 4*8-1:0] data_buf [32767:0];  // data ring buffer : 4 bytes * 32768 = 131072 bytes, total 32 BRAM36Ks

reg  [  17-1:0] hash_tab0 [4095:0];  // hash table       : 4096 entries x 8 items, total 16 BRAM36Ks
reg  [  17-1:0] hash_tab1 [4095:0];
reg  [  17-1:0] hash_tab2 [4095:0];
reg  [  17-1:0] hash_tab3 [4095:0];
reg  [  17-1:0] hash_tab4 [4095:0];
reg  [  17-1:0] hash_tab5 [4095:0];
reg  [  17-1:0] hash_tab6 [4095:0];
reg  [  17-1:0] hash_tab7 [4095:0];



// ------ptr---ptr300---wptr--ptr480----------
//        |__284__|
//        |__________484________|
//
reg  [17-1:0] wptr = 17'h0;
reg  [17-1:0] ptr  = 17'h0;
wire [17-1:0] ptr300 = ptr + 17'd300;
wire [17-1:0] ptr480 = ptr + 17'd480;

localparam [1:0] S_I_IDLE = 2'd0,
                 S_I_RUN  = 2'd1,
                 S_I_END  = 2'd2;
reg        [1:0] state_i  = S_I_IDLE;

assign i_ready         = (state_i==S_I_IDLE) ? 1'b1                          :
                         (state_i==S_I_RUN ) ? ((ptr480 - wptr) < 17'h10000) :
                       /*(state_i==S_I_END )*/ 1'b0                          ;

wire process_available = (state_i==S_I_IDLE) ? 1'b0                          :
                         (state_i==S_I_RUN ) ? ((wptr - ptr300) < 17'h10000) :
                       /*(state_i==S_I_END )*/ (wptr != ptr)                 ;

localparam [3:0] S_IDLE      = 4'd0,
                 S_LOAD1     = 4'd1,
                 S_LOAD2     = 4'd2,
                 S_GETHASH   = 4'd3,
                 S_MATCH_PRE = 4'd4,
                 S_MATCH     = 4'd5,
                 S_MATCH_WAIT= 4'd6,
                 S_SUBMIT    = 4'd7,
                 S_FORWARD1  = 4'd8,
                 S_FORWARD2  = 4'd9;
reg        [3:0] state       = S_IDLE;

reg              state_is_s_match = 1'b0;
always @ (posedge clk or negedge rstn)
    if (~rstn)
        state_is_s_match <= 1'b0;
    else
        state_is_s_match <= (state == S_MATCH) ? 1'b1 : 1'b0;

reg  ring_available = 1'b0;

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        wptr <= 17'h0;
        ring_available <= 1'b0;
        state_i <= S_I_IDLE;
    end else begin
        case (state_i)
            S_I_IDLE : begin
                wptr <= 17'h0;
                ring_available <= 1'b0;
                if (i_valid) begin
                    wptr <= wptr + 17'h1;
                    state_i <= i_last ? S_I_END : S_I_RUN;
                end
            end
            
            S_I_RUN :
                if (i_valid & i_ready) begin
                    wptr <= wptr + 17'h1;
                    if (wptr == 17'h0)                // wptr have been filled and back to the start for the first time
                        ring_available <= 1'b1;
                    if (i_last)
                        state_i <= S_I_END;
                end
            
            default :  // S_I_END :
                if (wptr == ptr && state == S_IDLE) begin
                    wptr <= 17'h0;
                    state_i <= S_I_IDLE;
                end
        endcase
    end




reg  [3*8-1:0] idata_r;

wire [4*8-1:0] idata = (wptr[1:0] == 2'd0) ? {  8'h0, idata_r[23:16], idata_r[15:8], i_data      } :
                       (wptr[1:0] == 2'd1) ? {  8'h0, idata_r[23:16], i_data       , idata_r[7:0]} :
                       (wptr[1:0] == 2'd2) ? {  8'h0, i_data        , idata_r[15:8], idata_r[7:0]} :
                     /*(wptr[1:0] == 2'd3)*/ {i_data, idata_r[23:16], idata_r[15:8], idata_r[7:0]} ;

always @ (posedge clk)
    idata_r <= idata[3*8-1:0];


always @ (posedge clk)                                             // write ring buffer
    if (i_valid && i_ready && (wptr[1:0]==2'd3 || i_last))
        data_buf[wptr[16:2]] <= idata;





reg            sdata_en = 1'b0;

reg  [8*8-1:0] sdata;

reg  [3*8-1:0] pdata;
reg  [4*8-1:0] cdata;
reg  [3*8-1:0] ndata;

reg  [  8-1:0] matchbyte = 8'h0;
reg  [  8-1:0] prevbyte  = 8'h0;

wire [ 12-1:0] hash = sdata[23:12] ^ sdata[11:0];

reg  [  9-1:0] score    = 9'd0;
reg  [  9-1:0] length   = 9'd0;
reg  [ 17-1:0] distance = 17'd0;
reg  [  4-1:0] best_idx = 4'h0;

reg            shortrep = 1'b0;

reg  [   11:0] pvalid = 12'b0;
reg            rep0valid = 1'b0;
reg  [    1:0] paddrlsb [11:0];          // 0~7 from hash table, 8~11 from rep
reg  [ 17-1:0] pdist    [11:0];          // 0~7 from hash table, 8 is rep0, 9 is rep1, 10 is rep2, 11 is rep3

reg  [ 15-1:0] caddr = 15'h0;
reg  [ 15-1:0] raddr = 15'h0;

reg  [  7-1:0] epoch = 7'h0;

reg      [3:0] idx        = 4'h0;         // 0~7 from hash table, 8~11 from rep

reg      [3:0] idxr       = 4'h0;
reg            pvalidr    = 1'b0;
reg      [1:0] paddrlsbr  = 2'b0;
reg  [ 17-1:0] pdistr     = 17'd0;

reg  [4*8-1:0] cdata_reorder = 32'h0;
reg  [  9-1:0] len_base   = 9'd0;
reg  [  9-1:0] score_base = 9'd0;

always @ (posedge clk) begin
    idxr <= idx;
    pvalidr <= pvalid[idx];
    paddrlsbr <= paddrlsb[idx];
    pdistr <= pdist[idx];
    
    case (paddrlsb[idx])
        2'd0    : cdata_reorder <=  cdata;
        2'd1    : cdata_reorder <= {cdata[23:0], pdata[23:16]};
        2'd2    : cdata_reorder <= {cdata[15:0], pdata[23: 8]};
        default : cdata_reorder <= {cdata[ 7:0], pdata       };
    endcase
    
    case (paddrlsb[idx])
        2'd0    : len_base <= {epoch, 2'd0};
        2'd1    : len_base <= {epoch, 2'd0} - 9'd1;
        2'd2    : len_base <= {epoch, 2'd0} - 9'd2;
        default : len_base <= {epoch, 2'd0} - 9'd3;
    endcase
    
    score_base<= (idx  >= 4'd8         ) ? 9'd4 :      // rep
                 (pdist[idx] < 17'd16  ) ? 9'd3 :
                 (pdist[idx] < 17'd512 ) ? 9'd2 :
                 (pdist[idx] < 17'd8192) ? 9'd1 :
                 /*otherwise*/             9'd0 ;
end


reg  [ 17-1:0] hash_rd [7:0];         // read from hash table

always @ (posedge clk) begin
    hash_rd[0] <= hash_tab0[hash];
    hash_rd[1] <= hash_tab1[hash];
    hash_rd[2] <= hash_tab2[hash];
    hash_rd[3] <= hash_tab3[hash];
    hash_rd[4] <= hash_tab4[hash];
    hash_rd[5] <= hash_tab5[hash];
    hash_rd[6] <= hash_tab6[hash];
    hash_rd[7] <= hash_tab7[hash];
end


reg  [4*8-1:0] rdata;                 // read data from BRAM
reg  [4*8-1:0] rdata_r;

always @ (posedge clk)
    rdata <= data_buf[raddr];

always @ (posedge clk)
    rdata_r <= rdata;



reg  [  9-1:0] tlength;               // not real register

always @ (*) begin
    if (epoch == 7'd0) begin
        case (paddrlsbr)
            2'd0    : tlength = (rdata[15: 0] != cdata_reorder[15: 0]) ? 9'd0 :
                                (rdata[23:16] != cdata_reorder[23:16]) ? 9'd2 :
                                (rdata[31:24] != cdata_reorder[31:24]) ? 9'd3 :
                                                                         9'd4 ;
            2'd1    : tlength = (rdata[23: 8] != cdata_reorder[23: 8]) ? 9'd0 :
                                (rdata[31:24] != cdata_reorder[31:24]) ? 9'd2 :
                                                                         9'd3 ;
            2'd2    : tlength = (rdata[31:16] != cdata_reorder[31:16]) ? 9'd0 :
                                                                         9'd0 ;
            default : tlength = 9'd0;
        endcase
    end else begin
        if      (rdata[ 7: 0] != cdata_reorder[ 7: 0]) tlength = len_base;
        else if (rdata[15: 8] != cdata_reorder[15: 8]) tlength = len_base + 9'd1;
        else if (rdata[23:16] != cdata_reorder[23:16]) tlength = len_base + 9'd2;
        else if (rdata[31:24] != cdata_reorder[31:24]) tlength = len_base + 9'd3;
        else                                           tlength = len_base + 9'd4;
    end
end


reg  [4*8-1:0] tdata_r;
reg      [1:0] paddrlsbrr;
reg  [  9-1:0] scorebase_r;
reg  [  9-1:0] tlength_r;
reg            pvalidrr;
reg  [ 17-1:0] pdistrr;
reg      [3:0] idxrr;
always @ (posedge clk) begin
    tdata_r <= cdata_reorder;
    paddrlsbrr <= paddrlsbr;
    scorebase_r <= score_base;
    tlength_r <= tlength;
    pvalidrr <= pvalidr;
    pdistrr <= pdistr;
    idxrr <= idxr;
end

reg  [  9-1:0] tscore;                // not real register
always @ (*) begin
    if      (tlength_r <  9'd2)
        tscore = 9'd4;
    else if (tlength_r == 9'd2)
        tscore = scorebase_r + 9'd1;
    else
        tscore = scorebase_r + tlength_r;
end


wire [17-1:0] paddr0   = ptr - pdist[0];
wire [17-1:0] paddr1   = ptr - pdist[1];
wire [17-1:0] paddridx = ptr - pdist[idx+4'd1];
wire [17-1:0] paddridx2= ptr - pdist[idx+4'd2];


reg  pvalid11;               // not real register
always @ (*) begin
    pvalid11 = pvalid[11];
    if (epoch == 7'd0) begin
        case (paddrlsbrr)
            2'd0    : if (rdata_r        != tdata_r       ) pvalid11 = 1'b0;
            2'd1    : if (rdata_r[31: 8] != tdata_r[31: 8]) pvalid11 = 1'b0;
            2'd2    : if (rdata_r[31:16] != tdata_r[31:16]) pvalid11 = 1'b0;
            default : if (rdata_r[31:24] != tdata_r[31:24]) pvalid11 = 1'b0;
        endcase
    end else begin
        if (rdata_r != tdata_r) pvalid11 = 1'b0;
    end
end 


always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        sdata_en <= 1'b0;
        {pdata, cdata, ndata, sdata} <= 0;
        matchbyte <= 8'h0;
        prevbyte  <= 8'h0;
        ptr      <= 0;
        score    <= 0;
        length   <= 0;
        distance <= 0;
        best_idx <= 0;
        shortrep <= 0;
        pvalid   <= 0;
        rep0valid <= 1'b0;
        for (i=0; i<12; i=i+1) begin
            paddrlsb[i] <= 0;
            pdist[i] <= 0;
        end
        pdist[8] <= 17'd1;
        caddr    <= 0;
        raddr    <= 0;
        state    <= S_IDLE;
        idx      <= 0;
        epoch    <= 0;
    end else begin
        if (state_i == S_I_IDLE) begin
            sdata_en <= 1'b0;
            {pdata, cdata, ndata, sdata} <= 0;
            matchbyte <= 8'h0;
            prevbyte  <= 8'h0;
            ptr      <= 0;
            score    <= 0;
            length   <= 0;
            distance <= 0;
            best_idx <= 0;
            shortrep <= 0;
            pvalid   <= 0;
            rep0valid <= 1'b0;
            for (i=0; i<12; i=i+1) begin
                paddrlsb[i] <= 0;
                pdist[i] <= 0;
            end
            pdist[8] <= 17'd1;
            caddr    <= 0;
            raddr    <= 0;
            state    <= S_IDLE;
            idx      <= 0;
            epoch    <= 0;
        end else begin
            case (state)
                S_IDLE : begin
                    score    <= 9'd4;
                    length   <= 9'd1;
                    distance <= 0;
                    best_idx <= 4'hF;
                    shortrep <= 0;
                    pvalid   <= 0;
                    if (process_available) begin
                        sdata_en <= 1'b1;
                        raddr <= ptr[16:2] + 15'd1;
                        caddr <= ptr[16:2] + 15'd1;
                        if (~sdata_en) begin
                            state <= S_LOAD1;
                        end else begin
                            state <= S_GETHASH;
                            if (ptr[1:0] != 2'h0)
                                caddr <= ptr[16:2] + 15'd2;
                        end
                    end
                    idx      <= 0;
                    epoch    <= 0;
                end
                
                S_LOAD1 : begin
                    sdata[31: 0] <= rdata;
                    state <= S_LOAD2;
                end
                
                S_LOAD2 : begin
                    sdata[63:32] <= rdata;
                    state <= S_GETHASH;
                end
                
                S_GETHASH : begin
                    {ndata, cdata} <= sdata[55:0];
                    pvalid <= 12'h0;
                    
                    for (i=0; i<8; i=i+1) begin
                        pdist[i] <= ptr - hash_rd[i];
                        paddrlsb[i] <= hash_rd[i][1:0];
                        if (((hash_rd[i] - ptr) > 17'd512) && (ring_available || hash_rd[i] < ptr))
                            pvalid[i] <= 1'b1;
                    end
                    
                    paddrlsb[8]  <= ptr[1:0] - pdist[ 8][1:0];
                    paddrlsb[9]  <= ptr[1:0] - pdist[ 9][1:0];
                    paddrlsb[10] <= ptr[1:0] - pdist[10][1:0];
                    paddrlsb[11] <= ptr[1:0] - pdist[11][1:0];
                    
                    pvalid[8] <= rep0valid;
                    if (pdist[9] > 17'd0) pvalid[9]  <= 1'b1;
                    if (pdist[10]> 17'd0) pvalid[10] <= 1'b1;
                    if (pdist[11]> 17'd0) pvalid[11] <= 1'b1;
                    
                    raddr <= hash_rd[0][16:2];
                    state <= S_MATCH_PRE;
                end
                
                S_MATCH_PRE : begin                                       // idx = 0
                    idx <= 4'd1;
                    raddr <= paddr1[16:2] + {8'd0, epoch};                // paddr[1][16:2];
                    state <= S_MATCH;
                end
                
                S_MATCH : begin                                           // idx = 1~11~0
                    if (idx == 4'd0) begin
                        raddr <= caddr;
                        state <= S_MATCH_WAIT;
                    end else if (idx >= 4'd11) begin
                        raddr <= caddr;
                        idx   <= 4'd0;
                    end else if (idx == 4'd7 || idx == 4'd10 || pvalid[idx+4'd1]) begin
                        raddr <= paddridx[16:2] + {8'd0, epoch};
                        idx   <= idx + 4'd1;
                    end else begin
                        raddr <= paddridx2[16:2] + {8'd0, epoch};
                        idx   <= idx + 4'd2;
                    end
                    
                    if (state_is_s_match) begin
                        if (epoch == 7'd0) begin
                            case (paddrlsbrr)
                                2'd0    : if (rdata_r        != tdata_r       ) pvalid[idxrr] <= 1'b0;
                                2'd1    : if (rdata_r[31: 8] != tdata_r[31: 8]) pvalid[idxrr] <= 1'b0;
                                2'd2    : if (rdata_r[31:16] != tdata_r[31:16]) pvalid[idxrr] <= 1'b0;
                                default : if (rdata_r[31:24] != tdata_r[31:24]) pvalid[idxrr] <= 1'b0;
                            endcase
                        end else begin
                            if (rdata_r != tdata_r) pvalid[idxrr] <= 1'b0;
                        end
                    end
                    
                    if (state_is_s_match && pvalidrr && tscore > score) begin
                        score    <= tscore;
                        length   <= tlength_r;
                        distance <= pdistrr;
                        best_idx <= idxrr;
                    end
                    
                    if (state_is_s_match) begin
                        if (epoch == 7'd0 && idxrr == 4'd8) begin
                            if (pvalidrr && (tlength_r != 9'd0))
                                shortrep <= 1'b1;
                            else
                                shortrep <= 1'b0;
                            case (paddrlsbrr)
                                2'd0    : matchbyte <= rdata_r[ 7: 0];
                                2'd1    : matchbyte <= rdata_r[15: 8];
                                2'd2    : matchbyte <= rdata_r[23:16];
                                default : matchbyte <= rdata_r[31:24];
                            endcase
                        end
                    end
                end
                
                S_MATCH_WAIT : begin
                    pvalid[11] <= pvalid11;
                    
                    if (pvalidrr && tscore > score) begin
                        score    <= tscore;
                        length   <= tlength_r;
                        distance <= pdistrr;
                        best_idx <= 4'd11;
                    end
                //end
                
                //S_INC : begin
                    pdata <= cdata[31:8];
                    case (ptr[1:0])
                        2'd0    : {ndata, cdata} <= {24'h0, rdata             };
                        2'd1    : {ndata, cdata} <= {       rdata, ndata      };
                        2'd2    : {ndata, cdata} <= { 8'h0, rdata, ndata[15:0]};
                        default : {ndata, cdata} <= {16'h0, rdata, ndata[ 7:0]};
                    endcase
                    
                    epoch <= epoch + 7'd1;
                    
                    caddr <= caddr + 15'd1;
                    raddr <= paddr0[16:2] + {8'd0, epoch} + 15'd1;      // paddr[0][16:2] + 15'd1;
                    
                    if (state_i==S_I_END) begin
                        length   <= 9'd1;
                        distance <= 0;
                        best_idx <= 4'hF;
                        raddr <= ptr[16:2] + 15'd2;
                        state <= S_SUBMIT;
                    end else if (epoch>=7'd67 || ({pvalid11,pvalid[10:0]}==12'h0)) begin   // done LZ search
                        raddr <= ptr[16:2] + 15'd2;
                        state <= S_SUBMIT;
                    end else begin                                      // continue for LZ search
                        state <= S_MATCH_PRE;
                    end
                end
                
                S_SUBMIT : begin
                    raddr <= ptr[16:2] + 15'd2;
                    if (o_ready) begin
                        {pdist[8], pdist[9], pdist[10], pdist[11]} <=
                            (best_idx <  4'd8) ? {distance , pdist[8], pdist[9] , pdist[10]} :   // MATCH
                            (best_idx == 4'd9) ? {pdist[9] , pdist[8], pdist[10], pdist[11]} :   // REP1
                            (best_idx ==4'd10) ? {pdist[10], pdist[8], pdist[9] , pdist[11]} :   // REP2
                            (best_idx ==4'd11) ? {pdist[11], pdist[8], pdist[9] , pdist[10]} :   // REP3
                            /*otherwise*/        {pdist[8] , pdist[9], pdist[10], pdist[11]} ;   // REP0, SHORTREP, or LIT
                        
                        if (best_idx <= 4'd11) rep0valid <= 1'b1;
                        
                        ptr    <= ptr + 17'd1;
                        length <= length - 9'd1;
                        state  <= S_FORWARD2;
                    end
                end
                
                S_FORWARD1 : begin
                    ptr    <= ptr + 17'd1;
                    length <= length - 9'd1;
                    state  <= S_FORWARD2;
                end
                
                default :  begin // S_FORWARD2 : begin
                    case (ptr[1:0])
                        2'd0    : sdata <= {rdata[31:24], sdata[63:8]};
                        2'd1    : sdata <= {rdata[ 7: 0], sdata[63:8]};
                        2'd2    : sdata <= {rdata[15: 8], sdata[63:8]};
                        default : sdata <= {rdata[23:16], sdata[63:8]};
                    endcase
                    
                    prevbyte <= sdata[7:0];
                    
                    if (length > 9'd0) begin
                        raddr <= ptr[16:2] + 15'd2;
                        state <= S_FORWARD1;
                    end else begin
                        raddr <= ptr[16:2];
                        state <= S_IDLE;
                    end
                end
            endcase
        end
    end


assign o_valid     = (state == S_SUBMIT);
assign o_last      = (state_i==S_I_END) && ((ptr+17'd1)==wptr);
assign o_pos       = ptr;
assign o_type      = (best_idx <   4'd8) ? 3'd1 :
                     (best_idx ==  4'd8) ? 3'd4 :
                     (best_idx ==  4'd9) ? 3'd5 :
                     (best_idx == 4'd10) ? 3'd6 :
                     (best_idx == 4'd11) ? 3'd7 :
                     shortrep            ? 3'd3 :
                     /*otherwise*/         3'd0 ;
assign o_byte      = sdata[7:0];
assign o_prevbyte  = prevbyte;
assign o_matchbyte = matchbyte;
assign o_len       = length;
assign o_dist      = distance;


always @ (posedge clk)                          // write back hash table
    if (state == S_FORWARD2) begin
        hash_tab0[hash] <= ptr - 17'd1;
        hash_tab1[hash] <= hash_rd[0];
        hash_tab2[hash] <= hash_rd[1];
        hash_tab3[hash] <= hash_rd[2];
        hash_tab4[hash] <= hash_rd[3];
        hash_tab5[hash] <= hash_rd[4];
        hash_tab6[hash] <= hash_rd[5];
        hash_tab7[hash] <= hash_rd[6];
    end


endmodule

