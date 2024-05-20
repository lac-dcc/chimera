// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module s_cal (input s0, s1, s2, s3, output s);

    wire n_s0,n_s1,n_s2,n_s3,o1,o2,o3,o4;

    Not N1(.A(s0), .out(n_s0));
    Not N2(.A(s1), .out(n_s1));
    Not N3(.A(s2), .out(n_s2));
    Not N4(.A(s3), .out(n_s3));

    And4 A1(.A(s0), .B(n_s1), .C(n_s2), .D(n_s3), .out(o1));
    And4 A2(.A(n_s0), .B(s1), .C(n_s2), .D(n_s3), .out(o2));
    And4 A3(.A(n_s0), .B(n_s1), .C(s2), .D(n_s3), .out(o3));
    And4 A4(.A(n_s0), .B(n_s1), .C(n_s2), .D(s3), .out(o4));

    Or4 O1(.A(o1), .B(o2), .C(o3), .D(o4), .out(s));

endmodule
