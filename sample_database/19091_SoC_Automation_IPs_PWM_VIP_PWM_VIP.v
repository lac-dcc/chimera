// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

module PWM_VIP(
    input HRESETn,
    input pwm,
    input [3:0] db_reg
);
    // PWM TEST
	reg [16:0] counter;
	always @(posedge pwm or negedge HRESETn) begin
		if (HRESETn == 0)
			counter <= 0;
		else if (pwm) begin 
			counter <= counter + 1;
		end
	end

    always @ (counter) begin
        if (counter > 2) begin
            $display("PWM Test Passed");	
            $finish();
        end	
    end

    // always @ (db_reg) begin 
    //     if (db_reg == 4'ha) begin
    //         if (counter > 2) begin
    //             $display("PWM Test Passed");	
    //             $finish();
    //         end	
    //     end
    // end

endmodule