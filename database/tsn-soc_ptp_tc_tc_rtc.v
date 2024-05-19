// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * testcase for ptpv2 real time counter
-*/

`include "ptpv2_defines.v"

`define WAVE_DUMP_FILE "./ptpv2.fst"
`define SIM_PPS

module tc_rtc;

    harness harness();
    //use small intervals
    //defparam harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INT10MS = 24'd150000;        
    //defparam harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INTQ8MS = 24'd150000;        
    //defparam harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INT10MS = 24'd150000;        
    //defparam harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INTQ8MS = 24'd150000;        

    integer i;

    initial begin
        fork
            harness.ptpv2_endpoint.clkgen.reset;
            harness.lp_ptpv2_endpoint.clkgen.reset; 
        join   

        #700;

        //initial rtc 
        $display("initialize rtc with second offset 32'h1234_5678 !");
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `SC_OFST_ADDR0}, {16'b0, 16'h11});
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `SC_OFST_ADDR1}, 32'h1234_5678);
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `NS_OFST_ADDR}, 32'h0150_0000);
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `RTC_CTL_ADDR}, 32'h1);
        #10_0000;

        //clear rtc 
        $display("clear rtc !");
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `RTC_CTL_ADDR}, 32'h2);
        #10_0000;

        //reset sc_counter and ns_counter
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `SC_OFST_ADDR0}, {16'b0, 16'h11});
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `SC_OFST_ADDR1}, 32'h2222_3333);
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `NS_OFST_ADDR}, 32'h0);
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `RTC_CTL_ADDR}, 32'h1);

        //set tick_inc value
        //ge clock T = 8ns, 8 * 2^26 = 536870912, convert to
        //hexdecimal, 32'h2000_0000
        $display("set tick_inc value to 32'h2000_0000 ! \n");
        harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `TICK_INC_ADDR}, 32'h2000_0000);
        #10_0000;

`ifdef SIM_PPS
        //wait 1.2 seconds
        $display("wait 1.2 seconds for pps output!");

        for(i = 1; i < 120; i=i+1) begin
            #1000_0000;
            $display("%f seconds elapsed!", i*0.01);
        end
`endif

        #10_0000;

        $finish;
    end

    //monitor pps output
    wire pps_out = harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.pps_o;
    wire [79:0] rtc_std = harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_std; 
    wire [79:0] pts_std = harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.rtc_rgs_inst.pts_std_i;

    initial begin
        force harness.ptpv2_endpoint.pps_in = pps_out;
    end
  
`ifdef SIM_PPS
    always @(posedge pps_out) begin
        #20;
        $display("positive edge of pps output is detected!");
        $display("current ptpv2 rtc time = %h", rtc_std);
        #200;
        $display("timestamp of pps input = %h", pts_std);
        $display("\n");
    end
`endif

    reg  dump_on_flag;
    reg  dump_off_flag;

    initial
    begin
        $dumpfile(`WAVE_DUMP_FILE);
        $dumpvars(0, tc_rtc.harness.ptpv2_endpoint);

        $dumpon;
`ifdef SIM_PPS
        $dumpoff;

        dump_on_flag = 0;
        dump_off_flag = 1;

        while (1) begin
            if((rtc_std[31:0] > 32'd9_9900_0000 || rtc_std[31:0] < 32'd100_0000) && dump_off_flag == 1) begin
                $dumpon;
                dump_on_flag = 1;
                dump_off_flag = 0;
            end

            if((rtc_std[31:0] <= 32'd9_9900_0000 && rtc_std[31:0] >= 32'd100_0000) && dump_on_flag == 1) begin
                $dumpoff;
                dump_on_flag = 0;
                dump_off_flag = 1;
            end

            #10;
        end
`endif

    end    
endmodule
