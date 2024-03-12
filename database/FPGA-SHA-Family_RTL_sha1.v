
//--------------------------------------------------------------------------------------------------------
// Module  : sha1
// Type    : synthesizable, IP's top
// Standard: Verilog 2001 (IEEE1364-2001)
//--------------------------------------------------------------------------------------------------------

module sha1(
    input  wire         rstn,
    input  wire         clk,
    // input interface
    output wire         tready,
    input  wire         tvalid,
    input  wire         tlast,
    input  wire [ 31:0] tid,
    input  wire [  7:0] tdata,
    // output interface
    output reg          ovalid,
    output reg  [ 31:0] oid,
    output reg  [ 60:0] olen,
    output wire [159:0] osha
);


function  [31:0] SL1;
    input [31:0] x;
begin
    SL1 = {x[30:0], x[31]};
end
endfunction


function  [31:0] SL5;
    input [31:0] x;
begin
    SL5 = {x[26:0], x[31:27]};
end
endfunction


function  [31:0] SL30;
    input [31:0] x;
begin
    SL30 = {x[1:0], x[31:2]};
end
endfunction


integer i;

wire [31:0] k [0:3];
assign k[ 0] = 'h5A827999;
assign k[ 1] = 'h6ED9EBA1;
assign k[ 2] = 'h8F1BBCDC;
assign k[ 3] = 'hCA62C1D6;

wire [31:0] hinit [0:4];
reg  [31:0] h [0:4];
reg  [31:0] hsave [0:4];
reg  [31:0] hadder [0:4];
assign hinit[0] = 'h67452301;
assign hinit[1] = 'hEFCDAB89;
assign hinit[2] = 'h98BADCFE;
assign hinit[3] = 'h10325476;
assign hinit[4] = 'hC3D2E1F0;
initial for(i=0; i<5; i=i+1) h[i] = 0;
initial for(i=0; i<5; i=i+1) hsave[i] = 0;
initial for(i=0; i<5; i=i+1) hadder[i] = 0;

reg [31:0] w [0:17];
reg [ 7:0] buff [0:63];
initial for(i=0; i<18; i=i+1) w[i] = 0;
initial for(i=0; i<64; i=i+1) buff[i] = 8'd0;

localparam [2:0] IDLE   = 3'd0,
                 RUN    = 3'd1,
                 ADD8   = 3'd2,
                 ADD0   = 3'd3,
                 ADDLEN = 3'd4,
                 DONE   = 3'd5;
reg  [ 2:0] status = IDLE;

