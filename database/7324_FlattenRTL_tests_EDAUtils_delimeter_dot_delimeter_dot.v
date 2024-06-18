// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module delimeter_dot(
        a,
        b,
        z
    );
    input a;
    input b;
    output z;
    wire \inst1.i1 ;
    wire \inst1.i2 ;
    wire \inst1.o1 ;
    assign \inst1.i1  = a;
    assign \inst1.i2  = b;
    assign z = \inst1.o1 ;
    assign \inst1.o1  = ( \inst1.i1  & \inst1.i2  );
endmodule 


