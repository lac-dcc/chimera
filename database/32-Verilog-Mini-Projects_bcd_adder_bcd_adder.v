module bcd_adder(a,b,cin,sum,cout);
    input [3:0] a,b;
    input cin;
    output [3:0] sum;
    output cout;
    reg [4:0] temp;
    reg [3:0] sum;
    reg cout;  

    always @(a,b,cin)
    begin
        temp = a+b+cin; 
        if(temp > 9)    
	begin
            temp = temp+6; //add 6, if result is more than 9.
            cout = 1;  //set the carry output
            sum = temp[3:0];   
   	end
        else    
	begin
            cout = 0;
            sum = temp[3:0];
        end
    end     

endmodule


module tb_bcdadder;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    wire [3:0] sum;
    wire cout;

    bcd_adder uut (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin
        a = 0;  b = 0;  cin = 0;   #100;
        a = 6;  b = 9;  cin = 0;   #100;
        a = 3;  b = 3;  cin = 1;   #100;
        a = 4;  b = 5;  cin = 0;   #100;
        a = 8;  b = 2;  cin = 0;   #100;
        a = 9;  b = 9;  cin = 1;   #100;
    end
      
endmodule
