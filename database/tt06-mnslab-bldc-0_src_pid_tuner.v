// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University MNS Labs
// Engineer: 
// 
// Create Date: 17.01.2024 11:44:23
// Design Name: BLDC
// Module Name: pid_tuner
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

 module pid_tuner #(
  parameter DATA_WIDTH = 16 
)(
  input wire clk_div,              		
  input wire reset,            		
  input wire [2:0] pid_select,			
  input wire signed [DATA_WIDTH-1:0] period_speed,
  output reg tuning_done,
	output reg [7:0] Kp,
	 output reg [7:0] Ki,
	 output reg [6:0] Kd
  
  
);


	reg division_trig;
	reg [31:0] dividend;
	reg [31:0] divisor ;
	wire [31:0] quotient ;
	wire [31:0] remainder ;
	wire division_running;
   	reg reset_divider;
   	wire div_done;

	Divider32bit divider_inst(
   .clk(clk_div),
   .reset(reset_divider),
   .start_division(division_trig), 
   .dividend(dividend),      
   .divisor(divisor),      
   .quotient(quotient),   
   .remainder(remainder), 
      .division_active(division_running),   
      .division_done(div_done)
);

	reg [DATA_WIDTH-1:0] period_counter;	
	reg [DATA_WIDTH-1:0] peak_period;		
	reg signed [DATA_WIDTH-1:0] period_speed_reg;
	reg signed [DATA_WIDTH-1:0] prev_period_speed;		
	reg signed [DATA_WIDTH-1:0] peak_level;
	reg signed [DATA_WIDTH-1:0] prev_peak_level;
	reg signed [DATA_WIDTH-1:0] dip_level;
    reg [7:0]	Kp_max;			
	
   //find peaks
	reg autotune_finalized;
	reg decreasing_flag;
	reg increasing_flag;
	reg Kp_done;
	reg Ki_done;
	reg Kd_done;
	
	always @(posedge clk_div) begin
    if (reset) begin
		peak_period<=16'h7fff;
		Kp_done<=1'b0;
		Ki_done<=1'b0;
		Kd_done<=1'b0;
		division_trig <=1'b0;
		dividend<=32'd0;
		divisor<=32'd0;
      	period_counter<=16'd0;
      	period_speed_reg<=16'h8000;
      	prev_period_speed<=16'h8000;
      	peak_level<=16'h8000;
      	prev_peak_level<=16'h8000;
      	dip_level<=16'h0000;
      	autotune_finalized<=1'b0;
      	decreasing_flag<=1'b0;
      	increasing_flag<=1'b1;
      	Kp_max<=8'd1;
      	Kp<=8'b1;
      	Ki<=8'b0;
      	Kd<=7'b0;
      	tuning_done<=1'b0;
      	reset_divider<=1'b1;
    end else
	   begin 
	       if(autotune_finalized==1'b0)
	       begin
	           prev_period_speed<=period_speed_reg;
	           period_speed_reg<=period_speed;
	               if(prev_period_speed<=period_speed_reg)
	               begin
	                   increasing_flag<=1'b1;
	               end else if (increasing_flag==1'b1)
	               begin
	                   dip_level<=prev_period_speed;
	               end else begin
	                   increasing_flag<=1'b0;
	               end
	               if(prev_period_speed>=period_speed_reg)
	               begin
	                   decreasing_flag<=1'b1;
	                   period_counter<=period_counter+1;
	               end else if (decreasing_flag==1'b1)	
	               begin
	                   peak_period<=period_counter;	
	                   period_counter<=16'd0;			
	                   prev_peak_level<=peak_level;
	                   peak_level<=prev_period_speed;			
			       if (prev_peak_level!=16'h8000) 
	                   begin
				   if(dip_level>=-200 && peak_level<=200)
                           begin
                               Kp_max<=Kp_max+1;
                           end else begin
                               Kp_max<=Kp_max-1;
                               autotune_finalized<=1'b1;
                           end
					   end else begin
					       autotune_finalized<=1'b0;
					   end
					   Kp<=Kp_max;
					   decreasing_flag<=1'b0;
                    end else begin
                        period_counter<=period_counter+1;	
                    end
                end else begin
					case (pid_select)
					   3'b100: begin 
						  Kp<=Kp_max>>1;
						  Kp_done<=1'b1;
						  Ki<=0;
						  Ki_done<=1'b1;
						  Kd<=0;
						  Kd_done<=1'b1;
					   end
					   3'b110: begin
						  if(Kp_done!=1'b1)
						  begin
						      if(division_trig==1'b0)
						      begin
                                reset_divider<=1'b1;
								dividend<=45*Kp_max;
								divisor<=100;
								division_trig<=1'b1;
							 end else if (div_done==1'b1) begin
								Kp<=quotient[7:0];
								division_trig<=1'b0;
								Kp_done<=1'b1;
							end else begin
                              	reset_divider<=1'b0;
                            end
                        end else if (Ki_done!=1'b1)
					       begin
					           if(division_trig==1'b0)
					           begin
							        dividend<=54*Kp_max;
								    divisor<=100*peak_period;
								    division_trig<=1'b1;
							   end else if (div_done==1'b1) begin
								    Ki<=quotient[7:0];
								    division_trig<=1'b0;
								    Ki_done<=1'b1;
							   end else begin
							        reset_divider<=1'b1;
							   end
						  end
						Kd<=0;
						Kd_done<=1'b1;
					end
					3'b111: begin 
						if(Kp_done!=1'b1)
						begin
							if(division_trig==1'b0)
							begin
                              	reset_divider<=1'b1;
								dividend<=6*Kp_max;
								divisor<=10;
								division_trig<=1'b1;
                            end else if (div_done==1'b1) begin
								Kp<=quotient[7:0];
								division_trig<=1'b0;
								Kp_done<=1'b1;
							end else begin
                              	reset_divider<=1'b0;
                            end
							end else if (Ki_done!=1'b1)
							begin
								if(division_trig==1'b0)
							begin
                              	
                              	reset_divider<=1'b1;
								dividend<=12*Kp_max;
								divisor<=10*peak_period;
								division_trig<=1'b1;
                            end else if (div_done) begin
								Ki<=quotient[7:0];
								division_trig<=1'b0;
								Ki_done<=1'b1;
							end else begin
                              	reset_divider<=1'b0;
                            end
							end else if (Kd_done!=1'b1)
							begin
								if(division_trig==1'b0)
							begin
                              	reset_divider<=1'b01;
                              	dividend<=(3*Kp_max*peak_period)>>2;
								divisor<=10;
								division_trig<=1'b1;
							end else if (div_done) begin
                              	
								Kd<=quotient[7:0];
								division_trig<=1'b0;
								Kd_done<=1'b1;
							end else begin
                              	reset_divider<=1'b0;
                            end
							end
					end
					default:begin
						Kp<=0;
						Ki<=0;
						Kd<=0;
						Kp_done<=1'b1;
						Ki_done<=1'b1;
						Kd_done<=1'b1;
					end
					endcase
					tuning_done<=Kp_done & Ki_done & Kd_done;
            end		
    	end
	       
	end 
	

endmodule 


