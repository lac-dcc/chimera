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
 * Ethernet MAC testbench
-*/

`include "emac_defines.v"
`include "ephy_defines.v"
`include "tb_emac_defines.v"
`define VCD

parameter Tp = 1;

// open dump files
initial begin
    tb.tb_log_file = $fopen("./log/tb_emac.log");
    if (tb.tb_log_file < 2)
    begin
        $display("*E Could not open/create testbench log file in ./log/ directory!");
        $finish;
    end
    $fdisplay(tb.tb_log_file, "========================== ETHERNET MAC IP Core Testbench results ===========================");
    $fdisplay(tb.tb_log_file, " ");
  
    tb.phy_log_file_desc = $fopen("./log/ephy_model.log");
    if (tb.phy_log_file_desc < 2)
    begin
        $fdisplay(tb.tb_log_file, "*E Could not open/create ephy_model.log file in ./log/ directory!");
        $finish;
    end
    $fdisplay(tb.phy_log_file_desc, "================ PHY Model Testbench access log ================");
    $fdisplay(tb.phy_log_file_desc, " ");
  
  `ifdef VCD
     $dumpfile("./log/ethmac.vcd");
     $dumpvars(0);
  `endif
end
integer      tests_successfull;
integer      tests_failed;
reg [799:0]  test_name; // used for tb_log_file

// main simulation thread
initial begin
    wait(tb.StartTB);  // Start of testbench

    clear_memories;
  
    // Initial global values
    tests_successfull = 0;
    tests_failed = 0;
    
    //  Call tests
    //  ----------
    //test_access_to_mac_reg(0, 4);           // 0 - 4
    //test_miim(0, 17);                       // 0 - 17
    test_miim(0, 2);                        

    // Finish test's logs
    //test_summary;
    $display("\n\n END of SIMULATION");
    $fclose(tb.tb_log_file | tb.phy_log_file_desc);
  
    $stop;
end

//////////////////////////////////////////////////////////////
// Log files and memory tasks
//////////////////////////////////////////////////////////////

task clear_memories;
    reg    [22:0]  adr_i;
    reg            delta_t;
begin
    for (adr_i = 0; adr_i < 4194304; adr_i = adr_i + 1)
    begin
        tb.ephy_model.rx_mem[adr_i[21:0]] = 0;
        tb.ephy_model.tx_mem[adr_i[21:0]] = 0;
    end
end
endtask // clear_memories

task test_note;
    input [799:0] test_note ;
    reg   [799:0] display_note ;
begin
    display_note = test_note;
    while ( display_note[799:792] == 0 )
        display_note = display_note << 8 ;
    $fdisplay( tb.tb_log_file, " " ) ;
    $fdisplay( tb.tb_log_file, "NOTE: %s", display_note ) ;
    $fdisplay( tb.tb_log_file, " " ) ;
end
endtask // test_note

task test_heading;
    input [799:0] test_heading ;
    reg   [799:0] display_test ;
begin
    display_test = test_heading;
    while ( display_test[799:792] == 0 )
      display_test = display_test << 8 ;
    $fdisplay( tb.tb_log_file, "  ***************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, "  ***************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, "  Heading: %s", display_test ) ;
    $fdisplay( tb.tb_log_file, "  ***************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, "  ***************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, " " ) ;
end
endtask // test_heading

task test_fail ;
    input [7999:0] failure_reason ;
    reg   [7999:0] display_failure ;
    reg   [799:0] display_test ;
