
//--------------------------------------------------------------------------------------------------------
// Module  : hard_png
// Type    : synthesizable, IP's top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: png image decoder
//--------------------------------------------------------------------------------------------------------

module hard_png (
    input  wire         rstn,
    input  wire         clk,
    // png data input stream
    input  wire         istart,
    input  wire         ivalid,
    output reg          iready,
    input  wire [ 7:0]  ibyte,
    // image frame configuration output
    output reg          ostart,
    output wire [ 2:0]  colortype, // 0:gray   1:gray+A   2:RGB   3:RGBA   4:RGB-plte
    output wire [13:0]  width,     // image width
    output wire [31:0]  height,    // image height
    // pixel output
    output reg          ovalid,
    output wire [ 7:0]  opixelr, opixelg, opixelb, opixela
);



initial ostart = 1'b0;
initial ovalid = 1'b0;

reg          isplte = 1'b0;

reg  [ 1:0]  bpp = 0;   // bytes per pixel
reg  [13:0]  ppr = 0;   // pixel per row
reg  [13:0]  bpr = 0;   // bytes per row
reg  [31:0]  rpf = 0;   // rows per frame

assign colortype = isplte ? 3'd4 : {1'b0,bpp};

assign width  = ppr;
assign height = rpf;

reg          pvalid;
reg          pready;
reg  [ 7:0]  pbyte;

reg          mvalid = 0;
reg  [ 7:0]  mbyte = 0;

reg          bvalid = 0;
reg  [ 7:0]  bbyte = 0;

reg          plte_wen = 0;
reg  [ 7:0]  plte_waddr = 0;
reg  [23:0]  plte_wdata = 0;
reg  [23:0]  plte_rdata;




//-----------------------------------------------------------------------------------------------------------------------
// png parser
//-----------------------------------------------------------------------------------------------------------------------

wire     ispltes [0:7]; assign ispltes[0]=1'b0; assign ispltes[1]=1'b0; assign ispltes[2]=1'b0; assign ispltes[3]=1'b1; assign ispltes[4]=1'b0; assign ispltes[5]=1'b0; assign ispltes[6]=1'b0; assign ispltes[7]=1'b0;
wire [ 1:0] bpps [0:7]; assign bpps[0]=2'd0; assign bpps[1]=2'd0; assign bpps[2]=2'd2; assign bpps[3]=2'd0; assign bpps[4]=2'd1; assign bpps[5]=2'd0; assign bpps[6]=2'd3; assign bpps[7]=2'd0;

wire [63:0] png_precode = 64'h89504e470d0a1a0a;
wire [31:0] ihdr_name = 32'h49484452;
wire [31:0] plte_name = 32'h504C5445;
wire [31:0] idat_name = 32'h49444154;
wire [31:0] iend_name = 32'h49454e44;

reg  [ 7:0] latchbytes [0:6];
wire [ 7:0] lastbytes  [0:7];
wire [63:0] lastlbytes;
wire [31:0] h32bit = lastlbytes[63:32];
wire [31:0] l32bit = lastlbytes[31: 0];

assign lastbytes[7] = ibyte;

initial {latchbytes[0],latchbytes[1],latchbytes[2],latchbytes[3],latchbytes[4],latchbytes[5],latchbytes[6]} = 0;

generate genvar ii;
    for(ii=0; ii<7; ii=ii+1) begin : generate_latchbytes_connect
        assign lastbytes[ii] = latchbytes[ii];
        always @ (posedge clk or negedge rstn)
            if(~rstn)
                latchbytes[ii] <= 0;
            else begin
                if(istart)
                    latchbytes[ii] <= 0;
                else if(ivalid)
                    latchbytes[ii] <= lastbytes[ii+1];
            end
    end
endgenerate

assign lastlbytes[ 7: 0] = lastbytes[7];
assign lastlbytes[15: 8] = lastbytes[6];
assign lastlbytes[23:16] = lastbytes[5];
assign lastlbytes[31:24] = lastbytes[4];
assign lastlbytes[39:32] = lastbytes[3];
assign lastlbytes[47:40] = lastbytes[2];
assign lastlbytes[55:48] = lastbytes[1];
assign lastlbytes[63:56] = lastbytes[0];

reg  [ 2:0] bcnt= 0;
reg  [31:0] cnt = 0;
reg  [ 2:0] crccnt = 0;
reg  [ 2:0] gapcnt = 0;

localparam [2:0] NONE = 3'd0,
                 IHDR = 3'd1,
                 PLTE = 3'd2,
                 IDAT = 3'd3,
                 IEND = 3'd4;
reg [2:0] curr_name = NONE;

reg busy = 1'b0;
reg sizevalid = 1'b0;

reg          ispltetmp = 1'b0;
reg  [ 1:0]  bpptmp = 0;   // bytes per pixel
reg  [13:0]  pprtmp = 0;   // pixel per row
reg  [15:0]  bprtmp = 0;   // bytes per row
reg  [31:0]  rpftmp = 0;   // rows per frame

reg  [ 1:0]  plte_bytecnt = 0;
reg  [ 7:0]  plte_pixcnt  = 0;

wire parametervalid =   (   lastbytes[7]==8'h0 &&
                            lastbytes[6]==8'h0 &&
                            lastbytes[5]==8'h0 &&
                            lastbytes[3]==8'h8 &&
                            (   lastbytes[4]==8'h0 ||
                                lastbytes[4]==8'h2 ||
                                lastbytes[4]==8'h3 ||
                                lastbytes[4]==8'h4 ||
                                lastbytes[4]==8'h6
                            )
                        );

