// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
assign min = 
    a < b ? 
    // 如果a < b 对a继续判断 否则b判断
        (a < c ? 
    // 如果a < c 对a继续判断 否则c判断
            (a < d ? a : d) :   // a < d -> a else d
            (c < d ? c : d)     // c < d -> c else d
        ) 
        :
    // 如果b < c 对b继续判断 否则c判断
        ( b < c ?
            (b < d ? b : d) :       // b < d -> b else d
            (c < d ? c : d)         // c < d -> c else d
        ) 
    ;

endmodule
