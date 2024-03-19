`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2022 11:01:58 PM
// Design Name: 
// Module Name: pipeline_shared
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


module pipeline_shared
(
input clk,
input rst_n,
input [7:0] a_i,
input [7:0] b_i,
input [7:0] c_i,
input [7:0] d_i,
input [7:0] ctrl1_i,
input [7:0] ctrl2_i,
output [9:0] e_o,
output [9:0] f_o
);

reg [9:0] e,f;
reg [7:0] a,b,c,d;
reg [7:0] ctrl1,ctrl2;
reg [8:0] ctrl_result;
reg gr,sm;

// registers for pipeline
reg [8:0] ctrl_result_pipe;
reg [7:0] e_pipe1, e_pipe2;
reg [8:0] e_pipe3, e_pipe4, e_pipe5, e_pipe6;
reg [7:0] f_pipe1, f_pipe2;
//reg [8:0] f_pipe3, f_pipe4, f_pipe5, f_pipe6;


always @(*) begin

    if (ctrl1 > ctrl2)
        ctrl_result = ctrl1 - ctrl2;
    else
        ctrl_result = ctrl1 | ctrl2;
    
    gr = 0;
    sm = 0;
//    if (ctrl_result > 9'd355) begin
//        gr = 1;
//    end
//    else if (ctrl_result < 9'd355) begin
//        sm = 1;
//    end
    if (ctrl_result_pipe > 9'd355) begin
        gr = 1;
    end
    else if (ctrl_result_pipe < 9'd355) begin
        sm = 1;
    end

end

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        a       <= {8{1'b0}};
        b       <= {8{1'b0}};
        c       <= {8{1'b0}};
        d       <= {8{1'b0}};
        ctrl1   <= {8{1'b0}};
        ctrl2   <= {8{1'b0}};
        e       <= {10{1'b0}};
        f       <= {10{1'b0}};     
        // registers for pipeline  
        ctrl_result_pipe    <= {9{1'b0}};
        e_pipe1             <= {8{1'b0}};
        e_pipe2             <= {8{1'b0}};
        e_pipe3             <= {9{1'b0}};
        e_pipe4             <= {9{1'b0}};
        e_pipe5             <= {9{1'b0}};
        e_pipe6             <= {9{1'b0}};
        f_pipe1             <= {8{1'b0}};
        f_pipe2             <= {8{1'b0}};
//        f_pipe3             <= {9{1'b0}};
//        f_pipe4             <= {9{1'b0}};
//        f_pipe5             <= {9{1'b0}};
//        f_pipe6             <= {9{1'b0}};
    end
    else begin
        a       <= a_i;
        b       <= b_i;
        c       <= c_i;
        d       <= d_i;
        ctrl1   <= ctrl1_i;
        ctrl2   <= ctrl2_i;
        // registers for pipeline
        ctrl_result_pipe    <= ctrl_result;
        e_pipe1             <= (a ^ b);
        e_pipe2             <= (c ^ d);
        e_pipe3             <= (a - b);
        e_pipe4             <= (c - d);
        e_pipe5             <= (a + b);
        e_pipe6             <= (c + d);
        f_pipe1             <= (a & b);
        f_pipe2             <= (c & d);
//        f_pipe3             <= (-a + b);
//        f_pipe4             <= (-c + d);
//        f_pipe5             <= (a + b);
//        f_pipe6             <= (c + d);
//        if (gr) begin
//            e   <= (a + b) + (c + d);
//            f   <= (a + b) - (c + d);
//        end
//        else if (sm) begin
//            e   <= (a - b) + (c - d);
//            f   <= (-a + b) + (-c + d);
//        end
//        else begin
//            e   <= {2'b00, (a ^ b) | (c ^ d)};
//            f   <= {2'b11, (a & b) ^ (c & d)};
//        end
        if (gr) begin
            e   <= e_pipe5 + e_pipe6;
            f   <= e_pipe5 - e_pipe6;
        end
        else if (sm) begin
            e   <= e_pipe3 + e_pipe4;
            f   <= -e_pipe3 - e_pipe4;
        end
        else begin
            e   <= {2'b00, e_pipe1 | e_pipe2};
            f   <= {2'b11, f_pipe1 ^ f_pipe2};
        end

    end
    
end

assign e_o = e;
assign f_o = f;

endmodule