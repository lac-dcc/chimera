// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

module bassackward(
    output reg [1:0]    Q,          // 0-3
    input  wire         a,
    input  wire         b,
    input  wire         c,
    input  wire         d
    );

    always @*
    begin
        case ( 1'b1 )               // this is a constant!
        a:          Q = 2'b00;      // a is a variable!
        b:          Q = 2'b01;
        c:          Q = 2'b10;
        d:          Q = 2'b11;
        default:    Q = 2'bxx;
        endcase
    end

endmodule
