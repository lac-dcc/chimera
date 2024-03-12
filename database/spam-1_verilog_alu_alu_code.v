// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY 
// verilator lint_off UNOPTFLAT 
// verilator lint_off WIDTH 

// EG USE M27C322 21bit address x16 data

// See also http://teaching.idallen.com/dat2343/10f/notes/040_overflow.txt#:~:text=The%20ALU%20doesn't%20know,after%20the%20math%20is%20done.

`ifndef  V_ALU_ROM
`define  V_ALU_ROM
`include "alu_ops.v"

`timescale 1ns/1ns

module alu_code #(parameter LOG=0, PD=80) (
    output [7:0] o,

    output _flag_c,
    output _flag_z,
    output _flag_n,
    output _flag_o,
    output _flag_eq,
    output _flag_ne,
    output _flag_gt,
    output _flag_lt,

    input  [7:0] a,
    input  [7:0] b,
    input  [4:0] alu_op
);
    import alu_ops::*;

    logic signed [9:0] c_buf_c;


    task set_ctop(c);
        c_buf_c[9] =c;
    endtask
    task set_cbot(c);
        c_buf_c[0] =c;
    endtask
    task set_result([7:0] r);
        c_buf_c = {1'b0, r, 1'b0};
    endtask
    task set_result9([8:0] r);
        c_buf_c = {r, 1'b0};
    endtask

    function [7:0] alu_result();
         alu_result = c_buf_c[8:1];
    endfunction

    function result_sign();
         result_sign = c_buf_c[8];
    endfunction

    function c_top();
        c_top = c_buf_c[9];
    endfunction

    function c_bot();
        c_bot = c_buf_c[0];
    endfunction

    logic _overflow;
    logic _force_neg;
    logic force_pos;

    assign #(PD) o = c_buf_c[8:1];
    assign #(PD) _flag_c = !c_buf_c[9];
    assign #(PD) _flag_z = !(c_buf_c[8:1] == 8'b0);
    assign #(PD) _flag_n = force_pos | (_force_neg & (!c_buf_c[8])); // top bit set indicates negative in signed arith
    assign #(PD) _flag_o = _overflow;
    assign #(PD) _flag_eq = !(a == b);    
    assign #(PD) _flag_ne = !(a != b);  

    // unsigned magnitude comparison of the input values.
    // if the bytes are eg two complement signed then this will produce incorrect results.
    // if this is the case then use a subtract operation instead
    logic unsigned_magnitude=1;

    // cast to signed numbers
    wire signed [7:0] signed_a = a;
    wire signed [7:0] signed_b = b;
    wire signed [7:0] signed_o = o;

    // optionally perform signed/unsigned mag comparison
    assign #(PD) _flag_gt = unsigned_magnitude ? !(a>b) : !(signed_a > signed_b);
    assign #(PD) _flag_lt = unsigned_magnitude ? !(a<b) : !(signed_a < signed_b);

    logic [15:0] TimesResult;

    // http://class.ece.iastate.edu/arun/Cpre381/lectures/arithmetic.pdf
    // pass sign bits in for subtraction overflow
    // - No overflow when adding a +ve and a -ve number
    // - No overflow when signs are the same for subtraction (because -- means a +)
    //- overflow when adding two +ves yields a -ve
    
    //- or, subtract a -ve from a +ve and get a -ve
    //- or, subtract a +ve from a -ve and get a +ve
    function _subOv(left, right, o);
        //$display("_subOv l=%b r=%b o=%b", left, right, o);
        if (left==right) return 1; // signs same subtraction
        if (!left & right & o) return 0; // pos sub neg eq neg
        if (left & !right & !o) return 0; // neg sub pos eq pos
        return 1;
    endfunction

    // http://class.ece.iastate.edu/arun/Cpre381/lectures/arithmetic.pdf
    // pass sign bits in for addition overflow
    // - No overflow when adding a +ve and a -ve number
    // - No overflow when signs are the same for subtraction (because -- means a +)
    //- overflow when adding two +ves yields a -ve
    //- or, adding two -ves gives a +ve
    //- or, subtract a -ve from a +ve and get a -ve
    //- or, subtract a +ve from a -ve and get a +ve
    function _addOv(left, right, o);
        //$display("_addOv l=%b r=%b o=%b", left, right, o);
        if (left!=right) return 1; // signs diff 
        if (left & right & !o) return 0; // pos add neg eq neg
        if (!left & !right & o) return 0; // neg add pos eq pos
        return 1;
    endfunction

    int count;

    //////////////////////////////////////////////////////
    // ROM PROGRAMMING
    //////////////////////////////////////////////////////

    always @* begin

        c_buf_c = 'x; // use x to ensure this isn't relied upon unless expicitely set
        _overflow = 1'b1;
        _force_neg = 1'b1;
        force_pos = 1'b0;
        unsigned_magnitude=1; // select whether a given op will use signed or unsigned arithmetic

        case (alu_op)
            OP_0: begin // not needed anymore cos immed allows 0 value into ALU
                set_result(0);
            end
            OP_A: begin // this is not the same as "A+0 immediate" because + takes carry into account and what we want is PASSA so maybe call it PASSA?
                set_result(a);
            end
            OP_B: begin // this is not the same as "B+0 immediate" because + takes carry into account and what we want is PASSB so maybe call it PASSB?
                set_result(b);
            end
            OP_NEGATE_A: begin  // eg switches -1 to 255 and 255 to -1
                set_result(-a); 
                _overflow = !(a==8'b10000000); // indicates the argument cannot be converted
            end
            OP_NEGATE_B: begin 
                set_result(-b);
                _overflow = !(b==8'b10000000); // indicates the argument cannot be converted
            end
            OP_BA_DIV_10: begin 

                if ( b >= 10 ) begin
                    _overflow =0;
                    TimesResult = 0;
                end
                else
                begin
                    TimesResult = (a + (b*256))/10;
                end
                set_result9(8'(TimesResult));
                //    $display("TR %d/%4h/%b    %10b", TimesResult, TimesResult, TimesResult, c_buf_c);
            end
            OP_BA_MOD_10: begin 
                if ( b >= 10 ) begin
                    _overflow =0;
                    TimesResult = 0;
                end
                else
                begin
                    TimesResult = (a + (b*256))%10;
                end
                set_result9(8'(TimesResult));
            end

            OP_B_PLUS_1: begin 
                // UNLIKE B_PLUS_A this sets carry but doesn't consume it 
                // - useful for low byte of a counter where we always want CLC first  
                // THIS INST USED TO ADD ONE TO IMMED 255 TO ACHIEVE A "SET CARRY" OPERATION
                set_result9(b + 1);
                _overflow = _addOv(b[7], 1'b0, result_sign());
            end
            ///// 8 ...
            OP_B_MINUS_1: begin 
                // UNLIKE B_MINUS_A this sets carry but doesn't consume it 
                // - useful for low byte of a counter where we always want CLC first  
                set_result9(b - 1);
                _overflow = _subOv(b[7], 1'b0, result_sign());
            end

            // low bank is when CIN=0 or these ops were directly selected
            OP_A_PLUS_B: begin  
                set_result9(a + b);
                _overflow = _addOv(a[7], b[7], o[7]);
            end
            OP_A_MINUS_B: begin 
                set_result9(a - b);
                _overflow = _subOv(a[7], b[7], o[7]);
            end
            OP_B_MINUS_A: begin 
                set_result9(b - a);
                _overflow = _subOv(b[7], a[7], o[7]);
            end

            OP_A_MINUS_B_SIGNEDMAG: begin 
                set_result9(a - b);
                unsigned_magnitude=0;
                _overflow = _subOv(a[7], b[7], o[7]);
            end

            OP_A_PLUS_B_PLUS_C: begin  // OP ONLY USED WHEN CARRY IS ACTIVE
                set_result9((a + b) + 1); 
                _overflow = _addOv(a[7], b[7], o[7]);
            end
            OP_A_MINUS_B_MINUS_C: begin // OP ONLY USED WHEN CARRY IS ACTIVE
                set_result9((a - b) - 1); 
                _overflow = _subOv(a[7],b[7],o[7]);
            end
            OP_B_MINUS_A_MINUS_C: begin // OP ONLY USED WHEN CARRY IS ACTIVE
                set_result9((b - a) - 1); 
                _overflow = _subOv(b[7],a[7],o[7]);
            end

            // 24 .............................................................
            OP_A_TIMES_B_HI: begin 
                TimesResult = (a * b);
                set_result(TimesResult[15:8]);
            end

            OP_A_TIMES_B_LO: begin 
                TimesResult = (a * b);
                set_result9( {(TimesResult[15:8] > 0), TimesResult[7:0] });
            end

            OP_A_DIV_B: begin 
                if (b == 0) begin
                    // div/0
                    // result will be 0 with overflow
                    _overflow=0; // force overflow - when div/0
                    set_ctop(1); // force carry
                    set_result( 0 );
                end
                else
                begin
                    set_result( a/ b );
                end
            end

            OP_A_MOD_B: begin 
                if (b == 0) begin
                    // div/0
                    // result will be 0 with overflow
                    _overflow=0; // force overflow - when div/0
                    set_ctop(1); // force carry
                    set_result( 0 );
                end
                else
                begin
                    set_result( a% b );
                end
            end

            OP_A_LSL_B: begin  // C <- A <- 0
                c_buf_c = {a, 1'b0};
                c_buf_c = c_buf_c << b;
                _overflow = !(a[7] != result_sign()); // sign bit change - not must use but hey ho
            end

            OP_A_LSR_B: begin // 0 -> A -> C
                c_buf_c = {a, 1'b0};
                c_buf_c = c_buf_c >> b;
                set_ctop(c_bot()); // move the carry-out bit to the return value position
                _overflow = !(a[7] != result_sign()); // sign bit change - not must use but hey ho
            end

            OP_A_ASR_B: begin // Sxxxxxxx -> SSxxxxxx  C=last carry out right
                c_buf_c = {a[7], a, 1'b0}; // extend the sign bit left
                c_buf_c = c_buf_c >>> b;
                set_ctop(c_bot()); // move the carry-out bit to the return value position
                _overflow = !(a[7] != result_sign()); // sign bit change can't happen unless this code is flawed
            end

            // C <- A <-   : shifted out value enters other side - last shift ends up in carry out
            //   |     ^
            //   -------
            // https://www.tutorialspoint.com/instruction-type-rlc-in-8085-microprocessor
            OP_A_RLC_B: begin 
                //c_buf_c = {a, 1'b0};
                
                c_buf_c = {a, 1'bx};
                set_ctop(0);
                for (count = 0; count < (b%8); count++) begin
                    c_buf_c[8:1] = { c_buf_c[7:1], c_buf_c[8]};
                end

                if (b>0) set_ctop(c_buf_c[1]);
                _overflow = !(a[7] != result_sign()); // sign bit change - not much use but hey ho
            end

            //   -> A -> C   : shifted out value enters other side - last shift ends up in carry out
            //   ^    |
            //   ------
            OP_A_RRC_B: begin 
                //c_buf_c = {1'b0, a, 1'b0};
                set_ctop(0);
                c_buf_c = {a, 1'bx};
                for (count = 0; count < (b%8); count++) begin
                    c_buf_c[8:1] = { c_buf_c[1], c_buf_c[8:2]};
                end
                if (b>0) set_ctop(c_buf_c[8]);
                _overflow = !(a[7] != result_sign()); // mnot much use
            end


            OP_A_OR_B: begin
                set_result(a | b);
            end
            OP_A_AND_B: begin
                set_result(a & b);
            end
            OP_A_XOR_B: begin
                set_result(a ^ b);
            end
            OP_A_NAND_B: begin
                set_result(~(a & b));
            end
            OP_NOT_B: begin
                set_result(~b);
            end
    

            OP_A_PLUS_B_BCD: begin // DOESNT SUPPORT CARRY IN
                force_pos = 1;

                `define P_A (((a >>4)*10) + (a & 8'h0f))
                `define P_B (((b >>4)*10) + (b & 8'h0f))
                `define P_SUM (`P_A + `P_B)

                `define P_CARRY 8'(`P_SUM/100)
                `define P_REMAIN 8'(`P_SUM % 100)

                `define P_TOP 8'(`P_REMAIN/10)
                `define P_BOT 8'(`P_REMAIN%10)

                set_result9({`P_CARRY, ((`P_TOP<<4) | `P_BOT) });
            end

            OP_A_MINUS_B_BCD: begin // DOESNT SUPPORT CARRY IN
                _force_neg = !(b>a);

                `define S_A 8'(((a >>4)*10) + (a & 8'h0f))
                `define S_B 8'(((b >>4)*10) + (b & 8'h0f))
                `define S_SUM 8'(`S_A + (100-`S_B)) // use add with roll over to avoid havng to deal with wrap around 255

                `define S_CARRY 8'(!(`S_SUM/100)) // use the inverse as we did add not subtract
                `define S_REMAIN 8'(`S_SUM % 100)

                `define S_TOP 8'(`S_REMAIN/10)
                `define S_BOT 8'(`S_REMAIN%10)

                set_result9({`S_CARRY, ((`S_TOP<<4) | `S_BOT) });
            end

            default: begin
                c_buf_c = 10'bxzxzxzxzxz;
                $display("%9t !!!!!!!!!!!!!!!!!!!!!!!!!!!! RANDOM ALU OUT !!!!!!!!!!!!!!!!!!!!!! UNHANDLED alu_op=%5b : alu_op:%-s", $time, alu_op, 
                        aluopName(alu_op)
                        );
            end

        endcase
    end


    if (LOG) 
    always @(*) 
        $display("%9t ALU_CODE", $time,
        " aluop=%-10s (op:%d)", aluopName(alu_op), alu_op, // %1s causes string to lose trailing space
        " ",
        " a=%08b (u%-3d/s%-4d/h%-02h) ", a, a, signed_a, a,
        " b=%08b (u%-3d/s%-4d/h%-02h) ", b, b, signed_b, b,
        " ",
        " out=%08b (u%-3d/s%-4d/h%-02h) ", o, o, signed_o, o,
        " _c%1b",  _flag_c,
        " _z%1b",  _flag_z,
        " _n%1b",  _flag_n,
        " _o%1b",  _flag_o,
        " _eq%1b", _flag_eq,
        " _ne%1b", _flag_ne,
        " _gt%1b", _flag_gt,
        " _lt%1b", _flag_lt,
        " ",
        " u_magnitude=%b ", unsigned_magnitude
         );

endmodule: alu_code

`endif
