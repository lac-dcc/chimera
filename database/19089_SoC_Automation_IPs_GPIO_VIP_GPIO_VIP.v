// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

`define GPIO_DATA 16'h9
module GPIO_VIP(
    inout [15: 0] GPIOOUT
);
    always @ (GPIOOUT) begin
        if (GPIOOUT == 16'h9) begin
            $display("GPIO Test Passed");
			$finish();
        end
    end

endmodule