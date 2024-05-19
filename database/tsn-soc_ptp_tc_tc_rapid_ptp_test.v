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
 * ptpv2 rapid test, testbench top level
-*/

`include "ptpv2_defines.v"
`define WAVE_DUMP_FILE "./ptpv2.fst"

module tc_rapid_ptp_test;

    harness harness();
    //small intervals for test
    defparam harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INT10MS = 24'd0_500_000;        
    defparam harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INTQ8MS = 24'd0_500_000;        
    defparam harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INT10MS = 24'd0_500_000;        
    defparam harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INTQ8MS = 24'd0_500_000;        

    wire [79:0]  slv_rtc   ;
    wire [79:0]  msr_rtc    ;
    wire [79:0]  rtc_diff  ;
    
    assign slv_rtc  = harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.rtc_std_o;
    assign msr_rtc  = harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.rtc_std_o; 
    assign rtc_diff = (slv_rtc >= msr_rtc) ? slv_rtc - msr_rtc : msr_rtc - slv_rtc;
    
    integer     i;
    integer     flog;
    integer     bcst;
    reg         dmp_fin;

    wire        mii_mode = 1'b0;     //0: GMII; 1: MII
    wire [5:0]  clk_ctl = 6'b100101; //{emb_ingressTime, bypass, tc_offload, peer_delay/delay_req-response, tc/bc, one_step/two-step}       
    wire        bypass  = 0;            
    wire [2:0]  ecsl_mode = 0;       //0: ether2; 1: ipv4/udp; 2: ipv6/udp; 3: pppoe/ipv4/udp; 4: pppoe/ipv6/udp; 
                                     //5: snap/ipv4/udp; 6: snap/ipv6/udp; 7: snap/802.3 
    wire [15:0] vlan_tag  = 0;       //0: no vlan tag; 1: single vlan tag; 2: double vlan tag
  
    reg         r_mii_mode;
    reg [5:0]   r_clk_ctl;         
    reg         r_bypass;            
    reg [2:0]   r_ecsl_mode; 
    reg [1:0]   r_vlan_tag; 

    reg [15:0]  length_type;
    reg [15:0]  ether2_type;
  
    initial
    begin: test_procedure
        flog  = $fopen("./ptpv2-log.dat") ;   

        dmp_fin = 0;
        bcst = 1 | flog;
      
        $fdisplay(bcst, "ptpv2 simulation start!");
        r_mii_mode  = mii_mode;
        r_clk_ctl   = clk_ctl ;
        r_bypass    = bypass ;
        r_ecsl_mode = ecsl_mode;
        r_vlan_tag  = vlan_tag ;
        
        $fdisplay(bcst, "----------------------------------------------------------------------------------");
        //characteristic of clock
        if(r_mii_mode == 1'b0)
            $fdisplay(bcst, "Gigabit Ethernet GMII mode"); 
        else 
            $fdisplay(bcst, "10M/100M Ethernet MII mode");             

        if(r_clk_ctl[2] == 1'b0)
            $fdisplay(bcst, "delay_request-response mechanism"); 
        else 
            $fdisplay(bcst, "peer delay mechanism");             

        if(r_clk_ctl[1] == 1'b0)
            $fdisplay(bcst, "ordinary/boundary clock"); 
        else 
            $fdisplay(bcst, "transparent clock");
        
        if(r_clk_ctl[0] == 1'b0)
            $fdisplay(bcst, "two-step clock"); 
        else 
            $fdisplay(bcst, "one-step clock");
        
        //bypass determination
        if(r_bypass == 1'b1)
            $fdisplay(bcst, "bypass ptpv2 functions");
        
        //encapsulation mode
        case(r_ecsl_mode)
            3'h0: begin
                $fdisplay(bcst, "ethernet2 encapsulation");    
                length_type = 16'h88f7;
                ether2_type = 16'h0000;
            end       
            3'h1: begin
                $fdisplay(bcst, "ipv4/udp encapsulation");              
                length_type = 16'h0800;
                ether2_type = 16'h0000;
            end
            3'h2: begin
                $fdisplay(bcst, "ipv6/udp encapsulation");              
                length_type = 16'h86dd;
                ether2_type = 16'h0000;
            end
            3'h3: begin
                $fdisplay(bcst, "pppoe ipv4/udp encapsulation");               
                length_type = 16'h8864;
                ether2_type = 16'h0021;
            end
            3'h4: begin
                $fdisplay(bcst, "pppoe ipv6/udp encapsulation");                 
                length_type = 16'h8864;
                ether2_type = 16'h0057;
            end
            3'h5: begin
                $fdisplay(bcst, "snap ipv4/udp encapsulation");                     
                length_type = 16'h0080;
                ether2_type = 16'h0800;
            end
            3'h6: begin
                $fdisplay(bcst, "snap ipv6/udp encapsulation");                
                length_type = 16'h0080;
                ether2_type = 16'h86dd;
            end
        endcase
        
        //vlan tag
        case(r_vlan_tag)
            2'b00:  
                $fdisplay(bcst, "no vlan");                   
            2'b01: 
                $fdisplay(bcst, "single vlan");                 
            2'b10: 
                $fdisplay(bcst, "double vlan");                  
        endcase
        
        $fdisplay(bcst, "  ");      
        
        //reset slave and master
        fork
            harness.ptpv2_endpoint.clkgen.reset;
            harness.lp_ptpv2_endpoint.clkgen.reset; 
        join       
        
        #1000;

        //set ethernet xMII mode
        force harness.mii_mode = r_mii_mode;

        //slave settings
        force harness.ptpv2_endpoint.ptp_agent.clk_ctl[1:0] = r_clk_ctl[1:0];
        force harness.ptpv2_endpoint.ptp_agent.tx_vlan_tag = r_vlan_tag;
        force harness.ptpv2_endpoint.ptp_agent.tx_length_type = length_type;
        force harness.ptpv2_endpoint.ptp_agent.tx_ether2_type = ether2_type;
        force harness.ptpv2_endpoint.ptp_agent.peer_delay = r_clk_ctl[2];

        //master settings
        force harness.lp_ptpv2_endpoint.ptp_agent.clk_ctl[1:0] = r_clk_ctl[1:0];
        force harness.lp_ptpv2_endpoint.ptp_agent.tx_vlan_tag = r_vlan_tag;
        force harness.lp_ptpv2_endpoint.ptp_agent.tx_length_type = length_type;
        force harness.lp_ptpv2_endpoint.ptp_agent.tx_ether2_type = ether2_type;
        force harness.lp_ptpv2_endpoint.ptp_agent.peer_delay = r_clk_ctl[2];


        fork
            harness.ptpv2_endpoint.ptp_agent.write_reg({`TSU_BLK_ADDR, `TSU_CFG_ADDR}, {26'b0, r_clk_ctl[5:0]});
            harness.lp_ptpv2_endpoint.ptp_agent.write_reg({`TSU_BLK_ADDR, `TSU_CFG_ADDR}, {26'b0, r_clk_ctl[5:0]});
        join


        #200;

        //set tick_inc value
        //ge clock T = 8ns, 8 * 2^26 = 536870912, convert to
        //hexdecimal, 32'h2000_0000
        fork
            harness.ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `TICK_INC_ADDR}, 32'h2000_0000);
            harness.lp_ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `TICK_INC_ADDR}, 32'h2000_0000);
        join
        
        #200;      

        //initialize ptp master clock
        //set ns offset
        harness.lp_ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `NS_OFST_ADDR}, 32'h1234_5678);
        //set second offset
        harness.lp_ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `SC_OFST_ADDR0}, {16'b0, 16'h3abc});
        harness.lp_ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `SC_OFST_ADDR1}, 32'hdefc_7956);
        //adjustment take effect
        harness.lp_ptpv2_endpoint.ptp_agent.write_reg({`RTC_BLK_ADDR, `RTC_CTL_ADDR}, 32'h1);
         
              
        for(i = 0; i < 5; i = i+1) begin
            #(2*harness.ptpv2_endpoint.ptpv2_core_wrapper.ptpv2_core_inst.rtc_unit_inst.sync_io_inst.INT10MS+1000);

            $fdisplay(bcst, "i = %d", i);
            $fdisplay(bcst, "ptpv2 slave rtc value = %h", slv_rtc);
            $fdisplay(bcst, "ptpv2 master rtc value = %h", msr_rtc );
            $fdisplay(bcst, "rtc value difference between slave and master   = %h", rtc_diff);  
            
            if(i == 3 && rtc_diff > 20) begin
                $fdisplay(bcst, "error: time not match. ptpv2 simulation end!");
                $fdisplay(bcst, "PTPv2 SIMULATION FAIL!!!!!");
                $fclose(flog);   

                dmp_fin = 1;
                #200;

                $stop;                                   
            end        
               
            $fdisplay(bcst, "  ");
        end 
      
        $fdisplay(bcst, "PTPv2 SIMULATION PASS!!!!!");
        $fclose(flog);

        dmp_fin = 1;
        #200;

        $finish;
    end
  
    initial
    begin
        $dumpfile(`WAVE_DUMP_FILE);
        $dumpvars(0, tc_rapid_ptp_test);
        $dumpon;
        //$dumpoff;
    end

    //++
    //dump frames from master(slave)
    //--
    wire         tx_en  = harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.tx_en_o;
    wire         tx_er  = harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.tx_er_o;
    wire  [7:0]  txd    = harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.txd_o  ;
    wire         tx_clk = harness.lp_ptpv2_endpoint.ptpv2_core_wrapper.tx_clk;

    wire         rx_dv  = harness.ptpv2_endpoint.ptpv2_core_wrapper.rx_dv_o;
    wire         rx_er  = harness.ptpv2_endpoint.ptpv2_core_wrapper.rx_er_o;
    wire  [7:0]  rxd    = harness.ptpv2_endpoint.ptpv2_core_wrapper.rxd_o  ;
    wire         rx_clk = harness.ptpv2_endpoint.ptpv2_core_wrapper.rx_clk;

    frame_monitor frame_monitor (
        .clk             (tx_clk),
        //.clk             (rx_clk),

        .dump_finish_i   (dmp_fin),
        .mii_mode_i      (mii_mode),
    
        .data_en_i       (tx_en),
        .data_er_i       (tx_er),
        .data_i          (txd)

        //.data_en_i       (rx_dv),
        //.data_er_i       (rx_er),
        //.data_i          (rxd)
    );
endmodule
