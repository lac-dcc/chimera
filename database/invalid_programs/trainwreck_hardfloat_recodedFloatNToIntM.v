
/*----------------------------------------------------------------------------
| `expSize' is size of exponent in usual format.  The recoded exponent size is
| `expSize+1'.  Likewise for `size'.
*----------------------------------------------------------------------------*/


//*** THIS MODULE IS NOT FULLY OPTIMIZED.

`include "fpu_common.v"

module recodedFloatNToIntM( in, signed_conv, out );

    parameter expSize = 8;
    parameter sigSize = 24;
    parameter intSize = 32;

    localparam size = expSize+sigSize;
    localparam shamtSize = `ceilLog2(intSize)+1;
    localparam toShiftSize = sigSize < intSize ? intSize : sigSize;

    input  [size:0]      in;
    input                signed_conv;
    output [intSize-1:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire zeroSig;
    wire isNaN;
    wire isInf;
    wire [expSize-1:0] expTwosComp;
    wire [31-expSize:0] tmp;
    wire [31-shamtSize:0] tmp2;
    wire underflow, overflow;
    wire [toShiftSize-1:0] toShift;
    wire [shamtSize-1:0] shiftAmt, negShiftAmt;
    wire [toShiftSize-1:0] commonCaseUns;
    wire [intSize-1:0] commonCase;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/

    assign zeroSig = in[sigSize-2:0] == 0;
    assign isNaN = in[size-1:size-3] == 3'b111;
    assign isInf = in[size-1:size-3] == 3'b110;

    assign {tmp,expTwosComp} = in[size-1:sigSize-1] - (1 << expSize);
    assign underflow = expTwosComp[expSize-1];
    assign overflow = (expTwosComp[expSize-2:0] >= intSize) | (signed_conv & (expTwosComp[expSize-2:0] == intSize-1) & ~(zeroSig & in[size])) | (~signed_conv & in[size]) | isNaN | isInf;

    assign toShift = {{(toShiftSize-(sigSize-1)){1'b1}},in[sigSize-2:0]};
    assign {tmp2,shiftAmt} = expTwosComp[expSize-2:0] - (sigSize - 1);
    assign negShiftAmt = -shiftAmt;
    assign commonCaseUns = shiftAmt[shamtSize-1] ? (toShift >> negShiftAmt[shamtSize-2:0]) :
                                                   (toShift << shiftAmt[shamtSize-2:0]);
    assign commonCase = in[size] ? -commonCaseUns[intSize-1:0] : commonCaseUns[intSize-1:0];

    assign out = underflow ? {intSize{1'b0}} :
                 overflow  ? {intSize{1'b1}} :
                 commonCase;

endmodule

