// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module simple_and_3(
        in1,
        in2,
        out1
    );
    input [5:0] in1;
    input [5:0] in2;
    output [0:5] out1;
    wire \inst1.a ;
    wire \inst1.b ;
    wire \inst1.z ;
    wire \inst1.inst1.i1 ;
    wire \inst1.inst1.i2 ;
    reg  \inst1.inst1.o1 ;
    wire \inst1.inst1.w1  = 1'b1;
    wire \inst2.a ;
    wire \inst2.b ;
    wire \inst2.z ;
    wire \inst2.inst1.i1 ;
    wire \inst2.inst1.i2 ;
    reg  \inst2.inst1.o1 ;
    wire \inst2.inst1.w1  = 1'b1;
    wire \inst3.a ;
    wire \inst3.b ;
    wire \inst3.z ;
    wire \inst3.inst1.i1 ;
    wire \inst3.inst1.i2 ;
    reg  \inst3.inst1.o1 ;
    wire \inst3.inst1.w1  = 1'b1;
    wire \inst4.i1 ;
    wire \inst4.i2 ;
    reg  \inst4.o1 ;
    wire \inst4.w1  = 1'b1;
    wire [1:0] \inst5.i1 ;
    reg [0:1] \inst5.o1 ;
    assign \inst1.a  = in1[0];
    assign \inst1.b  = in2[0];
    assign out1[0] = \inst1.z ;
    assign \inst1.inst1.i1  = \inst1.a ;
    assign \inst1.inst1.i2  = \inst1.b ;
    assign \inst1.z  = \inst1.inst1.o1 ;
    always @ (  \inst1.inst1.i1  or  \inst1.inst1.i2 )
    begin
        \inst1.inst1.o1  = ( ( \inst1.inst1.i1  ) ? ( \inst1.inst1.i1  ) : ( \inst1.inst1.i2  ) );
    end
    assign \inst2.a  = in1[1];
    assign \inst2.b  = in2[1];
    assign out1[1] = \inst2.z ;
    assign \inst2.inst1.i1  = \inst2.a ;
    assign \inst2.inst1.i2  = \inst2.b ;
    assign \inst2.z  = \inst2.inst1.o1 ;
    always @ (  \inst2.inst1.i1  or  \inst2.inst1.i2 )
    begin
        \inst2.inst1.o1  = ( ( \inst2.inst1.i1  ) ? ( \inst2.inst1.i1  ) : ( \inst2.inst1.i2  ) );
    end
    assign \inst3.a  = in1[2];
    assign \inst3.b  = in2[2];
    assign out1[2] = \inst3.z ;
    assign \inst3.inst1.i1  = \inst3.a ;
    assign \inst3.inst1.i2  = \inst3.b ;
    assign \inst3.z  = \inst3.inst1.o1 ;
    always @ (  \inst3.inst1.i1  or  \inst3.inst1.i2 )
    begin
        \inst3.inst1.o1  = ( ( \inst3.inst1.i1  ) ? ( \inst3.inst1.i1  ) : ( \inst3.inst1.i2  ) );
    end
    assign \inst4.i1  = in1[3];
    assign \inst4.i2  = in2[3];
    assign out1[3] = \inst4.o1 ;
    always @ (  \inst4.i1  or  \inst4.i2 )
    begin
        \inst4.o1  = ( ( \inst4.i1  ) ? ( \inst4.i1  ) : ( \inst4.i2  ) );
    end
    assign \inst5.i1  = in1[5:4];
    assign out1[4:5] = \inst5.o1 ;
    always @ (  posedge \inst5.i1 )
    begin
        \inst5.o1  = \inst5.i1 ;
    end
endmodule 


