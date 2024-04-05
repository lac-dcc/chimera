// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`include "./alu.v"
`include "../lib/assertion.v"

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
/* verilator lint_off MULTITOP */

`timescale 1ns/1ns

module test();
    import alu_ops::*;

	logic [7:0] a;
	logic [7:0] b;
	logic [4:0] alu_op;
    logic _flag_c_in;
	wire  [7:0] o;

    wire _flag_c;
    wire _flag_n;
    wire _flag_z;
    wire _flag_o;
    wire _flag_gt;
    wire _flag_lt;
    wire _flag_eq;
    wire _flag_ne;
	
	alu #(.LOG(0)) Alu( .result(o), .a, .b, .alu_op, ._flag_c_in, ._flag_c, ._flag_z, ._flag_n, ._flag_o, ._flag_gt, ._flag_lt, ._flag_eq, ._flag_ne);

    `define MAX_POS (127)
    `define MAX_NEG (-128)

    //reg [20*8:1] op_name;
    OpName op_name;
    string s;
    always @* begin
        op_name = aluopNameR(alu_op);
`ifndef verilator // verilator doesn't like left aligned format strings with a hyphen
//        $display ("%9t", $time, " MON: a=%b b=%b  _flag_c_in=%b   op=%02d %-10s  result=%8b   _flags (_c=%b _z=%1b _n=%1b _o=%1b _eq=%1b _ne=%1b _gt=%1b _lt=%b)", 
 //           a, b, _flag_c_in, alu_op,
  //          op_name,
   //         o, _flag_c, _flag_z, _flag_n, _flag_o, _flag_gt, _flag_lt, _flag_ne, _flag_eq
    //    );
`endif
    end

    `define  BAD_FLAG(X) begin $display("BAD FLAG VALUE FOR X @ line %d", `__LINE__); `FINISH_AND_RETURN(1)  end


/* REMOVED THIS BECAUSE ADDRESS CAN GLITCH WITH 'X' IN THE SIM WHEN EG CARRY NOT YET SET
    logic started = 0;
    always @* begin
        // detect inconsistent values
        if (started) begin
            if (_flag_c === 'x) `BAD_FLAG(c)
            if (_flag_z === 'x) `BAD_FLAG(z)
            if (_flag_n === 'x) `BAD_FLAG(n)
            if (_flag_o === 'x) `BAD_FLAG(o)
            if (_flag_gt === 'x) `BAD_FLAG(gt)
            if (_flag_lt === 'x) `BAD_FLAG(lt)
            if (_flag_ne === 'x) `BAD_FLAG(ne)
            if (_flag_eq === 'x) `BAD_FLAG(eq)
        end
    end
*/

    initial begin
        `ifndef verilator

        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        /*
        $display ("");
        $display ("%9t", $time, " MON: a=%8b b=%8b  _flag_c_in=%b   op=%02d result=%8b   _flags (_c=%b _z=%1b _n=%1b _o=%1b _eq=%1b _ne=%1b _gt=%1b _lt=%b)", 
            a,
            b,
            _flag_c_in,
            alu_op,
            o, 
            _flag_c,
            _flag_z,
            _flag_n,
            _flag_o,
            _flag_gt,
            _flag_lt,
            _flag_ne,
            _flag_eq
        );
*/
        
        `endif
    end

    wire [7:0] C=1;
    wire [7:0] Z=2;
    wire [7:0] N=4;
    wire [7:0] O=8;
    wire [7:0] EQ=16;
    wire [7:0] NE=32;
    wire [7:0] GT=64;
    wire [7:0] LT=128;

    function flagCheck(string flagName, [0:0] _flagValue, [7:0] expectation, bitSelector, string expectationStr);
        reg bitExpected;
        bitExpected = (expectation & bitSelector) == 0;
        flagCheck = (_flagValue == bitExpected);
        if (!flagCheck) $display("FLAG %2s wrong : got=%1b expected=%1b     for test case '%s'      a=%8b(d%-d/h%-2h) b%8b (d%-d/h%-2h) o=%8b (d%-d/h%-2h)", flagName, _flagValue, bitExpected, expectationStr, a,a,a,b,b,b,o,o,o); 
    endfunction

    `define FCMP(EXPECTATION,FLAGNAME,flagname) flagCheck("FLAGNAME", _flag_``flagname``, (EXPECTATION), FLAGNAME, "EXPECTATION")

    `define FLAGS(X) \
        if (!(`FCMP(X, C, c) & `FCMP(X, N, n) & `FCMP(X, Z, z) & `FCMP(X, O, o) & `FCMP(X, EQ, eq) & `FCMP(X, NE, ne) & `FCMP(X, GT, gt) & `FCMP(X, LT, lt))) \
        begin \
            $display("flag error at ", `__LINE__);  \
        `ifndef verilator \
            $finish_and_return(1);  \
        `endif \
        end

    localparam PropDelay=2000;

    function [7:0] to8([7:0] i);
        to8 = i;
    endfunction

    integer testcount=0;

    task PD;
        #PropDelay
        // $display("");
        testcount++;
    endtask

    integer count;
    function [7:0] count8();
        count8=8'(count);
    endfunction

    initial begin
        ////////////////////////////////////////////////////////////// 0
        assign a = 1;
        assign b = 2;
        assign _flag_c_in=1;
        assign alu_op = OP_0;
        PD;
        `Equals(o, 8'b0); 
        `FLAGS(NE | Z | LT)

        //started=1;

        ////////////////////////////////////////////////////////////// A
        assign a = 1;
        assign b = 2;
        assign _flag_c_in='x;
        assign alu_op = OP_A;
        PD;
        `Equals(o, 8'b1); 
        `FLAGS(NE | LT)

        assign a = 10;
        assign b = 20;
        assign _flag_c_in='x;
        PD;
        `Equals(o, 10); 
        `FLAGS(NE | LT)

        ////////////////////////////////////////////////////////////// B
        assign a = 1;
        assign b = 2;
        assign _flag_c_in='x;
        assign alu_op = OP_B;
        PD;
        `Equals(o, 2); 
        `FLAGS(NE | LT)

        assign a = 10;
        assign b = 20;
        assign _flag_c_in='x;
        PD;
        `Equals(o, 20); 
        `FLAGS(NE | LT)

        ////////////////////////////////////////////////////////////// NEGATE_A

        assign a = 0; 
        assign b = 0;
        assign _flag_c_in = 'x; // not relevant
        assign alu_op = OP_NEGATE_A;
        PD;
        `Equals(o, 8'b0)
        `FLAGS(Z|EQ)

        assign a = 1; 
        assign b = 0;
        assign _flag_c_in = 'x; 
        PD;
        `Equals(o, 8'b11111111)
        `FLAGS(N|NE|GT)

        assign a = 2; 
        assign b = 0;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b11111110)
        `FLAGS(N|NE|GT)

        assign a = `MAX_POS; // 127
        assign b = 0;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b10000001)
        `Equals(o, 8'(`MAX_NEG+1))
        `FLAGS(N|NE|GT)

        assign a = (`MAX_POS+1); // 128 = overflow on negation
        assign b = 0;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b10000000)
        `FLAGS(O|N|NE|GT) // OVERFLOW BECAUSE (MAX_POS+1)=128 which is actually negative -128 binary, and we cannot negate -128 in 8 bits (ie +ve 128 doesn't fit)

        assign a = (`MAX_NEG); // 128 = overflow on negation
        assign b = 0;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b10000000)
        `FLAGS(O|N|NE|GT) // OVERFLOW BECAUSE (MAX_POS+1)=128 which is actually negative -128 binary, and we cannot negate -128 in 8 bits (ie +ve 128 doesn't fit)

        assign a = (`MAX_NEG+1); // 128 = overflow on negation
        assign b = 0;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b01111111)
        `Equals(o, 8'(`MAX_POS))
        `FLAGS(NE|GT) // OVERFLOW BECAUSE (MAX_POS+1)=128 which is actually negative -128 binary, and we cannot negate -128 in 8 bits (ie +ve 128 doesn't fit)


        ////////////////////////////////////////////////////////////// NEGATE_B
        assign a = 0; 
        assign b = 1;
        assign _flag_c_in = 0; // not relevant
        assign alu_op = OP_NEGATE_B;
        PD;
        `Equals(o, 8'b11111111)
        `FLAGS(N|NE|LT)

        assign a = 0; 
        assign b = 0;
        assign _flag_c_in = 'x; // not relevant
        assign alu_op = OP_NEGATE_B;
        PD;
        `Equals(o, 8'b0)
        `FLAGS(Z|EQ)

        assign a = 0; 
        assign b = 1;
        assign _flag_c_in = 'x; 
        PD;
        `Equals(o, 8'b11111111)
        `FLAGS(N|NE|LT)

        assign a = 0; 
        assign b = 2;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b11111110)
        `FLAGS(N|NE|LT)

        assign a = 0;
        assign b = `MAX_POS; // 127
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b10000001)
        `Equals(o, 8'(`MAX_NEG+1))
        `FLAGS(N|NE|LT)

        assign a = 0;
        assign b = (`MAX_POS+1); // 128 = overflow on negation
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b10000000)
        `FLAGS(O|N|NE|LT) // OVERFLOW BECAUSE (MAX_POS+1)=128 which is actually negative -128 binary, and we cannot negate -128 in 8 bits (ie +ve 128 doesn't fit)

        assign a = 0;
        assign b = (`MAX_NEG); // 128 = overflow on negation
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b10000000)
        `FLAGS(O|N|NE|LT) // OVERFLOW BECAUSE (MAX_POS+1)=128 which is actually negative -128 binary, and we cannot negate -128 in 8 bits (ie +ve 128 doesn't fit)

        assign a = 0;
        assign b = (`MAX_NEG+1); // 128 = overflow on negation
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b01111111)
        `Equals(o, 8'(`MAX_POS))
        `FLAGS(NE|LT) // OVERFLOW BECAUSE (MAX_POS+1)=128 which is actually negative -128 binary, and we cannot negate -128 in 8 bits (ie +ve 128 doesn't fit)


        ////////////////////////////////////////////////////////////// BA_DIV_10
        assign a = 0; 
        assign b = 0; 
        assign _flag_c_in = 'x;
        assign alu_op = OP_BA_DIV_10;
        PD;
        `Equals(o, 8'b0)
        `FLAGS(Z|EQ) 

        assign a = 0; 
        assign b = 1; // carry in < 10 
        PD;
        `Equals(o, 8'd25);
        `FLAGS(NE|LT) 

        assign a = 1; 
        assign b = 10; // carry un MUST BE < 10 
        PD;
        `Equals(o, 8'd0);
        `FLAGS(O|Z|NE|LT) 

        assign a = 10; 
        assign b = 2; // carry in < 10 
        PD;
        `Equals(o, 8'd52); // 2*256 + 10 / 10 = 52
        `FLAGS(NE|GT) 


        ////////////////////////////////////////////////////////////// BCD_MOD 
        assign a = 0; 
        assign b = 0; 
        assign _flag_c_in = 'x;
        assign alu_op = OP_BA_MOD_10;
        PD;
        `Equals(o, 8'b0)
        `FLAGS(Z|EQ) 

        assign a = 0; 
        assign b = 1; // carry in < 10 
        PD;
        `Equals(o, 8'd6);
        `FLAGS(NE|LT) 

        assign a = 1; 
        assign b = 10; // carry un MUST BE < 10 
        PD;
        `Equals(o, 8'd0);
        `FLAGS(O|Z|NE|LT) 

        assign a = 10; 
        assign b = 2; // carry in < 10 
        PD;
        `Equals(o, 8'd2); // 2*256 + 10 % 10 = 2
        `FLAGS(NE|GT) 


        ////////////////////////////////////////////////////////////// B_MINUS_1
        assign a = 0; // NA
        assign b = 0; 
        assign _flag_c_in = 'x;
        assign alu_op = OP_B_MINUS_1;
        PD;
        `Equals(o, 8'b11111111)
        `FLAGS(C|N|EQ) 

        assign a = 0; // NA
        assign b = 1;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b0)
        `FLAGS(Z|NE|LT) 

        assign a = 0; // NA
        assign b = 127;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 126) 
        `FLAGS(NE|LT) 

        assign a = 0; // NA
        assign b = 128; // 128 unsigned reads as -128 signed
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 127); // 128-1=127 unsigned = same as -128-1=overflow signed
        `FLAGS(O|NE|LT) 

        assign a = 0; // NA
        assign b = 255; // 128 unsigned reads as -128 signed
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 254); // 255-1=254 unsigned = same as -1-1=-2 signed
        `Equals(o, 8'(-2)); // 255-1=254 unsigned = same as -1-1=-2 signed
        `FLAGS(N|NE|LT) 

        ////////////////////////////////////////////////////////////// B_PLUS_1
        assign a = 0; // NA
        assign b = 0; 
        assign _flag_c_in = 'x;
        assign alu_op = OP_B_PLUS_1;
        PD;
        `Equals(o, 1)
        `FLAGS(EQ) 

        assign a = 0; // NA
        assign b = 1;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 2)
        `FLAGS(NE|LT) 

        assign a = 0; // NA
        assign b = 127;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 128) 
        `FLAGS(O|N|NE|LT) 

        assign a = 0; // NA
        assign b = 128; // 128 unsigned reads as -128 signed
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 129); // 128+1=129 unsigned = same as -128+1=overflow signed
        `Equals(o, 8'(-127)); // 128+1=129 unsigned = same as -128+1=overflow signed
        `FLAGS(N|NE|LT) 

        assign a = 0; // NA
        assign b = 255; // 255 reads as -1
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 0); // 255-1=254 unsigned = same as -1-1=-2 signed
        `FLAGS(C|Z|NE|LT) 


        ////////////////////////////////////////////////////////////// A_PLUS_B

        assign a = 8'b00000000;
        assign b = 8'b00000000;
        assign _flag_c_in='x;
        assign alu_op = OP_A_PLUS_B;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(Z | EQ ) // CORRECT 

        assign a = 8'b00000000;
        assign b = 8'b11111111;
        assign _flag_c_in='x;
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(N | NE|  LT )

        // -86 + -127 is the same as 
        assign a = 8'b10101010; // -86 = 170 unsigned
        assign b = 8'b10000001; // -127 = 129 unsigned
        assign _flag_c_in='x;
        PD;
        `Equals(o, 8'b00101011); // +43 so this is signed overflow but also carry because 170+129=42 carry 1
        `FLAGS(C | O | NE | GT)

        // UNSIGNED & TWOS COMP
        // 1 UN - 5 TC   = -4 TC = 252 UN
        // 1 UN + 251 UN = -4 TC = 252 UN
        assign a = 1;  
        assign b = -5; // same as 251 unsigned
        assign _flag_c_in='x;
        PD;
        `Equals(o, 8'(-4)); // 1+-5=-4   
        `Equals(o, 252); // but also 1+251 unsigned = 252
        `FLAGS(N | NE | LT) // LT because 1 < -5 when considered as unsigned 8 bit

        // -5 +3 = -2 
        assign a = 251; // -5
        assign b = 3;   // +3
        assign _flag_c_in='x;
        PD;
        `Equals(o, 8'b11111110); // -2
        `FLAGS(N|NE|GT)

        assign a = 1;
        assign b = -1; 
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 0); // signed 1 + -1 = 0,  unsigned 1+255=0 carry 1
        `FLAGS(C|Z|NE|LT) 

        assign a = 1;
        assign b = 1;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'd2);
        `FLAGS(EQ) 

        ////////////////////////////////////////////////////////////// A_MINUS_B

        assign a = 1;
        assign b = 3;
        assign _flag_c_in = 'x;
        assign alu_op = OP_A_MINUS_B;
        PD;
        `Equals(o, 8'b11111110); // -2 = 254 unsigned
        `Equals(o, -8'd2); // also can write a negative twos complement like this
        `FLAGS(C|N|NE|LT)  // 1-3 = -2   but also  1 - 254 unsigned = 255 borrow 1

        assign a = 1;
        assign b = -3; // same as 254
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b00000100); // 1 - -3 = +4    but also 1-254 = 255 borrow 1
        `Equals(o, 8'd4); // also can write a negative twos complement like this
        `FLAGS(C|NE|LT)  // O set and C set - bug FIXME

        // -255=0-255  is (9'b100000001) too big for 8 bits so overflow
        assign a = 0;
        assign b = 255; // 255 unsigned = but this is -1 in twos complement
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'h01); // 0 - -1 = +1   , but in unsigned this is 0-255 = 1 borrow 1
        `FLAGS(C|NE|LT) 

        ////////////////////////////////////////////////////////////// B_MINUS_A
        assign a = 1;
        assign b = 1;
        assign _flag_c_in = 'x;
        assign alu_op = OP_B_MINUS_A;
        PD;
        `Equals(o, 0);
        `FLAGS(Z|EQ)

        assign a = 1;
        assign b = 3;
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'd2);
        `FLAGS(NE|LT)  

        assign a = 1;
        assign b = -3; // same as 253
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'd252); // -3 -1 = -4    but also 253 - 1 = 252
        `Equals(o, -8'd4); // also can write a negative twos complement like this
        `FLAGS(N|NE|LT)   

        // 255=0-255  is (9'b100000001) too big for 8 bits so overflow
        assign a = 0;
        assign b = 255; // 255 unsigned = but this is -1 in twos complement
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 255); //  -1 - 1 = -1 
        `FLAGS(N|NE|LT) 


        ////////////////////////////////////////////////////////// A_MINUS_B_SIGNEDMAG 
        assign a = 1;
        assign b = 3;
        assign _flag_c_in = 'x;
        assign alu_op = OP_A_MINUS_B_SIGNEDMAG;
        PD;
        `Equals(o, 8'b11111110); // -2 = 254 unsigned
        `Equals(o, -8'd2); // also can write a negative twos complement like this
        `FLAGS(C|N|NE|LT)  // 1-3 = -2   but also  1 - 254 unsigned = 255 borrow 1

        assign a = 1;
        assign b = -3; // same as 254
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'b00000100); // 1 - -3 = +4    but also 1-254 = 255 borrow 1
        `Equals(o, 8'd4); // also can write a negative twos complement like this
        `FLAGS(C|NE|GT)  // O set and C set - bug FIXME

        // -255=0-255  is (9'b100000001) too big for 8 bits so overflow
        assign a = 0;
        assign b = 255; // 255 unsigned = but this is -1 in twos complement
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'h01); // 0 - -1 = +1   , but in unsigned this is 0-255 = 1 borrow 1
        `FLAGS(C|NE|GT) 

        assign a = 1;
        assign b = 1; 
        assign _flag_c_in = 'x;
        PD;
        `Equals(o, 8'h00);
        `FLAGS(Z|EQ) 


        ////////////////////////////////////////////////////////////// A_PLUS_B_PLUS_C

        assign a = 8'b00000000; 
        assign b = 8'b00000000; 
        assign _flag_c_in=1;
        assign alu_op = OP_A_PLUS_B_PLUS_C;
        PD;
        `Equals(o, 8'b00000000); // +43 so this is signed overflow but also carry because 170+129=42 carry 1
        `FLAGS(Z | EQ) // CORRECT

        assign a = 8'b00000000; 
        assign b = 8'b00000000; 
        assign _flag_c_in=0;
        assign alu_op = OP_A_PLUS_B_PLUS_C;
        PD;
        `Equals(o, 8'b00000001); // +43 so this is signed overflow but also carry because 170+129=42 carry 1
        `FLAGS(EQ)


        assign a = 8'b10101010; // -86 = 170 unsigned
        assign b = 8'b10000001; // -127 = 129 unsigned
        assign _flag_c_in=0;
        assign alu_op = OP_A_PLUS_B_PLUS_C;
        PD;
        `Equals(o, 8'b00101100); // +43 so this is signed overflow but also carry because 170+129=42 carry 1
        `FLAGS(C | O | NE | GT)

        // UNSIGNED & TWOS COMP
        // 1 UN - 5 TC   = -4 TC = 252 UN
        // 1 UN + 251 UN = -4 TC = 252 UN
        assign a = 1;  
        assign b = -5; // same as 251 unsigned
        assign _flag_c_in=0;
        PD;
        `Equals(o, 8'(-3)); // 1+-5=-4   
        `Equals(o, 8'(253)); // but also 1+251 unsigned = 252
        `FLAGS(N | NE | LT) // LT because 1 < -5 when considered as unsigned 8 bit

        // -5 +3 = -2 
        assign a = 251; // -5
        assign b = 3;   // +3
        assign _flag_c_in=0;
        PD;
        `Equals(o, 8'b11111111); // -2
        `FLAGS(N|NE|GT)

        assign a = 1;
        assign b = -1; 
        assign _flag_c_in =0;
        PD;
        `Equals(o, 1); // signed 1 + -1 + 1 = 0,  unsigned 1+255+1=1 carry 1
        `FLAGS(C|NE|LT) 

        assign a = 1;
        assign b = 1;
        assign _flag_c_in = 1; // will be promoted to low bank of A+B
        PD;
        `Equals(o, 8'd2);
        `FLAGS(EQ) 


        ////////////////////////////////////////////////////////////// A_MINUS_B_MINUS_C

        // zero boundary tests
        assign a = 1;
        assign b = 0;
        assign _flag_c_in = 1; 
        assign alu_op = OP_A_MINUS_B_MINUS_C; 
        PD;
        `Equals(o, 1);
        `FLAGS(NE|GT)
        assign a = 1;

        assign b = 1;
        assign _flag_c_in = 1; 
        PD;
        `Equals(o, 0);
        `FLAGS(Z|EQ)

        assign b = 1;
        assign _flag_c_in = 0; 
        PD;
        `Equals(o, 8'hff);
        `FLAGS(C|N|EQ)


        // minus-munus make positive
        assign a = 1;
        assign b = 3;
        assign _flag_c_in = 0;
        PD;
        `Equals(o, 8'b11111101); // -2 = 254 unsigned
        `Equals(o, -8'd3); // also can write a negative twos complement like this
        `FLAGS(C|N|NE|LT)  // 1-3 = -2   but also  1 - 254 unsigned = 255 borrow 1

        assign a = 1;
        assign b = -3; // same as 254
        assign _flag_c_in = 0;
        PD;
        `Equals(o, 8'd3); //  ((1 - (-3)) - 1) = 3
        `FLAGS(C|NE|LT)  // O set and C set - bug FIXME


        // overflow boundary test 
        // -255=0-255  is (9'b100000001) too big for 8 bits so overflow
        assign a = 0;
        assign b = (`MAX_POS-1);
        assign _flag_c_in = 1;
        PD;
        `Equals(o, 8'b10000010); // -126
        `FLAGS(C|N|NE|LT)

        assign a = 0;
        assign b = `MAX_POS;
        assign _flag_c_in = 1;
        PD;
        `Equals(o, 8'b10000001); // -127
        `FLAGS(C|N|NE|LT)

        assign a = 0;
        assign b = `MAX_POS;
        assign _flag_c_in = 0;
        PD;
        `Equals(o, 8'b10000000); // -128
        `FLAGS(C|N|NE|LT)

        ////////////////////////////////////////////////////////////// B_MINUS_A_MINUS_C
        assign a = 1;
        assign b = 1;
        assign _flag_c_in = 0;
        assign alu_op = OP_B_MINUS_A_MINUS_C;
        PD;
        `Equals(o, 8'd255);
        `FLAGS(C|N|EQ)

        assign a = 1;
        assign b = 3;
        assign _flag_c_in = 0;
        PD;
        `Equals(o, 8'd1);
        `FLAGS(NE|LT)  

        assign a = 1;
        assign b = -3; // same as 253
        assign _flag_c_in = 0;
        PD;
        `Equals(o, 8'd251); // (-3 -1 = -4) -1c = -5    but also 253 - 1 -1 = 251
        `Equals(o, -8'd5); 
        `FLAGS(N|NE|LT)   

        // 255=0-255  is (9'b100000001) too big for 8 bits so overflow
        assign a = 0;
        assign b = 255; // 255 unsigned = but this is -1 in twos complement
        assign _flag_c_in = 0;
        PD;
        `Equals(o, 8'd254); //  (-1 - 0) -1  = -2 
        `FLAGS(N|NE|LT) 

        assign a = 1;
        assign b = 1;
        assign _flag_c_in = 1; 
        PD;
        `Equals(o, 8'd0);
        `FLAGS(Z|EQ)

        ////////////////////////////////////////////////////////////// A_TIMES_B_HI
        // TIMES
        assign a = 8'hff;
        assign b = 8'h00;
        assign _flag_c_in = 1'bx;
        assign alu_op = OP_A_TIMES_B_HI;
        PD;
        `Equals(o, 8'h00);
        `FLAGS(Z|NE|GT)  

        assign a = 8'h0F;
        assign b = 8'h0F;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b00000000); // 0f*0f=00e1
        `Equals(_flag_c, 1'b1);
        `FLAGS(EQ|Z) 

        assign a = 8'hFF;
        assign b = 8'hFF;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'hFE);
        `FLAGS(N|EQ) 

        assign a = 8'hF0;
        assign b = 8'h10;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'h0F); // 0f00
        `FLAGS(NE|GT) 

        ////////////////////////////////////////////////////////////// A_TIMES_B_LO
        assign a = 8'hff;
        assign b = 8'h00;
        assign _flag_c_in = 1'bx;
        assign alu_op = OP_A_TIMES_B_LO;
        PD;
        `Equals(o, 8'h00);
        `FLAGS(Z|NE|GT)  

        assign a = 8'h0f;
        assign b = 8'h0f;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'he1);
        `FLAGS(N|EQ)  

        assign a = 8'hFF;
        assign b = 8'hFF;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'h01);
        `FLAGS(C|EQ)  // carry here indicates that the upper byte is non-zero


        ////////////////////////////////////////////////////////////// A_DIV_B
        assign a = 8'haa;
        assign b = 8'h02;
        assign _flag_c_in = 1'bx;
        assign alu_op = OP_A_DIV_B;
        PD;
        `Equals(o, 8'h55);
        `FLAGS(NE|GT)  

        assign a = 8'haa;
        assign b = 8'h00;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b0);
        `FLAGS(O|Z|NE|GT)  // overflow indicate div/0


        ////////////////////////////////////////////////////////////// A_MOD_B
        assign a = 8'd7;
        assign b = 8'd2;
        assign _flag_c_in = 1'bx;
        assign alu_op = OP_A_MOD_B;
        PD;
        `Equals(o, 8'd1);
        `FLAGS(NE|GT) 

        assign a = 8'haa;
        assign b = 8'h00;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b0);
        `FLAGS(O|Z|NE|GT)  // overflow indicate div/0

        ////////////////////////////////////////////////////////////// A_LSL_B
        assign a = 8'b10000010;
        assign b = 0;
        assign _flag_c_in = 'x;
        assign alu_op = OP_A_LSL_B;
        PD;
        `Equals(o, 8'b10000010);
        `FLAGS(N|NE|GT)  

        assign b = 1;
        PD;
        `Equals(o, 8'b00000100);
        `FLAGS(O|C|NE|GT)  

        assign b = 6;
        PD;
        `Equals(o, 8'b10000000);
        `FLAGS(N|NE|GT)  

        assign b = 0;
        PD;
        `Equals(o, 8'b10000010);
        `FLAGS(N|NE|GT)  

        assign b = 2;
        PD;
        `Equals(o, 8'b00001000);
        `FLAGS(O|NE|GT)  

        assign b = 8;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(O|Z|NE|GT)  

        assign b = 9;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(O|Z|NE|GT)  

        assign b = 10;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(O|Z|NE|GT)  

        ////////////////////////////////////////////////////////////// A_LSR_B

        assign a = 8'b10000001;
        assign b = 0;
        assign _flag_c_in = 'x;
        assign alu_op = OP_A_LSR_B;
        PD;
        `Equals(o, 8'b10000001);
        `FLAGS(N|NE|GT)  

        assign b = 1;
        PD;
        `Equals(o, 8'b01000000);
        `FLAGS(O|C|NE|GT)  

        assign b = 2;
        PD;
        `Equals(o, 8'b00100000);
        `FLAGS(O|NE|GT)  

        assign b = 8;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(O|C|Z|NE|GT)  

        assign b = 9;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(O|Z|NE|GT)  

        assign b = 10;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(O|Z|NE|GT)  

        ////////////////////////////////////////////////////////////// A_ASR_B

        assign a = 8'b10000001;
        assign b = 0;
        assign _flag_c_in = 'x;
        assign alu_op = OP_A_ASR_B;
        PD;
        `Equals(o, 8'b10000001);
        `FLAGS(N|NE|GT)  

        assign b = 1;
        PD;
        `Equals(o, 8'b11000000);
        `FLAGS(C|N|NE|GT)  

        assign b = 2;
        PD;
        `Equals(o, 8'b11100000);
        `FLAGS(N|NE|GT)  

        assign b = 6;
        PD;
        `Equals(o, 8'b11111110);
        `FLAGS(N|NE|GT)  

        assign b = 7;
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(N|NE|GT)  

        assign b = 8;
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(C|N|NE|GT)  

        assign b = 9;
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(C|N|NE|GT)  

        assign b = 10;
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(C|N|NE|GT)  

        // POSTIVE NUMBERS
        assign a = 8'b00000100;
        assign b = 2;
        PD;
        `Equals(o, 8'b00000001);
        `FLAGS(NE|GT)  

        assign b = 3;
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(C|Z|NE|GT)  

        ////////////////////////////////////////////////////////////// A_RLC_B


        assign a = 8'b10000001;
        assign b = 0;
        assign _flag_c_in = 1'bx;
        assign alu_op = OP_A_RLC_B;
        PD;
        `Equals(o, 8'b10000001);
        `FLAGS(N|NE|GT)  

        assign b = 1;
        PD;
        `Equals(o, 8'b00000011);
        `FLAGS(C|O|NE|GT)  

        assign b = 2;
        PD;
        `Equals(o, 8'b00000110);
        `FLAGS(O|NE|GT)  

        assign b = 3;
        PD;
        `Equals(o, 8'b00001100);
        `FLAGS(O|NE|GT)  

        assign b = 8;
        PD;
        `Equals(o, 8'b10000001); 
        `FLAGS(C|N|NE|GT)  

        ////////////////////////////////////////////////////////////// A_RRC_B

        assign a = 8'b10000001;
        assign b = 0;
        assign _flag_c_in = 'x;
        assign alu_op = OP_A_RRC_B;
        PD;
        `Equals(o, 8'b10000001);
        `FLAGS(N|NE|GT)  

        assign b = 1;
        PD;
        `Equals(o, 8'b11000000);
        `FLAGS(C|N|NE|GT)  

        assign b = 2;
        PD;
        `Equals(o, 8'b01100000); // first shift should have put lower bit '0' into carry and filled top bit from carry '1'  so second therefore  11000000->0   to second shift is 01100000->0
        `FLAGS(O|NE|GT)  

        assign b = 8;
        PD;
        `Equals(o, 8'b10000001); // first shift should have put lower bit '0' into carry and filled top bit from carry '1'  so second therefore  11000000->0   to second shift is 01100000->0
        `FLAGS(C|N|NE|GT)  


        ////////////////////////////////////////////////////////////// A_AND_B
        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b10100000; // LOGICAL VALUE
        assign alu_op = OP_A_AND_B;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b10000000);
        `FLAGS(N|NE|GT)

        assign b = 8'b11111111; // LOGICAL VALUE
        PD;
        `Equals(o, 8'b11010101);
        `FLAGS(N|NE|LT)

        assign b = 8'b00000000; // LOGICAL VALUE
        PD;
        `Equals(o, 8'b00000000);
        `FLAGS(Z|NE|GT)

        ////////////////////////////////////////////////////////////// A_OR_B
        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b10100000; // LOGICAL VALUE
        assign alu_op = OP_A_OR_B;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b11110101);
        `FLAGS(N|NE|GT)

        assign b = 8'b11111111; // LOGICAL VALUE
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(N|NE|LT)

        assign b = 8'b00000000; // LOGICAL VALUE
        PD;
        `Equals(o, 8'b11010101);
        `FLAGS(N|NE|GT)

        ////////////////////////////////////////////////////////////// A_XOR_B
        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b10100000; // LOGICAL VALUE
        assign alu_op = OP_A_XOR_B;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b01110101);
        `FLAGS(NE|GT)

        assign b = 8'b11111111; // LOGICAL VALUE
        PD;
        `Equals(o, 8'b00101010);
        `FLAGS(NE|LT)

        assign b = 8'b00000000; // LOGICAL VALUE
        PD;
        `Equals(o, 8'b11010101);
        `FLAGS(N|NE|GT)

        ////////////////////////////////////////////////////////////// A_NAND_B
        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b10100000; // LOGICAL VALUE
        assign alu_op = OP_A_NAND_B;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b01111111);
        `FLAGS(NE|GT)

        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b11111111; // LOGICAL VALUE
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b00101010);
        `FLAGS(NE|LT)

        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b00000000; // LOGICAL VALUE
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b11111111);
        `FLAGS(N|NE|GT)


        ////////////////////////////////////////////////////////////// NOT_B
        assign a = 8'b11010101; // LOGICAL VALUE
        assign b = 8'b10100000; // LOGICAL VALUE
        assign alu_op = OP_NOT_B;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'b01011111);
        `FLAGS(NE|GT)

        ////////////////////////////////////////////////////////////// OP_A_PLUS_B_BCD
        assign a = 8'h29; 
        assign b = 8'h32; 
        assign alu_op = OP_A_PLUS_B_BCD;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'h61);
        `FLAGS(NE|LT)

        assign a = 8'h99; 
        assign b = 8'h00; 
        PD;
        `Equals(o, 8'h99);
        `FLAGS(NE|GT) 

        assign a = 8'h99; 
        assign b = 8'h01; 
        PD;
        `Equals(o, 8'h00);
        `FLAGS(C|Z|NE|GT)

        assign a = 8'h99; 
        assign b = 8'h99; 
        PD;
        `Equals(o, 8'h98);
        `FLAGS(C|EQ)

        // not legal BCD but a test to see that tens and units are still respected
        assign a = 8'haa;  // in broken BCD = 10*100 + 10 = 110 which rolls over to 10
        assign b = 8'h01; 
        PD;
        `Equals(o, 8'h11); // 10 +1 = 11
        `FLAGS(C|NE|GT)

        assign a = 8'h00; 
        assign b = 8'h0a; // 10 in the unit column - this is not a valid BCD input - but the result should be converted to BCD nonetheless
        PD;
        `Equals(o, 8'h10);
        `FLAGS(NE|LT) 

        assign a = 8'haa; // 10*100+10 = 110 
        assign b = 8'h11; // 11
        PD;
        `Equals(o, 8'h21);  // 110 + 11 = 121 => 21
        `FLAGS(C|NE|GT) 


        ////////////////////////////////////////////////////////////// OP_A_MINUS_B_BCD
        assign a = 8'h70; 
        assign b = 8'h25; 
        assign alu_op = OP_A_MINUS_B_BCD;
        assign _flag_c_in = 1'bx;
        PD;
        `Equals(o, 8'h45);
        `FLAGS(NE|GT)

        assign a = 8'h00; 
        assign b = 8'h01; 
        PD;
        `Equals(o, 8'h99);
        `FLAGS(C|N|NE|LT)

        // not legal BCD but a test to see that tens and units are still respected
        assign a = 8'haa; 
        assign b = 8'hff; 
        PD;
        `Equals(o, 8'h45); // 110-165=-55 (100-55=45)
        `FLAGS(C|N|NE|LT) 


        //////////////////////////////////////////////////////////////////////
        PD;
        $display("---");
        $display("done : %d tests", testcount);
        

    end
endmodule : test
