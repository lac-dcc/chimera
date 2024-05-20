// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module adder_32bit (
        input [31:0] a,
        input [31:0] b,
        input cin,
        output [31:0] sum,
        output cout) ;
    wire carry ;

    wire [15:0] lower_half_a;
    wire [15:0] lower_half_b;
    wire  lower_half_cin;
    wire [15:0] lower_half_sum;
    wire  lower_half_cout;
    wire [15:0] upper_half_a;
    wire [15:0] upper_half_b;
    wire  upper_half_cin;
    wire [15:0] upper_half_sum;
    wire  upper_half_cout;

    wire  lower_half_carry  ;

    wire [7:0] lower_half_lower_half_a;
    wire [7:0] lower_half_lower_half_b;
    wire  lower_half_lower_half_cin;
    wire [7:0] lower_half_lower_half_sum;
    wire  lower_half_lower_half_cout;
    wire [7:0] lower_half_upper_half_a;
    wire [7:0] lower_half_upper_half_b;
    wire  lower_half_upper_half_cin;
    wire [7:0] lower_half_upper_half_sum;
    wire  lower_half_upper_half_cout;
    wire [7:0] upper_half_lower_half_a;
    wire [7:0] upper_half_lower_half_b;
    wire  upper_half_lower_half_cin;
    wire [7:0] upper_half_lower_half_sum;
    wire  upper_half_lower_half_cout;
    wire [7:0] upper_half_upper_half_a;
    wire [7:0] upper_half_upper_half_b;
    wire  upper_half_upper_half_cin;
    wire [7:0] upper_half_upper_half_sum;
    wire  upper_half_upper_half_cout;

    wire  lower_half_lower_half_carry  ;

    wire [3:0] lower_half_lower_half_lower_half_a;
    wire [3:0] lower_half_lower_half_lower_half_b;
    wire  lower_half_lower_half_lower_half_cin;
    wire [3:0] lower_half_lower_half_lower_half_sum;
    wire  lower_half_lower_half_lower_half_cout;
    wire [3:0] lower_half_lower_half_upper_half_a;
    wire [3:0] lower_half_lower_half_upper_half_b;
    wire  lower_half_lower_half_upper_half_cin;
    wire [3:0] lower_half_lower_half_upper_half_sum;
    wire  lower_half_lower_half_upper_half_cout;
    wire [3:0] lower_half_upper_half_lower_half_a;
    wire [3:0] lower_half_upper_half_lower_half_b;
    wire  lower_half_upper_half_lower_half_cin;
    wire [3:0] lower_half_upper_half_lower_half_sum;
    wire  lower_half_upper_half_lower_half_cout;
    wire [3:0] lower_half_upper_half_upper_half_a;
    wire [3:0] lower_half_upper_half_upper_half_b;
    wire  lower_half_upper_half_upper_half_cin;
    wire [3:0] lower_half_upper_half_upper_half_sum;
    wire  lower_half_upper_half_upper_half_cout;
    wire [3:0] upper_half_lower_half_lower_half_a;
    wire [3:0] upper_half_lower_half_lower_half_b;
    wire  upper_half_lower_half_lower_half_cin;
    wire [3:0] upper_half_lower_half_lower_half_sum;
    wire  upper_half_lower_half_lower_half_cout;
    wire [3:0] upper_half_lower_half_upper_half_a;
    wire [3:0] upper_half_lower_half_upper_half_b;
    wire  upper_half_lower_half_upper_half_cin;
    wire [3:0] upper_half_lower_half_upper_half_sum;
    wire  upper_half_lower_half_upper_half_cout;
    wire [3:0] upper_half_upper_half_lower_half_a;
    wire [3:0] upper_half_upper_half_lower_half_b;
    wire  upper_half_upper_half_lower_half_cin;
    wire [3:0] upper_half_upper_half_lower_half_sum;
    wire  upper_half_upper_half_lower_half_cout;
    wire [3:0] upper_half_upper_half_upper_half_a;
    wire [3:0] upper_half_upper_half_upper_half_b;
    wire  upper_half_upper_half_upper_half_cin;
    wire [3:0] upper_half_upper_half_upper_half_sum;
    wire  upper_half_upper_half_upper_half_cout;

    assign {  lower_half_lower_half_lower_half_cout  ,  lower_half_lower_half_lower_half_sum  }=  lower_half_lower_half_lower_half_a  +  lower_half_lower_half_lower_half_b  +  lower_half_lower_half_lower_half_cin  ;



    assign {  lower_half_lower_half_upper_half_cout  ,  lower_half_lower_half_upper_half_sum  }=  lower_half_lower_half_upper_half_a  +  lower_half_lower_half_upper_half_b  +  lower_half_lower_half_upper_half_cin  ;




    wire  lower_half_upper_half_carry  ;


    assign {  lower_half_upper_half_lower_half_cout  ,  lower_half_upper_half_lower_half_sum  }=  lower_half_upper_half_lower_half_a  +  lower_half_upper_half_lower_half_b  +  lower_half_upper_half_lower_half_cin  ;



    assign {  lower_half_upper_half_upper_half_cout  ,  lower_half_upper_half_upper_half_sum  }=  lower_half_upper_half_upper_half_a  +  lower_half_upper_half_upper_half_b  +  lower_half_upper_half_upper_half_cin  ;





    wire  upper_half_carry  ;


    wire  upper_half_lower_half_carry  ;


    assign {  upper_half_lower_half_lower_half_cout  ,  upper_half_lower_half_lower_half_sum  }=  upper_half_lower_half_lower_half_a  +  upper_half_lower_half_lower_half_b  +  upper_half_lower_half_lower_half_cin  ;



    assign {  upper_half_lower_half_upper_half_cout  ,  upper_half_lower_half_upper_half_sum  }=  upper_half_lower_half_upper_half_a  +  upper_half_lower_half_upper_half_b  +  upper_half_lower_half_upper_half_cin  ;




    wire  upper_half_upper_half_carry  ;


    assign {  upper_half_upper_half_lower_half_cout  ,  upper_half_upper_half_lower_half_sum  }=  upper_half_upper_half_lower_half_a  +  upper_half_upper_half_lower_half_b  +  upper_half_upper_half_lower_half_cin  ;



    assign {  upper_half_upper_half_upper_half_cout  ,  upper_half_upper_half_upper_half_sum  }=  upper_half_upper_half_upper_half_a  +  upper_half_upper_half_upper_half_b  +  upper_half_upper_half_upper_half_cin  ;
    assign lower_half_lower_half_lower_half_a = lower_half_lower_half_a[3:0];
    assign lower_half_lower_half_lower_half_b = lower_half_lower_half_b[3:0];
    assign lower_half_lower_half_lower_half_cin = lower_half_lower_half_cin;
    assign lower_half_lower_half_sum[3:0] = lower_half_lower_half_lower_half_sum;
    assign lower_half_lower_half_carry = lower_half_lower_half_lower_half_cout;
    assign lower_half_lower_half_upper_half_a = lower_half_lower_half_a[7:4];
    assign lower_half_lower_half_upper_half_b = lower_half_lower_half_b[7:4];
    assign lower_half_lower_half_upper_half_cin = lower_half_lower_half_carry;
    assign lower_half_lower_half_sum[7:4] = lower_half_lower_half_upper_half_sum;
    assign lower_half_lower_half_cout = lower_half_lower_half_upper_half_cout;
    assign lower_half_upper_half_lower_half_a = lower_half_upper_half_a[3:0];
    assign lower_half_upper_half_lower_half_b = lower_half_upper_half_b[3:0];
    assign lower_half_upper_half_lower_half_cin = lower_half_upper_half_cin;
    assign lower_half_upper_half_sum[3:0] = lower_half_upper_half_lower_half_sum;
    assign lower_half_upper_half_carry = lower_half_upper_half_lower_half_cout;
    assign lower_half_upper_half_upper_half_a = lower_half_upper_half_a[7:4];
    assign lower_half_upper_half_upper_half_b = lower_half_upper_half_b[7:4];
    assign lower_half_upper_half_upper_half_cin = lower_half_upper_half_carry;
    assign lower_half_upper_half_sum[7:4] = lower_half_upper_half_upper_half_sum;
    assign lower_half_upper_half_cout = lower_half_upper_half_upper_half_cout;
    assign upper_half_lower_half_lower_half_a = upper_half_lower_half_a[3:0];
    assign upper_half_lower_half_lower_half_b = upper_half_lower_half_b[3:0];
    assign upper_half_lower_half_lower_half_cin = upper_half_lower_half_cin;
    assign upper_half_lower_half_sum[3:0] = upper_half_lower_half_lower_half_sum;
    assign upper_half_lower_half_carry = upper_half_lower_half_lower_half_cout;
    assign upper_half_lower_half_upper_half_a = upper_half_lower_half_a[7:4];
    assign upper_half_lower_half_upper_half_b = upper_half_lower_half_b[7:4];
    assign upper_half_lower_half_upper_half_cin = upper_half_lower_half_carry;
    assign upper_half_lower_half_sum[7:4] = upper_half_lower_half_upper_half_sum;
    assign upper_half_lower_half_cout = upper_half_lower_half_upper_half_cout;
    assign upper_half_upper_half_lower_half_a = upper_half_upper_half_a[3:0];
    assign upper_half_upper_half_lower_half_b = upper_half_upper_half_b[3:0];
    assign upper_half_upper_half_lower_half_cin = upper_half_upper_half_cin;
    assign upper_half_upper_half_sum[3:0] = upper_half_upper_half_lower_half_sum;
    assign upper_half_upper_half_carry = upper_half_upper_half_lower_half_cout;
    assign upper_half_upper_half_upper_half_a = upper_half_upper_half_a[7:4];
    assign upper_half_upper_half_upper_half_b = upper_half_upper_half_b[7:4];
    assign upper_half_upper_half_upper_half_cin = upper_half_upper_half_carry;
    assign upper_half_upper_half_sum[7:4] = upper_half_upper_half_upper_half_sum;
    assign upper_half_upper_half_cout = upper_half_upper_half_upper_half_cout;

    assign lower_half_lower_half_a = lower_half_a[7:0];
    assign lower_half_lower_half_b = lower_half_b[7:0];
    assign lower_half_lower_half_cin = lower_half_cin;
    assign lower_half_sum[7:0] = lower_half_lower_half_sum;
    assign lower_half_carry = lower_half_lower_half_cout;
    assign lower_half_upper_half_a = lower_half_a[15:8];
    assign lower_half_upper_half_b = lower_half_b[15:8];
    assign lower_half_upper_half_cin = lower_half_carry;
    assign lower_half_sum[15:8] = lower_half_upper_half_sum;
    assign lower_half_cout = lower_half_upper_half_cout;
    assign upper_half_lower_half_a = upper_half_a[7:0];
    assign upper_half_lower_half_b = upper_half_b[7:0];
    assign upper_half_lower_half_cin = upper_half_cin;
    assign upper_half_sum[7:0] = upper_half_lower_half_sum;
    assign upper_half_carry = upper_half_lower_half_cout;
    assign upper_half_upper_half_a = upper_half_a[15:8];
    assign upper_half_upper_half_b = upper_half_b[15:8];
    assign upper_half_upper_half_cin = upper_half_carry;
    assign upper_half_sum[15:8] = upper_half_upper_half_sum;
    assign upper_half_cout = upper_half_upper_half_cout;

    assign lower_half_a = a[15:0];
    assign lower_half_b = b[15:0];
    assign lower_half_cin = cin;
    assign sum[15:0] = lower_half_sum;
    assign carry = lower_half_cout;
    assign upper_half_a = a[31:16];
    assign upper_half_b = b[31:16];
    assign upper_half_cin = carry;
    assign sum[31:16] = upper_half_sum;
    assign cout = upper_half_cout;

endmodule
