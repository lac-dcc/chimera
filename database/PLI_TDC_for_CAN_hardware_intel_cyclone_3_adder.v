// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

module adder (
    output Sum,
    output Co,
    input A,
    input B,
    input Ci
);

assign Sum = A ^ B ^ Ci;
assign Co = (A&&B || (A||B)&&Ci);

endmodule
