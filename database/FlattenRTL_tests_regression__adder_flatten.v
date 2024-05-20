// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module adder_32bit (
        input [31:0] a,
        input [31:0] b,
        input cin,
        output [31:0] sum,
        output cout) ;
    wire carry ;

    wire [15:0] lower_half__a;
    wire [15:0] lower_half__b;
    wire  lower_half__cin;
    wire [15:0] lower_half__sum;
    wire  lower_half__cout;
    wire [15:0] upper_half__a;
    wire [15:0] upper_half__b;
    wire  upper_half__cin;
    wire [15:0] upper_half__sum;
    wire  upper_half__cout;

    wire  lower_half__carry  ;

    wire [7:0] lower_half__lower_half__a;
    wire [7:0] lower_half__lower_half__b;
    wire  lower_half__lower_half__cin;
    wire [7:0] lower_half__lower_half__sum;
    wire  lower_half__lower_half__cout;
    wire [7:0] lower_half__upper_half__a;
    wire [7:0] lower_half__upper_half__b;
    wire  lower_half__upper_half__cin;
    wire [7:0] lower_half__upper_half__sum;
    wire  lower_half__upper_half__cout;
    wire [7:0] upper_half__lower_half__a;
    wire [7:0] upper_half__lower_half__b;
    wire  upper_half__lower_half__cin;
    wire [7:0] upper_half__lower_half__sum;
    wire  upper_half__lower_half__cout;
    wire [7:0] upper_half__upper_half__a;
    wire [7:0] upper_half__upper_half__b;
    wire  upper_half__upper_half__cin;
    wire [7:0] upper_half__upper_half__sum;
    wire  upper_half__upper_half__cout;

    wire  lower_half__lower_half__carry  ;

    wire [3:0] lower_half__lower_half__lower_half__a;
    wire [3:0] lower_half__lower_half__lower_half__b;
    wire  lower_half__lower_half__lower_half__cin;
    wire [3:0] lower_half__lower_half__lower_half__sum;
    wire  lower_half__lower_half__lower_half__cout;
    wire [3:0] lower_half__lower_half__upper_half__a;
    wire [3:0] lower_half__lower_half__upper_half__b;
    wire  lower_half__lower_half__upper_half__cin;
    wire [3:0] lower_half__lower_half__upper_half__sum;
    wire  lower_half__lower_half__upper_half__cout;
    wire [3:0] lower_half__upper_half__lower_half__a;
    wire [3:0] lower_half__upper_half__lower_half__b;
    wire  lower_half__upper_half__lower_half__cin;
    wire [3:0] lower_half__upper_half__lower_half__sum;
    wire  lower_half__upper_half__lower_half__cout;
    wire [3:0] lower_half__upper_half__upper_half__a;
    wire [3:0] lower_half__upper_half__upper_half__b;
    wire  lower_half__upper_half__upper_half__cin;
    wire [3:0] lower_half__upper_half__upper_half__sum;
    wire  lower_half__upper_half__upper_half__cout;
    wire [3:0] upper_half__lower_half__lower_half__a;
    wire [3:0] upper_half__lower_half__lower_half__b;
    wire  upper_half__lower_half__lower_half__cin;
    wire [3:0] upper_half__lower_half__lower_half__sum;
    wire  upper_half__lower_half__lower_half__cout;
    wire [3:0] upper_half__lower_half__upper_half__a;
    wire [3:0] upper_half__lower_half__upper_half__b;
    wire  upper_half__lower_half__upper_half__cin;
    wire [3:0] upper_half__lower_half__upper_half__sum;
    wire  upper_half__lower_half__upper_half__cout;
    wire [3:0] upper_half__upper_half__lower_half__a;
    wire [3:0] upper_half__upper_half__lower_half__b;
    wire  upper_half__upper_half__lower_half__cin;
    wire [3:0] upper_half__upper_half__lower_half__sum;
    wire  upper_half__upper_half__lower_half__cout;
    wire [3:0] upper_half__upper_half__upper_half__a;
    wire [3:0] upper_half__upper_half__upper_half__b;
    wire  upper_half__upper_half__upper_half__cin;
    wire [3:0] upper_half__upper_half__upper_half__sum;
    wire  upper_half__upper_half__upper_half__cout;

    assign {  lower_half__lower_half__lower_half__cout  ,  lower_half__lower_half__lower_half__sum  }=  lower_half__lower_half__lower_half__a  +  lower_half__lower_half__lower_half__b  +  lower_half__lower_half__lower_half__cin  ;



    assign {  lower_half__lower_half__upper_half__cout  ,  lower_half__lower_half__upper_half__sum  }=  lower_half__lower_half__upper_half__a  +  lower_half__lower_half__upper_half__b  +  lower_half__lower_half__upper_half__cin  ;




    wire  lower_half__upper_half__carry  ;


    assign {  lower_half__upper_half__lower_half__cout  ,  lower_half__upper_half__lower_half__sum  }=  lower_half__upper_half__lower_half__a  +  lower_half__upper_half__lower_half__b  +  lower_half__upper_half__lower_half__cin  ;



    assign {  lower_half__upper_half__upper_half__cout  ,  lower_half__upper_half__upper_half__sum  }=  lower_half__upper_half__upper_half__a  +  lower_half__upper_half__upper_half__b  +  lower_half__upper_half__upper_half__cin  ;





    wire  upper_half__carry  ;


    wire  upper_half__lower_half__carry  ;


    assign {  upper_half__lower_half__lower_half__cout  ,  upper_half__lower_half__lower_half__sum  }=  upper_half__lower_half__lower_half__a  +  upper_half__lower_half__lower_half__b  +  upper_half__lower_half__lower_half__cin  ;



    assign {  upper_half__lower_half__upper_half__cout  ,  upper_half__lower_half__upper_half__sum  }=  upper_half__lower_half__upper_half__a  +  upper_half__lower_half__upper_half__b  +  upper_half__lower_half__upper_half__cin  ;




    wire  upper_half__upper_half__carry  ;


    assign {  upper_half__upper_half__lower_half__cout  ,  upper_half__upper_half__lower_half__sum  }=  upper_half__upper_half__lower_half__a  +  upper_half__upper_half__lower_half__b  +  upper_half__upper_half__lower_half__cin  ;



    assign {  upper_half__upper_half__upper_half__cout  ,  upper_half__upper_half__upper_half__sum  }=  upper_half__upper_half__upper_half__a  +  upper_half__upper_half__upper_half__b  +  upper_half__upper_half__upper_half__cin  ;
    assign lower_half__lower_half__lower_half__a = lower_half__lower_half__a[3:0];
    assign lower_half__lower_half__lower_half__b = lower_half__lower_half__b[3:0];
    assign lower_half__lower_half__lower_half__cin = lower_half__lower_half__cin;
    assign lower_half__lower_half__sum[3:0] = lower_half__lower_half__lower_half__sum;
    assign lower_half__lower_half__carry = lower_half__lower_half__lower_half__cout;
    assign lower_half__lower_half__upper_half__a = lower_half__lower_half__a[7:4];
    assign lower_half__lower_half__upper_half__b = lower_half__lower_half__b[7:4];
    assign lower_half__lower_half__upper_half__cin = lower_half__lower_half__carry;
    assign lower_half__lower_half__sum[7:4] = lower_half__lower_half__upper_half__sum;
    assign lower_half__lower_half__cout = lower_half__lower_half__upper_half__cout;
    assign lower_half__upper_half__lower_half__a = lower_half__upper_half__a[3:0];
    assign lower_half__upper_half__lower_half__b = lower_half__upper_half__b[3:0];
    assign lower_half__upper_half__lower_half__cin = lower_half__upper_half__cin;
    assign lower_half__upper_half__sum[3:0] = lower_half__upper_half__lower_half__sum;
    assign lower_half__upper_half__carry = lower_half__upper_half__lower_half__cout;
    assign lower_half__upper_half__upper_half__a = lower_half__upper_half__a[7:4];
    assign lower_half__upper_half__upper_half__b = lower_half__upper_half__b[7:4];
    assign lower_half__upper_half__upper_half__cin = lower_half__upper_half__carry;
    assign lower_half__upper_half__sum[7:4] = lower_half__upper_half__upper_half__sum;
    assign lower_half__upper_half__cout = lower_half__upper_half__upper_half__cout;
    assign upper_half__lower_half__lower_half__a = upper_half__lower_half__a[3:0];
    assign upper_half__lower_half__lower_half__b = upper_half__lower_half__b[3:0];
    assign upper_half__lower_half__lower_half__cin = upper_half__lower_half__cin;
    assign upper_half__lower_half__sum[3:0] = upper_half__lower_half__lower_half__sum;
    assign upper_half__lower_half__carry = upper_half__lower_half__lower_half__cout;
    assign upper_half__lower_half__upper_half__a = upper_half__lower_half__a[7:4];
    assign upper_half__lower_half__upper_half__b = upper_half__lower_half__b[7:4];
    assign upper_half__lower_half__upper_half__cin = upper_half__lower_half__carry;
    assign upper_half__lower_half__sum[7:4] = upper_half__lower_half__upper_half__sum;
    assign upper_half__lower_half__cout = upper_half__lower_half__upper_half__cout;
    assign upper_half__upper_half__lower_half__a = upper_half__upper_half__a[3:0];
    assign upper_half__upper_half__lower_half__b = upper_half__upper_half__b[3:0];
    assign upper_half__upper_half__lower_half__cin = upper_half__upper_half__cin;
    assign upper_half__upper_half__sum[3:0] = upper_half__upper_half__lower_half__sum;
    assign upper_half__upper_half__carry = upper_half__upper_half__lower_half__cout;
    assign upper_half__upper_half__upper_half__a = upper_half__upper_half__a[7:4];
    assign upper_half__upper_half__upper_half__b = upper_half__upper_half__b[7:4];
    assign upper_half__upper_half__upper_half__cin = upper_half__upper_half__carry;
    assign upper_half__upper_half__sum[7:4] = upper_half__upper_half__upper_half__sum;
    assign upper_half__upper_half__cout = upper_half__upper_half__upper_half__cout;

    assign lower_half__lower_half__a = lower_half__a[7:0];
    assign lower_half__lower_half__b = lower_half__b[7:0];
    assign lower_half__lower_half__cin = lower_half__cin;
    assign lower_half__sum[7:0] = lower_half__lower_half__sum;
    assign lower_half__carry = lower_half__lower_half__cout;
    assign lower_half__upper_half__a = lower_half__a[15:8];
    assign lower_half__upper_half__b = lower_half__b[15:8];
    assign lower_half__upper_half__cin = lower_half__carry;
    assign lower_half__sum[15:8] = lower_half__upper_half__sum;
    assign lower_half__cout = lower_half__upper_half__cout;
    assign upper_half__lower_half__a = upper_half__a[7:0];
    assign upper_half__lower_half__b = upper_half__b[7:0];
    assign upper_half__lower_half__cin = upper_half__cin;
    assign upper_half__sum[7:0] = upper_half__lower_half__sum;
    assign upper_half__carry = upper_half__lower_half__cout;
    assign upper_half__upper_half__a = upper_half__a[15:8];
    assign upper_half__upper_half__b = upper_half__b[15:8];
    assign upper_half__upper_half__cin = upper_half__carry;
    assign upper_half__sum[15:8] = upper_half__upper_half__sum;
    assign upper_half__cout = upper_half__upper_half__cout;

    assign lower_half__a = a[15:0];
    assign lower_half__b = b[15:0];
    assign lower_half__cin = cin;
    assign sum[15:0] = lower_half__sum;
    assign carry = lower_half__cout;
    assign upper_half__a = a[31:16];
    assign upper_half__b = b[31:16];
    assign upper_half__cin = carry;
    assign sum[31:16] = upper_half__sum;
    assign cout = upper_half__cout;

endmodule
