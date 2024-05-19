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
     $dumpoff;
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
    test_full_duplex_transmit_1000M(64, 1518);                        

    // Finish test's logs
    test_summary;
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
// functions to assemble frame
//////////////////////////////////////////////////////////////
`include "emac_utils.v"

reg   [7:0]  frame_buf[0:16383];
reg   [7:0]  payload_buf[0:16366];

function integer AssembleFrame(input [47:0] dstMacAddr, input [47:0] srcMacAddr, 
                     input [15:0] lengthType, input integer payloadLen,  input crcEn);
    integer len;
    integer i;
    integer m;
    integer pad_len;
    reg [31:0] frame_crc;

    begin
        len = 0;

        //destination address
        for(i = 0; i < 6; i = i+1) begin
            frame_buf[len] = dstMacAddr[(47-i*8)-:8];
            len = len + 1;
        end

        //source address
        for(i = 0; i < 6; i = i+1) begin
            frame_buf[len] = srcMacAddr[(47-i*8)-:8];
            len = len + 1;
        end

        //Length/Type
        frame_buf[len+0] = lengthType[15:8]; frame_buf[len+1] = lengthType[7:0]; 
        len = len + 2;

        //payload
        for(i = 0; i < payloadLen; i = i+1) begin
            frame_buf[len] = payload_buf[i];
            len = len + 1;
        end

        //padding and calculate CRC
        if(crcEn == 1) begin
            pad_len = 64 - (len + 4);

            if(pad_len > 0) begin
                for(m = 0; m < pad_len; m = m+1) begin
                    frame_buf[len] = 8'h00;
                    len = len + 1;
                end
            end

            //crc octets
            frame_crc = CalculateFrameFCS(len);
            frame_buf[len+0] = frame_crc[7:0];    frame_buf[len+1] = frame_crc[15:8];  
            frame_buf[len+2] = frame_crc[23:16];  frame_buf[len+3] = frame_crc[31:24];
            len = len + 4; 
        end  //crcEn

        AssembleFrame = len;
    end
endfunction

//calculate FCS for frame_buf
function [31:0] CalculateFrameFCS(input integer dataLen);
    integer i;
    reg [31:0] current_crc;
    reg [31:0] next_crc;

    begin
        current_crc = 32'hffff_ffff;
        for(i = 0; i < dataLen; i = i + 1) begin
            next_crc = nextCRC32_D8(reverse_8b(frame_buf[i]), current_crc);
            current_crc = next_crc; 
        end

        CalculateFrameFCS = ~reverse_32b(current_crc);
    end
endfunction

//////////////////////////////////////////////////////////////
// Test tasks
//////////////////////////////////////////////////////////////

task test_full_duplex_transmit_1000M;
    input  [31:0]  start_frame_len;
    input  [31:0]  end_frame_len;

    integer        i;
    integer        fail;
    integer        frame_len;
    integer        payload_len;
    integer        assemble_len;
    integer        ifg_interval;           
    integer        frame_file;

    reg   [31:0]   reg_data;
    reg   [47:0]   dst_mac_addr;
    reg   [47:0]   src_mac_addr;
    reg   [15:0]   length_type;
    reg   [7:0]    frame_data;

    // storage memory for TX data 
    reg   [7:0]    tx_mem [0:4194303]; // 4194304 locations of 8-bit data width
    integer        tx_mem_addr;        // address for storing to TX memory
begin
    // Open file to dump frame data
    frame_file = $fopen("./log/emac_frame.dat");
    if (frame_file < 2)
    begin
        $display("*E Could not open/create frame data dump file in ./log/ directory!");
        $finish;
    end

    // MAC FULL DUPLEX TRANSMIT TEST--1000M SPEED
    test_heading("MAC FULL DUPLEX TRANSMIT TEST -- 1000M SPEED");
    $display(" ");
    $display("MAC FULL DUPLEX TRANSMIT TEST--1000M SPEED");
    fail = 0;

    // reset MAC registers
    tb.hard_reset;

    #200;

    // Set MAC configuration register
    reg_data = `EMAC_CONFIG_SPEED | `EMAC_CONFIG_RXEN | `EMAC_CONFIG_TXEN | `EMAC_CONFIG_CRCEN | `EMAC_CONFIG_FULLDUPLEX;
    tb.bus_master.write_reg(`EMAC_CONFIG, reg_data);

    #200;

    test_name    = "TEST: MAC FULL DUPLEX TRANSMIT TEST -- 1000M SPEED";
    ifg_interval = 500; //ns
    tx_mem_addr  = 0;

    dst_mac_addr = 48'hE0_55_57_D0_00_03;
    src_mac_addr = 48'hD0_77_82_C0_02_65;
    length_type  = 16'h187f;   //user defined type

    for(frame_len = start_frame_len; frame_len <= end_frame_len; frame_len = frame_len + 1) begin
        `TIME; $display("   Transmitted frame length frame_len = %d", frame_len);
        payload_len = frame_len - (12+2+4);  //subtract dst/src mac address, type/length, crc length

        // Fill payload_buf;
        frame_data = 0;
        for(i = 0; i < payload_len; i = i + 1) begin
            payload_buf[i] = frame_data;
            frame_data = frame_data + 1;
        end

        // Assemble frame
        assemble_len = AssembleFrame(dst_mac_addr, src_mac_addr, length_type, payload_len, 1'b1);
        if(assemble_len != frame_len) begin
            `TIME; $display("  Assemble frame error, frame_len = %h, assemble_len = %h", frame_len, assemble_len);
            fail = fail + 1;
            disable test_full_duplex_transmit_1000M;
        end

        // Dump frame data to file
        for(i = 0; i < frame_len; i = i+4) begin
            if((i+4) <= frame_len) 
                $fdisplay(frame_file, "%h  %h %h %h %h", i, frame_buf[i], frame_buf[i+1], frame_buf[i+2], frame_buf[i+3]);  
            else if((i+3) == frame_len)
                $fdisplay(frame_file, "%h  %h %h %h", i, frame_buf[i], frame_buf[i+1], frame_buf[i+2]);  
            else if((i+2) == frame_len)
                $fdisplay(frame_file, "%h  %h %h", i, frame_buf[i], frame_buf[i+1]);  
            else if((i+1) == frame_len)
                $fdisplay(frame_file, "%h  %h", i, frame_buf[i]);  
        end
        $fdisplay(frame_file, "   ");

        // Store frame data (include CRC) to tx_mem, which will be used to compare received data in PHY model
        for(i = 0; i < frame_len; i = i+1) begin
            tx_mem[tx_mem_addr] = frame_buf[i];
            tx_mem_addr = tx_mem_addr + 1;
        end 

        // Write frame data (exclude CRC) to TX FIFO to start MAC frame transmit
        for(i = 0; i < frame_len-4; i = i+1) begin
            tb.emac_user_agent.tx_buf[i] = frame_buf[i];
        end
        tb.emac_user_agent.TransmitFrame(frame_len-4);

        #ifg_interval;  //wait ifg_interval ns       
    end   //for(frame_len = start_frame_len; frame_len <= end_frame_len; frame_len = frame_len + 1)

    // Compare the data received in PHY model with the transmitted data
    `TIME; 
    $display("  Total frame data transmitted : %d", tx_mem_addr);
    $display("  Waiting for PHY Model to complete data reception...");
    wait_timeout(tb.ephy_model.tx_mem_addr_in == tx_mem_addr, 2_000_000);

    for(i = 0; i < tx_mem_addr; i = i+1) begin
        if(tx_mem[i] != tb.ephy_model.tx_mem[i]) begin
            fail = fail + 1;
            $display("    Transmit data and receive data mismatch at mem_addr: %d, Tx data: %h, Rx data: %h",
                          i, tx_mem[i], tb.ephy_model.tx_mem[i]);
        end
    end

    if(fail == 0)
        $display("\nTEST PASS!!!");
    else begin
        $display("\nTEST FAIL!!!, Mismatched Number: %d", fail);
        test_fail("Full Duplex Transmit 1000M Speed Test Fail, Data Mismatch!");
    end

    $fclose(frame_file);
end
endtask // test_full_duplex_transmit_1000M
  
task wait_timeout(input ev, input integer ns_timeout);
    integer time_elapsed;
begin
    time_elapsed = 0;
    while(!ev && time_elapsed < ns_timeout) begin
        time_elapsed = time_elapsed + 10;
        #10;
    end
end
endtask
