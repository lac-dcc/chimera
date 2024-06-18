// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module root(
    input [31:0] number,
    output reg [31:0] sq_root, cube_root
    );
    real red;
    always@(number) begin
        find_sq_root(number, sq_root);
        find_cube_root(number, cube_root);
        
        $display("\n \t\t Square Root of %0d is %0d", number, sq_root);
        $display(" \t\t Cube Root of   %0d is %0d ", number, cube_root);
        end
        
    task find_sq_root;
        input [31:0] num;
        output [31:0] res;
        begin
            res = num**(0.5);
        end
    endtask
    
    task find_cube_root;
        input [31:0] num;
        output [31:0] res;
        begin
            res= num**(0.33);
        end
    endtask

endmodule
