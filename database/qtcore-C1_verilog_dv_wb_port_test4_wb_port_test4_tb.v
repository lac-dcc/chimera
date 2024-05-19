// This program was cloned from: https://github.com/kiwih/qtcore-C1
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

module wb_port_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;
	wire [7:0] mprj_io_0;
	wire [15:0] checkbits;

	assign checkbits = mprj_io[31:16];
	assign mprj_io_0 = mprj_io[7:0];

	//assign mprj_io[3] = 1'b1;

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #12.5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	`ifdef ENABLE_SDF
		initial begin
			$sdf_annotate("../../../sdf/user_proj_example.sdf", uut.mprj) ;
			$sdf_annotate("../../../sdf/user_project_wrapper.sdf", uut.mprj.mprj) ;
			$sdf_annotate("../../../mgmt_core_wrapper/sdf/DFFRAM.sdf", uut.soc.DFFRAM_0) ;
			$sdf_annotate("../../../mgmt_core_wrapper/sdf/mgmt_core.sdf", uut.soc.core) ;
			$sdf_annotate("../../../caravel/sdf/housekeeping.sdf", uut.housekeeping) ;
			$sdf_annotate("../../../caravel/sdf/chip_io.sdf", uut.padframe) ;
			$sdf_annotate("../../../caravel/sdf/mprj_logic_high.sdf", uut.mgmt_buffers.mprj_logic_high_inst) ;
			$sdf_annotate("../../../caravel/sdf/mprj2_logic_high.sdf", uut.mgmt_buffers.mprj2_logic_high_inst) ;
			$sdf_annotate("../../../caravel/sdf/mgmt_protect_hv.sdf", uut.mgmt_buffers.powergood_check) ;
			$sdf_annotate("../../../caravel/sdf/mgmt_protect.sdf", uut.mgmt_buffers) ;
			$sdf_annotate("../../../caravel/sdf/caravel_clocking.sdf", uut.clocking) ;
			$sdf_annotate("../../../caravel/sdf/digital_pll.sdf", uut.pll) ;
			$sdf_annotate("../../../caravel/sdf/xres_buf.sdf", uut.rstb_level) ;
			$sdf_annotate("../../../caravel/sdf/user_id_programming.sdf", uut.user_id_value) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[6] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[7] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[8] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[9] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[10] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[6] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[7] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[8] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[9] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[10] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[11] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[12] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[13] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[14] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[15] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_5) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_6) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_7) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_8) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_9) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_10) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_11) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_12) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_13) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_14) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_15) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_16) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_17) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_18) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_19) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_20) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_21) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_22) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_23) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_24) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_25) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_26) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_27) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_28) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_29) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_30) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_31) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_32) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_33) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_34) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_35) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_36) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_37) ;
		end
	`endif 

	`ifndef GL
	initial begin
        wait(uut.chip_core.mprj.mprj.p0_proc_go);
        $display("proc_go is high");
        $display("Reserved: %b, CU: %b, SEG: %b, PC: %x, IR: %x, ACC: %x",
            uut.chip_core.mprj.mprj.qtcore_C1_p0.ctrl_unit.reserved_register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.ctrl_unit.state_register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.SEG_Register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.PC_Register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.IR_Register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.ACC_Register.internal_data);

        $display("SEGEXE_L: %b, SEGEXE_H: %b, IO_IN: %b, IO_OUT: %b",
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.segexe_l_reg.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.segexe_h_reg.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.io_in_reg.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.io_out_reg.internal_data);
        
        $display("MEM[0]: %x, MEM[1]: %x, MEM[2]: %x, MEM[3]: %x",
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[0].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[1].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[2].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[3].mem_cell.internal_data);

		$display("MEM[4]: %x, MEM[5]: %x, MEM[6]: %x, MEM[7]: %x",
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[4].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[5].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[6].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[7].mem_cell.internal_data);

		$display("MEM[8]: %x, MEM[9]: %x, MEM[10]: %x, MEM[11]: %x",
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[8].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[9].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[10].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[11].mem_cell.internal_data);

		$display("MEM[12]: %x, MEM[13]: %x, MEM[14]: %x, MEM[15]: %x",
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[12].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[13].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[14].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[15].mem_cell.internal_data);
		
		$display("MEM[16]: %x, MEM[17]: %x, MEM[18]: %x, MEM[19]: %x",
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[16].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[17].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[18].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[19].mem_cell.internal_data);
		
		$display("MEM[20]: %x, MEM[21]: %x, MEM[22]: %x, MEM[23]: %x",
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[20].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[21].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[22].mem_cell.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[23].mem_cell.internal_data);
			

        wait(uut.chip_core.mprj.mprj.p0_halt_out);
        $display("halt_out is high");
        $display("Reserved: %b, CU: %b, SEG: %b, PC: %x, IR: %x, ACC: %x",
            uut.chip_core.mprj.mprj.qtcore_C1_p0.ctrl_unit.reserved_register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.ctrl_unit.state_register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.SEG_Register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.PC_Register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.IR_Register.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.ACC_Register.internal_data);

        $display("SEGEXE_L: %b, SEGEXE_H: %b, IO_IN: %b, IO_OUT: %b",
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.segexe_l_reg.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.segexe_h_reg.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.io_in_reg.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.io_out_reg.internal_data);
        
		$display("CNT_L: %b, CNT_H: %b, STATUS_CTRL: %b, TEMP: %b",
			uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.cnt_l_reg.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.cnt_h_reg.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.status_ctrl_reg.internal_data,
			uut.chip_core.mprj.mprj.qtcore_C1_p0.csr_inst.sig_in_reg.internal_data);

        $display("MEM[0]: %x, MEM[1]: %x, MEM[2]: %x, MEM[3]: %x, MEM[4]: %x, MEM[14]: %x, MEM[15]: %x",
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[0].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[1].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[2].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[3].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[4].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[14].mem_cell.internal_data,
            uut.chip_core.mprj.mprj.qtcore_C1_p0.mem_bank.memory[15].mem_cell.internal_data);
    end
	`endif

	initial begin
		$dumpfile("wb_port_test4.vcd");
		$dumpvars(0, wb_port_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (10) begin
			repeat (100000) @(posedge clock);
			$display("+100000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test Mega-Project WB Port (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test Mega-Project WB Port (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		wait(checkbits == 16'hAB6F);
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Early fail, Test Mega-Project WB Port (GL) Failed");
		`else
			$display ("Monitor: Early fail, Test Mega-Project WB Port (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		wait(checkbits == 16'hAB7F);
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Readout fail, Test Mega-Project WB Port (GL) Failed");
		`else
			$display ("Monitor: Readout fail, Test Mega-Project WB Port (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		wait(checkbits == 16'hAB8F);
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Read-in timeout fail, Test Mega-Project WB Port (GL) Failed");
		`else
			$display ("Monitor: Read-in timeout fail, Test Mega-Project WB Port (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	`ifndef GL
	initial begin
		wait(uut.chip_core.mprj.mprj.p0_proc_go);
		$display("Monitor: Waiting for correct I/O out...");
		wait(mprj_io_0 == 8'h15);
		$display("Monitor: I/O output is correct");
	end
	`endif

	initial begin
		wait(checkbits == 16'hAB9F);
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Read-out timeout fail, Test Mega-Project WB Port (GL) Failed");
		`else
			$display ("Monitor: Read-out timeout fail, Test Mega-Project WB Port (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
	   wait(checkbits == 16'hAB60);
		$display("Monitor: MPRJ-Logic WB Started");
		wait(checkbits == 16'hAB62);
		$display("Monitor: Detected halt_out signal (this is good)");
		wait(checkbits == 16'hAB61);
		`ifdef GL
	    	$display("Monitor: Mega-Project WB (GL) Passed");
		`else
		    $display("Monitor: Mega-Project WB (RTL) Passed");
		`endif
	    $finish;
	end

	integer read_i;
	initial begin
		read_i = 0;
		for(read_i = 0; read_i < 67; read_i = read_i + 1) begin
			wait(checkbits == (16'hf000 | read_i));
			$display("Monitor: Read-in has read %d", read_i);
		end
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#100000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("wb_port_test4.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
`default_nettype wire