begin
    tests_failed = tests_failed + 1 ;
  
    display_failure = failure_reason; // {failure_reason, "!"} ;
    while ( display_failure[7999:7992] == 0 )
        display_failure = display_failure << 8 ;
  
    display_test = test_name ;
    while ( display_test[799:792] == 0 )
        display_test = display_test << 8 ;
  
    $fdisplay( tb.tb_log_file, "    *************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, "    At time: %t ", $time ) ;
    $fdisplay( tb.tb_log_file, "    Test: %s", display_test ) ;
    $fdisplay( tb.tb_log_file, "    *FAILED* because") ;
    $fdisplay( tb.tb_log_file, "    %s", display_failure ) ;
    $fdisplay( tb.tb_log_file, "    *************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, " " ) ;
  
    `ifdef STOP_ON_FAILURE
       #20 $stop ;
    `endif
end
endtask // test_fail

task test_fail_num ;
    input [7999:0] failure_reason ;
    input [31:0]   number ;
    reg   [7999:0] display_failure ;
    reg   [799:0] display_test ;
begin
    tests_failed = tests_failed + 1 ;
  
    display_failure = failure_reason; // {failure_reason, "!"} ;
    while ( display_failure[7999:7992] == 0 )
        display_failure = display_failure << 8 ;
  
    display_test = test_name ;
    while ( display_test[799:792] == 0 )
        display_test = display_test << 8 ;
  
    $fdisplay( tb.tb_log_file, "    *************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, "    At time: %t ", $time ) ;
    $fdisplay( tb.tb_log_file, "    Test: %s", display_test ) ;
    $fdisplay( tb.tb_log_file, "    *FAILED* because") ;
    $fdisplay( tb.tb_log_file, "    %s; %d", display_failure, number ) ;
    $fdisplay( tb.tb_log_file, "    *************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, " " ) ;
  
    `ifdef STOP_ON_FAILURE
       #20 $stop ;
    `endif
end
endtask // test_fail_num

task test_ok ;
    reg [799:0] display_test ;
begin
    tests_successfull = tests_successfull + 1 ;

    display_test = test_name ;
    while ( display_test[799:792] == 0 )
        display_test = display_test << 8 ;

    $fdisplay( tb.tb_log_file, "    *************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, "    At time: %t ", $time ) ;
    $fdisplay( tb.tb_log_file, "    Test: %s", display_test ) ;
    $fdisplay( tb.tb_log_file, "    reported *SUCCESSFULL*! ") ;
    $fdisplay( tb.tb_log_file, "    *************************************************************************************" ) ;
    $fdisplay( tb.tb_log_file, " " ) ;
end
endtask // test_ok


task test_summary;
begin
    $fdisplay(tb.tb_log_file, "**************************** Ethernet MAC test summary **********************************") ;
    $fdisplay(tb.tb_log_file, "Tests performed:   %d", tests_successfull + tests_failed) ;
    $fdisplay(tb.tb_log_file, "Failed tests   :   %d", tests_failed) ;
    $fdisplay(tb.tb_log_file, "Successfull tests: %d", tests_successfull) ;
    $fdisplay(tb.tb_log_file, "**************************** Ethernet MAC test summary **********************************") ;
    $fclose(tb.tb_log_file) ;
end
endtask // test_summary

//////////////////////////////////////////////////////////////
// MIIM Basic tasks
//////////////////////////////////////////////////////////////

task miim_set_clk_div; // set clock divider for MII clock
    input [7:0]  clk_div;
begin
    // MDIO mode register
    tb.bus_master.write_reg(`EMAC_MDIOMODE, (`EMAC_MDIOMODE_CLKDIV & clk_div));
end
endtask // miim_set_clk_div

task check_miim_busy; // MIIM - check if BUSY
    reg [31:0] tmp;
begin
    @(posedge tb.bus2ip_clk);                                                                  
    // MIIM read status register
    tb.bus_master.read_reg(`EMAC_MDIOSTATUS, tmp);
    while(tmp[`EMAC_MDIOSTATUS_BUSY] !== 1'b0) //`EMAC_MDIOSTATUS_BUSY
    begin
        @(posedge tb.bus2ip_clk);                                                                  
        tb.bus_master.read_reg(`EMAC_MDIOSTATUS, tmp);
    end
end
endtask // check_miim_busy

task check_miim_scan_valid; // MIIM - check if SCAN data are valid
    reg [31:0] tmp;
begin
    @(posedge tb.bus2ip_clk);                                                                  
    // MIIM read status register
    tb.bus_master.read_reg(`EMAC_MDIOSTATUS, tmp);
    while(tmp[`EMAC_MDIOSTATUS_NVALID] !== 1'b0) //`EMAC_MDIOSTATUS_NVALID
    begin
        @(posedge tb.bus2ip_clk);                                                                  
        tb.bus_master.read_reg(`EMAC_MDIOSTATUS, tmp);
    end
end
endtask // check_miim_scan_valid

task miim_write_req; // requests write to MDIO
    input [4:0]  phy_addr;
    input [4:0]  reg_addr;
    input [15:0] data_in;
begin
    // MDIO address, PHY address = 1, command register address = 0
    tb.bus_master.write_reg(`EMAC_MDIOADDRESS, (`EMAC_MDIOADDRESS_FIAD & phy_addr) | (`EMAC_MDIOADDRESS_RGAD & (reg_addr << 8)));
    // MDIO TX data
    tb.bus_master.write_reg(`EMAC_MDIOTX_DATA, {16'h0000, data_in});
    // MDIO command
    tb.bus_master.write_reg(`EMAC_MDIOCOMMAND, `EMAC_MDIOCOMMAND_WCTRLDATA);
    @(posedge tb.bus2ip_clk);                                                                  
end
endtask // miim_write_req

task miim_read_req; // requests read from MDIO
    input [4:0]  phy_addr;
    input [4:0]  reg_addr;
begin
    // MDIO address, PHY address = 1, command register address = 0
    tb.bus_master.write_reg(`EMAC_MDIOADDRESS, (`EMAC_MDIOADDRESS_FIAD & phy_addr) | (`EMAC_MDIOADDRESS_RGAD & (reg_addr << 8)));
    // MDIO command
    tb.bus_master.write_reg(`EMAC_MDIOCOMMAND, `EMAC_MDIOCOMMAND_RSTAT);
    @(posedge tb.bus2ip_clk);                                                                  
end
endtask // miim_read_req

task miim_scan_req; // requests scan from MDIO
    input [4:0]  phy_addr;
    input [4:0]  reg_addr;
begin
    // MDIO address, PHY address = 1, command register address = 0
    tb.bus_master.write_reg(`EMAC_MDIOADDRESS, (`EMAC_MDIOADDRESS_FIAD & phy_addr) | (`EMAC_MDIOADDRESS_RGAD & (reg_addr << 8)));
    // MDIO command
    tb.bus_master.write_reg(`EMAC_MDIOCOMMAND, `EMAC_MDIOCOMMAND_SCANSTAT);
    @(posedge tb.bus2ip_clk);                                                                  
end
endtask // miim_scan_req

task miim_scan_finish; // finish scan from MDIO
begin
    // MDIO command
    tb.bus_master.write_reg(`EMAC_MDIOCOMMAND, 32'h0);
    @(posedge tb.bus2ip_clk);                                                                  
end
endtask // miim_scan_finish


//////////////////////////////////////////////////////////////
// Test tasks
//////////////////////////////////////////////////////////////

task test_miim;
    input  [31:0]  start_task;
    input  [31:0]  end_task;
    integer        i;
    integer        i1;
    integer        i2;
    integer        i3;
    integer        cnt;
    integer        fail;
    integer        test_num;
    reg     [8:0]  clk_div; // only 8 bits are valid!
    reg     [4:0]  phy_addr;
    reg     [4:0]  reg_addr;
    reg     [15:0] phy_data;
    reg     [15:0] tmp_data;
begin
    // MIIM MODULE TEST
    test_heading("MIIM MODULE TEST");
    $display(" ");
    $display("MIIM MODULE TEST");
    fail = 0;
    
    // reset MAC registers
    tb.hard_reset;

    #200;

    // Set MAC speed
    tb.bus_master.write_reg(`EMAC_CONFIG, `EMAC_CONFIG_SPEED);

    //////////////////////////////////////////////////////////////////////
    ////                                                              ////
    ////  test_miim:                                                  ////
    ////                                                              ////
    ////  0:  Test clock divider of mii management module with all    ////
    ////      possible frequences.                                    ////
    ////  1:  Test various readings from 'real' phy registers.        ////
    ////  2:  Test various writings to 'real' phy registers (control  ////
    ////      and non writable registers)                             ////
    ////  3:  Test reset phy through miim management module           ////
    ////  4:  Test 'walking one' across phy address (with and without ////
    ////      preamble)                                               ////
    ////  5:  Test 'walking one' across phy's register address (with  ////
    ////      and without preamble)                                   ////
    ////  6:  Test 'walking one' across phy's data (with and without  ////
    ////      preamble)                                               ////
    ////  7:  Test reading from phy with wrong phy address (host      ////
    ////      reading high 'z' data)                                  ////
    ////  8:  Test writing to phy with wrong phy address and reading  ////
    ////      from correct one                                        ////
    ////  9:  Test sliding stop scan command immediately after read   ////
    ////      request (with and without preamble)                     ////
    //// 10:  Test sliding stop scan command immediately after write  ////
    ////      request (with and without preamble)                     ////
    //// 11:  Test busy and nvalid status durations during write      ////
    ////      (with and without preamble)                             ////
    //// 12:  Test busy and nvalid status durations during write      ////
    ////      (with and without preamble)                             ////
    //// 13:  Test busy and nvalid status durations during scan (with ////
    ////      and without preamble)                                   ////
    //// 14:  Test scan status from phy with detecting link-fail bit  ////
    ////      (with and without preamble)                             ////
    //// 15:  Test scan status from phy with sliding link-fail bit    ////
    ////      (with and without preamble)                             ////
    //// 16:  Test sliding stop scan command immediately after scan   ////
    ////      request (with and without preamble)                     ////
    //// 17:  Test sliding stop scan command after 2. scan (with and  ////
    ////      without preamble)                                       ////
    ////                                                              ////
    //////////////////////////////////////////////////////////////////////

    for (test_num = start_task; test_num <= end_task; test_num = test_num + 1) begin
        ////////////////////////////////////////////////////////////////////
        ////                                                            ////
        ////  Test clock divider of mii management module with all      ////
        ////  possible frequences.                                      ////
        ////                                                            ////
        ////////////////////////////////////////////////////////////////////
        if (test_num == 0) begin //
            // TEST 0: CLOCK DIVIDER OF MII MANAGEMENT MODULE WITH ALL POSSIBLE FREQUENCES
            test_name   = "TEST 0: CLOCK DIVIDER OF MII MANAGEMENT MODULE WITH ALL POSSIBLE FREQUENCES";
            `TIME; $display("  TEST 0: CLOCK DIVIDER OF MII MANAGEMENT MODULE WITH ALL POSSIBLE FREQUENCES");
        
            wait(tb.Mdc_O); // wait for MDIO clock to be 1
            for(clk_div = 0; clk_div <= 255; clk_div = clk_div + 1) begin
                i1 = 0;
                i2 = 0;
                #Tp miim_set_clk_div(clk_div[7:0]);
                @(posedge tb.Mdc_O);
                #Tp;
                fork
                    begin
                        @(posedge tb.Mdc_O);
                        #Tp;
                        disable count_i1;
                        disable count_i2;
                    end
                    begin: count_i1
                        forever begin
                            @(posedge tb.bus2ip_clk);
                            i1 = i1 + 1;
                            #Tp;
                        end
                    end
                    begin: count_i2
                        forever begin
                            @(negedge tb.bus2ip_clk);
                            i2 = i2 + 1;
                            #Tp;
                        end
                    end
                join

                if((clk_div[7:0] == 0) || (clk_div[7:0] == 1) || (clk_div[7:0] == 2) || (clk_div[7:0] == 3)) begin
                    if((i1 == i2) && (i1 == 2)) begin
                    end
                    else begin
                        fail = fail + 1;
                        test_fail("Clock divider of MII module did'nt divide frequency corectly (it should divide by 2)");
                    end
                end
                else begin
                    if((i1 == i2) && (i1 == {clk_div[7:1], 1'b0})) begin
                    end
                    else begin
                        fail = fail + 1;
                        test_fail("Clock divider of MII module did'nt divide frequency corectly");
                    end
                end
            end

            if(fail == 0) begin
                test_ok;
                `TIME; $display("  TEST 0: CLOCK DIVIDER OF MII MANAGEMENT MODULE WITH ALL POSSIBLE FREQUENCES: All Passed!");
            end 
            else begin
                fail = 0;
            end
        end // test_num == 0

        ////////////////////////////////////////////////////////////////////
        ////                                                            ////
        ////  Test various readings from 'real' phy registers.          ////
        ////                                                            ////
        ////////////////////////////////////////////////////////////////////
        if (test_num == 1) begin//
            // TEST 1: VARIOUS READINGS FROM 'REAL' PHY REGISTERS
            test_name   = "TEST 1: VARIOUS READINGS FROM 'REAL' PHY REGISTERS";
            `TIME; $display("  TEST 1: VARIOUS READINGS FROM 'REAL' PHY REGISTERS");
        
            // set the fastest possible MII
            clk_div = 0;
            miim_set_clk_div(clk_div[7:0]);
            // set address
            reg_addr = 5'h1F;
            phy_addr = 5'h1;
            while(reg_addr >= 5'h4) begin
                // read request
                #Tp miim_read_req(phy_addr, reg_addr);
                check_miim_busy; // wait for read to finish
                // read data
                tb.bus_master.read_reg(`EMAC_MDIORX_DATA, phy_data);
                if (phy_data !== 16'hDEAD) begin
                    test_fail("Wrong data was read from PHY from 'not used' address space");
                    fail = fail + 1;
                end
                if (reg_addr == 5'h4) // go out of for loop
                    reg_addr = 5'h3;
                else
                    reg_addr = reg_addr - 5'h9;
            end
        
            // set address
            reg_addr = 5'h3;
            // read request
            #Tp miim_read_req(phy_addr, reg_addr);
            check_miim_busy; // wait for read to finish
            // read data
            tb.bus_master.read_reg(`EMAC_MDIORX_DATA, phy_data);
            if (phy_data !== {`PHY_ID2, `MAN_MODEL_NUM, `MAN_REVISION_NUM}) begin
              test_fail("Wrong data was read from PHY from ID register 2");
              fail = fail + 1;
            end

            if(fail == 0) begin
                test_ok;
                `TIME; $display("  TEST 1: VARIOUS READINGS FROM 'REAL' PHY REGISTERS: All Passed!");
            end
            else begin
                fail = 0;
            end
        end //test_num == 1
        
        ////////////////////////////////////////////////////////////////////
        ////                                                            ////
        ////  Test various writings to 'real' phy registers (control    ////
        ////  and non writable registers)                               ////
        ////                                                            ////
        ////////////////////////////////////////////////////////////////////
        if (test_num == 2) begin// 
            // TEST 2: VARIOUS WRITINGS TO 'REAL' PHY REGISTERS ( CONTROL AND NON WRITABLE REGISTERS )
            test_name   = "TEST 2: VARIOUS WRITINGS TO 'REAL' PHY REGISTERS ( CONTROL AND NON WRITABLE REGISTERS )";
            `TIME; $display("  TEST 2: VARIOUS WRITINGS TO 'REAL' PHY REGISTERS ( CONTROL AND NON WRITABLE REGISTERS )");
        
            // negate data and try to write into unwritable register
            tmp_data = ~phy_data;
            // write request
            #Tp miim_write_req(phy_addr, reg_addr, tmp_data);
            check_miim_busy; // wait for write to finish
            // read request
            #Tp miim_read_req(phy_addr, reg_addr);
            check_miim_busy; // wait for read to finish
            // read data
            tb.bus_master.read_reg(`EMAC_MDIORX_DATA, tmp_data);
            if (tmp_data !== phy_data) begin
                test_fail("Data was written into unwritable PHY register - ID register 2");
                fail = fail + 1;
            end
        
            // set address
            reg_addr = 5'h0; // control register
            // read request
            #Tp miim_read_req(phy_addr, reg_addr);
            check_miim_busy; // wait for read to finish
            // read data
            tb.bus_master.read_reg(`EMAC_MDIORX_DATA, tmp_data);
            // write request
            phy_data = 16'h7DFF; // bit 15 (RESET bit) and bit 9 are self clearing bits
            #Tp miim_write_req(phy_addr, reg_addr, phy_data);
            check_miim_busy; // wait for write to finish
            // read request
            #Tp miim_read_req(phy_addr, reg_addr);
            check_miim_busy; // wait for read to finish
            // read data
            tb.bus_master.read_reg(`EMAC_MDIORX_DATA, phy_data);
            if (phy_data !== 16'h7DFF) begin
                test_fail("Data was not correctly written into OR read from writable PHY register - control register");
                fail = fail + 1;
            end
            // write request
            #Tp miim_write_req(phy_addr, reg_addr, tmp_data);
            check_miim_busy; // wait for write to finish
            // read request
            #Tp miim_read_req(phy_addr, reg_addr);
            check_miim_busy; // wait for read to finish
            // read data
            tb.bus_master.read_reg(`EMAC_MDIORX_DATA, phy_data);
            if (phy_data !== tmp_data) begin
                test_fail("Data was not correctly written into OR read from writable PHY register - control register");
                fail = fail + 1;
            end

            if(fail == 0) begin
                test_ok;
                `TIME; $display("  TEST 2: VARIOUS WRITINGS TO 'REAL' PHY REGISTERS ( CONTROL AND NON WRITABLE REGISTERS ): All Passed!");
            end
            else begin
                fail = 0;
            end
        end
        
    end   //  for (test_num=start_task; test_num <= end_task; test_num=test_num+1)
end
endtask // test_miim
  
