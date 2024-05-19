// This program was cloned from: https://github.com/drom/quark
// License: MIT License

module tail_offset (ir, ${ range(16).map(e => 'toff_' + e + '_0').join(', ') });

input  [63:0] ir;
output [3:0] ${
    range(16)
    .map(e => 'toff_' + e + '_0')
    .join(', ')
};

reg [3:0] ${ range(16).map(e => 'toff_' + e + '_' + e).join(', ') };

reg [3:0] ${ range(16).map(e => 'ir' + e ).join(', ') };
<% var res = [];
    sklansky(12, e => {
        res.push('toff_' + e.res.hi + '_' + e.res.lo);
    });
%>
reg [3:0] ${ res.join(', ') };

wire [3:0] ${ range(1, 15).map(e => 'tlen_' + e).join(', ') };

${ range(1, 14)
    .map(e => 'tail_length u_len' + e + ' (.ir(ir' + e + '), .len(tlen_' + e + '));' )
    .join('\n')
}

always @ (ir) { ${
    rangeRight(16)
    .map(e => 'ir' + e)
    .join(', ')
} } = ir;

always @ ( ${
    range(12).map(e => 'toff_' + e + '_' + e).join(', ')
} )
<% var res = [];
    sklansky(12, e => {
        res.push(
            '  toff_' + e.res.hi + '_' + e.res.lo +
            ' = toff_' + e.left.hi + '_' + e.left.lo +
            ' + toff_' + e.right.hi + '_' + e.right.lo + ';'
        );
    });
%>
begin
${ res.join('\n') };
end

/*
mux16 #(.W(4)) u_offset_mux (
    .sel(pc),
    .i0000(of0001),
    .i0001(of0010),
    .i0010(of0011),
    .i0011(of0100),
    .i0100(of0101),
    .i0101(of0110),
    .i0110(of0111),
    .i0111(of1000),
    .i1000(of1001),
    .i1001(of1010),
    .i1010(of1011),
    .i1011(of1100),
    .i1100(of1101),
    .i1101(4'b????),
    .i1110(4'b????),
    .i1111(4'b????),
    .o(offset)
);
*/

/*
mux16 #(.W(3)) u_len_mux (
    .sel(pc),
    .i0000(len0001),
    .i0001(len0010),
    .i0010(len0011),
    .i0011(len0100),
    .i0100(len0101),
    .i0101(len0110),
    .i0110(len0111),
    .i0111(len1000),
    .i1000(len1001),
    .i1001(len1010),
    .i1010(len1011),
    .i1011(len1100),
    .i1100(len1101),
    .i1101(len1110),
    .i1110(len1111),
    .i1111(len1111),
    .o(len)
);
*/

/*
mux16 #(.W(4)) imm3_0_mux (
    .sel(offset),
    .i0000(ir1111),
    .i0001(ir1110),
    .i0010(ir1101),
    .i0011(ir1100),
    .i0100(ir1011),
    .i0101(ir1010),
    .i0110(ir1001),
    .i0111(ir1000),
    .i1000(ir0111),
    .i1001(ir0110),
    .i1010(ir0101),
    .i1011(ir0100),
    .i1100(4'b????),
    .i1101(4'b????),
    .i1110(4'b????),
    .i1111(4'b????),
    .o(imm3_0)
);
*/
/*
always @ (imm31_16, imm15_8, imm7_4, imm3_0) imm = {imm31_16, imm15_8, imm7_4, imm3_0};
*/

endmodule
