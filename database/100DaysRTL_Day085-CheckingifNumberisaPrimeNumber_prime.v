// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module prime(
    input  [7:0]number,
    output reg is_prime
    );
parameter PRIME= 1'b1, Not_PRIME= 1'b0;

    always@(number) begin
    is_prime= check_prime(number);

        if(is_prime== 1'b1) $display("\t\t %d is a prime number", number);
        else $display("\t\t %d is not a prime number", number);
end


function automatic integer check_prime;
input [7:0]num;
integer i;
integer count;
begin
count= 0;
 for (i = 2; i < num/2; i = i + 1) begin
        if (num % i == 0) begin
          count = count+1;
          end
 end
 if(count== 0) check_prime= PRIME;
 else check_prime= Not_PRIME;
 end
endfunction
endmodule
