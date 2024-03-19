module z80_alu(d, op, a, b, f, nf);

input [4:0] op;
input [15:0] a;
input [15:0] b;
output reg [15:0] d;
input [3:0] f;
output [3:0] nf;

wire n = f[2];
wire h = f[1];
wire c = f[0];

assign nf = {nz, 1'bx, nh, nc};
wire nz = (d[7:0] == 0);
reg nh;
reg nc;


always @(*) begin
    case (op)
    OR:      d = {a[15:8], a[7:0] | b[7:0]};
    AND:     d = {a[15:8], a[7:0] & b[7:0]};
    XOR:     d = {a[15:8], a[7:0] ^ b[7:0]};
    CPL:     d = ~a;
     
    ADD:     d = a + b;
    ADC:     d = a + b + c;
    ADD2:    d = a + b;
    SUB:     d = a - b;
    SBC:     d = a - b - c;
                  
    RLC:     d = {8'h00, a[6:0], a[7]};
    RL:      d = {8'h00, a[6:0], c};
    RRC:     d = {8'h00, a[0], a[7:1]};
    RR:      d = {8'h00, c, a[7:1]};
    SLA:     d = {8'h00, a[6:0], 1'b0};
    SRA:     d = {8'h00, a[7], a[7:1]};
    SRL:     d = {8'h00, 1'b0, a[7:1]};
                  
    SWAP:    d = {8'h00, a[3:0], a[7:4]};
    SWAP2:   d = {a[7:0], a[15:8]};
    
    DAA: begin
        d = a;
    
        if (n) begin
            if (c) d[7:0] = d[7:0] - 8'h60;
            if (h) d[7:0] = d[7:0] - 8'h06;
        end else begin
            if (c || d[7:0] > 8'h99) d[7:0] = d[7:0] + 8'h60;
            if (h || d[3:0] > 8'h09) d[7:0] = d[7:0] + 8'h06;
        end
    end
    default: d = 0;
    endcase
end


reg [16:0] hspace;
reg [16:0] cspace;

always @(*) begin
    nh = 0;
    nc = 0;
    hspace = 0;
    cspace = 0;

    case (op)
    ADD:     begin hspace = ({1'b0, a[3:0]} + {1'b0, b[3:0]});      nh = hspace[4];
                   cspace = ({1'b0, a[7:0]} + {1'b0, b[7:0]});      nc = cspace[8];  end
    ADC:     begin hspace = ({1'b0, a[3:0]} + {1'b0, b[3:0]} + c);  nh = hspace[4];
                   cspace = ({1'b0, a[7:0]} + {1'b0, b[7:0]} + c);  nc = cspace[8];  end
    ADD2:    begin hspace = ({1'b0, a[11:0]} + {1'b0, b[11:0]});    nh = hspace[12];
                   cspace = ({1'b0, a[15:0]} + {1'b0, b[15:0]});    nc = cspace[16]; end
    SUB:     begin hspace = ({1'b0, a[3:0]} - {1'b0, b[3:0]});      nh = hspace[4];
                   cspace = ({1'b0, a[7:0]} - {1'b0, b[7:0]});      nc = cspace[8];  end
    SBC:     begin hspace = ({1'b0, a[3:0]} - {1'b0, b[3:0]} - c);  nh = hspace[4];
                   cspace = ({1'b0, a[7:0]} - {1'b0, b[7:0]} - c);  nc = cspace[8];  end
                  
    RLC:     nc = a[7];
    RL:      nc = a[7];
    RRC:     nc = a[0];
    RR:      nc = a[0];
    SLA:     nc = a[7];
    SRA:     nc = a[0];
    SRL:     nc = a[0];
    DAA:     nc = !n && a[7:0] > 8'h99;
    default: nc = 0;
    endcase
end


parameter OR        = 5'h00;
parameter AND       = 5'h01;
parameter XOR       = 5'h02;
parameter CPL       = 5'h03;
parameter ADD2      = 5'h04;
parameter ADD       = 5'h05;
parameter ADC       = 5'h06;
parameter SUB       = 5'h07;
parameter SBC       = 5'h08;
parameter RLC       = 5'h09;
parameter RL        = 5'h0a;
parameter RRC       = 5'h0b;
parameter RR        = 5'h0c;
parameter SLA       = 5'h0d;
parameter SRA       = 5'h0e;
parameter SRL       = 5'h0f;
parameter SWAP      = 5'h10;
parameter SWAP2     = 5'h11;
parameter DAA       = 5'h12;

endmodule
