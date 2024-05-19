// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License


`timescale 1ns/10ps

module TESTBED;

integer i, j, latency, latency_total;
integer fp_r, fp_i, int_r, int_i;
integer SNR_ratio;

parameter FFT_size		= 32;
parameter dataset		= 5;
parameter IN_width		= 12;
parameter OUT_width		= 16;
parameter latency_limit		= 68;

parameter cycle			= 10.0;

reg clk, rst_n, in_valid;
wire out_valid;
reg signed [IN_width-1:0] din_r, din_i;
wire signed [OUT_width-1:0] dout_r, dout_i;
reg signed [OUT_width:0] gold_r, gold_i;

reg signed [31:0] noise, signal;
reg [31:0] noise_energy, signal_energy;

always #(cycle/2.0) clk = ~clk;

initial begin

	`ifdef RTL
		$fsdbDumpfile("FFT_RTL.fsdb");
		$fsdbDumpvars(0, FFT_CORE);
	`elsif GATE
		$sdf_annotate("FFT_SYN.sdf",FFT_CORE);

		`ifdef VCD
			$dumpfile("FFT_GATE.vcd");
			$dumpvars();
		`elsif FSDB
			$fsdbDumpfile("FFT_GATE.fsdb");
			$fsdbDumpvars(0, FFT_CORE);
		`endif
	`endif
end

initial begin

	clk = 0;
	rst_n = 1;
	in_valid = 0;
	signal_energy = 0;
	noise_energy = 0;
	latency = 0;
	latency_total = 0;
	
	for(i=0;i<dataset;i=i+1) begin
		
		signal_energy = 0;
		noise_energy = 0;
		
		case(i)
		0: begin 
			fp_r = $fopen("../Test_pattern/input/IN_real_pattern01.txt", "r");
			fp_i = $fopen("../Test_pattern/input/IN_imag_pattern01.txt", "r");
		end
		1: begin
			fp_r = $fopen("../Test_pattern/input/IN_real_pattern02.txt", "r");
			fp_i = $fopen("../Test_pattern/input/IN_imag_pattern02.txt", "r");
		end
                2: begin
                        fp_r = $fopen("../Test_pattern/input/IN_real_pattern03.txt", "r");
                        fp_i = $fopen("../Test_pattern/input/IN_imag_pattern03.txt", "r");
                end
                3: begin
                        fp_r = $fopen("../Test_pattern/input/IN_real_pattern04.txt", "r");
                        fp_i = $fopen("../Test_pattern/input/IN_imag_pattern04.txt", "r");
                end
                4: begin
                        fp_r = $fopen("../Test_pattern/input/IN_real_pattern05.txt", "r");
                        fp_i = $fopen("../Test_pattern/input/IN_imag_pattern05.txt", "r");
                end
		default: begin 
			$display("Wrong dataset!? How could this happen?");
			$finish;
		end
		endcase


		@(negedge clk);
		@(negedge clk) rst_n = 0;
		@(negedge clk) rst_n = 1;
		@(negedge clk);

		for(j=0;j<FFT_size;j=j+1) begin

			@(negedge clk);
			in_valid = 1;
			int_r = $fscanf(fp_r, "%d", din_r);
			int_i = $fscanf(fp_i, "%d", din_i);

		end
		@(negedge clk) in_valid = 0;


		$fclose(fp_r);
		$fclose(fp_i);

		latency = 0;
		while(!out_valid) begin
			@(negedge clk) latency = latency + 1;
			if(latency > latency_limit) begin
				$display("Latency too long (> %0d cycles)", latency_limit);
				$finish;
			end
		end

		// Read golden data
                case(i)
                0: begin
                        fp_r = $fopen("../Test_pattern/output/OUT_real_16_pattern01.txt", "r");
                        fp_i = $fopen("../Test_pattern/output/OUT_imag_16_pattern01.txt", "r");
                end
                1: begin
                        fp_r = $fopen("../Test_pattern/output/OUT_real_16_pattern02.txt", "r");
                        fp_i = $fopen("../Test_pattern/output/OUT_imag_16_pattern02.txt", "r");
                end
                2: begin
                        fp_r = $fopen("../Test_pattern/output/OUT_real_16_pattern03.txt", "r");
                        fp_i = $fopen("../Test_pattern/output/OUT_imag_16_pattern03.txt", "r");
                end
                3: begin
                        fp_r = $fopen("../Test_pattern/output/OUT_real_16_pattern04.txt", "r");
                        fp_i = $fopen("../Test_pattern/output/OUT_imag_16_pattern04.txt", "r");
                end
                4: begin
                        fp_r = $fopen("../Test_pattern/output/OUT_real_16_pattern05.txt", "r");
                        fp_i = $fopen("../Test_pattern/output/OUT_imag_16_pattern05.txt", "r");
                end
                default: begin
                        $display("Wrong dataset!? No Way!");
                        $finish;
                end
                endcase

		for(j=0;j<FFT_size;j=j+1) begin

			while(!out_valid) begin
				@(negedge clk) latency = latency + 1;
				if(latency > latency_limit) begin
					$display("Total latency too long (> %0d cycles)", latency_limit);
					$finish;
				end
			end

			int_r = $fscanf(fp_r, "%d", gold_r);
			int_i = $fscanf(fp_i, "%d", gold_i);

			signal = gold_r;
			signal_energy = signal_energy + signal*signal;
			signal = gold_i;
			signal_energy = signal_energy + signal*signal;


			noise = gold_r - dout_r;
			noise_energy = noise_energy + noise*noise;
			noise = gold_i - dout_i;
			noise_energy = noise_energy + noise*noise;
			@(negedge clk);
		end

		if(noise_energy == 0) begin 
			$display(" ---------- SNR = infinity");
			$display(" ---------- dataset %2d pass!!\n", i+1);
		end
		else begin
	
			SNR_ratio = signal_energy/noise_energy;
			$display(" ---------- SNR = %2.2f", $log10(SNR_ratio)*10.0);

			if(SNR_ratio >= 10000) $display(" ---------- dataset %2d passed!!\n", i+1);
			else begin
				$display(" ---------- dataset %2d failed!! Bye\n", i+1);
				$finish;
			end
		end

		$fclose(fp_r);
		$fclose(fp_i);

		latency_total = latency_total + latency;

	end

	$display("\033[1;33m********************************\033[m");
    	$display("\033[1;33mWell Done \033[m");
    	$display("\033[1;33m********************************\033[m");
    	$display("\033[1;35m      ▒~▒▒         \033[m");
    	$display("\033[1;35m      ▒x▒x           \033[m");
    	$display("\033[1;35m▒i▒X▒X▒}▒▒▒X▒▒          \033[m");
    	$display("\033[1;35m▒i      ▒X▒X▒▒        \033[m");
    	$display("\033[1;35m▒i   ▒@ ▒X▒X▒▒   You have passed all patterns!!\033[m");
    	$display("\033[1;35m▒i▒š▒  ▒X▒X▒▒          \033[m");
    	$display("\033[1;35m▒i   ▒▒▒X▒X▒▒         \033[m");
    	$display("\033[1;35m                   \033[m");
    	$display("\033[1;32m********************************\033[m");
    	$display("\033[1;32m********************************\033[m");
	$display("Clk period = %2.2f ns", cycle);
	$display("Average latency = %2.2f cycles", latency_total/dataset);
        $display("Bye\n\n");

        $finish;


end

FFT FFT_CORE(
.clk(clk),
.rst_n(rst_n),
.in_valid(in_valid),
.din_r(din_r),
.din_i(din_i),
.out_valid(out_valid),
.dout_r(dout_r),
.dout_i(dout_i)
);

endmodule
	
