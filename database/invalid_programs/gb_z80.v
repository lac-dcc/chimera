module z80(
    clock, resetn, 
    address, indata, outdata, load, store,
    intreq, intaddress, intack,
    du, df, daf, dbc, dde, dhl, dsp, dpc
);

input clock;
input resetn;

output [15:0] address = bus_a;
input [7:0] indata;
output reg [7:0] outdata;
output load;
output store;

input intreq;
input [15:0] intaddress;
output reg intack;

output [15:0] du = u;
output [3:0] df = f;
output [15:0] daf = {a,f,4'h0};
output [15:0] dbc = {b,c};
output [15:0] dde = {d,e};
output [15:0] dhl = {h,l};
output [15:0] dsp = sp;
output [15:0] dpc = pc;


reg [15:0] u;

wire [15:0] uc_u;
wire [4:0] uc_d;
wire [4:0] uc_op;
wire [4:0] uc_a;
wire [4:0] uc_b;
wire [4:0] uc_cc;

reg ie;

z80_ucode uc(u, clock, resetn, {uc_u, uc_d, uc_op, uc_a, uc_b, load, store, uc_cc});

always @(*) begin
    if (intreq && ie && (uc_u[7:0] == 8'h00 || uc_u[7:0] == 8'h70)) begin
        u = 16'h0050;
    end else if (uc_d == D_UC) begin
        u = {bus_d[7:0], bus_d[15:8]};
    end else begin
        u = uc_u;
    end
    
    intack = (uc_d == D_IACK);
end


reg [7:0] a;
reg [3:0] f;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
reg [7:0] h;
reg [7:0] l;
reg [15:0] sp;
reg [15:0] pc;

reg [15:0] temp;


reg [15:0] bus_a;
reg [15:0] bus_b;
wire [15:0] bus_d;
wire [3:0] nf;

z80_alu alu(bus_d, uc_op, bus_a, bus_b, f, nf);


always @(*) begin
    case (uc_a)
    A_0:     bus_a = 16'h0;
    A_1:     bus_a = 16'h1;
    A_8:     bus_a = 16'h08;
    A_10:    bus_a = 16'h10;
    A_18:    bus_a = 16'h18;
    A_20:    bus_a = 16'h20;
    A_28:    bus_a = 16'h28;
    A_30:    bus_a = 16'h30;
    A_38:    bus_a = 16'h38;
    A_PC:    bus_a = pc;
    A_UC:    bus_a = {uc_u[7:0], uc_u[15:8]};
    A_D16:   bus_a = {indata, temp[7:0]};
    A_D8:    bus_a = {{8{indata[7]}}, indata};
    A_A:     bus_a = {{8{a[7]}}, a};
    A_B:     bus_a = {{8{b[7]}}, b};
    A_C:     bus_a = {{8{c[7]}}, c};
    A_D:     bus_a = {{8{d[7]}}, d};
    A_E:     bus_a = {{8{e[7]}}, e};
    A_H:     bus_a = {{8{h[7]}}, h};
    A_L:     bus_a = {{8{l[7]}}, l};
    A_AF:    bus_a = {a, f, 4'h0};
    A_BC:    bus_a = {b, c};
    A_DE:    bus_a = {d, e};
    A_HL:    bus_a = {h, l};
    A_SP:    bus_a = sp;
    A_IADDR: bus_a = intaddress;
    A_TEMP:  bus_a = temp;
    A_MASK:  bus_a = 16'hff00;
    default: bus_a = 16'h0000;
    endcase
end

always @(*) begin
    case (uc_b)
    B_0:     bus_b = 16'h0;
    B_1:     bus_b = 16'h1;
    B_2:     bus_b = 16'h02;
    B_4:     bus_b = 16'h04;
    B_8:     bus_b = 16'h08;
    B_10:    bus_b = 16'h10;
    B_20:    bus_b = 16'h20;
    B_40:    bus_b = 16'h40;
    B_80:    bus_b = 16'h80;
    B_fe:    bus_b = 16'hfe;
    B_fd:    bus_b = 16'hfd;
    B_fb:    bus_b = 16'hfb;
    B_f7:    bus_b = 16'hf7;
    B_ef:    bus_b = 16'hef;
    B_df:    bus_b = 16'hdf;
    B_bf:    bus_b = 16'hbf;
    B_7f:    bus_b = 16'h7f;
    B_D8:    bus_b = {{8{indata[7]}}, indata};
    B_A:     bus_b = {{8{a[7]}}, a};
    B_F:     bus_b = {8'h00, f, 4'h0};
    B_B:     bus_b = {{8{b[7]}}, b};
    B_C:     bus_b = {{8{c[7]}}, c};
    B_D:     bus_b = {{8{d[7]}}, d};
    B_E:     bus_b = {{8{e[7]}}, e};
    B_H:     bus_b = {{8{h[7]}}, h};
    B_L:     bus_b = {{8{l[7]}}, l};
    B_BC:    bus_b = {b, c};
    B_DE:    bus_b = {d, e};
    B_HL:    bus_b = {h, l};
    B_SP:    bus_b = sp;
    B_IE:    bus_b = ie;
    default: bus_b = 16'h0000;
    endcase
end

always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        pc <= 16'h0000;
        sp <= 16'hfffe;
        a <= 8'h01; // 8'h11 for gbc
        f <= 4'hb;
        b <= 8'h00;
        c <= 8'h13;
        d <= 8'h00;
        e <= 8'hd8;
        h <= 8'h01;
        l <= 8'h4d;
        ie <= 0;
    end else begin
        case (uc_d)
        D_PC:   pc      <= bus_d;
        D_DATA: outdata <= bus_d[7:0];
        D_A:    a       <= bus_d[7:0];
        D_B:    b       <= bus_d[7:0];
        D_C:    c       <= bus_d[7:0];
        D_D:    d       <= bus_d[7:0];
        D_E:    e       <= bus_d[7:0];
        D_H:    h       <= bus_d[7:0];
        D_L:    l       <= bus_d[7:0];
        D_AF:   begin a <= bus_d[15:8]; f <= bus_d[7:4]; end
        D_BC:   begin b <= bus_d[15:8]; c <= bus_d[7:0]; end
        D_DE:   begin d <= bus_d[15:8]; e <= bus_d[7:0]; end
        D_HL:   begin h <= bus_d[15:8]; l <= bus_d[7:0]; end
        D_SP:   sp      <= bus_d;
        D_IE:   ie      <= bus_d[0];
        D_TEMP: temp    <= bus_d;
        endcase
    
        case (uc_cc)
        CC_Z0Hx: begin f[3] <= nf[3]; f[2] <= 1'b0; f[1] <= nf[1];                end
        CC_Z1Hx: begin f[3] <= nf[3]; f[2] <= 1'b1; f[1] <= nf[1];                end
        CC_000C: begin f[3] <= 1'b0;  f[2] <= 1'b0; f[1] <= 1'b0;  f[0] <= nf[0]; end
        CC_x0HC: begin                f[2] <= 1'b0; f[1] <= nf[1]; f[0] <= nf[0]; end
        CC_Zx0C: begin f[3] <= nf[3];               f[1] <= 1'b0;  f[0] <= nf[0]; end
        CC_x11x: begin                f[2] <= 1'b1; f[1] <= 1'b1;                 end
        CC_x001: begin                f[2] <= 1'b0; f[1] <= 1'b0;  f[0] <= 1'b1;  end
        CC_Z0HC: begin f[3] <= nf[3]; f[2] <= 1'b0; f[1] <= nf[1]; f[0] <= nf[0]; end
        CC_x00x: begin                f[2] <= 1'b0; f[1] <= 1'b0;                 end
        CC_Z1HC: begin f[3] <= nf[3]; f[2] <= 1'b1; f[1] <= nf[1]; f[0] <= nf[0]; end
        CC_Z010: begin f[3] <= nf[3]; f[2] <= 1'b0; f[1] <= 1'b1;  f[0] <= 1'b0;  end
        CC_Z000: begin f[3] <= nf[3]; f[2] <= 1'b0; f[1] <= 1'b0;  f[0] <= 1'b0;  end
        CC_00HC: begin f[3] <= 1'b0;  f[2] <= 1'b0; f[1] <= nf[1]; f[0] <= nf[0]; end
        CC_Z00C: begin f[3] <= nf[3]; f[2] <= 1'b0; f[1] <= 1'b0;  f[0] <= nf[0]; end
        CC_Z01x: begin f[3] <= nf[3]; f[2] <= 1'b0; f[1] <= 1'b1;                 end
        endcase
    end
end




parameter D_0       = 5'h00;
parameter D_PC      = 5'h01;
parameter D_UC      = 5'h02;
parameter D_A       = 5'h03;
parameter D_B       = 5'h04;
parameter D_C       = 5'h05;
parameter D_D       = 5'h06;
parameter D_E       = 5'h07;
parameter D_H       = 5'h08;
parameter D_L       = 5'h09;
parameter D_AF      = 5'h0a;
parameter D_BC      = 5'h0b;
parameter D_DE      = 5'h0c;
parameter D_HL      = 5'h0d;
parameter D_SP      = 5'h0e;
parameter D_IE      = 5'h0f;
parameter D_IACK    = 5'h10;
parameter D_TEMP    = 5'h11;
parameter D_DATA    = 5'h12;

parameter A_0       = 5'h00;
parameter A_1       = 5'h01;
parameter A_8       = 5'h02;
parameter A_10      = 5'h03;
parameter A_18      = 5'h04;
parameter A_20      = 5'h05;
parameter A_28      = 5'h06;
parameter A_30      = 5'h07;
parameter A_38      = 5'h08;
parameter A_PC      = 5'h09;
parameter A_UC      = 5'h0a;
parameter A_D16     = 5'h0b;
parameter A_D8      = 5'h0c;
parameter A_A       = 5'h0d;
parameter A_B       = 5'h0e;
parameter A_C       = 5'h0f;
parameter A_D       = 5'h10;
parameter A_E       = 5'h11;
parameter A_H       = 5'h12;
parameter A_L       = 5'h13;
parameter A_AF      = 5'h14;
parameter A_BC      = 5'h15;
parameter A_DE      = 5'h16;
parameter A_HL      = 5'h17;
parameter A_SP      = 5'h18;
parameter A_IADDR   = 5'h19;
parameter A_TEMP    = 5'h1a;
parameter A_MASK    = 5'h1b;

parameter B_0       = 5'h00;
parameter B_1       = 5'h01;
parameter B_2       = 5'h02;
parameter B_4       = 5'h03;
parameter B_8       = 5'h04;
parameter B_10      = 5'h05;
parameter B_20      = 5'h06;
parameter B_40      = 5'h07;
parameter B_80      = 5'h08;
parameter B_fe      = 5'h09;
parameter B_fd      = 5'h0a;
parameter B_fb      = 5'h0b;
parameter B_f7      = 5'h0c;
parameter B_ef      = 5'h0d;
parameter B_df      = 5'h0e;
parameter B_bf      = 5'h0f;
parameter B_7f      = 5'h10;
parameter B_D8      = 5'h11;
parameter B_A       = 5'h12;
parameter B_F       = 5'h13;
parameter B_B       = 5'h14;
parameter B_C       = 5'h15;
parameter B_D       = 5'h16;
parameter B_E       = 5'h17;
parameter B_H       = 5'h18;
parameter B_L       = 5'h19;
parameter B_BC      = 5'h1a;
parameter B_DE      = 5'h1b;
parameter B_HL      = 5'h1c;
parameter B_SP      = 5'h1d;
parameter B_IE      = 5'h1e;

parameter CC_xxxx   = 5'h00;
parameter CC_Z0Hx   = 5'h01;
parameter CC_Z1Hx   = 5'h02;
parameter CC_000C   = 5'h03;
parameter CC_x0HC   = 5'h04;
parameter CC_Zx0C   = 5'h05;
parameter CC_x11x   = 5'h06;
parameter CC_x001   = 5'h07;
parameter CC_Z0HC   = 5'h08;
parameter CC_x00x   = 5'h09;
parameter CC_Z1HC   = 5'h0a;
parameter CC_Z010   = 5'h0b;
parameter CC_Z000   = 5'h0c;
parameter CC_00HC   = 5'h0d;
parameter CC_ZNHC   = 5'h0e;
parameter CC_Z00C   = 5'h0f;
parameter CC_Z01x   = 5'h10;

endmodule
