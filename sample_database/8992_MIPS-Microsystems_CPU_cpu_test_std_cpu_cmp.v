// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module cmp(
    input [31:0] A, B,
    input CMPOp,        //0: signed, 1: unsigned
    output equal, less, greater
);

    assign equal = (A==B) ? 1'b1 : 1'b0;
    assign less = (CMPOp==1'b0) ?   (($signed(A)<$signed(B)) ? 1'b1 : 1'b0) :
                                    ((A < B) ? 1'b1 : 1'b0);
    assign greater = (CMPOp==1'b0) ?   (($signed(A)>$signed(B)) ? 1'b1 : 1'b0) :
                                    ((A > B) ? 1'b1 : 1'b0);

endmodule // cmp