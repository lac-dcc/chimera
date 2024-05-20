// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University MNS Labs
// Engineer: 
// 
// Create Date: 17.01.2024 11:44:23
// Design Name: BLDC
// Module Name: Register_Module_1
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

module Register_Module_1#(parameter depth = 20)(
    input clk,
    input rst,
    input write,
    input read_1,
    input [7:0] index_1,
    input [7:0] data_in,
    input [7:0] Kp_int_i,
    output [7:0] data_out_1,
    //
    output [15:0] pwm_period,
    output [15:0] period_reference, 
    output [7:0] Kp_ext,             
    output [7:0] Ki_ext,               
    output [6:0] Kd_ext,              
    output override_internal_pid,      
    output [3:0] tunerreset_autotune          
    );
    
    reg [7:0] internal_register [0:depth-1]; 
    assign data_out_1 = (read_1) ? (internal_register[index_1[4:0]]) : (8'b0);
    
    assign pwm_period            = {internal_register[0],internal_register[1]};
    assign period_reference      = {internal_register[2],internal_register[3]};
    assign Kp_ext                = internal_register[4];
    assign Ki_ext                = internal_register[5];
    assign Kd_ext                = internal_register[6][6:0];
    assign override_internal_pid = internal_register[6][7];
    assign tunerreset_autotune   = internal_register[8][3:0];
    
    always @(posedge clk)begin
        if(rst)begin
            internal_register [0] <= 8'b0;
            internal_register [1] <= 8'b0;
            internal_register [2] <= 8'b0;
            internal_register [3] <= 8'b0;
            internal_register [4] <= 8'b0;
            internal_register [5] <= 8'b0;
            internal_register [6] <= 8'b0;
            internal_register [7] <= 8'b0;
            internal_register [8] <= 8'b0;
            internal_register [9] <= 8'b0;
            internal_register [10] <= 8'b0;
            internal_register [11] <= 8'b0;
            internal_register [12] <= 8'b0;
            internal_register [13] <= 8'b0;
            internal_register [14] <= 8'b0;
            internal_register [15] <= 8'b0;
            internal_register [16] <= 8'b0;
            internal_register [17] <= 8'b0;
            internal_register [18] <= 8'b0;
            internal_register [19] <= 8'b0;
        end
        else begin
            internal_register[index_1[4:0]] <= (write) ? (data_in) : (internal_register[index_1[4:0]]);
            internal_register[7] <= Kp_int_i;
        end
    end
endmodule
