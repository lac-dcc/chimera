// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module armstrong(
    input [8:0] number,
    output reg is_armstrong
    );
    parameter ARMSTRONG= 1'b1, Not_ARMSTRONG= 1'b0;
    always@(number)
        begin
            is_armstrong= check_armstrong(number);

            if(is_armstrong== 1'b1) $display("\t\t %d is a armstrong number", number);
            else $display("\t\t %d is not a armstrong number", number);
    end
    
    function check_armstrong;
    input [8:0]num;
            reg [8:0] temp_num;
            reg [8:0] remainder;
            reg [8:0] result;
    begin
            result= 9'd0;
            temp_num = num;
            while (temp_num != 0) begin
            remainder = temp_num % 10;
            result =  result + (remainder * remainder * remainder);
            temp_num = temp_num/ 10;
    end
    if (result == num) check_armstrong= ARMSTRONG;
    else check_armstrong= Not_ARMSTRONG;
end
endfunction
endmodule
