// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0


always @(posedge clock)
begin
	if ((mc_oe == 1'b1)&&(mc_ce == 1'b1))			// chip enabled, output enabled
	begin
		case(mc_add)
			6'h00:									// data register
				begin
					mc_data [7:0] = spi_dout;
				end
			6'h19:									// pwm on-time register
				begin
					pwm_on <= mc_data;
				end
			6'h1a:									// pwm off-time register
				begin
					pwm_off <= mc_data;
				end
		endcase
	end
	else if ((mc_we == 1'b1)&&(mc_ce == 1'b1))		// chip enabled, wirte enabled
	begin
		case(mc_add)
			6'h00:									// data register 
				begin
					spi_din <= mc_data[7:0];
					spi_go <= 1'b1;
				end
			6'h19:									// pwm on-time register
				begin
					mc_data <= pwm_on;
				end
			6'h1a:									// pwm off-time register
				begin
					mc_data <= pwm_off;
				end
		endcase
	end
	else											// other state; go into HiZ
	begin
		mc_data <= 16'bz;
	end

	if ((state == 1'b1)&&(go == 1'b1))				// reset go when byte is accepted
	begin
		go <= 1'b0;
	end
end