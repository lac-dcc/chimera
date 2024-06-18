// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/5/3     meisq          1.0         Original
//*******************************************************************************/
module buzzer_pwm_test(
                       input clk,
                       input rst_n,
	                    input key1,
	                    output buzzer
                      );
parameter IDLE    = 0;
parameter BUZZER  = 1;
wire button_negedge;
wire pwm_out;
reg[31:0] period;
reg[31:0] duty;

reg[3:0] state;
reg[31:0] timer;
assign buzzer = ~(pwm_out & (state == BUZZER));//buzzer  low active

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		period <= 32'd0;
		timer <= 32'd0;
		duty <= 32'd429496729;
		state <= IDLE;
	end
	else
		case(state)
			IDLE:
			begin
				if(button_negedge)
				begin
					period <= 32'd8590;   //The pwm step value
					state <= BUZZER;
					duty <= duty + 32'd429496729;
					
				end
			end
			BUZZER:
			begin
				if(timer >= 32'd12_499_999)      //buzzer effictive time 250ms
				begin
					state <= IDLE;
					timer <= 32'd0;
				end
				else
				begin
					timer <= timer + 32'd1;
				end
			end
			default:
			begin
				state <= IDLE;		
			end			
		endcase
end

ax_debounce ax_debounce_m0
(
    .clk             (clk),
    .rst             (~rst_n),
    .button_in       (key1),
    .button_posedge  (),
    .button_negedge  (button_negedge),
    .button_out      ()
);

ax_pwm#
(
    .N(32)
) 
ax_pwm_m0(
    .clk      (clk),
    .rst      (~rst_n),
    .period   (period),
    .duty     (duty),
    .pwm_out  (pwm_out)
    );
	
endmodule 