reg  [60:0] cnt = 61'd0;
reg  [ 5:0] tcnt = 6'd0;
wire [63:0] bitlen = {cnt,3'h0};

wire       iinit;
reg        ifirst = 1'b0;
reg        ivalid = 1'b0;
reg        ilast = 1'b0;
reg [60:0] ilen  = 61'd0;
reg [31:0] iid = 0;
reg [ 7:0] idata = 8'd0;
reg [ 5:0] icnt = 6'd0;
reg        minit= 1'b0;
reg        men  = 1'b0;
reg        mlast = 1'b0;
reg [31:0] mid = 0;
reg [60:0] mlen = 61'd0;
reg [ 5:0] mcnt = 6'd0;
reg        winit  = 1'b0;
reg        wen  = 1'b0;
reg        wlast = 1'b0;
reg [31:0] wid = 0;
reg [60:0] wlen = 61'd0;
reg        wstart = 1'b0;
reg        wfinal = 1'b0;
reg [ 1:0] wtype = 2'd0;
reg        wkinit  = 1'b0;
reg        wken = 1'b0;
reg        wklast = 1'b0;
reg [31:0] wkid = 0;
reg [60:0] wklen = 61'd0;
reg        wkstart = 1'b0;
reg [ 1:0] wktype = 2'd0;
reg [31:0] wk0=0, wk1=0;

assign tready = (status==IDLE) || (status==RUN);
assign iinit  = (status==IDLE) & tvalid;

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        status <= IDLE;
        cnt <= 61'd0;
        tcnt <= 6'd0;
        {ivalid, ifirst, ilast, ilen, iid, idata} <= 0;
    end else begin
        ilen <= cnt;
        case(status)
            IDLE   : begin
                if(tvalid) begin
                    status <= tlast ? ADD8 : RUN;
                    cnt <= 61'd1;
                end
                tcnt <= cnt[5:0] + 6'd1;
                ivalid <= tvalid;
                ifirst <= tvalid;
                ilast  <= 1'b0;
                iid    <= tid;
                idata  <= tdata;
            end
            RUN     : begin
                if(tvalid) begin
                    status <= tlast ? ADD8 : RUN;
                    cnt <= cnt + 61'd1;
                end
                tcnt <= cnt[5:0] + 6'd1;
                ivalid <= tvalid;
                if(tcnt==6'h3f) ifirst <= 1'b0;
                ilast  <= 1'b0;
                idata  <= tdata;
            end
            ADD8    : begin
                status <= (cnt[5:0]==6'h37) ? ADDLEN : ADD0;
                tcnt <= cnt[5:0] + 6'd1;
                ivalid <= 1'b1;
                if(tcnt==6'h3f) ifirst <= 1'b0;
                ilast  <= 1'b0;
                idata  <= 8'h80;
            end
            ADD0    : begin
                status <= (tcnt==6'h37) ? ADDLEN : ADD0;
                tcnt <= tcnt + 6'd1;
                ivalid <= 1'b1;
                if(tcnt==6'h3f) ifirst <= 1'b0;
                ilast  <= 1'b0;
                idata  <= 8'h00;
            end
            ADDLEN  : begin
                status <= (tcnt==6'h3f) ? DONE : ADDLEN;
                tcnt <= tcnt + 6'd1;
                ivalid <= 1'b1;
                if(tcnt==6'h3f) ifirst <= 1'b0;
                ilast  <= (tcnt==6'h3f);
                idata  <= bitlen[8*(7-tcnt[2:0])+:8];
            end
            default : begin
                status <= IDLE;
                cnt <= 61'd0;
                tcnt <= 6'd0;
                {ivalid, ifirst, ilast, ilen, idata} <= 0;
            end
        endcase
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        icnt <= 6'd0;
        for(i=0; i<64; i=i+1) buff[i] <= 8'd0;
    end else begin
        if(iinit) begin
            icnt <= 6'd0;
        end else if(ivalid) begin
            buff[icnt] <= idata;
            icnt <= icnt + 6'd1;
        end
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        minit <= 1'b0;
        men   <= 1'b0;
        mlast <= 1'b0;
        mid   <= 0;
        mlen  <= 61'd0;
        mcnt  <= 6'd0;
    end else begin
        minit <= ifirst & (icnt==6'h3e);
        if(ifirst & (icnt==6'h3e)) begin
            men   <= 1'b0;
            mlast <= 1'b0;
            mcnt  <= 6'd0;
        end else if(ivalid & (icnt==6'h3f)) begin
            men   <= 1'b1;
            mlast <= ilast;
            mid   <= iid;
            mlen  <= ilen;
            mcnt  <= 6'd0;
        end else begin
            if(mcnt==6'd39) begin
                men   <= 1'b0;
                mlast <= 1'b0;
            end
            if(men)
                mcnt <= mcnt + 6'd1;
        end
    end


wire [5:0] waddr0, waddr1, waddr2, waddr3, waddr4, waddr5, waddr6, waddr7;
assign waddr0 = {mcnt[2:0],3'd0};
assign waddr1 = {mcnt[2:0],3'd1};
assign waddr2 = {mcnt[2:0],3'd2};
assign waddr3 = {mcnt[2:0],3'd3};
assign waddr4 = {mcnt[2:0],3'd4};
assign waddr5 = {mcnt[2:0],3'd5};
assign waddr6 = {mcnt[2:0],3'd6};
assign waddr7 = {mcnt[2:0],3'd7};

reg  [31:0] wtmp [0:17];        // not real register

always @ (*) begin
    for(i=0; i<18; i=i+1) wtmp[i] = w[i];
    for(i=17; i>0; i=i-1) wtmp[i] = wtmp[i-1];
    wtmp[0] = SL1(wtmp[16]^wtmp[14]^wtmp[8]^wtmp[3]);
    for(i=17; i>0; i=i-1) wtmp[i] = wtmp[i-1];
    wtmp[0] = SL1(wtmp[16]^wtmp[14]^wtmp[8]^wtmp[3]);
end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        winit  <= 1'b0;
        wen    <= 1'b0;
        wlast  <= 1'b0;
        wid    <= 0;
        wlen   <= 61'd0;
        wstart <= 1'b0;
        wfinal <= 1'b0;
        wtype  <= 2'd0;
        for(i=0; i<18; i=i+1) w[i] <= 0;
    end else begin
        winit  <= minit;
        wen    <= men;
        wlast  <= mlast & (mcnt==6'd39);
        wid    <= mid;
        wlen   <= mlen;
        wstart <= men & (mcnt==6'd0);
        wfinal <= men & (mcnt==6'd39);
        if(mcnt<6'd10) begin
            wtype <= 2'd0;
        end else if(mcnt<6'd20) begin
            wtype <= 2'd1;
        end else if(mcnt<6'd30) begin
            wtype <= 2'd2;
        end else begin
            wtype <= 2'd3;
        end
        if(mcnt<6'd8) begin
            w[1] <= {buff[waddr0],buff[waddr1],buff[waddr2],buff[waddr3]};
            w[0] <= {buff[waddr4],buff[waddr5],buff[waddr6],buff[waddr7]};
            for(i=2; i<18; i=i+1) w[i] <= w[i-2];
        end else begin
            for(i=0; i<18; i=i+1) w[i] <= wtmp[i];
        end
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        wkinit <= 1'b0;
        wken <= 1'b0;
        wklast <= 1'b0;
        wkid   <= 0;
        wklen  <= 61'd0;
        wkstart <= 1'b0;
        wktype <= 2'd0;
        wk0 <= 0;
        wk1 <= 0;
    end else begin
        wkinit <= winit;
        wken <= wen;
        wklast <= wlast;
        wkid   <= wid;
        wklen  <= wlen;
        wkstart <= wstart;
        wktype <= wtype;
        wk0 <= w[0] + k[wtype];
        wk1 <= w[1] + k[wtype];
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        for(i=0; i<5; i=i+1) hsave[i] <= 0;
    end else begin
        if(wkstart)
            for(i=0; i<5; i=i+1) hsave[i] <= h[i];
    end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        for(i=0; i<5; i=i+1) hadder[i] <= 0;
    end else begin
        if(wfinal) begin
            for(i=0; i<5; i=i+1) hadder[i] <= hsave[i];
        end else begin
            for(i=0; i<5; i=i+1) hadder[i] <= 0;
        end
    end


reg [31:0] ht [0:4];     // not real register
reg [31:0] f, t;         // not real register

always @ (*) begin
    for(i=0; i<5; i=i+1) ht[i] = h[i];
    
    case(wktype)
    2'd0    : f = (ht[1]&ht[2]) | (~ht[1]&ht[3]);
    2'd2    : f = (ht[1]&ht[2]) | (ht[1]&ht[3]) | (ht[2]&ht[3]);
    default : f = ht[1] ^ ht[2] ^ ht[3];
    endcase
    t = SL5(ht[0]) + f + ht[4] + wk1;
    ht[4] = ht[3];
    ht[3] = ht[2];
    ht[2] = SL30(ht[1]);
    ht[1] = ht[0];
    ht[0] = t;
    
    case(wktype)
    2'd0    : f = (ht[1]&ht[2]) | (~ht[1]&ht[3]);
    2'd2    : f = (ht[1]&ht[2]) | (ht[1]&ht[3]) | (ht[2]&ht[3]);
    default : f = ht[1] ^ ht[2] ^ ht[3];
    endcase
    t = SL5(ht[0]) + f + ht[4] + wk0;
    ht[4] = ht[3];
    ht[3] = ht[2];
    ht[2] = SL30(ht[1]);
    ht[1] = ht[0];
    ht[0] = t;
end

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        for(i=0; i<5; i=i+1) h[i] <= 0;
    end else begin
        if(wkinit) begin
            for(i=0; i<5; i=i+1) h[i] <= hinit[i];
        end else if(wken) begin
            for(i=0; i<5; i=i+1)
                h[i] <= hadder[i] + ht[i];
        end
    end

initial {ovalid,oid,olen} = 0;
always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        ovalid <= 1'b0;
        oid  <= 0;
        olen <= 61'd0;
    end else begin
        ovalid <= wklast;
        oid  <= wkid;
        olen <= wklen;
    end

assign osha = {h[0],h[1],h[2],h[3],h[4]};

endmodule
