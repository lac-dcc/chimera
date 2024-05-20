// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// adc.v - driver logic for adc124s051 4-chl 12-bit 500kSPS ADC
// 03-18-21 E. Brombaugh

`default_nettype none

module adc(
    input clk,              // 48MHz CPU clock
    input reset,            // Low-true reset
    
	output reg adc_cs, adc_si,
	output adc_clko,
	input adc_so,
	
	output reg [11:0] a0, a1, a2, a3,
	
	output reg a0_v, a1_v, a2_v, a3_v
);
	// divide 48MHz clock down to 8MHz max that ADC allows
	reg clk_ena, clk_ena_180, adc_clk;
	reg [2:0] clk_div;
	always @(posedge clk)
		if(reset)
		begin
			clk_div <= 3'd0;
			clk_ena <= 1'b1;
			clk_ena_180 <= 1'b0;
			adc_clk <= 1'b1;
		end
		else
		begin
			clk_div <= clk_div + 3'd1;
			clk_ena <= 1'b0;
			clk_ena_180 <= 1'b0;
			
			if(clk_div == 3'd0)
				adc_clk <= 1'b1;
				
			if(clk_div == 3'd2)
				clk_ena_180 <= 1'b1;
			
			if(clk_div == 3'd3)
				adc_clk <= 1'b0;
			
			if(clk_div == 3'd5)
			begin
				clk_ena <= 1'b1;
				clk_div <= 3'd0;
			end
		end
		
	// state machine generates cs, si (input to ADC) and assembles result
	reg [3:0] adc_cnt;
	reg [1:0] adc_chl, adc_pchl, data_chl;
	reg [11:0] sreg, data_curr, data_prev;
	reg data_valid;
	always @(posedge clk)
		if(reset)
		begin
			adc_cs <= 1'b1;
			adc_si <= 1'b0;
			adc_cnt <= 4'h0;
			adc_chl <= 2'b11;
			adc_pchl <= 2'b10;
			sreg <= 12'h000;
			data_curr <= 12'h000;
			data_prev <= 12'h000;
			data_chl <= 2'b00;
			data_valid <= 1'b0;
		end
		else
		begin
			// count always advances
			if(clk_ena)
				adc_cnt <= adc_cnt + 1;
			
			// channel advances at end of cycle
			if(clk_ena && (adc_cnt == 4'hf))
			begin
				adc_chl <= adc_chl + 1;
				adc_pchl <= adc_chl;
			end
			
			// cs drops after first count cycle
			if(clk_ena_180 && (adc_cnt == 4'hf) && adc_cs)
				adc_cs <= 1'b0;
			
			// si shifts out chl addr on cycles 3,4 (bits 4, 3)
			if(clk_ena)
				case(adc_cnt)
					4'h1: adc_si <= 1'b1;
					4'h2: adc_si <= adc_chl[1];
					4'h3: adc_si <= adc_chl[0];
					default: adc_si <= 1'b0;
				endcase
			
			// input shift register
			if(clk_ena_180 & (adc_cnt[3:2]!=2'b00))
				sreg[11:0] <= {sreg[10:0],adc_so};
			
			// output holding registers with inversion
			if(clk_ena_180 && (adc_cnt == 4'hf))
			begin
				data_curr <= ~{sreg[10:0],adc_so};
				data_prev <= data_curr;
				data_chl <= adc_pchl;
				data_valid <= 1'b1;
			end
			else
				data_valid <= 1'b0;
		end
	
	// crosstalk correction pipeline
	reg [2:0] cena_pipe;
	reg signed [12:0] cdiff, csum;
	always @(posedge clk)
		if(reset)
		begin
			cena_pipe <= 3'b000;
			cdiff <= 12'h000;
			csum <= 12'h000;
		end
		else
		begin
			// pipelined enable from previous valid
			cena_pipe <= {cena_pipe[1:0],data_valid};
			
			// compute difference
			if(data_valid)
				cdiff <= $signed({1'b0,data_curr}) - $signed({1'b0,data_prev});
			
			// add scaled difference to current
			if(cena_pipe[0])
				csum <= $signed({1'b0,data_curr}) + (cdiff >>> 9);
		end

	// saturate to proper limits
	reg [11:0] corrected;
	always @(*)
		if(csum[12])
		begin
			if(data_curr[11])
				corrected = 12'hfff;
			else
				corrected = 12'h000;
		end
		else
			corrected = csum[11:0];
			
	wire corrected_valid = cena_pipe[1];
		
	// demux and final output result
	always @(posedge clk)
		if(reset)
		begin
			a0 <= 12'd0;
			a1 <= 12'd0;
			a2 <= 12'd0;
			a3 <= 12'd0;
			a0_v <= 1'b0;
			a1_v <= 1'b0;
			a2_v <= 1'b0;
			a3_v <= 1'b0;
		end
		else
		begin
			// holding regs
			if(corrected_valid)
				case(data_chl)
					2'b00: a0 <= corrected;
					2'b01: a1 <= corrected;
					2'b10: a2 <= corrected;
					2'b11: a3 <= corrected;
				endcase
			
			// output valids
			if(corrected_valid)
				case(adc_pchl)
					2'b00: a0_v <= 1'b1;
					2'b01: a1_v <= 1'b1;
					2'b10: a2_v <= 1'b1;
					2'b11: a3_v <= 1'b1;
				endcase
			else
			begin
				a0_v <= 1'b0;
				a1_v <= 1'b0;
				a2_v <= 1'b0;
				a3_v <= 1'b0;
			end
		end
	
	// disable adc_clko when cs high
	assign adc_clko = adc_clk | adc_cs;
endmodule
