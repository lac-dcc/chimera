// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

module led(
    input   wire        enable,     // turn off when 0
    input   wire [3:0]  D,          // 0-F
    output  wire        a,
    output  wire        b,          // these must be wire because driven by cont. assign
    output  wire        c,
    output  wire        d,
    output  wire        e,
    output  wire        f,
    output  wire        g
    );

    reg [6:0] segs;

    assign {a,b,c,d,e,f,g} = segs;

    always @*
    begin
        if ( enable )
            case ( D )
            //casez ( D )
            //casex ( D )
            4'h0:       segs = {7'b1111110};
            4'h1:       segs = {7'b0110000};
            4'h2:       segs = {7'b1101101};
            4'h3:       segs = {7'b1111001};
            4'h4:       segs = {7'b0110011};
            4'h5:       segs = {7'b1011011};
            4'h6:       segs = {7'b1011111};
            4'h7:       segs = {7'b1110000};
            4'h8:       segs = {7'b1111111};
            4'h9:       segs = {7'b1111011};
            4'ha:       segs = {7'b1110111};
            4'hb:       segs = {7'b0011111};
            4'hc:       segs = {7'b1001110};
            4'hd:       segs = {7'b0111101};
            4'he:       segs = {7'b1001111};
            4'hf:       segs = {7'b1000111};

            4'bxxxx:    segs = {7'bx0x0x0x};   // will case match x values in simulation?

            4'b????:    segs = {7'bz0z0z0z};   // will case match z values in simulation?
            //4'bzzzz:    segs = {7'b0z0z0z0z};   // will case match z values in simulation?

            default:    segs = 7'bx;            // unknown or floating D bit values

            endcase
        else
            //segs = 0;        // or could use 'bz to float the outputs
            segs = 'bz;
    end

endmodule
