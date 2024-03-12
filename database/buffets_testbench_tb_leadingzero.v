// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



module tb8;

    reg [7:0] seq;
    wire [3:0] idx;

    leadingZero8 u_lze_8(seq,idx);

    initial begin
    #3
        seq = 8'h80;
    #3
        $display("seq %h, idx %d\n", seq, idx);
        seq = 8'h01;
    #3
        $display("seq %h, idx %d\n", seq, idx);
        seq = 8'h08;
    #3
        $display("seq %h, idx %d\n", seq, idx);
        seq = 8'h03;
    #3
        $display("seq %h, idx %d\n", seq, idx);
    end

endmodule

module tb32;

    reg [31:0] seq;
    wire [5:0] idx;

    leadingZero32 u_lze_32(seq,idx);

    initial begin
    #3
        seq = 32'h80000000;
    #3
        $display("seq %h, idx %d\n", seq, idx);
        seq = 32'h00000001;
    #3
        $display("seq %h, idx %d\n", seq, idx);
        seq = 32'h00000008;
    #3
        $display("seq %h, idx %d\n", seq, idx);
        seq = 32'h00000003;
    #3
        $display("seq %h, idx %d\n", seq, idx);
    end
endmodule
