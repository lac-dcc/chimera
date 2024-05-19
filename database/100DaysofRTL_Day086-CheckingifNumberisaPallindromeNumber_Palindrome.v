// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module Palindrome(
    input [15:0] number,
    output reg is_palindrome
    );
    parameter PALINDROME= 1'b1, Not_PALINDROME= 1'b0;
    always@(number)
        begin
        is_palindrome= check_palindrome(number);

            if(is_palindrome== 1'b1) $display("\t\t %d is a palindrome number", number);
            else $display("\t\t %d is not a palindrome odd number", number);
    end
    
    function check_palindrome;
        input [15:0]num;
        reg [15:0]lastDigit; 
        reg [15:0]reverseNum;
        reg [15:0]temp_num;
        begin
        temp_num= num;
        reverseNum= 1'b0;
            while (temp_num > 0) begin
            lastDigit = temp_num % 10;
            reverseNum = (reverseNum * 10) + lastDigit;
            temp_num = temp_num / 10;
        end
        
        if (num == reverseNum) check_palindrome= PALINDROME;
        else check_palindrome= Not_PALINDROME;
        end
  endfunction
endmodule
