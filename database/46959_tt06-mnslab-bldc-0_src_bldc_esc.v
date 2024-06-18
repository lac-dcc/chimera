// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University MNS Labs
// Engineer: 
// 
// Create Date: 17.01.2024 11:44:23
// Design Name: BLDC
// Module Name: bldc_esc_1
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



module bldc_esc_1 #(parameter DATA_WIDTH = 16,parameter debounce = 3)(
  input clk,
  input clk_div,
  input reset,
  input [3:0] tunerreset_autotune,
  input pwm_en,
  input encoder_a, 
  input encoder_b,  			
  input [DATA_WIDTH-1:0] pwm_period,	
  input [DATA_WIDTH-1:0] period_reference,	
  input [7:0] Kp_ext,
  input [7:0] Ki_ext,
  input [6:0] Kd_ext,
  input override_internal_pid,		
  output [7:0] Kp_int_o,
  output reg motor_positive,   	
  output reg motor_negative
);
    assign Kp_int_o = Kp_int;
    reg [DATA_WIDTH-1:0] period_reference_reg;
	reg [DATA_WIDTH-1:0] period_speed ;
	wire tuning_done;
	wire [7:0] Kp_int;
	
	wire [7:0] Ki_int;
	wire [6:0] Kd_int;
	
	wire tunerreset_pin;
	assign tunerreset_pin= reset | tunerreset_autotune[3];
    
    wire motor_pwm;
    reg [DATA_WIDTH-1:0] pwm_counter;
    reg [DATA_WIDTH-1:0] pwm_duty_cycle;
    reg [1:0]encoder_state;
    reg [1:0]prev_encoder_state;
    reg [1:0]pwm_direction;
    reg [DATA_WIDTH-1:0] speed_ctr;
    reg [7:0] Kp ;
    reg [7:0] Ki ;
    reg [6:0] Kd ;
    reg signed[DATA_WIDTH-1:0] error;
    reg signed[(DATA_WIDTH)-1:0] integral;
    reg signed[DATA_WIDTH-1:0] derivative;
    reg signed[(DATA_WIDTH)-1:0] pid_output;
    reg signed[DATA_WIDTH-1:0] previous_error;
    reg [2:0] encoder_a_shift_reg;
    reg encoder_a_reg;
    reg [2:0] encoder_b_shift_reg;
    reg encoder_b_reg;
    reg [2:0] pwm_en_shift_reg;
    reg pwm_en_reg;
    reg flag;
    reg counter_rst;
    reg [1:0]encoder_a_set;
	reg [3:0] clk_counter;
    
    pid_tuner tuner_inst_1(
	   .clk_div(clk_div),
	   .reset(tunerreset_pin),
	   .pid_select(tunerreset_autotune[2:0]),
	   .period_speed(error),
	   .tuning_done(tuning_done),
	   .Kp(Kp_int),	
	   .Ki(Ki_int),
	   .Kd(Kd_int)
    );
    
    assign motor_pwm = (pwm_counter < pwm_duty_cycle) & pwm_en_reg; 
    
    always @(posedge clk) 
    begin
 
        if (reset) begin 
            counter_rst <= 1'b1;
            encoder_a_set <= 2'b0;
            flag <= 1'b0;
            integral <= 16'b0;
            pwm_counter <= {DATA_WIDTH{1'b0}};
            encoder_state <= 2'b0;
            prev_encoder_state <= 2'b0;
            pwm_direction<=2'b00;
            motor_positive<=1'b0;
            motor_negative<=1'b0;
            Kp <= 8'h1;
            Ki <= 8'd0;
            Kd <= 7'd0;
            speed_ctr<={DATA_WIDTH{1'b0}};
            previous_error <= {DATA_WIDTH{1'b0}};
            error<=16'b0;
            period_speed <= 16'b0;
            pid_output <= 16'b0;
            derivative <= 16'b0;
            pwm_duty_cycle <= 16'b0;
            encoder_a_shift_reg <= 3'b0;
            encoder_a_reg <= 1'b0;
            encoder_b_shift_reg <= 3'b0;
            encoder_b_reg <= 1'b0;
            pwm_en_shift_reg <= 3'b0;
            pwm_en_reg <= 1'b0;
		clk_counter<=4'd0;
	end else if (clk_counter==4'd7)begin
		clk_counter<=4'd0;
            pwm_en_shift_reg <= {pwm_en_shift_reg[debounce-2:0],pwm_en};
            if (pwm_en_shift_reg == {debounce{1'b0}} || pwm_en_shift_reg == {debounce{1'b1}})begin
                pwm_en_reg <= pwm_en_shift_reg[0];  
            end
            encoder_a_shift_reg <= {encoder_a_shift_reg[debounce-2:0],encoder_a};
            if (encoder_a_shift_reg == {debounce{1'b0}} || encoder_a_shift_reg == {debounce{1'b1}})begin
                encoder_a_reg <= encoder_a_shift_reg[0]; 
            end 
            encoder_b_shift_reg <= {encoder_b_shift_reg[debounce-2:0],encoder_b};
            if (encoder_b_shift_reg == {debounce{1'b0}} || encoder_b_shift_reg == {debounce{1'b1}})begin
                encoder_b_reg <= encoder_b_shift_reg[0];  
            end
            pid_output <= (Kp * error) + ((Ki * integral)>>3) + (Kd * derivative);	
            if(pid_output<1) begin			
                pwm_duty_cycle<=pwm_period;
            end else if (pid_output>pwm_period) begin	
                pwm_duty_cycle<=0;
            end else begin
                pwm_duty_cycle<=pid_output;	
            end
            derivative <= error - previous_error;
            if (integral + error > 2048) begin 
                integral <= 2047;
            end
            else if (integral + error < -2048) begin
                integral <= -2047;
            end
            else begin
                integral <= integral + error;
            end
            previous_error<=error;
            error <= period_reference_reg - period_speed;
                
            if (pwm_counter == pwm_period-1) begin
                pwm_counter <= 16'd0;
            end else begin
            pwm_counter <= pwm_counter + 1;
            end
            encoder_state <= {encoder_a_reg, encoder_b_reg};
            prev_encoder_state <= encoder_state;
            if(pwm_en_reg)begin
                case ({encoder_state, prev_encoder_state})
                    4'b0100, 4'b1101,4'b1011: begin
                        pwm_direction<=2'b10;
                    end
                    4'b1000,4'b1110,4'b0111: begin
                        pwm_direction<=2'b01;
                    end
                    default: begin
                        pwm_direction<=2'b00;
                    end
                endcase
            end
            
            if(!flag && (pwm_period!=0))begin
                motor_positive <= (period_reference<32767) ? (1'b1) : (1'b0);
                motor_negative <= (period_reference>=32767) ? (1'b1) : (1'b0);
                flag <= ((period_speed>=150) && (period_reference>=period_speed)) ? (1'b1): (1'b0);
            end
            if(period_reference>=32767)
            begin
                period_reference_reg<= (~period_reference)+1;
            end else begin
                period_reference_reg<= period_reference;
            end
            if(pwm_en_reg==1'b0)begin
                motor_positive<=1'b0;
                motor_negative<=1'b0;
            end else if (flag)begin
                case(pwm_direction)
                    2'b00: begin
                        if(period_reference>32767) begin
                            motor_positive<=1'b0;
                            motor_negative<=motor_pwm;
                        end else begin
                            motor_positive<=motor_pwm;
                            motor_negative<=1'b0;
                        end
                    end 
                    2'b01:begin
                        motor_positive<=1'b0;
                        motor_negative<=motor_pwm;
                    end
                    2'b10:begin
                        motor_positive<=motor_pwm;
                        motor_negative<=1'b0;
                    end
                    default: begin
                        motor_positive <= 1'b0;
                        motor_negative <= 1'b0;
                    end
                endcase
            end
            if(override_internal_pid) begin
                Kp<=Kp_ext;
                Ki<=Ki_ext;
                Kd<=Kd_ext;
            end else if (tuning_done) begin
                Kp<=Kp_int;
                Ki<=Ki_int;
                Kd<=Kd_int;
            end else begin
                Kp<=Kp_int;
                Ki<=0;
                Kd<=0;
            end
            if(encoder_a_reg && encoder_a_set==2'b00)begin
                counter_rst <= 1'b0;
                encoder_a_set <= 2'b01;
            end else if(encoder_a_set==2'b01 && !encoder_a_reg)begin
                encoder_a_set <= 2'b10;
            end else if (encoder_a_reg && encoder_a_set==2'b10)begin
                counter_rst <= 1'b1;
                encoder_a_set <= 2'b00;
                period_speed<=speed_ctr;
            end
            if(counter_rst)begin
                speed_ctr <= 16'b0;
            end else begin
                speed_ctr<=speed_ctr+1;
            end
    end else begin
	clk_counter <=clk_counter+1;
    end
end
endmodule