always @ (*)
    if(cnt>0 && curr_name==IDAT && gapcnt==2'd0) begin
        iready = pready;
        pvalid = ivalid;
        pbyte  = ibyte;
    end else begin
        iready = 1'b1;
        pvalid = 1'b0;
        pbyte  = 0;
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        bcnt <= 0;
        cnt  <= 0;
        crccnt <= 0;
        gapcnt <= 0;
        busy <= 1'b0;
        sizevalid <= 1'b0;
        curr_name <= NONE;
        ispltetmp <= 1'b0;
        bpptmp <= 0;
        pprtmp <= 0;
        bprtmp <= 0;
        rpftmp <= 0;
        isplte <= 1'b0;
        bpp    <= 0;
        ppr    <= 0;
        bpr    <= 0;
        rpf    <= 0;
        ostart <= 1'b0;
        plte_wen <= 1'b0;
        plte_waddr <= 0;
        plte_wdata <= 0;
        plte_bytecnt <= 0;
        plte_pixcnt  <= 0;
    end else begin
        ostart <= 1'b0;
        plte_wen <= 1'b0;
        plte_waddr <= 0;
        plte_wdata <= 0;
        if(istart) begin
            bcnt <= 0;
            cnt  <= 0;
            crccnt <= 0;
            gapcnt <= 0;
            busy <= 1'b0;
            sizevalid <= 1'b0;
            curr_name <= NONE;
            ispltetmp <= 1'b0;
            bpptmp <= 0;
            pprtmp <= 0;
            bprtmp <= 0;
            rpftmp <= 0;
            isplte <= 1'b0;
            bpp    <= 0;
            ppr    <= 0;
            bpr    <= 0;
            rpf    <= 0;
            plte_bytecnt <= 0;
            plte_pixcnt  <= 0;
        end else if(ivalid) begin
            plte_bytecnt <= 0;
            plte_pixcnt  <= 0;
            if(~busy) begin
                bcnt <= 0;
                cnt  <= 0;
                crccnt <= 0;
                busy <= (lastlbytes==png_precode);
            end else begin
                if(cnt>0) begin
                    bcnt <= 0;
                    if(curr_name==IHDR) begin
                        cnt  <= cnt - 1;
                        gapcnt <= 2'd2;
                        if(cnt==6) begin
                            rpftmp <= l32bit;
                            if(h32bit[31:14] == 18'h0) begin
                                sizevalid <= 1'b1;
                                pprtmp <= h32bit[13:0];
                            end else begin
                                sizevalid <= 1'b0;
                                pprtmp <= 14'h3fff;
                            end
                        end else if(cnt==3) begin
                            ispltetmp <= ispltes[lastlbytes[10:8]];
                            bpptmp <= bpps[lastlbytes[10:8]];
                        end else if(cnt==2) begin
                            case(bpptmp)
                            2'd0 : bprtmp <= {2'b00, pprtmp};
                            2'd1 : bprtmp <= {1'b0, pprtmp, 1'b0};
                            2'd2 : bprtmp <= {1'b0, pprtmp, 1'b0} + {2'b00, pprtmp};
                            2'd3 : bprtmp <= {pprtmp, 2'b00};
                            endcase
                        end else if(cnt==1) begin
                            if(sizevalid && parametervalid && (bprtmp[15:14]==2'd0)) begin
                                ostart <= 1'b1;
                                isplte <= ispltetmp;
                                bpp <= bpptmp;
                                ppr <= pprtmp;
                                bpr <= bprtmp[13:0];
                                rpf <= rpftmp;
                            end else begin
                                isplte <= 1'b0;
                                bpp <= 0;
                                ppr <= 0;
                                bpr <= 0;
                                rpf <= 0;
                            end
                        end
                    end else if(curr_name==IDAT) begin
                        if(gapcnt>2'd0)
                            gapcnt <= gapcnt - 2'd1;
                        if(gapcnt==2'd0) begin
                            if(pready)
                                cnt <= cnt - 1;
                        end else begin
                            cnt <= cnt - 1;
                        end
                    end else if(curr_name==PLTE) begin
                        plte_pixcnt <= plte_pixcnt;
                        case(plte_bytecnt)
                        2'd0   :plte_bytecnt <= 2'd1;
                        2'd1   :plte_bytecnt <= 2'd2;
                        default:begin 
                                plte_bytecnt <= 2'd0;
                                plte_pixcnt  <= plte_pixcnt + 8'd1;
                                plte_wen     <= 1'b1;
                                plte_waddr   <= plte_pixcnt;
                                plte_wdata   <= lastlbytes[23:0];
                            end
                        endcase
                        cnt <= cnt - 1;
                    end else begin
                        cnt <= cnt - 1;
                    end
                end else if(crccnt>3'd0) begin
                    bcnt <= 0;
                    cnt  <= 0;
                    crccnt <= crccnt - 3'd1;
                    if(crccnt==3'd1) begin
                        if(curr_name==IEND) begin
                            busy <= 1'b0;
                        end
                        curr_name <= NONE;
                    end
                end else begin
                    if(bcnt==3'd7) begin
                        cnt <= h32bit;
                        crccnt <= 3'd4;
                        if     (l32bit==ihdr_name)
                            curr_name <= IHDR;
                        else if(l32bit==plte_name)
                            curr_name <= PLTE;
                        else if(l32bit==idat_name)
                            curr_name <= IDAT;
                        else if(l32bit==iend_name)
                            curr_name <= IEND;
                        else
                            curr_name <= NONE;
                    end
                    bcnt <= bcnt + 3'd1;
                end
            end
        end
    end




//-----------------------------------------------------------------------------------------------------------------------
// uz_inflate
//-----------------------------------------------------------------------------------------------------------------------

reg        end_stream = 0;

wire       huffman_ovalid;
wire [7:0] huffman_obyte;

reg [ 2:0] uz_cnt = 0;
reg [ 7:0] rbyte = 0;

reg        tvalid;
wire       tready;
reg        tbit;

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        mvalid <= 1'b0;
        mbyte  <= 0;
    end else begin
        if(istart) begin
            mvalid <= 1'b0;
            mbyte  <= 0;
        end else begin
            mvalid <= huffman_ovalid;
            mbyte  <= huffman_obyte;
        end
    end

always @ (*)
    if(uz_cnt==3'h0) begin
        pready = tready;
        tvalid = pvalid;
        tbit   = pbyte[0];
    end else begin
        pready = 1'b0;
        tvalid = 1'b1;
        tbit   = rbyte[uz_cnt];
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        uz_cnt <= 0;
        rbyte <= 0;
    end else begin
        if(istart) begin
            uz_cnt <= 0;
            rbyte <= 0;
        end else begin
            if(uz_cnt==3'h0) begin
                if(pvalid & tready) begin
                    uz_cnt <= uz_cnt + 3'h1;
                    rbyte <= pbyte;
                end
            end else begin
                if(tready)
                    uz_cnt <= uz_cnt + 3'h1;
            end
        end
    end


//--------------------------------------------------------------------------------------------------------------------
// huffman inflate
//--------------------------------------------------------------------------------------------------------------------
wire [ 4:0] CLCL [0:18]; assign CLCL[0]=5'd16; assign CLCL[1]=5'd17; assign CLCL[2]=5'd18; assign CLCL[3]=5'd0; assign CLCL[4]=5'd8; assign CLCL[5]=5'd7; assign CLCL[6]=5'd9; assign CLCL[7]=5'd6; assign CLCL[8]=5'd10; assign CLCL[9]=5'd5; assign CLCL[10]=5'd11; assign CLCL[11]=5'd4; assign CLCL[12]=5'd12; assign CLCL[13]=5'd3; assign CLCL[14]=5'd13; assign CLCL[15]=5'd2; assign CLCL[16]=5'd14; assign CLCL[17]=5'd1; assign CLCL[18]=5'd15;
wire [ 8:0] LENGTH_BASE [0:29]; assign LENGTH_BASE[0]=9'd0; assign LENGTH_BASE[1]=9'd3; assign LENGTH_BASE[2]=9'd4; assign LENGTH_BASE[3]=9'd5; assign LENGTH_BASE[4]=9'd6; assign LENGTH_BASE[5]=9'd7; assign LENGTH_BASE[6]=9'd8; assign LENGTH_BASE[7]=9'd9; assign LENGTH_BASE[8]=9'd10; assign LENGTH_BASE[9]=9'd11; assign LENGTH_BASE[10]=9'd13; assign LENGTH_BASE[11]=9'd15; assign LENGTH_BASE[12]=9'd17; assign LENGTH_BASE[13]=9'd19; assign LENGTH_BASE[14]=9'd23; assign LENGTH_BASE[15]=9'd27; assign LENGTH_BASE[16]=9'd31; assign LENGTH_BASE[17]=9'd35; assign LENGTH_BASE[18]=9'd43; assign LENGTH_BASE[19]=9'd51; assign LENGTH_BASE[20]=9'd59; assign LENGTH_BASE[21]=9'd67; assign LENGTH_BASE[22]=9'd83; assign LENGTH_BASE[23]=9'd99; assign LENGTH_BASE[24]=9'd115; assign LENGTH_BASE[25]=9'd131; assign LENGTH_BASE[26]=9'd163; assign LENGTH_BASE[27]=9'd195; assign LENGTH_BASE[28]=9'd227; assign LENGTH_BASE[29]=9'd258;
wire [ 2:0] LENGTH_EXTRA [0:29]; assign LENGTH_EXTRA[0]=3'd0; assign LENGTH_EXTRA[1]=3'd0; assign LENGTH_EXTRA[2]=3'd0; assign LENGTH_EXTRA[3]=3'd0; assign LENGTH_EXTRA[4]=3'd0; assign LENGTH_EXTRA[5]=3'd0; assign LENGTH_EXTRA[6]=3'd0; assign LENGTH_EXTRA[7]=3'd0; assign LENGTH_EXTRA[8]=3'd0; assign LENGTH_EXTRA[9]=3'd1; assign LENGTH_EXTRA[10]=3'd1; assign LENGTH_EXTRA[11]=3'd1; assign LENGTH_EXTRA[12]=3'd1; assign LENGTH_EXTRA[13]=3'd2; assign LENGTH_EXTRA[14]=3'd2; assign LENGTH_EXTRA[15]=3'd2; assign LENGTH_EXTRA[16]=3'd2; assign LENGTH_EXTRA[17]=3'd3; assign LENGTH_EXTRA[18]=3'd3; assign LENGTH_EXTRA[19]=3'd3; assign LENGTH_EXTRA[20]=3'd3; assign LENGTH_EXTRA[21]=3'd4; assign LENGTH_EXTRA[22]=3'd4; assign LENGTH_EXTRA[23]=3'd4; assign LENGTH_EXTRA[24]=3'd4; assign LENGTH_EXTRA[25]=3'd5; assign LENGTH_EXTRA[26]=3'd5; assign LENGTH_EXTRA[27]=3'd5; assign LENGTH_EXTRA[28]=3'd5; assign LENGTH_EXTRA[29]=3'd0;
wire [14:0] DISTANCE_BASE [0:29]; assign DISTANCE_BASE[0]=15'd1; assign DISTANCE_BASE[1]=15'd2; assign DISTANCE_BASE[2]=15'd3; assign DISTANCE_BASE[3]=15'd4; assign DISTANCE_BASE[4]=15'd5; assign DISTANCE_BASE[5]=15'd7; assign DISTANCE_BASE[6]=15'd9; assign DISTANCE_BASE[7]=15'd13; assign DISTANCE_BASE[8]=15'd17; assign DISTANCE_BASE[9]=15'd25; assign DISTANCE_BASE[10]=15'd33; assign DISTANCE_BASE[11]=15'd49; assign DISTANCE_BASE[12]=15'd65; assign DISTANCE_BASE[13]=15'd97; assign DISTANCE_BASE[14]=15'd129; assign DISTANCE_BASE[15]=15'd193; assign DISTANCE_BASE[16]=15'd257; assign DISTANCE_BASE[17]=15'd385; assign DISTANCE_BASE[18]=15'd513; assign DISTANCE_BASE[19]=15'd769; assign DISTANCE_BASE[20]=15'd1025; assign DISTANCE_BASE[21]=15'd1537; assign DISTANCE_BASE[22]=15'd2049; assign DISTANCE_BASE[23]=15'd3073; assign DISTANCE_BASE[24]=15'd4097; assign DISTANCE_BASE[25]=15'd6145; assign DISTANCE_BASE[26]=15'd8193; assign DISTANCE_BASE[27]=15'd12289; assign DISTANCE_BASE[28]=15'd16385; assign DISTANCE_BASE[29]=15'd24577;
wire [ 3:0] DISTANCE_EXTRA [0:29]; assign DISTANCE_EXTRA[0]=4'd0; assign DISTANCE_EXTRA[1]=4'd0; assign DISTANCE_EXTRA[2]=4'd0; assign DISTANCE_EXTRA[3]=4'd0; assign DISTANCE_EXTRA[4]=4'd1; assign DISTANCE_EXTRA[5]=4'd1; assign DISTANCE_EXTRA[6]=4'd2; assign DISTANCE_EXTRA[7]=4'd2; assign DISTANCE_EXTRA[8]=4'd3; assign DISTANCE_EXTRA[9]=4'd3; assign DISTANCE_EXTRA[10]=4'd4; assign DISTANCE_EXTRA[11]=4'd4; assign DISTANCE_EXTRA[12]=4'd5; assign DISTANCE_EXTRA[13]=4'd5; assign DISTANCE_EXTRA[14]=4'd6; assign DISTANCE_EXTRA[15]=4'd6; assign DISTANCE_EXTRA[16]=4'd7; assign DISTANCE_EXTRA[17]=4'd7; assign DISTANCE_EXTRA[18]=4'd8; assign DISTANCE_EXTRA[19]=4'd8; assign DISTANCE_EXTRA[20]=4'd9; assign DISTANCE_EXTRA[21]=4'd9; assign DISTANCE_EXTRA[22]=4'd10; assign DISTANCE_EXTRA[23]=4'd10; assign DISTANCE_EXTRA[24]=4'd11; assign DISTANCE_EXTRA[25]=4'd11; assign DISTANCE_EXTRA[26]=4'd12; assign DISTANCE_EXTRA[27]=4'd12; assign DISTANCE_EXTRA[28]=4'd13; assign DISTANCE_EXTRA[29]=4'd13;

reg        irepeat = 1'b0;
reg        srepeat = 1'b0;

reg symbol_valid = 1'b0;
reg [7:0] symbol  = 0;

reg  [ 1:0] iword = 0;
reg  [ 1:0] ibcnt = 0;
reg  [ 4:0] precode_wpt = 0;
/*  */
reg         bfin  = 1'b0;
reg         bfix  = 1'b0;
reg         fixed_tree = 1'b0;
reg  [13:0] precode_reg  = 0;
wire [ 4:0] hclen = 5'd4   + {1'b0, precode_reg[13:10]};
wire [ 8:0] hlit  = 9'd257 +        precode_reg[ 4: 0]; 
wire [ 8:0] hdist = 9'd1   + {4'h0, precode_reg[ 9: 5]};
wire [ 8:0] hmax  = hlit + hdist;
wire [ 8:0] hend  = (hlit+9'd32>9'd288) ? hlit+9'd32 : 9'd288;

reg  [ 4:0] lentree_wpt  = 0;
reg  [ 8:0] tree_wpt = 0;

wire        lentree_codeen;   
wire [ 5:0] lentree_code;
wire        codetree_codeen;
wire [ 9:0] codetree_code;
wire        distree_codeen;
wire [ 9:0] distree_code;

reg  [ 2:0] repeat_code_pt  = 0;

localparam [1:0] REPEAT_NONE      = 2'd0,
                 REPEAT_PREVIOUS  = 2'd1,
                 REPEAT_ZERO_FEW  = 2'd2,
                 REPEAT_ZERO_MANY = 2'd3;
reg  [ 1:0] repeat_mode = REPEAT_NONE;

reg  [ 6:0] repeat_code=0;
reg  [ 7:0] repeat_len =0;
reg  [ 5:0] repeat_val = 0;

reg         lentree_run = 1'b0;
wire        lentree_done;
reg         tree_run = 1'b0;
wire        codetree_done;
wire        distree_done;
wire        tree_done = (codetree_done & distree_done) | fixed_tree;

reg  [ 2:0] tcnt =3'h0, tmax =3'h0;
reg  [ 3:0] dscnt=4'h0, dsmax=4'h0;

localparam [1:0] T = 2'd0,
                 D = 2'd1,
                 R = 2'd2,
                 S = 2'd3;
reg [1:0] huffman_status = T;

wire   lentree_ien  = ~end_stream & tvalid & lentree_done &  ~lentree_codeen & (repeat_mode==REPEAT_NONE && repeat_len==8'd0) & (tree_wpt<hmax);
wire   codetree_ien = ~end_stream & tvalid & tree_done    & ~codetree_codeen & (tcnt==3'd0) & (dscnt==4'd0) & (huffman_status==T);
wire   distree_ien  = ~end_stream & tvalid & tree_done    &  ~distree_codeen & (tcnt==3'd0) & (dscnt==4'd0) & (huffman_status==D);

assign tready = end_stream | & (
    ( precode_wpt<5'd17 || lentree_wpt<hclen ) |
    ( lentree_done & ~lentree_codeen & ((repeat_mode==REPEAT_NONE && repeat_len==8'd0) | repeat_code_pt>3'd0) & (tree_wpt<hmax) ) |
    ( tree_done & ~codetree_codeen & ~distree_codeen & (huffman_status==T || huffman_status==D || (huffman_status==R && dscnt>4'd0)) ) );

reg  [ 8:0] lengthb= 0;
reg  [ 5:0] lengthe= 0;
wire [ 8:0] length = lengthb + lengthe;
reg  [ 8:0] len_last = 0;

reg  [15:0] distanceb=0;
reg  [15:0] distancee=0;
wire [15:0] distance = distanceb + distancee;

reg         lentree_wen = 1'b0;
reg  [ 4:0] lentree_waddr = 0;
reg  [ 2:0] lentree_wdata = 0;
reg         codetree_wen = 1'b0;
reg  [ 8:0] codetree_waddr = 0;
reg  [ 5:0] codetree_wdata = 0;
reg         distree_wen = 1'b0;
reg  [ 4:0] distree_waddr = 0;
reg  [ 5:0] distree_wdata = 0;

wire [ 5:0] lentree_raddr;
wire [ 5:0] lentree_rdata;
wire [ 9:0] codetree_raddr;
wire [ 9:0] codetree_rdata;
reg  [ 9:0] codetree_rdata_fixed;
wire [ 5:0] distree_raddr;
wire [ 9:0] distree_rdata;
reg  [ 9:0] distree_rdata_fixed;

task lentree_write;
    input       wen;
    input [4:0] waddr;
    input [2:0] wdata;
//task automatic lentree_write(input wen=1'b0, input [4:0] waddr='0, input [2:0] wdata='0);
begin
    lentree_wen   <= wen;
    lentree_waddr <= waddr;
    lentree_wdata <= wdata;
end
endtask

task codetree_write;
    input       wen;
    input [8:0] waddr;
    input [5:0] wdata;
//task automatic codetree_write(input wen=1'b0, input [8:0] waddr='0, input [5:0] wdata='0);
begin
    codetree_wen   <= wen;
    codetree_waddr <= waddr;
    codetree_wdata <= wdata;
end
endtask

task distree_write;
    input       wen;
    input [4:0] waddr;
    input [5:0] wdata;
//task automatic distree_write(input wen=1'b0, input [4:0] waddr='0, input [5:0] wdata='0);
begin
    distree_wen   <= wen;
    distree_waddr <= waddr;
    distree_wdata <= wdata;
end
endtask

task reset_all_regs;
begin
    {bfin, bfix, fixed_tree} <= 0;
    iword <= 0;
    ibcnt <= 0;
    precode_wpt <= 0;
    precode_reg <= 0;
    lentree_wpt <= 0;
    lentree_run <= 1'b0;
    tree_run    <= 1'b0;
    lentree_write(0,0,0);
    codetree_write(0,0,0);
    distree_write(0,0,0);
    repeat_code_pt <= 0;
    repeat_mode <= REPEAT_NONE;
    repeat_code <= 0;
    repeat_len <= 0;
    repeat_val <= 0;
    tree_wpt   <= 0;
    tcnt     <= 0;
    tmax     <= 0;
    lengthb  <= 0;
    lengthe  <= 0;
    distanceb<= 0;
    distancee<= 0;
    dscnt    <= 0;
    dsmax    <= 0;
    huffman_status   <= T;
    symbol_valid <= 1'b0;
    symbol       <= 0;
    irepeat  <= 1'b0;
    srepeat  <= 1'b0;
    len_last <= 0;
end
endtask

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        end_stream <= 0;
        reset_all_regs;
    end else begin
        if(istart) begin
            end_stream <= 0;
            reset_all_regs;
        end else begin
            symbol_valid <= 1'b0;
            symbol       <= 0;
            irepeat  <= 1'b0;
            srepeat  <= 1'b0;
            lentree_write(0,0,0);
            codetree_write(0,0,0);
            distree_write(0,0,0);
            if(precode_wpt<=2) begin
                lentree_run <= 1'b0;
                tree_run    <= 1'b0;
                if(tvalid) begin
                    precode_wpt <= precode_wpt + 5'd1;
                    if(precode_wpt==0) begin
                        bfin <= tbit;
                    end else if(precode_wpt==1) begin
                        bfix <= tbit;
                    end else begin
                        if( {tbit,bfix} == 2'b01 ) begin
                            precode_wpt <= 5'h1F;
                            lentree_wpt <= 5'h1F;
                            tree_wpt <= 9'h1FF;
                            fixed_tree <= 1'b1;
                        end
                    end
                end
            end else if(precode_wpt<17) begin
                lentree_run <= 1'b0;
                tree_run    <= 1'b0;
                if(tvalid) begin
                    precode_reg <= {tbit, precode_reg[13:1]};
                    precode_wpt <= precode_wpt + 5'd1;
                end
            end else if(lentree_wpt<hclen) begin
                lentree_run <= 1'b0;
                tree_run    <= 1'b0;
                if(tvalid) begin
                    if(ibcnt<2'd2) begin
                        iword[ibcnt[0]] <= tbit;
                        ibcnt <= ibcnt + 2'd1;
                    end else begin
                        lentree_write(1'b1, CLCL[lentree_wpt], {tbit, iword});
                        ibcnt <= 2'd0;
                        lentree_wpt <= lentree_wpt + 5'd1;
                    end
                end
            end else if(lentree_wpt<19) begin
                lentree_run <= 1'b0;
                tree_run    <= 1'b0;
                lentree_write(1'b1, CLCL[lentree_wpt], 0);
                lentree_wpt <= lentree_wpt + 5'd1;
            end else if(~ (lentree_done | fixed_tree)) begin
                lentree_run <= ~fixed_tree;
                tree_run    <= 1'b0;
            end else if(tree_wpt<hmax) begin
                lentree_run <= ~fixed_tree;
                tree_run    <= 1'b0;
                if(repeat_code_pt>3'd0) begin
                    if(tvalid) begin
                        repeat_code_pt <= repeat_code_pt - 3'd1;
                        repeat_code[3'd7-repeat_code_pt] <= tbit;
                    end
                end else if(repeat_mode>0) begin
                    case(repeat_mode)
                    REPEAT_PREVIOUS: begin
                        repeat_len <= repeat_code[6:5] + 8'd3;
                    end
                    REPEAT_ZERO_FEW: begin
                        repeat_len <= repeat_code[6:4] + 8'd3;
                    end
                    REPEAT_ZERO_MANY: begin
                        repeat_len <= repeat_code[6:0] + 8'd11;
                    end
                    default: begin
                        repeat_len <= 0;
                    end
                    endcase
                    repeat_mode <= REPEAT_NONE;
                end else if(repeat_len>8'd0) begin
                    repeat_len <= repeat_len - 8'd1;
                    tree_wpt   <= tree_wpt + 9'd1;
                    if(tree_wpt<288)
                        codetree_write(1'b1, tree_wpt, (tree_wpt<hlit) ? repeat_val : 0);
                    if(tree_wpt>=hlit && tree_wpt<(hlit+9'd32))
                        distree_write(1'b1, tree_wpt - hlit, (tree_wpt<hmax) ? repeat_val : 0);
                end else if(lentree_codeen) begin
                    case(lentree_code)
                    16: begin       // repeat previous
                        repeat_mode <= REPEAT_PREVIOUS;
                        repeat_code_pt <= 3'd2;
                    end
                    17: begin       // repeat 0 for 3-10 times
                        repeat_mode <= REPEAT_ZERO_FEW;
                        repeat_val  <= 0;
                        repeat_code_pt <= 3'd3;
                    end
                    18: begin       // repeat 0 for 11-138 times
                        repeat_mode <= REPEAT_ZERO_MANY;
                        repeat_val  <= 0;
                        repeat_code_pt <= 3'd7;
                    end
                    default: begin  // normal value
                        repeat_mode <= REPEAT_NONE;
                        repeat_val  <= lentree_code;  // save previous code for repeat
                        repeat_code_pt <= 3'd0;
                        tree_wpt <= tree_wpt + 9'd1;
                        if(tree_wpt<288)
                            codetree_write(1'b1, tree_wpt, (tree_wpt<hlit) ? lentree_code : 0);
                        if(tree_wpt>=hlit && tree_wpt<(hlit+9'd32))
                            distree_write(1'b1, tree_wpt - hlit, (tree_wpt<hmax) ? lentree_code : 0);
                    end
                    endcase
                    repeat_code <= 0;
                end
            end else if(tree_wpt<hend) begin
                lentree_run <= ~fixed_tree;
                tree_run    <= 1'b0;
                if(tree_wpt<288)
                    codetree_write(1'b1, tree_wpt, 0);
                if(tree_wpt>=hlit && tree_wpt<(hlit+9'd32))
                    distree_write(1'b1, tree_wpt - hlit, 0);
                tree_wpt <= tree_wpt + 9'd1;
            end else if(tree_wpt<hend+2) begin
                lentree_run <= ~fixed_tree;
                tree_run    <= 1'b0;
                tree_wpt <= tree_wpt + 9'd1;
            end else if(~tree_done) begin
                lentree_run <= ~fixed_tree;
                tree_run    <= 1'b1;
            end else begin
                lentree_run <= ~fixed_tree;
                tree_run    <= ~fixed_tree;
                if(dscnt>4'd0) begin
                    if(tvalid) begin
                        dscnt <= dscnt - 4'd1;
                        distancee[dsmax-dscnt] <= tbit;
                    end
                end else if(tcnt>3'd0) begin
                    if(tvalid) begin
                        tcnt <= tcnt - 3'd1;
                        lengthe[tmax-tcnt] <= tbit;
                    end
                end else if(huffman_status==R) begin
                    huffman_status <= S;
                    len_last <= length;
                    srepeat  <= 1'b1;
                end else if(huffman_status==S) begin
                    if(len_last>0) begin
                        irepeat <= 1'b1;
                        len_last <= len_last - 9'd1;
                    end else
                        huffman_status <= T;
                end else if(codetree_codeen) begin
                    if(codetree_code<10'd256) begin             // normal symbol
                        symbol_valid <= 1'b1;
                        symbol       <= codetree_code[7:0];
                    end else if(codetree_code==10'd256) begin   // end symbol
                        end_stream <= bfin;
                        reset_all_regs;
                    end else begin                              // special symbol
                        lengthb<= LENGTH_BASE[codetree_code-10'd256];
                        lengthe<= 0;
                        tcnt   <= LENGTH_EXTRA[codetree_code-10'd256];
                        tmax   <= LENGTH_EXTRA[codetree_code-10'd256];
                        huffman_status <= D;
                    end
                end else if(distree_codeen) begin
                    distanceb<= DISTANCE_BASE[distree_code];
                    distancee<= 0;
                    dscnt    <= DISTANCE_EXTRA[distree_code];
                    dsmax    <= DISTANCE_EXTRA[distree_code];
                    huffman_status <= R;
                end
            end
        end
    end


//--------------------------------------------------------------------------------------------------------------------
// lentree huffman builder
//--------------------------------------------------------------------------------------------------------------------
huffman_builder #(
    .NUMCODES  ( 19             ),
    .CODEBITS  ( 3              ),
    .BITLENGTH ( 7              ),
    .OUTWIDTH  ( 6              )
) lentree_builder (
    .rstn      ( rstn           ),
    .clk       ( clk            ),
    .istart    ( istart         ),
    .wren      ( lentree_wen    ),
    .wraddr    ( lentree_waddr  ),
    .wrdata    ( lentree_wdata  ),
    .run       ( lentree_run    ),
    .done      ( lentree_done   ),
    .rdaddr    ( lentree_raddr  ),
    .rddata    ( lentree_rdata  )
);


//--------------------------------------------------------------------------------------------------------------------
// lentree huffman decoder
//--------------------------------------------------------------------------------------------------------------------
huffman_decoder #(
    .NUMCODES  ( 19             ),
    .OUTWIDTH  ( 6              )
) lentree_decoder (
    .rstn      ( rstn           ),
    .clk       ( clk            ),
    .istart    ( istart         ),
    .ien       ( lentree_ien    ),
    .ibit      ( tbit           ),
    .oen       ( lentree_codeen ),
    .ocode     ( lentree_code   ),
    .rdaddr    ( lentree_raddr  ),
    .rddata    ( lentree_rdata  )
);


//--------------------------------------------------------------------------------------------------------------------
// codetree huffman builder
//--------------------------------------------------------------------------------------------------------------------
huffman_builder #(
    .NUMCODES  ( 288            ),
    .CODEBITS  ( 5              ),
    .BITLENGTH ( 15             ),
    .OUTWIDTH  ( 10             )
) codetree_builder (
    .rstn      ( rstn           ),
    .clk       ( clk            ),
    .istart    ( istart         ),
    .wren      ( codetree_wen   ),
    .wraddr    ( codetree_waddr ),
    .wrdata    ( codetree_wdata[4:0] ),
    .run       ( tree_run       ),
    .done      ( codetree_done  ),
    .rdaddr    ( codetree_raddr ),
    .rddata    ( codetree_rdata )
);


//--------------------------------------------------------------------------------------------------------------------
// codetree_fixed
//--------------------------------------------------------------------------------------------------------------------
wire [9:0] rom_fixed_codetree [0:1023];
assign rom_fixed_codetree[0]=10'd289; assign rom_fixed_codetree[1]=10'd370; assign rom_fixed_codetree[2]=10'd290; assign rom_fixed_codetree[3]=10'd307; assign rom_fixed_codetree[4]=10'd546; assign rom_fixed_codetree[5]=10'd291; assign rom_fixed_codetree[6]=10'd561; assign rom_fixed_codetree[7]=10'd292; assign rom_fixed_codetree[8]=10'd293; assign rom_fixed_codetree[9]=10'd300; assign rom_fixed_codetree[10]=10'd294; assign rom_fixed_codetree[11]=10'd297; assign rom_fixed_codetree[12]=10'd295; assign rom_fixed_codetree[13]=10'd296; assign rom_fixed_codetree[14]=10'd0; assign rom_fixed_codetree[15]=10'd1; assign rom_fixed_codetree[16]=10'd2; assign rom_fixed_codetree[17]=10'd3; assign rom_fixed_codetree[18]=10'd298; assign rom_fixed_codetree[19]=10'd299; assign rom_fixed_codetree[20]=10'd4; assign rom_fixed_codetree[21]=10'd5; assign rom_fixed_codetree[22]=10'd6; assign rom_fixed_codetree[23]=10'd7; assign rom_fixed_codetree[24]=10'd301; assign rom_fixed_codetree[25]=10'd304; assign rom_fixed_codetree[26]=10'd302; assign rom_fixed_codetree[27]=10'd303; assign rom_fixed_codetree[28]=10'd8; assign rom_fixed_codetree[29]=10'd9; assign rom_fixed_codetree[30]=10'd10; assign rom_fixed_codetree[31]=10'd11; assign rom_fixed_codetree[32]=10'd305; assign rom_fixed_codetree[33]=10'd306; assign rom_fixed_codetree[34]=10'd12; assign rom_fixed_codetree[35]=10'd13; assign rom_fixed_codetree[36]=10'd14; assign rom_fixed_codetree[37]=10'd15; assign rom_fixed_codetree[38]=10'd308; assign rom_fixed_codetree[39]=10'd339; assign rom_fixed_codetree[40]=10'd309; assign rom_fixed_codetree[41]=10'd324; assign rom_fixed_codetree[42]=10'd310; assign rom_fixed_codetree[43]=10'd317; assign rom_fixed_codetree[44]=10'd311; assign rom_fixed_codetree[45]=10'd314; assign rom_fixed_codetree[46]=10'd312; assign rom_fixed_codetree[47]=10'd313; assign rom_fixed_codetree[48]=10'd16; assign rom_fixed_codetree[49]=10'd17; assign rom_fixed_codetree[50]=10'd18; assign rom_fixed_codetree[51]=10'd19; assign rom_fixed_codetree[52]=10'd315; assign rom_fixed_codetree[53]=10'd316; assign rom_fixed_codetree[54]=10'd20; assign rom_fixed_codetree[55]=10'd21; assign rom_fixed_codetree[56]=10'd22; assign rom_fixed_codetree[57]=10'd23; assign rom_fixed_codetree[58]=10'd318; assign rom_fixed_codetree[59]=10'd321; assign rom_fixed_codetree[60]=10'd319; assign rom_fixed_codetree[61]=10'd320; assign rom_fixed_codetree[62]=10'd24; assign rom_fixed_codetree[63]=10'd25; assign rom_fixed_codetree[64]=10'd26; assign rom_fixed_codetree[65]=10'd27; assign rom_fixed_codetree[66]=10'd322; assign rom_fixed_codetree[67]=10'd323; assign rom_fixed_codetree[68]=10'd28; assign rom_fixed_codetree[69]=10'd29; assign rom_fixed_codetree[70]=10'd30; assign rom_fixed_codetree[71]=10'd31; assign rom_fixed_codetree[72]=10'd325; assign rom_fixed_codetree[73]=10'd332; assign rom_fixed_codetree[74]=10'd326; assign rom_fixed_codetree[75]=10'd329; assign rom_fixed_codetree[76]=10'd327; assign rom_fixed_codetree[77]=10'd328; assign rom_fixed_codetree[78]=10'd32; assign rom_fixed_codetree[79]=10'd33; assign rom_fixed_codetree[80]=10'd34; assign rom_fixed_codetree[81]=10'd35; assign rom_fixed_codetree[82]=10'd330; assign rom_fixed_codetree[83]=10'd331; assign rom_fixed_codetree[84]=10'd36; assign rom_fixed_codetree[85]=10'd37; assign rom_fixed_codetree[86]=10'd38; assign rom_fixed_codetree[87]=10'd39; assign rom_fixed_codetree[88]=10'd333; assign rom_fixed_codetree[89]=10'd336; assign rom_fixed_codetree[90]=10'd334; assign rom_fixed_codetree[91]=10'd335; assign rom_fixed_codetree[92]=10'd40; assign rom_fixed_codetree[93]=10'd41; assign rom_fixed_codetree[94]=10'd42; assign rom_fixed_codetree[95]=10'd43; assign rom_fixed_codetree[96]=10'd337; assign rom_fixed_codetree[97]=10'd338; assign rom_fixed_codetree[98]=10'd44; assign rom_fixed_codetree[99]=10'd45; assign rom_fixed_codetree[100]=10'd46; assign rom_fixed_codetree[101]=10'd47; assign rom_fixed_codetree[102]=10'd340; assign rom_fixed_codetree[103]=10'd355; assign rom_fixed_codetree[104]=10'd341; assign rom_fixed_codetree[105]=10'd348; assign rom_fixed_codetree[106]=10'd342; assign rom_fixed_codetree[107]=10'd345; assign rom_fixed_codetree[108]=10'd343; assign rom_fixed_codetree[109]=10'd344; assign rom_fixed_codetree[110]=10'd48; assign rom_fixed_codetree[111]=10'd49; assign rom_fixed_codetree[112]=10'd50; assign rom_fixed_codetree[113]=10'd51; assign rom_fixed_codetree[114]=10'd346; assign rom_fixed_codetree[115]=10'd347; assign rom_fixed_codetree[116]=10'd52; assign rom_fixed_codetree[117]=10'd53; assign rom_fixed_codetree[118]=10'd54; assign rom_fixed_codetree[119]=10'd55; assign rom_fixed_codetree[120]=10'd349; assign rom_fixed_codetree[121]=10'd352; assign rom_fixed_codetree[122]=10'd350; assign rom_fixed_codetree[123]=10'd351; assign rom_fixed_codetree[124]=10'd56; assign rom_fixed_codetree[125]=10'd57; assign rom_fixed_codetree[126]=10'd58; assign rom_fixed_codetree[127]=10'd59; assign rom_fixed_codetree[128]=10'd353; assign rom_fixed_codetree[129]=10'd354; assign rom_fixed_codetree[130]=10'd60; assign rom_fixed_codetree[131]=10'd61; assign rom_fixed_codetree[132]=10'd62; assign rom_fixed_codetree[133]=10'd63; assign rom_fixed_codetree[134]=10'd356; assign rom_fixed_codetree[135]=10'd363; assign rom_fixed_codetree[136]=10'd357; assign rom_fixed_codetree[137]=10'd360; assign rom_fixed_codetree[138]=10'd358; assign rom_fixed_codetree[139]=10'd359; assign rom_fixed_codetree[140]=10'd64; assign rom_fixed_codetree[141]=10'd65; assign rom_fixed_codetree[142]=10'd66; assign rom_fixed_codetree[143]=10'd67; assign rom_fixed_codetree[144]=10'd361; assign rom_fixed_codetree[145]=10'd362; assign rom_fixed_codetree[146]=10'd68; assign rom_fixed_codetree[147]=10'd69; assign rom_fixed_codetree[148]=10'd70; assign rom_fixed_codetree[149]=10'd71; assign rom_fixed_codetree[150]=10'd364; assign rom_fixed_codetree[151]=10'd367; assign rom_fixed_codetree[152]=10'd365; assign rom_fixed_codetree[153]=10'd366; assign rom_fixed_codetree[154]=10'd72; assign rom_fixed_codetree[155]=10'd73; assign rom_fixed_codetree[156]=10'd74; assign rom_fixed_codetree[157]=10'd75; assign rom_fixed_codetree[158]=10'd368; assign rom_fixed_codetree[159]=10'd369; assign rom_fixed_codetree[160]=10'd76; assign rom_fixed_codetree[161]=10'd77; assign rom_fixed_codetree[162]=10'd78; assign rom_fixed_codetree[163]=10'd79; assign rom_fixed_codetree[164]=10'd371; assign rom_fixed_codetree[165]=10'd434; assign rom_fixed_codetree[166]=10'd372; assign rom_fixed_codetree[167]=10'd403; assign rom_fixed_codetree[168]=10'd373; assign rom_fixed_codetree[169]=10'd388; assign rom_fixed_codetree[170]=10'd374; assign rom_fixed_codetree[171]=10'd381; assign rom_fixed_codetree[172]=10'd375; assign rom_fixed_codetree[173]=10'd378; assign rom_fixed_codetree[174]=10'd376; assign rom_fixed_codetree[175]=10'd377; assign rom_fixed_codetree[176]=10'd80; assign rom_fixed_codetree[177]=10'd81; assign rom_fixed_codetree[178]=10'd82; assign rom_fixed_codetree[179]=10'd83; assign rom_fixed_codetree[180]=10'd379; assign rom_fixed_codetree[181]=10'd380; assign rom_fixed_codetree[182]=10'd84; assign rom_fixed_codetree[183]=10'd85; assign rom_fixed_codetree[184]=10'd86; assign rom_fixed_codetree[185]=10'd87; assign rom_fixed_codetree[186]=10'd382; assign rom_fixed_codetree[187]=10'd385; assign rom_fixed_codetree[188]=10'd383; assign rom_fixed_codetree[189]=10'd384; assign rom_fixed_codetree[190]=10'd88; assign rom_fixed_codetree[191]=10'd89; assign rom_fixed_codetree[192]=10'd90; assign rom_fixed_codetree[193]=10'd91; assign rom_fixed_codetree[194]=10'd386; assign rom_fixed_codetree[195]=10'd387; assign rom_fixed_codetree[196]=10'd92; assign rom_fixed_codetree[197]=10'd93; assign rom_fixed_codetree[198]=10'd94; assign rom_fixed_codetree[199]=10'd95; assign rom_fixed_codetree[200]=10'd389; assign rom_fixed_codetree[201]=10'd396; assign rom_fixed_codetree[202]=10'd390; assign rom_fixed_codetree[203]=10'd393; assign rom_fixed_codetree[204]=10'd391; assign rom_fixed_codetree[205]=10'd392; assign rom_fixed_codetree[206]=10'd96; assign rom_fixed_codetree[207]=10'd97; assign rom_fixed_codetree[208]=10'd98; assign rom_fixed_codetree[209]=10'd99; assign rom_fixed_codetree[210]=10'd394; assign rom_fixed_codetree[211]=10'd395; assign rom_fixed_codetree[212]=10'd100; assign rom_fixed_codetree[213]=10'd101; assign rom_fixed_codetree[214]=10'd102; assign rom_fixed_codetree[215]=10'd103; assign rom_fixed_codetree[216]=10'd397; assign rom_fixed_codetree[217]=10'd400; assign rom_fixed_codetree[218]=10'd398; assign rom_fixed_codetree[219]=10'd399; assign rom_fixed_codetree[220]=10'd104; assign rom_fixed_codetree[221]=10'd105; assign rom_fixed_codetree[222]=10'd106; assign rom_fixed_codetree[223]=10'd107; assign rom_fixed_codetree[224]=10'd401; assign rom_fixed_codetree[225]=10'd402; assign rom_fixed_codetree[226]=10'd108; assign rom_fixed_codetree[227]=10'd109; assign rom_fixed_codetree[228]=10'd110; assign rom_fixed_codetree[229]=10'd111; assign rom_fixed_codetree[230]=10'd404; assign rom_fixed_codetree[231]=10'd419; assign rom_fixed_codetree[232]=10'd405; assign rom_fixed_codetree[233]=10'd412; assign rom_fixed_codetree[234]=10'd406; assign rom_fixed_codetree[235]=10'd409; assign rom_fixed_codetree[236]=10'd407; assign rom_fixed_codetree[237]=10'd408; assign rom_fixed_codetree[238]=10'd112; assign rom_fixed_codetree[239]=10'd113; assign rom_fixed_codetree[240]=10'd114; assign rom_fixed_codetree[241]=10'd115; assign rom_fixed_codetree[242]=10'd410; assign rom_fixed_codetree[243]=10'd411; assign rom_fixed_codetree[244]=10'd116; assign rom_fixed_codetree[245]=10'd117; assign rom_fixed_codetree[246]=10'd118; assign rom_fixed_codetree[247]=10'd119; assign rom_fixed_codetree[248]=10'd413; assign rom_fixed_codetree[249]=10'd416; assign rom_fixed_codetree[250]=10'd414; assign rom_fixed_codetree[251]=10'd415; assign rom_fixed_codetree[252]=10'd120; assign rom_fixed_codetree[253]=10'd121; assign rom_fixed_codetree[254]=10'd122; assign rom_fixed_codetree[255]=10'd123; assign rom_fixed_codetree[256]=10'd417; assign rom_fixed_codetree[257]=10'd418; assign rom_fixed_codetree[258]=10'd124; assign rom_fixed_codetree[259]=10'd125; assign rom_fixed_codetree[260]=10'd126; assign rom_fixed_codetree[261]=10'd127; assign rom_fixed_codetree[262]=10'd420; assign rom_fixed_codetree[263]=10'd427; assign rom_fixed_codetree[264]=10'd421; assign rom_fixed_codetree[265]=10'd424; assign rom_fixed_codetree[266]=10'd422; assign rom_fixed_codetree[267]=10'd423; assign rom_fixed_codetree[268]=10'd128; assign rom_fixed_codetree[269]=10'd129; assign rom_fixed_codetree[270]=10'd130; assign rom_fixed_codetree[271]=10'd131; assign rom_fixed_codetree[272]=10'd425; assign rom_fixed_codetree[273]=10'd426; assign rom_fixed_codetree[274]=10'd132; assign rom_fixed_codetree[275]=10'd133; assign rom_fixed_codetree[276]=10'd134; assign rom_fixed_codetree[277]=10'd135; assign rom_fixed_codetree[278]=10'd428; assign rom_fixed_codetree[279]=10'd431; assign rom_fixed_codetree[280]=10'd429; assign rom_fixed_codetree[281]=10'd430; assign rom_fixed_codetree[282]=10'd136; assign rom_fixed_codetree[283]=10'd137; assign rom_fixed_codetree[284]=10'd138; assign rom_fixed_codetree[285]=10'd139; assign rom_fixed_codetree[286]=10'd432; assign rom_fixed_codetree[287]=10'd433; assign rom_fixed_codetree[288]=10'd140; assign rom_fixed_codetree[289]=10'd141; assign rom_fixed_codetree[290]=10'd142; assign rom_fixed_codetree[291]=10'd143; assign rom_fixed_codetree[292]=10'd435; assign rom_fixed_codetree[293]=10'd483; assign rom_fixed_codetree[294]=10'd436; assign rom_fixed_codetree[295]=10'd452; assign rom_fixed_codetree[296]=10'd568; assign rom_fixed_codetree[297]=10'd437; assign rom_fixed_codetree[298]=10'd438; assign rom_fixed_codetree[299]=10'd445; assign rom_fixed_codetree[300]=10'd439; assign rom_fixed_codetree[301]=10'd442; assign rom_fixed_codetree[302]=10'd440; assign rom_fixed_codetree[303]=10'd441; assign rom_fixed_codetree[304]=10'd144; assign rom_fixed_codetree[305]=10'd145; assign rom_fixed_codetree[306]=10'd146; assign rom_fixed_codetree[307]=10'd147; assign rom_fixed_codetree[308]=10'd443; assign rom_fixed_codetree[309]=10'd444; assign rom_fixed_codetree[310]=10'd148; assign rom_fixed_codetree[311]=10'd149; assign rom_fixed_codetree[312]=10'd150; assign rom_fixed_codetree[313]=10'd151; assign rom_fixed_codetree[314]=10'd446; assign rom_fixed_codetree[315]=10'd449; assign rom_fixed_codetree[316]=10'd447; assign rom_fixed_codetree[317]=10'd448; assign rom_fixed_codetree[318]=10'd152; assign rom_fixed_codetree[319]=10'd153; assign rom_fixed_codetree[320]=10'd154; assign rom_fixed_codetree[321]=10'd155; assign rom_fixed_codetree[322]=10'd450; assign rom_fixed_codetree[323]=10'd451; assign rom_fixed_codetree[324]=10'd156; assign rom_fixed_codetree[325]=10'd157; assign rom_fixed_codetree[326]=10'd158; assign rom_fixed_codetree[327]=10'd159; assign rom_fixed_codetree[328]=10'd453; assign rom_fixed_codetree[329]=10'd468; assign rom_fixed_codetree[330]=10'd454; assign rom_fixed_codetree[331]=10'd461; assign rom_fixed_codetree[332]=10'd455; assign rom_fixed_codetree[333]=10'd458; assign rom_fixed_codetree[334]=10'd456; assign rom_fixed_codetree[335]=10'd457; assign rom_fixed_codetree[336]=10'd160; assign rom_fixed_codetree[337]=10'd161; assign rom_fixed_codetree[338]=10'd162; assign rom_fixed_codetree[339]=10'd163; assign rom_fixed_codetree[340]=10'd459; assign rom_fixed_codetree[341]=10'd460; assign rom_fixed_codetree[342]=10'd164; assign rom_fixed_codetree[343]=10'd165; assign rom_fixed_codetree[344]=10'd166; assign rom_fixed_codetree[345]=10'd167; assign rom_fixed_codetree[346]=10'd462; assign rom_fixed_codetree[347]=10'd465; assign rom_fixed_codetree[348]=10'd463; assign rom_fixed_codetree[349]=10'd464; assign rom_fixed_codetree[350]=10'd168; assign rom_fixed_codetree[351]=10'd169; assign rom_fixed_codetree[352]=10'd170; assign rom_fixed_codetree[353]=10'd171; assign rom_fixed_codetree[354]=10'd466; assign rom_fixed_codetree[355]=10'd467; assign rom_fixed_codetree[356]=10'd172; assign rom_fixed_codetree[357]=10'd173; assign rom_fixed_codetree[358]=10'd174; assign rom_fixed_codetree[359]=10'd175; assign rom_fixed_codetree[360]=10'd469; assign rom_fixed_codetree[361]=10'd476; assign rom_fixed_codetree[362]=10'd470; assign rom_fixed_codetree[363]=10'd473; assign rom_fixed_codetree[364]=10'd471; assign rom_fixed_codetree[365]=10'd472; assign rom_fixed_codetree[366]=10'd176; assign rom_fixed_codetree[367]=10'd177; assign rom_fixed_codetree[368]=10'd178; assign rom_fixed_codetree[369]=10'd179; assign rom_fixed_codetree[370]=10'd474; assign rom_fixed_codetree[371]=10'd475; assign rom_fixed_codetree[372]=10'd180; assign rom_fixed_codetree[373]=10'd181; assign rom_fixed_codetree[374]=10'd182; assign rom_fixed_codetree[375]=10'd183; assign rom_fixed_codetree[376]=10'd477; assign rom_fixed_codetree[377]=10'd480; assign rom_fixed_codetree[378]=10'd478; assign rom_fixed_codetree[379]=10'd479; assign rom_fixed_codetree[380]=10'd184; assign rom_fixed_codetree[381]=10'd185; assign rom_fixed_codetree[382]=10'd186; assign rom_fixed_codetree[383]=10'd187; assign rom_fixed_codetree[384]=10'd481; assign rom_fixed_codetree[385]=10'd482; assign rom_fixed_codetree[386]=10'd188; assign rom_fixed_codetree[387]=10'd189; assign rom_fixed_codetree[388]=10'd190; assign rom_fixed_codetree[389]=10'd191; assign rom_fixed_codetree[390]=10'd484; assign rom_fixed_codetree[391]=10'd515; assign rom_fixed_codetree[392]=10'd485; assign rom_fixed_codetree[393]=10'd500; assign rom_fixed_codetree[394]=10'd486; assign rom_fixed_codetree[395]=10'd493; assign rom_fixed_codetree[396]=10'd487; assign rom_fixed_codetree[397]=10'd490; assign rom_fixed_codetree[398]=10'd488; assign rom_fixed_codetree[399]=10'd489; assign rom_fixed_codetree[400]=10'd192; assign rom_fixed_codetree[401]=10'd193; assign rom_fixed_codetree[402]=10'd194; assign rom_fixed_codetree[403]=10'd195; assign rom_fixed_codetree[404]=10'd491; assign rom_fixed_codetree[405]=10'd492; assign rom_fixed_codetree[406]=10'd196; assign rom_fixed_codetree[407]=10'd197; assign rom_fixed_codetree[408]=10'd198; assign rom_fixed_codetree[409]=10'd199; assign rom_fixed_codetree[410]=10'd494; assign rom_fixed_codetree[411]=10'd497; assign rom_fixed_codetree[412]=10'd495; assign rom_fixed_codetree[413]=10'd496; assign rom_fixed_codetree[414]=10'd200; assign rom_fixed_codetree[415]=10'd201; assign rom_fixed_codetree[416]=10'd202; assign rom_fixed_codetree[417]=10'd203; assign rom_fixed_codetree[418]=10'd498; assign rom_fixed_codetree[419]=10'd499; assign rom_fixed_codetree[420]=10'd204; assign rom_fixed_codetree[421]=10'd205; assign rom_fixed_codetree[422]=10'd206; assign rom_fixed_codetree[423]=10'd207; assign rom_fixed_codetree[424]=10'd501; assign rom_fixed_codetree[425]=10'd508; assign rom_fixed_codetree[426]=10'd502; assign rom_fixed_codetree[427]=10'd505; assign rom_fixed_codetree[428]=10'd503; assign rom_fixed_codetree[429]=10'd504; assign rom_fixed_codetree[430]=10'd208; assign rom_fixed_codetree[431]=10'd209; assign rom_fixed_codetree[432]=10'd210; assign rom_fixed_codetree[433]=10'd211; assign rom_fixed_codetree[434]=10'd506; assign rom_fixed_codetree[435]=10'd507; assign rom_fixed_codetree[436]=10'd212; assign rom_fixed_codetree[437]=10'd213; assign rom_fixed_codetree[438]=10'd214; assign rom_fixed_codetree[439]=10'd215; assign rom_fixed_codetree[440]=10'd509; assign rom_fixed_codetree[441]=10'd512; assign rom_fixed_codetree[442]=10'd510; assign rom_fixed_codetree[443]=10'd511; assign rom_fixed_codetree[444]=10'd216; assign rom_fixed_codetree[445]=10'd217; assign rom_fixed_codetree[446]=10'd218; assign rom_fixed_codetree[447]=10'd219; assign rom_fixed_codetree[448]=10'd513; assign rom_fixed_codetree[449]=10'd514; assign rom_fixed_codetree[450]=10'd220; assign rom_fixed_codetree[451]=10'd221; assign rom_fixed_codetree[452]=10'd222; assign rom_fixed_codetree[453]=10'd223; assign rom_fixed_codetree[454]=10'd516; assign rom_fixed_codetree[455]=10'd531; assign rom_fixed_codetree[456]=10'd517; assign rom_fixed_codetree[457]=10'd524; assign rom_fixed_codetree[458]=10'd518; assign rom_fixed_codetree[459]=10'd521; assign rom_fixed_codetree[460]=10'd519; assign rom_fixed_codetree[461]=10'd520; assign rom_fixed_codetree[462]=10'd224; assign rom_fixed_codetree[463]=10'd225; assign rom_fixed_codetree[464]=10'd226; assign rom_fixed_codetree[465]=10'd227; assign rom_fixed_codetree[466]=10'd522; assign rom_fixed_codetree[467]=10'd523; assign rom_fixed_codetree[468]=10'd228; assign rom_fixed_codetree[469]=10'd229; assign rom_fixed_codetree[470]=10'd230; assign rom_fixed_codetree[471]=10'd231; assign rom_fixed_codetree[472]=10'd525; assign rom_fixed_codetree[473]=10'd528; assign rom_fixed_codetree[474]=10'd526; assign rom_fixed_codetree[475]=10'd527; assign rom_fixed_codetree[476]=10'd232; assign rom_fixed_codetree[477]=10'd233; assign rom_fixed_codetree[478]=10'd234; assign rom_fixed_codetree[479]=10'd235; assign rom_fixed_codetree[480]=10'd529; assign rom_fixed_codetree[481]=10'd530; assign rom_fixed_codetree[482]=10'd236; assign rom_fixed_codetree[483]=10'd237; assign rom_fixed_codetree[484]=10'd238; assign rom_fixed_codetree[485]=10'd239; assign rom_fixed_codetree[486]=10'd532; assign rom_fixed_codetree[487]=10'd539; assign rom_fixed_codetree[488]=10'd533; assign rom_fixed_codetree[489]=10'd536; assign rom_fixed_codetree[490]=10'd534; assign rom_fixed_codetree[491]=10'd535; assign rom_fixed_codetree[492]=10'd240; assign rom_fixed_codetree[493]=10'd241; assign rom_fixed_codetree[494]=10'd242; assign rom_fixed_codetree[495]=10'd243; assign rom_fixed_codetree[496]=10'd537; assign rom_fixed_codetree[497]=10'd538; assign rom_fixed_codetree[498]=10'd244; assign rom_fixed_codetree[499]=10'd245; assign rom_fixed_codetree[500]=10'd246; assign rom_fixed_codetree[501]=10'd247; assign rom_fixed_codetree[502]=10'd540; assign rom_fixed_codetree[503]=10'd543; assign rom_fixed_codetree[504]=10'd541; assign rom_fixed_codetree[505]=10'd542; assign rom_fixed_codetree[506]=10'd248; assign rom_fixed_codetree[507]=10'd249; assign rom_fixed_codetree[508]=10'd250; assign rom_fixed_codetree[509]=10'd251; assign rom_fixed_codetree[510]=10'd544; assign rom_fixed_codetree[511]=10'd545; assign rom_fixed_codetree[512]=10'd252; assign rom_fixed_codetree[513]=10'd253; assign rom_fixed_codetree[514]=10'd254; assign rom_fixed_codetree[515]=10'd255; assign rom_fixed_codetree[516]=10'd547; assign rom_fixed_codetree[517]=10'd554; assign rom_fixed_codetree[518]=10'd548; assign rom_fixed_codetree[519]=10'd551; assign rom_fixed_codetree[520]=10'd549; assign rom_fixed_codetree[521]=10'd550; assign rom_fixed_codetree[522]=10'd256; assign rom_fixed_codetree[523]=10'd257; assign rom_fixed_codetree[524]=10'd258; assign rom_fixed_codetree[525]=10'd259; assign rom_fixed_codetree[526]=10'd552; assign rom_fixed_codetree[527]=10'd553; assign rom_fixed_codetree[528]=10'd260; assign rom_fixed_codetree[529]=10'd261; assign rom_fixed_codetree[530]=10'd262; assign rom_fixed_codetree[531]=10'd263; assign rom_fixed_codetree[532]=10'd555; assign rom_fixed_codetree[533]=10'd558; assign rom_fixed_codetree[534]=10'd556; assign rom_fixed_codetree[535]=10'd557; assign rom_fixed_codetree[536]=10'd264; assign rom_fixed_codetree[537]=10'd265; assign rom_fixed_codetree[538]=10'd266; assign rom_fixed_codetree[539]=10'd267; assign rom_fixed_codetree[540]=10'd559; assign rom_fixed_codetree[541]=10'd560; assign rom_fixed_codetree[542]=10'd268; assign rom_fixed_codetree[543]=10'd269; assign rom_fixed_codetree[544]=10'd270; assign rom_fixed_codetree[545]=10'd271; assign rom_fixed_codetree[546]=10'd562; assign rom_fixed_codetree[547]=10'd565; assign rom_fixed_codetree[548]=10'd563; assign rom_fixed_codetree[549]=10'd564; assign rom_fixed_codetree[550]=10'd272; assign rom_fixed_codetree[551]=10'd273; assign rom_fixed_codetree[552]=10'd274; assign rom_fixed_codetree[553]=10'd275; assign rom_fixed_codetree[554]=10'd566; assign rom_fixed_codetree[555]=10'd567; assign rom_fixed_codetree[556]=10'd276; assign rom_fixed_codetree[557]=10'd277; assign rom_fixed_codetree[558]=10'd278; assign rom_fixed_codetree[559]=10'd279; assign rom_fixed_codetree[560]=10'd569; assign rom_fixed_codetree[561]=10'd572; assign rom_fixed_codetree[562]=10'd570; assign rom_fixed_codetree[563]=10'd571; assign rom_fixed_codetree[564]=10'd280; assign rom_fixed_codetree[565]=10'd281; assign rom_fixed_codetree[566]=10'd282; assign rom_fixed_codetree[567]=10'd283; assign rom_fixed_codetree[568]=10'd573; assign rom_fixed_codetree[569]=10'd574; assign rom_fixed_codetree[570]=10'd284; assign rom_fixed_codetree[571]=10'd285; assign rom_fixed_codetree[572]=10'd286; assign rom_fixed_codetree[573]=10'd287; assign rom_fixed_codetree[574]=10'd0; assign rom_fixed_codetree[575]=10'd0; assign rom_fixed_codetree[576]=10'd0; assign rom_fixed_codetree[577]=10'd0; assign rom_fixed_codetree[578]=10'd0; assign rom_fixed_codetree[579]=10'd0; assign rom_fixed_codetree[580]=10'd0; assign rom_fixed_codetree[581]=10'd0; assign rom_fixed_codetree[582]=10'd0; assign rom_fixed_codetree[583]=10'd0; assign rom_fixed_codetree[584]=10'd0; assign rom_fixed_codetree[585]=10'd0; assign rom_fixed_codetree[586]=10'd0; assign rom_fixed_codetree[587]=10'd0; assign rom_fixed_codetree[588]=10'd0; assign rom_fixed_codetree[589]=10'd0; assign rom_fixed_codetree[590]=10'd0; assign rom_fixed_codetree[591]=10'd0; assign rom_fixed_codetree[592]=10'd0; assign rom_fixed_codetree[593]=10'd0; assign rom_fixed_codetree[594]=10'd0; assign rom_fixed_codetree[595]=10'd0; assign rom_fixed_codetree[596]=10'd0; assign rom_fixed_codetree[597]=10'd0; assign rom_fixed_codetree[598]=10'd0; assign rom_fixed_codetree[599]=10'd0; assign rom_fixed_codetree[600]=10'd0; assign rom_fixed_codetree[601]=10'd0; assign rom_fixed_codetree[602]=10'd0; assign rom_fixed_codetree[603]=10'd0; assign rom_fixed_codetree[604]=10'd0; assign rom_fixed_codetree[605]=10'd0; assign rom_fixed_codetree[606]=10'd0; assign rom_fixed_codetree[607]=10'd0; assign rom_fixed_codetree[608]=10'd0; assign rom_fixed_codetree[609]=10'd0; assign rom_fixed_codetree[610]=10'd0; assign rom_fixed_codetree[611]=10'd0; assign rom_fixed_codetree[612]=10'd0; assign rom_fixed_codetree[613]=10'd0; assign rom_fixed_codetree[614]=10'd0; assign rom_fixed_codetree[615]=10'd0; assign rom_fixed_codetree[616]=10'd0; assign rom_fixed_codetree[617]=10'd0; assign rom_fixed_codetree[618]=10'd0; assign rom_fixed_codetree[619]=10'd0; assign rom_fixed_codetree[620]=10'd0; assign rom_fixed_codetree[621]=10'd0; assign rom_fixed_codetree[622]=10'd0; assign rom_fixed_codetree[623]=10'd0; assign rom_fixed_codetree[624]=10'd0; assign rom_fixed_codetree[625]=10'd0; assign rom_fixed_codetree[626]=10'd0; assign rom_fixed_codetree[627]=10'd0; assign rom_fixed_codetree[628]=10'd0; assign rom_fixed_codetree[629]=10'd0; assign rom_fixed_codetree[630]=10'd0; assign rom_fixed_codetree[631]=10'd0; assign rom_fixed_codetree[632]=10'd0; assign rom_fixed_codetree[633]=10'd0; assign rom_fixed_codetree[634]=10'd0; assign rom_fixed_codetree[635]=10'd0; assign rom_fixed_codetree[636]=10'd0; assign rom_fixed_codetree[637]=10'd0; assign rom_fixed_codetree[638]=10'd0; assign rom_fixed_codetree[639]=10'd0; assign rom_fixed_codetree[640]=10'd0; assign rom_fixed_codetree[641]=10'd0; assign rom_fixed_codetree[642]=10'd0; assign rom_fixed_codetree[643]=10'd0; assign rom_fixed_codetree[644]=10'd0; assign rom_fixed_codetree[645]=10'd0; assign rom_fixed_codetree[646]=10'd0; assign rom_fixed_codetree[647]=10'd0; assign rom_fixed_codetree[648]=10'd0; assign rom_fixed_codetree[649]=10'd0; assign rom_fixed_codetree[650]=10'd0; assign rom_fixed_codetree[651]=10'd0; assign rom_fixed_codetree[652]=10'd0; assign rom_fixed_codetree[653]=10'd0; assign rom_fixed_codetree[654]=10'd0; assign rom_fixed_codetree[655]=10'd0; assign rom_fixed_codetree[656]=10'd0; assign rom_fixed_codetree[657]=10'd0; assign rom_fixed_codetree[658]=10'd0; assign rom_fixed_codetree[659]=10'd0; assign rom_fixed_codetree[660]=10'd0; assign rom_fixed_codetree[661]=10'd0; assign rom_fixed_codetree[662]=10'd0; assign rom_fixed_codetree[663]=10'd0; assign rom_fixed_codetree[664]=10'd0; assign rom_fixed_codetree[665]=10'd0; assign rom_fixed_codetree[666]=10'd0; assign rom_fixed_codetree[667]=10'd0; assign rom_fixed_codetree[668]=10'd0; assign rom_fixed_codetree[669]=10'd0; assign rom_fixed_codetree[670]=10'd0; assign rom_fixed_codetree[671]=10'd0; assign rom_fixed_codetree[672]=10'd0; assign rom_fixed_codetree[673]=10'd0; assign rom_fixed_codetree[674]=10'd0; assign rom_fixed_codetree[675]=10'd0; assign rom_fixed_codetree[676]=10'd0; assign rom_fixed_codetree[677]=10'd0; assign rom_fixed_codetree[678]=10'd0; assign rom_fixed_codetree[679]=10'd0; assign rom_fixed_codetree[680]=10'd0; assign rom_fixed_codetree[681]=10'd0; assign rom_fixed_codetree[682]=10'd0; assign rom_fixed_codetree[683]=10'd0; assign rom_fixed_codetree[684]=10'd0; assign rom_fixed_codetree[685]=10'd0; assign rom_fixed_codetree[686]=10'd0; assign rom_fixed_codetree[687]=10'd0; assign rom_fixed_codetree[688]=10'd0; assign rom_fixed_codetree[689]=10'd0; assign rom_fixed_codetree[690]=10'd0; assign rom_fixed_codetree[691]=10'd0; assign rom_fixed_codetree[692]=10'd0; assign rom_fixed_codetree[693]=10'd0; assign rom_fixed_codetree[694]=10'd0; assign rom_fixed_codetree[695]=10'd0; assign rom_fixed_codetree[696]=10'd0; assign rom_fixed_codetree[697]=10'd0; assign rom_fixed_codetree[698]=10'd0; assign rom_fixed_codetree[699]=10'd0; assign rom_fixed_codetree[700]=10'd0; assign rom_fixed_codetree[701]=10'd0; assign rom_fixed_codetree[702]=10'd0; assign rom_fixed_codetree[703]=10'd0; assign rom_fixed_codetree[704]=10'd0; assign rom_fixed_codetree[705]=10'd0; assign rom_fixed_codetree[706]=10'd0; assign rom_fixed_codetree[707]=10'd0; assign rom_fixed_codetree[708]=10'd0; assign rom_fixed_codetree[709]=10'd0; assign rom_fixed_codetree[710]=10'd0; assign rom_fixed_codetree[711]=10'd0; assign rom_fixed_codetree[712]=10'd0; assign rom_fixed_codetree[713]=10'd0; assign rom_fixed_codetree[714]=10'd0; assign rom_fixed_codetree[715]=10'd0; assign rom_fixed_codetree[716]=10'd0; assign rom_fixed_codetree[717]=10'd0; assign rom_fixed_codetree[718]=10'd0; assign rom_fixed_codetree[719]=10'd0; assign rom_fixed_codetree[720]=10'd0; assign rom_fixed_codetree[721]=10'd0; assign rom_fixed_codetree[722]=10'd0; assign rom_fixed_codetree[723]=10'd0; assign rom_fixed_codetree[724]=10'd0; assign rom_fixed_codetree[725]=10'd0; assign rom_fixed_codetree[726]=10'd0; assign rom_fixed_codetree[727]=10'd0; assign rom_fixed_codetree[728]=10'd0; assign rom_fixed_codetree[729]=10'd0; assign rom_fixed_codetree[730]=10'd0; assign rom_fixed_codetree[731]=10'd0; assign rom_fixed_codetree[732]=10'd0; assign rom_fixed_codetree[733]=10'd0; assign rom_fixed_codetree[734]=10'd0; assign rom_fixed_codetree[735]=10'd0; assign rom_fixed_codetree[736]=10'd0; assign rom_fixed_codetree[737]=10'd0; assign rom_fixed_codetree[738]=10'd0; assign rom_fixed_codetree[739]=10'd0; assign rom_fixed_codetree[740]=10'd0; assign rom_fixed_codetree[741]=10'd0; assign rom_fixed_codetree[742]=10'd0; assign rom_fixed_codetree[743]=10'd0; assign rom_fixed_codetree[744]=10'd0; assign rom_fixed_codetree[745]=10'd0; assign rom_fixed_codetree[746]=10'd0; assign rom_fixed_codetree[747]=10'd0; assign rom_fixed_codetree[748]=10'd0; assign rom_fixed_codetree[749]=10'd0; assign rom_fixed_codetree[750]=10'd0; assign rom_fixed_codetree[751]=10'd0; assign rom_fixed_codetree[752]=10'd0; assign rom_fixed_codetree[753]=10'd0; assign rom_fixed_codetree[754]=10'd0; assign rom_fixed_codetree[755]=10'd0; assign rom_fixed_codetree[756]=10'd0; assign rom_fixed_codetree[757]=10'd0; assign rom_fixed_codetree[758]=10'd0; assign rom_fixed_codetree[759]=10'd0; assign rom_fixed_codetree[760]=10'd0; assign rom_fixed_codetree[761]=10'd0; assign rom_fixed_codetree[762]=10'd0; assign rom_fixed_codetree[763]=10'd0; assign rom_fixed_codetree[764]=10'd0; assign rom_fixed_codetree[765]=10'd0; assign rom_fixed_codetree[766]=10'd0; assign rom_fixed_codetree[767]=10'd0; assign rom_fixed_codetree[768]=10'd0; assign rom_fixed_codetree[769]=10'd0; assign rom_fixed_codetree[770]=10'd0; assign rom_fixed_codetree[771]=10'd0; assign rom_fixed_codetree[772]=10'd0; assign rom_fixed_codetree[773]=10'd0; assign rom_fixed_codetree[774]=10'd0; assign rom_fixed_codetree[775]=10'd0; assign rom_fixed_codetree[776]=10'd0; assign rom_fixed_codetree[777]=10'd0; assign rom_fixed_codetree[778]=10'd0; assign rom_fixed_codetree[779]=10'd0; assign rom_fixed_codetree[780]=10'd0; assign rom_fixed_codetree[781]=10'd0; assign rom_fixed_codetree[782]=10'd0; assign rom_fixed_codetree[783]=10'd0; assign rom_fixed_codetree[784]=10'd0; assign rom_fixed_codetree[785]=10'd0; assign rom_fixed_codetree[786]=10'd0; assign rom_fixed_codetree[787]=10'd0; assign rom_fixed_codetree[788]=10'd0; assign rom_fixed_codetree[789]=10'd0; assign rom_fixed_codetree[790]=10'd0; assign rom_fixed_codetree[791]=10'd0; assign rom_fixed_codetree[792]=10'd0; assign rom_fixed_codetree[793]=10'd0; assign rom_fixed_codetree[794]=10'd0; assign rom_fixed_codetree[795]=10'd0; assign rom_fixed_codetree[796]=10'd0; assign rom_fixed_codetree[797]=10'd0; assign rom_fixed_codetree[798]=10'd0; assign rom_fixed_codetree[799]=10'd0; assign rom_fixed_codetree[800]=10'd0; assign rom_fixed_codetree[801]=10'd0; assign rom_fixed_codetree[802]=10'd0; assign rom_fixed_codetree[803]=10'd0; assign rom_fixed_codetree[804]=10'd0; assign rom_fixed_codetree[805]=10'd0; assign rom_fixed_codetree[806]=10'd0; assign rom_fixed_codetree[807]=10'd0; assign rom_fixed_codetree[808]=10'd0; assign rom_fixed_codetree[809]=10'd0; assign rom_fixed_codetree[810]=10'd0; assign rom_fixed_codetree[811]=10'd0; assign rom_fixed_codetree[812]=10'd0; assign rom_fixed_codetree[813]=10'd0; assign rom_fixed_codetree[814]=10'd0; assign rom_fixed_codetree[815]=10'd0; assign rom_fixed_codetree[816]=10'd0; assign rom_fixed_codetree[817]=10'd0; assign rom_fixed_codetree[818]=10'd0; assign rom_fixed_codetree[819]=10'd0; assign rom_fixed_codetree[820]=10'd0; assign rom_fixed_codetree[821]=10'd0; assign rom_fixed_codetree[822]=10'd0; assign rom_fixed_codetree[823]=10'd0; assign rom_fixed_codetree[824]=10'd0; assign rom_fixed_codetree[825]=10'd0; assign rom_fixed_codetree[826]=10'd0; assign rom_fixed_codetree[827]=10'd0; assign rom_fixed_codetree[828]=10'd0; assign rom_fixed_codetree[829]=10'd0; assign rom_fixed_codetree[830]=10'd0; assign rom_fixed_codetree[831]=10'd0; assign rom_fixed_codetree[832]=10'd0; assign rom_fixed_codetree[833]=10'd0; assign rom_fixed_codetree[834]=10'd0; assign rom_fixed_codetree[835]=10'd0; assign rom_fixed_codetree[836]=10'd0; assign rom_fixed_codetree[837]=10'd0; assign rom_fixed_codetree[838]=10'd0; assign rom_fixed_codetree[839]=10'd0; assign rom_fixed_codetree[840]=10'd0; assign rom_fixed_codetree[841]=10'd0; assign rom_fixed_codetree[842]=10'd0; assign rom_fixed_codetree[843]=10'd0; assign rom_fixed_codetree[844]=10'd0; assign rom_fixed_codetree[845]=10'd0; assign rom_fixed_codetree[846]=10'd0; assign rom_fixed_codetree[847]=10'd0; assign rom_fixed_codetree[848]=10'd0; assign rom_fixed_codetree[849]=10'd0; assign rom_fixed_codetree[850]=10'd0; assign rom_fixed_codetree[851]=10'd0; assign rom_fixed_codetree[852]=10'd0; assign rom_fixed_codetree[853]=10'd0; assign rom_fixed_codetree[854]=10'd0; assign rom_fixed_codetree[855]=10'd0; assign rom_fixed_codetree[856]=10'd0; assign rom_fixed_codetree[857]=10'd0; assign rom_fixed_codetree[858]=10'd0; assign rom_fixed_codetree[859]=10'd0; assign rom_fixed_codetree[860]=10'd0; assign rom_fixed_codetree[861]=10'd0; assign rom_fixed_codetree[862]=10'd0; assign rom_fixed_codetree[863]=10'd0; assign rom_fixed_codetree[864]=10'd0; assign rom_fixed_codetree[865]=10'd0; assign rom_fixed_codetree[866]=10'd0; assign rom_fixed_codetree[867]=10'd0; assign rom_fixed_codetree[868]=10'd0; assign rom_fixed_codetree[869]=10'd0; assign rom_fixed_codetree[870]=10'd0; assign rom_fixed_codetree[871]=10'd0; assign rom_fixed_codetree[872]=10'd0; assign rom_fixed_codetree[873]=10'd0; assign rom_fixed_codetree[874]=10'd0; assign rom_fixed_codetree[875]=10'd0; assign rom_fixed_codetree[876]=10'd0; assign rom_fixed_codetree[877]=10'd0; assign rom_fixed_codetree[878]=10'd0; assign rom_fixed_codetree[879]=10'd0; assign rom_fixed_codetree[880]=10'd0; assign rom_fixed_codetree[881]=10'd0; assign rom_fixed_codetree[882]=10'd0; assign rom_fixed_codetree[883]=10'd0; assign rom_fixed_codetree[884]=10'd0; assign rom_fixed_codetree[885]=10'd0; assign rom_fixed_codetree[886]=10'd0; assign rom_fixed_codetree[887]=10'd0; assign rom_fixed_codetree[888]=10'd0; assign rom_fixed_codetree[889]=10'd0; assign rom_fixed_codetree[890]=10'd0; assign rom_fixed_codetree[891]=10'd0; assign rom_fixed_codetree[892]=10'd0; assign rom_fixed_codetree[893]=10'd0; assign rom_fixed_codetree[894]=10'd0; assign rom_fixed_codetree[895]=10'd0; assign rom_fixed_codetree[896]=10'd0; assign rom_fixed_codetree[897]=10'd0; assign rom_fixed_codetree[898]=10'd0; assign rom_fixed_codetree[899]=10'd0; assign rom_fixed_codetree[900]=10'd0; assign rom_fixed_codetree[901]=10'd0; assign rom_fixed_codetree[902]=10'd0; assign rom_fixed_codetree[903]=10'd0; assign rom_fixed_codetree[904]=10'd0; assign rom_fixed_codetree[905]=10'd0; assign rom_fixed_codetree[906]=10'd0; assign rom_fixed_codetree[907]=10'd0; assign rom_fixed_codetree[908]=10'd0; assign rom_fixed_codetree[909]=10'd0; assign rom_fixed_codetree[910]=10'd0; assign rom_fixed_codetree[911]=10'd0; assign rom_fixed_codetree[912]=10'd0; assign rom_fixed_codetree[913]=10'd0; assign rom_fixed_codetree[914]=10'd0; assign rom_fixed_codetree[915]=10'd0; assign rom_fixed_codetree[916]=10'd0; assign rom_fixed_codetree[917]=10'd0; assign rom_fixed_codetree[918]=10'd0; assign rom_fixed_codetree[919]=10'd0; assign rom_fixed_codetree[920]=10'd0; assign rom_fixed_codetree[921]=10'd0; assign rom_fixed_codetree[922]=10'd0; assign rom_fixed_codetree[923]=10'd0; assign rom_fixed_codetree[924]=10'd0; assign rom_fixed_codetree[925]=10'd0; assign rom_fixed_codetree[926]=10'd0; assign rom_fixed_codetree[927]=10'd0; assign rom_fixed_codetree[928]=10'd0; assign rom_fixed_codetree[929]=10'd0; assign rom_fixed_codetree[930]=10'd0; assign rom_fixed_codetree[931]=10'd0; assign rom_fixed_codetree[932]=10'd0; assign rom_fixed_codetree[933]=10'd0; assign rom_fixed_codetree[934]=10'd0; assign rom_fixed_codetree[935]=10'd0; assign rom_fixed_codetree[936]=10'd0; assign rom_fixed_codetree[937]=10'd0; assign rom_fixed_codetree[938]=10'd0; assign rom_fixed_codetree[939]=10'd0; assign rom_fixed_codetree[940]=10'd0; assign rom_fixed_codetree[941]=10'd0; assign rom_fixed_codetree[942]=10'd0; assign rom_fixed_codetree[943]=10'd0; assign rom_fixed_codetree[944]=10'd0; assign rom_fixed_codetree[945]=10'd0; assign rom_fixed_codetree[946]=10'd0; assign rom_fixed_codetree[947]=10'd0; assign rom_fixed_codetree[948]=10'd0; assign rom_fixed_codetree[949]=10'd0; assign rom_fixed_codetree[950]=10'd0; assign rom_fixed_codetree[951]=10'd0; assign rom_fixed_codetree[952]=10'd0; assign rom_fixed_codetree[953]=10'd0; assign rom_fixed_codetree[954]=10'd0; assign rom_fixed_codetree[955]=10'd0; assign rom_fixed_codetree[956]=10'd0; assign rom_fixed_codetree[957]=10'd0; assign rom_fixed_codetree[958]=10'd0; assign rom_fixed_codetree[959]=10'd0; assign rom_fixed_codetree[960]=10'd0; assign rom_fixed_codetree[961]=10'd0; assign rom_fixed_codetree[962]=10'd0; assign rom_fixed_codetree[963]=10'd0; assign rom_fixed_codetree[964]=10'd0; assign rom_fixed_codetree[965]=10'd0; assign rom_fixed_codetree[966]=10'd0; assign rom_fixed_codetree[967]=10'd0; assign rom_fixed_codetree[968]=10'd0; assign rom_fixed_codetree[969]=10'd0; assign rom_fixed_codetree[970]=10'd0; assign rom_fixed_codetree[971]=10'd0; assign rom_fixed_codetree[972]=10'd0; assign rom_fixed_codetree[973]=10'd0; assign rom_fixed_codetree[974]=10'd0; assign rom_fixed_codetree[975]=10'd0; assign rom_fixed_codetree[976]=10'd0; assign rom_fixed_codetree[977]=10'd0; assign rom_fixed_codetree[978]=10'd0; assign rom_fixed_codetree[979]=10'd0; assign rom_fixed_codetree[980]=10'd0; assign rom_fixed_codetree[981]=10'd0; assign rom_fixed_codetree[982]=10'd0; assign rom_fixed_codetree[983]=10'd0; assign rom_fixed_codetree[984]=10'd0; assign rom_fixed_codetree[985]=10'd0; assign rom_fixed_codetree[986]=10'd0; assign rom_fixed_codetree[987]=10'd0; assign rom_fixed_codetree[988]=10'd0; assign rom_fixed_codetree[989]=10'd0; assign rom_fixed_codetree[990]=10'd0; assign rom_fixed_codetree[991]=10'd0; assign rom_fixed_codetree[992]=10'd0; assign rom_fixed_codetree[993]=10'd0; assign rom_fixed_codetree[994]=10'd0; assign rom_fixed_codetree[995]=10'd0; assign rom_fixed_codetree[996]=10'd0; assign rom_fixed_codetree[997]=10'd0; assign rom_fixed_codetree[998]=10'd0; assign rom_fixed_codetree[999]=10'd0; assign rom_fixed_codetree[1000]=10'd0; assign rom_fixed_codetree[1001]=10'd0; assign rom_fixed_codetree[1002]=10'd0; assign rom_fixed_codetree[1003]=10'd0; assign rom_fixed_codetree[1004]=10'd0; assign rom_fixed_codetree[1005]=10'd0; assign rom_fixed_codetree[1006]=10'd0; assign rom_fixed_codetree[1007]=10'd0; assign rom_fixed_codetree[1008]=10'd0; assign rom_fixed_codetree[1009]=10'd0; assign rom_fixed_codetree[1010]=10'd0; assign rom_fixed_codetree[1011]=10'd0; assign rom_fixed_codetree[1012]=10'd0; assign rom_fixed_codetree[1013]=10'd0; assign rom_fixed_codetree[1014]=10'd0; assign rom_fixed_codetree[1015]=10'd0; assign rom_fixed_codetree[1016]=10'd0; assign rom_fixed_codetree[1017]=10'd0; assign rom_fixed_codetree[1018]=10'd0; assign rom_fixed_codetree[1019]=10'd0; assign rom_fixed_codetree[1020]=10'd0; assign rom_fixed_codetree[1021]=10'd0; assign rom_fixed_codetree[1022]=10'd0; assign rom_fixed_codetree[1023]=10'd0;
always @ (posedge clk) codetree_rdata_fixed <= rom_fixed_codetree[codetree_raddr];


//--------------------------------------------------------------------------------------------------------------------
// codetree huffman decoder
//--------------------------------------------------------------------------------------------------------------------
huffman_decoder #(
    .NUMCODES  ( 288            ),
    .OUTWIDTH  ( 10             )
) codetree_decoder (
    .rstn      ( rstn           ),
    .clk       ( clk            ),
    .istart    ( istart         ),
    .ien       ( codetree_ien   ),
    .ibit      ( tbit           ),
    .oen       ( codetree_codeen),
    .ocode     ( codetree_code  ),
    .rdaddr    ( codetree_raddr ),
    .rddata    ( fixed_tree ? codetree_rdata_fixed : codetree_rdata )
);


//--------------------------------------------------------------------------------------------------------------------
// distree huffman builder
//--------------------------------------------------------------------------------------------------------------------
huffman_builder #(
    .NUMCODES  ( 32             ),
    .CODEBITS  ( 5              ),
    .BITLENGTH ( 15             ),
    .OUTWIDTH  ( 10             )
) distree_builder (
    .rstn      ( rstn           ),
    .clk       ( clk            ),
    .istart    ( istart         ),
    .wren      ( distree_wen    ),
    .wraddr    ( distree_waddr  ),
    .wrdata    ( distree_wdata[4:0] ),
    .run       ( tree_run       ),
    .done      ( distree_done   ),
    .rdaddr    ( distree_raddr  ),
    .rddata    ( distree_rdata  )
);


//--------------------------------------------------------------------------------------------------------------------
// distree_fixed
//--------------------------------------------------------------------------------------------------------------------
wire [9:0] rom_fixed_distree [0:63];
assign rom_fixed_distree[0]=10'd33; assign rom_fixed_distree[1]=10'd48; assign rom_fixed_distree[2]=10'd34; assign rom_fixed_distree[3]=10'd41; assign rom_fixed_distree[4]=10'd35; assign rom_fixed_distree[5]=10'd38; assign rom_fixed_distree[6]=10'd36; assign rom_fixed_distree[7]=10'd37; assign rom_fixed_distree[8]=10'd0; assign rom_fixed_distree[9]=10'd1; assign rom_fixed_distree[10]=10'd2; assign rom_fixed_distree[11]=10'd3; assign rom_fixed_distree[12]=10'd39; assign rom_fixed_distree[13]=10'd40; assign rom_fixed_distree[14]=10'd4; assign rom_fixed_distree[15]=10'd5; assign rom_fixed_distree[16]=10'd6; assign rom_fixed_distree[17]=10'd7; assign rom_fixed_distree[18]=10'd42; assign rom_fixed_distree[19]=10'd45; assign rom_fixed_distree[20]=10'd43; assign rom_fixed_distree[21]=10'd44; assign rom_fixed_distree[22]=10'd8; assign rom_fixed_distree[23]=10'd9; assign rom_fixed_distree[24]=10'd10; assign rom_fixed_distree[25]=10'd11; assign rom_fixed_distree[26]=10'd46; assign rom_fixed_distree[27]=10'd47; assign rom_fixed_distree[28]=10'd12; assign rom_fixed_distree[29]=10'd13; assign rom_fixed_distree[30]=10'd14; assign rom_fixed_distree[31]=10'd15; assign rom_fixed_distree[32]=10'd49; assign rom_fixed_distree[33]=10'd56; assign rom_fixed_distree[34]=10'd50; assign rom_fixed_distree[35]=10'd53; assign rom_fixed_distree[36]=10'd51; assign rom_fixed_distree[37]=10'd52; assign rom_fixed_distree[38]=10'd16; assign rom_fixed_distree[39]=10'd17; assign rom_fixed_distree[40]=10'd18; assign rom_fixed_distree[41]=10'd19; assign rom_fixed_distree[42]=10'd54; assign rom_fixed_distree[43]=10'd55; assign rom_fixed_distree[44]=10'd20; assign rom_fixed_distree[45]=10'd21; assign rom_fixed_distree[46]=10'd22; assign rom_fixed_distree[47]=10'd23; assign rom_fixed_distree[48]=10'd57; assign rom_fixed_distree[49]=10'd60; assign rom_fixed_distree[50]=10'd58; assign rom_fixed_distree[51]=10'd59; assign rom_fixed_distree[52]=10'd24; assign rom_fixed_distree[53]=10'd25; assign rom_fixed_distree[54]=10'd26; assign rom_fixed_distree[55]=10'd27; assign rom_fixed_distree[56]=10'd61; assign rom_fixed_distree[57]=10'd62; assign rom_fixed_distree[58]=10'd28; assign rom_fixed_distree[59]=10'd29; assign rom_fixed_distree[60]=10'd30; assign rom_fixed_distree[61]=10'd31; assign rom_fixed_distree[62]=10'd0; assign rom_fixed_distree[63]=10'd0;
always @ (posedge clk) distree_rdata_fixed <= rom_fixed_distree[distree_raddr];


//--------------------------------------------------------------------------------------------------------------------
// distree huffman decoder
//--------------------------------------------------------------------------------------------------------------------
huffman_decoder #(
    .NUMCODES  ( 32             ),
    .OUTWIDTH  ( 10             )
) distree_decoder (
    .rstn      ( rstn           ),
    .clk       ( clk            ),
    .istart    ( istart         ),
    .ien       ( distree_ien    ),
    .ibit      ( tbit           ),
    .oen       ( distree_codeen ),
    .ocode     ( distree_code   ),
    .rdaddr    ( distree_raddr  ),
    .rddata    ( fixed_tree ? distree_rdata_fixed : distree_rdata  )
);


//--------------------------------------------------------------------------------------------------------------------
// repeat buffer
//--------------------------------------------------------------------------------------------------------------------
parameter [15:0]  REPEAT_BUFFER_MAXLEN = 16'd33792;
reg  [15:0]  wptr = 0;
reg  [15:0]  rptr = 0;
reg  [15:0]  sptr = 0;
reg  [15:0]  eptr = 0;
wire [15:0]  sptrw = (wptr<distance) ? wptr + REPEAT_BUFFER_MAXLEN - distance : wptr - distance;
wire [15:0]  eptrw = (wptr<16'd1) ? wptr + REPEAT_BUFFER_MAXLEN - 16'd1 : wptr - 16'd1;

reg        repeat_valid = 1'b0;
reg  [7:0] repeat_data;

assign  huffman_ovalid = symbol_valid | repeat_valid;
assign  huffman_obyte  = repeat_valid ? repeat_data : symbol;

always @ (posedge clk or negedge rstn)
    if(~rstn)
        wptr <= 0;
    else begin
        if(istart)
            wptr <= 0;
        else if(huffman_ovalid)
            wptr <= (wptr<(REPEAT_BUFFER_MAXLEN-16'd1)) ? wptr+16'd1 : 16'd0;
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        rptr <= 0;
        sptr <= 0;
        eptr <= 0;
    end else begin
        if(istart) begin
            rptr <= 0;
            sptr <= 0;
            eptr <= 0;
        end else if(srepeat) begin
            rptr <= sptrw;
            sptr <= sptrw;
            eptr <= eptrw;
        end else if(irepeat) begin
            if(rptr!=eptr)
                rptr <= (rptr<(REPEAT_BUFFER_MAXLEN-16'd1)) ? rptr+16'd1 : 16'd0;
            else
                rptr <= sptr;
        end
    end

always @ (posedge clk or negedge rstn)
    if(~rstn)
        repeat_valid <= 1'b0;
    else
        repeat_valid <= istart ? 1'b0 : irepeat;

reg [7:0] mem_repeat_buffer [0 : REPEAT_BUFFER_MAXLEN-1];

always @ (posedge clk)
    if(huffman_ovalid) mem_repeat_buffer[wptr] <= huffman_obyte;

always @ (posedge clk)
    repeat_data <= mem_repeat_buffer[rptr];





//-----------------------------------------------------------------------------------------------------------------------
// unfilter
//-----------------------------------------------------------------------------------------------------------------------
function  [7:0] paeth;
    input [7:0] a, b, c;
//function automatic logic [7:0] paeth(input [7:0] a, input [7:0] b, input [7:0] c);
    reg signed [10:0] sa, sb, sc, p, pa, pb, pc;
begin
    sa = {3'h0, a};
    sb = {3'h0, b};
    sc = {3'h0, c};
    p  = sa + sb - sc;
    pa = p > sa ? p - sa : sa - p;
    pb = p > sb ? p - sb : sb - p;
    pc = p > sc ? p - sc : sc - p;
    if (pa <= pb && pa <= pc)
        paeth = a;
    else if (pb <= pc)
        paeth = b;
    else
        paeth = c;
end
endfunction

reg         nfirstrow = 1'b0;
reg  [13:0] col = 0;
reg  [ 2:0] mode = 0;
reg  [ 7:0] fdata;
wire [ 7:0] LLdata, UUdata, ULdata;
wire nfirstcol  = col > (14'h1+bpp);
wire [ 8:0] SSdata = (nfirstcol ? {1'b0,LLdata} : 9'h0) + (nfirstrow ? {1'b0,UUdata} : 9'h0);


always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        nfirstrow <= 1'b0;
        col       <= 0;
    end else begin
        if(istart) begin
            nfirstrow <= 1'b0;
            col       <= 0;
        end else if(mvalid) begin
            if(col<bpr) begin
                col <= col + 14'h1;
            end else begin
                nfirstrow <= 1'b1;
                col <= 0;
            end
        end
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        mode <= 0;
    end else begin
        if(istart)
            mode <= 0;
        else if(mvalid && col==14'h0)
            mode <= mbyte[2:0];
    end

always @ (*)
    case(mode)
        3'd0   : fdata = mbyte;
        3'd1   : fdata = mbyte + (nfirstcol ? LLdata : 8'h0);
        3'd2   : fdata = mbyte + (nfirstrow ? UUdata : 8'h0);
        3'd3   : fdata = mbyte + SSdata[8:1];
        default: fdata = mbyte + paeth( (nfirstcol ? LLdata : 8'h0),
                                        (nfirstrow ? UUdata : 8'h0),
                                        (nfirstrow & nfirstcol ? ULdata : 8'h0) );
    endcase

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        bvalid <= 1'b0;
        bbyte  <= 0;
    end else begin
        if(istart) begin
            bvalid <= 1'b0;
            bbyte  <= 0;
        end else begin
            bvalid <= (mvalid && col!=14'h0);
            if(mvalid && col!=14'h0) bbyte <= fdata;
        end
    end

// shift reg for current line
reg [7:0] mem_sr_currline [0:3];

integer i;

initial for(i=0; i<4; i=i+1) mem_sr_currline[i] = 0;
assign LLdata  = mem_sr_currline [bpp];
always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        mem_sr_currline[0] <= 0;
    end else begin
        if(istart) begin
            mem_sr_currline[0] <= 0;
        end else if(mvalid)
            mem_sr_currline[0] <= fdata;
    end
generate genvar isrcl;
    for(isrcl=0; isrcl<3; isrcl=isrcl+1) begin : gen_sr_currline
        always @ (posedge clk or negedge rstn)
            if(~rstn) begin
                mem_sr_currline[isrcl+1] <= 0;
            end else begin
                if(istart) begin
                    mem_sr_currline[isrcl+1] <= 0;
                end else if(mvalid)
                    mem_sr_currline[isrcl+1] <= mem_sr_currline[isrcl];
            end
    end
endgenerate


// shift reg for previous line
reg [7:0] mem_sr_prevline [0:3];
initial for(i=0; i<4; i=i+1) mem_sr_prevline[i] = 0;
assign ULdata  = mem_sr_prevline [bpp];
always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        mem_sr_prevline[0]  <= 0;
    end else begin
        if(istart) begin
            mem_sr_prevline[0] <= 0;
        end else if(mvalid)
            mem_sr_prevline[0] <= UUdata;
    end
generate genvar isrpl;
    for(isrpl=0; isrpl<3; isrpl=isrpl+1) begin : gen_sr_prevline
        always @ (posedge clk or negedge rstn)
            if(~rstn) begin
                mem_sr_prevline[isrpl+1]  <= 0;
            end else begin
                if(istart) begin
                    mem_sr_prevline[isrpl+1] <= 0;
                end else if(mvalid)
                    mem_sr_prevline[isrpl+1] <= mem_sr_prevline[isrpl];
            end
    end
endgenerate


// shift buffer from current line to previous line
reg         sb_rvalid = 1'b0;
reg  [ 7:0] sb_rdata;
reg  [ 7:0] sb_ldata = 0;
reg  [ 7:0] sb_lidata = 0;
reg  [13:0] sb_ptr = 0;

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        sb_lidata <= 0;
    end else begin
        if(istart) begin
            sb_lidata <= 0;
        end else if(mvalid)
            sb_lidata <= fdata;
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        sb_ptr <= 0;
    end else begin
        if(istart) begin
            sb_ptr <= 0;
        end else if(mvalid) begin
            if(sb_ptr < (bpr-14'd1))
                sb_ptr <= sb_ptr + 14'd1;
            else
                sb_ptr <= 0;
        end
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        sb_ldata  <= 0;
        sb_rvalid <= 1'b0;
    end else begin
        if(istart) begin
            sb_ldata  <= 0;
            sb_rvalid <= 1'b0;
        end else begin
            if(sb_rvalid)
                sb_ldata <= sb_rdata;
            sb_rvalid <= mvalid;
        end
    end

reg [7:0] mem_sb [0 : ((1<<14)-1)];

always @ (posedge clk)
    if(mvalid)
        mem_sb[sb_ptr] <= fdata;

always @ (posedge clk)
    sb_rdata <= mem_sb[sb_ptr];

assign UUdata = (bpr == 14'd0) ? sb_lidata : (sb_rvalid ? sb_rdata : sb_ldata);



//-------------------------------------------------------------------------------------------------------------
// build pixel
//-------------------------------------------------------------------------------------------------------------
reg [1:0] pixcnt = 0;
reg [7:0] pr=0, pg=0, pb=0, pa=0;

assign opixelr = isplte ? plte_rdata[23:16] : pr;
assign opixelg = isplte ? plte_rdata[15: 8] : pg;
assign opixelb = isplte ? plte_rdata[ 7: 0] : pb;
assign opixela = isplte ?             8'hff : pa;

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        pixcnt <= 0;
        ovalid <= 1'b0;
        {pr, pg, pb, pa} <= 0;
    end else begin
        ovalid <= 1'b0;
        if(istart | ostart) begin
            pixcnt <= 0;
            {pr, pg, pb, pa} <= 0;
        end else if(bvalid) begin
            case(pixcnt)
            2'd0 : {pr, pg, pb, pa} <= {bbyte, bbyte, bbyte, 8'hff};
            2'd1 : {            pa} <= {                     bbyte};
            2'd2 : {    pg, pb, pa} <= {          pa, bbyte, 8'hff};
            2'd3 : {            pa} <= {                     bbyte};
            endcase
            if(pixcnt<bpp) begin
                pixcnt <= pixcnt + 2'd1;
                ovalid <= 1'b0;
            end else begin
                pixcnt <= 2'd0;
                ovalid <= 1'b1;
            end
        end
    end



//-------------------------------------------------------------------------------------------------------------
// PLTE mem
//-------------------------------------------------------------------------------------------------------------
reg [23:0] mem_plte [0:255];

always @ (posedge clk)
    if(plte_wen)
        mem_plte[plte_waddr] <= plte_wdata;

always @ (posedge clk)
    plte_rdata <= mem_plte[bbyte];


endmodule
