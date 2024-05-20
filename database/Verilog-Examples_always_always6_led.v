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
        if ( enable ) begin
            if ( D == 4'h0 )        segs = {7'b1111110};
            else if ( D == 4'h1 )   segs = {7'b0110000};
            else if ( D == 4'h2 )   segs = {7'b1101101};
            else if ( D == 4'h3 )   segs = {7'b1111001};
            else if ( D == 4'h4 )   segs = {7'b0110011};
            else if ( D == 4'h5 )   segs = {7'b1011011};
            else if ( D == 4'h6 )   segs = {7'b1011111};
            else if ( D == 4'h7 )   segs = {7'b1110000};
            else if ( D == 4'h8 )   segs = {7'b1111111};
            else if ( D == 4'h9 )   segs = {7'b1111011};
            else if ( D == 4'ha )   segs = {7'b1110111};
            else if ( D == 4'hb )   segs = {7'b0011111};
            else if ( D == 4'hc )   segs = {7'b1001110};
            else if ( D == 4'hd )   segs = {7'b0111101};
            else if ( D == 4'he )   segs = {7'b1001111};
            else if ( D == 4'hf )   segs = {7'b1000111};
            else                    segs = 7'bx;            // unknown D bit values
        end
        else
            //segs = 0;        // or could use 'bz to float the outputs
            segs = 'bz;
    end

endmodule
