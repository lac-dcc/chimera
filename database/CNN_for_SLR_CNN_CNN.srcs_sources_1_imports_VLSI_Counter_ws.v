`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2018 16:46:47
// Design Name: 
// Module Name: Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Counter_ws(
    input clk,
    input start,
    input reset,
    output reg done=1'b0,
    output reg ws
    );
    parameter fill = 212; //213 clock XXXX
    //parameter mod = fill + 67*64;
    reg [8:0] count; //ws_count
    reg [5:0] count2; //64 rows
    always @ ( posedge clk )
    begin
        if( reset || ~start )
        begin
            count <= 0;
            ws <= 0;
            count2 <= 0;
            done <= 0;
        end else if ( start )
        begin
            if( count < fill )
            begin
				count <= count + 1;
				ws <= 0;
				done <= 0;
            end else if ( count2 == 63 && count == 279)
            begin
                count <= 12;
                count2 <= 0;
                ws <= 0;
                done <= 0;
            end else if ( count < 276 )
            begin
                count <= count + 1;
				ws <= 1;
				done <= 1;
            end else if ( count < 279 )
			begin
				count <= count + 1;
				ws <= 0;
				done <= 1;
			end
			else if ( count == 279 )
			begin
			     count <= 213;
			     ws <= 1;
			     count2 <= count2 + 1;
			     done <= 1;
			end
        end
    end
	
endmodule
