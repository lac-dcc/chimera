// This program was cloned from: https://github.com/hrvach/Life_MiSTer
// License: MIT License

module row (
   input           clock,
   input    [0:0]  shiftin,
   output   [0:0]  shiftout
);

   altshift_taps  ALTSHIFT_TAPS_component (
            .clock (clock),
            .shiftin (shiftin),
            .shiftout (shiftout)
            );
   defparam
      ALTSHIFT_TAPS_component.intended_device_family = "Cyclone V",
      ALTSHIFT_TAPS_component.lpm_hint = "RAM_BLOCK_TYPE=M10K",
      ALTSHIFT_TAPS_component.lpm_type = "altshift_taps",
      ALTSHIFT_TAPS_component.number_of_taps = 1,
      ALTSHIFT_TAPS_component.tap_distance = 2198,
      ALTSHIFT_TAPS_component.width = 1;

endmodule


module ring (  
        input clock,
		  input enable,
		  input shiftin,
	     output shiftout,
		  input [31:0] status
);      
	  
		  reg [21:0] counter = 0;
		  		  
		  always @(posedge clock) begin
				if (enable)
					counter <= ~|counter ? 2472795 : counter - 1'b1;														
		  end
		  
		  
	altsyncram	altsyncram_component (
				.address_a (counter),
				.address_b (counter),
				.clock0 (clock),
				.data_a (shiftin),
				.wren_a (enable),
				.q_b (shiftout),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b (1'b1),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.init_file = "./roms/initial.hex",
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 2472800,
		altsyncram_component.numwords_b = 2472800,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "CLOCK0",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.ram_block_type = "M10K",
		altsyncram_component.read_during_write_mode_mixed_ports = "OLD_DATA",
		altsyncram_component.widthad_a = 22,
		altsyncram_component.widthad_b = 22,
		altsyncram_component.width_a = 1,
		altsyncram_component.width_b = 1,
		altsyncram_component.width_byteena_a = 1;
		  		  
endmodule

