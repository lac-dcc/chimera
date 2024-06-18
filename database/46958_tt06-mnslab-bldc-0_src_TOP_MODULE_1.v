// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University MNS Labs
// Engineer: 
// 
// Create Date: 17.01.2024 11:44:23
// Design Name: BLDC
// Module Name: esc_1
// Project Name: PID Controller for BLDC
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

module esc_1(
    input clk,
    input rst,
    input sda_in,
    output sda_out,
    output sda_oe,
    input scl, 
    
    input pwm_en,   
    input encoder_a,   
    input encoder_b,   
    output motor_positive,  
    output motor_negative   
    
    );
    
    // PID inputs
    wire [15:0] pwm_period_wire;
    wire [15:0] period_reference_i2c_wire;
    wire [7:0] Kp_ext_i2c_wire;
    wire [7:0] Ki_ext_i2c_wire;
    wire [6:0] Kd_ext_i2c_wire;
    wire override_internal_pid_i2c_wire;
    
    wire busy_wire;
    wire valid_wire;
    wire [7:0] data_out_i2c;
    wire [7:0] data_out_ram;
    wire write_i2c;
    wire read_1_i2c;
    wire [7:0] index_1_i2c;
    wire [7:0] Kp_int_wire;
    wire [3:0] tunerreset_autotune;
     
    
    I2C_SLAVE_1 I2C_SLAVE(
        . clk(clk),
        . rst(rst),
        .sda_in(sda_in),
        .sda_out(sda_out),
        .sda_oe(sda_oe),
        . scl(scl),
        . write(write_i2c),
        . read_1(read_1_i2c),
        . index_1(index_1_i2c),
        . data_out(data_out_i2c),
        . data_in(data_out_ram),
        . busy(busy_wire),
        . valid(valid_wire)
    );
    
    Register_Module_1 RAM_BLOCK(
        . clk(clk),
        . rst(rst),
        . write(write_i2c),
        . read_1(read_1_i2c),
        . index_1(index_1_i2c),
        . data_in(data_out_i2c),
        . data_out_1(data_out_ram),
        //
        . pwm_period(pwm_period_wire),          
        . period_reference(period_reference_i2c_wire),  
        . Kp_ext(Kp_ext_i2c_wire),            
        . Ki_ext(Ki_ext_i2c_wire),            
        . Kd_ext(Kd_ext_i2c_wire),         
        . Kp_int_i(Kp_int_wire), 
        . override_internal_pid(override_internal_pid_i2c_wire),   
        . tunerreset_autotune(tunerreset_autotune)             
    );
    
    bldc_esc_1 BLDC_ESC(
      . clk(clk),
      . clk_div(clk),
      . reset(rst),
      . tunerreset_autotune(tunerreset_autotune),
      . pwm_en(pwm_en),
      . encoder_a(encoder_a),
      . encoder_b(encoder_b),
      . pwm_period(pwm_period_wire),
      . period_reference(period_reference_i2c_wire),
      . Kp_ext(Kp_ext_i2c_wire),
      . Ki_ext(Ki_ext_i2c_wire),
      . Kd_ext(Kd_ext_i2c_wire),
      . override_internal_pid(override_internal_pid_i2c_wire),
      . Kp_int_o(Kp_int_wire),
      . motor_positive(motor_positive),
      . motor_negative(motor_negative)
    );
    
endmodule
