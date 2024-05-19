// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2002 Tadej Markovic, tadej@opencores.org 
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
 * Ethernet PHY model
-*/

`include "ephy_defines.v"
`include "tb_emac_defines.v"

module ephy_model  // Simplified PHY model
(
    // MAC miscellaneous signals
    input              m_rst_n,
    input  [2:0]       speed_i,    //from MAC
    // MAC TX signals
    input              mgtx_clk,    //from MAC to PHY
    output reg         mtx_clk ,    //from PHY to MAC
    input  [7:0]       mtxd_i  ,
    input              mtx_en_i,
    input              mtx_er_i,
    // MAC RX signals
    output reg         mrx_clk ,
    output reg [7:0]   mrxd_o  ,
    output reg         mrx_dv_o,
    output reg         mrx_er_o,
    // MAC common signals
    output reg         mcol_o,
    output reg         mcrs_o,
    // MAC management signals
    input              mdc_i,
    inout              md_io,
    // SYSTEM
    input  [31:0]      phy_log
);

    //////////////////////////////////////////////////////////////////////
    //
    // PHY management (MIIM) REGISTER definitions
    //
    //////////////////////////////////////////////////////////////////////
    //
    //   Supported registers:
    //
    // Addr | Register Name
    //--------------------------------------------------------------------
    //   0  | Control reg.         |
    //   1  | Status reg. #1       |--> normal operation
    //   2  | PHY ID reg. 1        |
    //   3  | PHY ID reg. 2        |
    //   11 | PSE Control reg.     |
    //   12 | PSE Status reg.      |
    //   15 | Extended Status reg. |
    //----------------------
    // Addr | Data MEMORY      |-->  for testing
    //
    //--------------------------------------------------------------------

    // Control register
    reg            control_bit15;     //Reset, self clearing bit
    reg    [14:10] control_bit14_10;
    reg            control_bit9;      //Restart Auto-Negotiation, self clearing bit
    reg    [8:0]   control_bit8_0;

    // Status register
    wire   [15:9]  status_bit15_9 = `SUPPORTED_SPEED_AND_PORT;
    wire           status_bit8    = `EXTENDED_STATUS;
    wire           status_bit7    = 1'b0; // reserved
    reg    [6:0]   status_bit6_0;

    // PHY ID register 1
    wire   [15:0]  phy_id1        = `PHY_ID1;
    // PHY ID register 2
    wire   [15:0]  phy_id2        = {`PHY_ID2, `MAN_MODEL_NUM, `MAN_REVISION_NUM};

    //--------------------------------------------------------------------
    //
    // Data MEMORY
    reg    [15:0]  data_mem [0:31]; // 32 locations of 16-bit data width
    //
    //////////////////////////////////////////////////////////////////////


    //////////////////////////////////////////////////////////////////////
    //
    // PHY clocks - RX & TX
    //
    //////////////////////////////////////////////////////////////////////
`ifdef VERBOSE
    always @(*) begin
        if (!status_bit6_0[2]) // Link is down
            #1 $fdisplay(phy_log, "   (%0t)(%m)Ethernet link is down!", $time);
        else
            #1 $fdisplay(phy_log, "   (%0t)(%m)Ethernet link is up!", $time);
    end
`endif

    // speed selection signal eth_speed 
    // control reg. {0.6, 0.13}: 
    // 2'b11: Reserved
    // 2'b10: 1000 Mbps
    // 2'b01: 100 Mbps
    // 2'b00: 10 Mbps
    reg [1:0]     eth_speed;

    always @(*) begin
        eth_speed = 2'b00;
        if (!control_bit14_10[12]) begin  //Not Auto-Negotiation Enabled
            if(speed_i[2])
                eth_speed = 2'b10;
            else if(speed_i[1])
                eth_speed = 2'b01;
            else if(speed_i[0])
                eth_speed = 2'b00;
        end
    end

    `ifdef VERBOSE
    always @(*) begin
        if(eth_speed == 2'b10)
            #1 $fdisplay(phy_log, "   (%0t)(%m)PHY configured to 1000 Mbps!", $time);
        else if(eth_speed == 2'b01)
            #1 $fdisplay(phy_log, "   (%0t)(%m)PHY configured to 100 Mbps!", $time);
        else
            #1 $fdisplay(phy_log, "   (%0t)(%m)PHY configured to 10 Mbps!", $time);
    end
    `endif

    initial begin
        mtx_clk = 0;
        #7;
        forever begin
            if(eth_speed == 2'b01) // 100 Mbps - 25 MHz, 40 ns
            begin
                #20 mtx_clk = ~mtx_clk;
            end
            else if(eth_speed == 2'b00) // 10 Mbps - 2.5 MHz, 400 ns
            begin
                #200 mtx_clk = ~mtx_clk;
            end
            else
                #1;  //to avoid dead loop
        end
    end

    initial begin
        // EQUAL mrx_clk to mtx_clk
        mrx_clk = 0;
        #7;
        forever begin
            if(eth_speed == 2'b10)      // 1000 Mbps - 125 MHz, 8 ns
            begin
                #4  mrx_clk = ~mrx_clk;
            end
            else if(eth_speed == 2'b01) // 100 Mbps - 25 MHz, 40 ns
            begin
                #20 mrx_clk = ~mrx_clk;
            end
            else if(eth_speed == 2'b00) // 10 Mbps - 2.5 MHz, 400 ns
            begin
                #200 mrx_clk = ~mrx_clk;
            end
            else
                #1;  //to avoid dead loop
        end
    end

    //////////////////////////////////////////////////////////////////////
    //
    // PHY management (MIIM) interface
    //
    //////////////////////////////////////////////////////////////////////
    reg             respond_to_all_phy_addr; // PHY will respond to all phy addresses
    reg             no_preamble; // PHY responds to frames without preamble
    
    integer         md_transfer_cnt; // counter countes the value of whole data transfer
    reg             md_transfer_cnt_reset; // for reseting the counter
    reg             md_io_reg; // registered input
    reg             md_io_output; // registered output
    reg             md_io_rd_wr;  // op-code latched (read or write)
    reg             md_io_enable; // output enable
    reg     [4:0]   phy_address; // address of PHY device
    reg     [4:0]   reg_address; // address of a register
    reg             md_get_phy_address; // for shifting PHY address in
    reg             md_get_reg_address; // for shifting register address in
    reg     [15:0]  reg_data_in; // data to be written in a register
    reg             md_get_reg_data_in; // for shifting data in
    reg             md_put_reg_data_in; // for storing data into a selected register
    reg     [15:0]  reg_data_out; // data to be read from a register
    reg             md_put_reg_data_out; // for registering data from a selected register
    
    wire    [15:0]  register_bus_in; // data bus to a selected register
    reg     [15:0]  register_bus_out; // data bus from a selected register

    initial begin
        md_io_enable = 1'b0;
        respond_to_all_phy_addr = 1'b0;
        no_preamble = 1'b0;
    end

    // tristate output
    assign #1 md_io = (m_rst_n && md_io_enable) ? md_io_output : 1'bz ;

    // registering input
    always @(posedge mdc_i or negedge m_rst_n) begin
        if (!m_rst_n)
            md_io_reg <= #1 0;
        else
            md_io_reg <= #1 md_io;
    end

    // getting (shifting) PHY address, Register address and Data in
    // putting Data out and shifting
    always @(posedge mdc_i or negedge m_rst_n) begin
        if (!m_rst_n) begin
            phy_address <= 0;
            reg_address <= 0;
            reg_data_in <= 0;
            reg_data_out <= 0;
            md_io_output <= 0;
        end
        else begin
            if (md_get_phy_address) begin
                phy_address[4:1] <= phy_address[3:0]; // correct address is `ETH_PHY_ADDR
                phy_address[0]   <= md_io;
            end
            if (md_get_reg_address) begin
                reg_address[4:1] <= reg_address[3:0];
                reg_address[0]   <= md_io;
            end
            if (md_get_reg_data_in) begin
                reg_data_in[15:1] <= reg_data_in[14:0];
                reg_data_in[0]    <= md_io;
            end
            if (md_put_reg_data_out) begin
                reg_data_out <= register_bus_out;
            end
            if (md_io_enable) begin
                md_io_output       <= reg_data_out[15];
                reg_data_out[15:1] <= reg_data_out[14:0];
                reg_data_out[0]    <= 1'b0;
            end
        end
    end

    assign #1 register_bus_in = reg_data_in; // md_put_reg_data_in - allows writing to a selected register

    // counter for transfer to and from MIIM
    always @(posedge mdc_i or negedge m_rst_n) begin
        if (!m_rst_n) begin
            if (no_preamble)
                md_transfer_cnt <= 33;
            else
                md_transfer_cnt <= 1;
        end
        else begin
            if (md_transfer_cnt_reset) begin
                if (no_preamble)
                    md_transfer_cnt <= 33;
                else
                    md_transfer_cnt <= 1;
            end
            else if (md_transfer_cnt < 64) begin
                md_transfer_cnt <= md_transfer_cnt + 1'b1;
            end
            else begin
                if (no_preamble)
                    md_transfer_cnt <= 33;
                else
                    md_transfer_cnt <= 1;
            end
        end
    end

    // MIIM transfer control
    always @(*) begin
        #1;
        while ((m_rst_n) && (md_transfer_cnt <= 64)) begin
            // reset the signal - put registered data in the register (when write)
            // check preamble
            if (md_transfer_cnt < 33) begin
                #4 md_put_reg_data_in = 1'b0;
                if (md_io_reg !== 1'b1) begin
                    #1 md_transfer_cnt_reset = 1'b1;
                end
                else begin
                    #1 md_transfer_cnt_reset = 1'b0;
                end
            end
    
            // check start bits
            else if (md_transfer_cnt == 33) begin
                if (no_preamble) begin
                    #4 md_put_reg_data_in = 1'b0;
                    if (md_io_reg === 1'b0) begin
                        #1 md_transfer_cnt_reset = 1'b0;
                    end
                    else begin
                        #1 md_transfer_cnt_reset = 1'b1;
                        //if ((md_io_reg !== 1'bz) && (md_io_reg !== 1'b1))
                        if (md_io_reg !== 1'bz) begin
                            // ERROR - start !
                            `ifdef VERBOSE
                            $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong first start bit (without preamble)", $time);
                            `endif
                            #10 $stop;
                        end
                    end
                end
                else begin// with preamble
                    #4 ;
                    `ifdef VERBOSE
                    $fdisplay(phy_log, "   (%0t)(%m)MIIM - 32-bit preamble received", $time);
                    `endif
                    // check start bit only if md_transfer_cnt_reset is inactive, because if
                    // preamble suppression was changed start bit should not be checked
                    if ((md_io_reg !== 1'b0) && (md_transfer_cnt_reset == 1'b0)) begin
                        // ERROR - start !
                        `ifdef VERBOSE
                        $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong first start bit", $time);
                        `endif
                        #10 $stop;
                    end
                end
            end
    
            else if (md_transfer_cnt == 34) begin
                #4;
                if (md_io_reg !== 1'b1) begin
                    // ERROR - start !
                    #1;
                    `ifdef VERBOSE
                    if (no_preamble)
                        $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong second start bit (without preamble)", $time);
                    else
                        $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong second start bit", $time);
                    `endif
                    #10 $stop;
                end
                else begin
                    `ifdef VERBOSE
                    if (no_preamble)
                        #1 $fdisplay(phy_log, "   (%0t)(%m)MIIM - 2 start bits received (without preamble)", $time);
                    else
                        #1 $fdisplay(phy_log, "   (%0t)(%m)MIIM - 2 start bits received", $time);
                    `endif
                end
            end
    
            // register the op-code (rd / wr)
            else if (md_transfer_cnt == 35) begin
                #4;
                if (md_io_reg === 1'b1) begin
                    #1 md_io_rd_wr = 1'b1;
                end
                else begin
                    #1 md_io_rd_wr = 1'b0;
                end
            end
    
            else if (md_transfer_cnt == 36) begin
                #4;
                if ((md_io_reg === 1'b0) && (md_io_rd_wr == 1'b1)) begin
                    #1 md_io_rd_wr = 1'b1; // reading from PHY registers
                    `ifdef VERBOSE
                    $fdisplay(phy_log, "   (%0t)(%m)MIIM - op-code for READING from registers", $time);
                    `endif
                end
                else if ((md_io_reg === 1'b1) && (md_io_rd_wr == 1'b0)) begin
                    #1 md_io_rd_wr = 1'b0; // writing to PHY registers
                    `ifdef VERBOSE
                    $fdisplay(phy_log, "   (%0t)(%m)MIIM - op-code for WRITING to registers", $time);
                    `endif
                end
                else begin
                    // ERROR - wrong opcode !
                    `ifdef VERBOSE
                    #1 $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong OP-CODE", $time);
                    `endif
                    #10 $stop;
                end
                // set the signal - get PHY address
                begin
                    #1 md_get_phy_address = 1'b1;
                end
            end
    
            // reset the signal - get PHY address
            else if (md_transfer_cnt == 41) begin
                #4 md_get_phy_address = 1'b0;
                // set the signal - get register address
                #1 md_get_reg_address = 1'b1;
            end
    
            // reset the signal - get register address
            // set the signal - put register data to output register
            else if (md_transfer_cnt == 46) begin
                #4 md_get_reg_address = 1'b0;
                #1 md_put_reg_data_out = 1'b1;
            end
    
            // reset the signal - put register data to output register
            // set the signal - enable md_io as output when read
            else if (md_transfer_cnt == 47) begin
                #4 md_put_reg_data_out = 1'b0;
                if (md_io_rd_wr) begin//read
                    if (md_io_reg !== 1'bz) begin
                        // ERROR - turn around !
                        `ifdef VERBOSE
                        #1 $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong turn-around cycle before reading data out", $time);
                        `endif
                        #10 $stop;
                    end
                    if ((phy_address === `ETH_PHY_ADDR) || respond_to_all_phy_addr) begin// check the PHY address
                        #1 md_io_enable = 1'b1;
                        `ifdef VERBOSE
                        $fdisplay(phy_log, "   (%0t)(%m)MIIM - received correct PHY ADDRESS: %x", $time, phy_address);
                        `endif
                    end
                    else begin
                        `ifdef VERBOSE
                        #1 $fdisplay(phy_log, "*W (%0t)(%m)MIIM - received different PHY ADDRESS: %x", $time, phy_address);
                        `endif
                    end
                end
                else begin// write
                    #1 md_io_enable = 1'b0;
                    // check turn around cycle when write on clock 47
                    if (md_io_reg !== 1'b1) begin
                        // ERROR - turn around !
                        `ifdef VERBOSE
                        #1 $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong 1. turn-around cycle before writing data in", 
                                     $time);
                        `endif
                        #10 $stop;
                    end
                end
            end
    
            // set the signal - get register data in when write
            else if (md_transfer_cnt == 48) begin
                #4;
                if (!md_io_rd_wr) begin// write
                    #1 md_get_reg_data_in = 1'b1;
                    // check turn around cycle when write on clock 48
                    if (md_io_reg !== 1'b0) begin
                        // ERROR - turn around !
                        `ifdef VERBOSE
                        #1 $fdisplay(phy_log, "*E (%0t)(%m)MIIM - wrong 2. turn-around cycle before writing data in", 
                                     $time);
                        `endif
                        #10 $stop;
                    end
                end
                else begin// read
                    #1 md_get_reg_data_in = 1'b0;
                end
            end
    
            // reset the signal - enable md_io as output when read
            // reset the signal - get register data in when write
            // set the signal - put registered data in the register when write
            else if (md_transfer_cnt == 64) begin
                #1 md_io_enable = 1'b0;
                #4 md_get_reg_data_in = 1'b0;
                if (!md_io_rd_wr) begin// write
                    if ((phy_address === `ETH_PHY_ADDR) || respond_to_all_phy_addr) begin // check the PHY address
                        #1 md_put_reg_data_in = 1'b1;
                        `ifdef VERBOSE
                        $fdisplay(phy_log, "   (%0t)(%m)MIIM - received correct PHY ADDRESS: %x", $time, phy_address);
                        $fdisplay(phy_log, "   (%0t)(%m)MIIM - WRITING to register %x COMPLETED!", $time, reg_address);
                        `endif
                    end
                    else begin
                        `ifdef VERBOSE
                        #1 $fdisplay(phy_log, "*W (%0t)(%m)MIIM - received different PHY ADDRESS: %x", $time, phy_address);
                        $fdisplay(phy_log, "*W (%0t)(%m)MIIM - NO WRITING to register %x !", $time, reg_address);
                        `endif
                    end
                end
                else begin// read
                    `ifdef VERBOSE
                    if ((phy_address === `ETH_PHY_ADDR) || respond_to_all_phy_addr) // check the PHY address
                        #1 $fdisplay(phy_log, "   (%0t)(%m)MIIM - READING from register %x COMPLETED!", 
                                   $time, reg_address);
                    else
                        #1 $fdisplay(phy_log, "*W (%0t)(%m)MIIM - NO READING from register %x !", $time, reg_address);
                    `endif
                end
            end
    
            // wait for one clock period
            @(posedge mdc_i)
              #1;
        end 
    end

    //====================================================================
    //
    // PHY management (MIIM) REGISTERS
    //
    //====================================================================
    //
    //   Supported registers:
    //
    // Addr | Register Name
    //--------------------------------------------------------------------
    //   0  | Control reg.         |
    //   1  | Status reg. #1       |--> normal operation
    //   2  | PHY ID reg. 1        |
    //   3  | PHY ID reg. 2        |
    //   11 | PSE Control reg.     |
    //   12 | PSE Status reg.      |
    //   15 | Extended Status reg. |
    //----------------------
    // Addr | Data MEMORY          |-->  for testing
    //
    //--------------------------------------------------------------------
    //
    // Control register
    //  reg            control_bit15;    //Reset, self clearing bit
    //  reg    [14:10] control_bit14_10;
    //  reg            control_bit9;     //Auto-Negotiation Enable, self clearing bit
    //  reg    [8:0]   control_bit8_0;
    // Status register
    //  wire   [15:9]  status_bit15_9 = `SUPPORTED_SPEED_AND_PORT;
    //  wire           status_bit8    = `EXTENDED_STATUS;
    //  wire           status_bit7    = 1'b0; // reserved
    //  reg    [6:0]   status_bit6_0  = `DEFAULT_STATUS;
    // PHY ID register 1
    //  wire   [15:0]  phy_id1        = `PHY_ID1;
    // PHY ID register 2
    //  wire   [15:0]  phy_id2        = {`PHY_ID2, `MAN_MODEL_NUM, `MAN_REVISION_NUM};
    //--------------------------------------------------------------------
    //
    // Data MEMORY
    //  reg    [15:0]  data_mem [0:31]; // 32 locations of 16-bit data width
    //
    //====================================================================
    
    //////////////////////////////////////////////////////////////////////
    //
    // PHY management (MIIM) REGISTER control
    //
    //////////////////////////////////////////////////////////////////////

    // wholy writable registers for walking ONE's on data, phy and reg. addresses
    reg     registers_addr_data_test_operation;

    // Non writable status registers
    initial begin // always
        status_bit6_0[6] = no_preamble;
        status_bit6_0[5] = 1'b0;
        status_bit6_0[3] = 1'b1;
        status_bit6_0[0] = 1'b1;

        status_bit6_0[4] = 1'b0;
        status_bit6_0[1] = 1'b0;

        status_bit6_0[2] = 1'b1;
        registers_addr_data_test_operation = 0;
    end

    // Reading from a selected registers
    always @(*) begin
        if (registers_addr_data_test_operation) begin // test operation
            if (md_put_reg_data_out) begin// read enable
                register_bus_out = #1 data_mem[reg_address];
            end
        end
        else begin // normal operation
            if (md_put_reg_data_out) begin // read enable
                case (reg_address)
                    5'h0:    register_bus_out = #1 {control_bit15, control_bit14_10, control_bit9, control_bit8_0};
                    5'h1:    register_bus_out = #1 {status_bit15_9, status_bit8, status_bit7, status_bit6_0};
                    5'h2:    register_bus_out = #1 phy_id1;
                    5'h3:    register_bus_out = #1 phy_id2;
                    default: register_bus_out = #1 16'hDEAD;
                endcase
            end
        end
    end

    // Self clear control signals
    reg    self_clear_d0;
    reg    self_clear_d1;
    reg    self_clear_d2;
    reg    self_clear_d3;

    // Self clearing control
    always @(posedge mdc_i or negedge m_rst_n) begin
        if (!m_rst_n) begin
            self_clear_d0    <= #1 0;
            self_clear_d1    <= #1 0;
            self_clear_d2    <= #1 0;
            self_clear_d3    <= #1 0;
        end
        else begin
            self_clear_d0    <= #1 md_put_reg_data_in;
            self_clear_d1    <= #1 self_clear_d0;
            self_clear_d2    <= #1 self_clear_d1;
            self_clear_d3    <= #1 self_clear_d2;
        end
    end

    // Writing to a selected register
    always @(posedge mdc_i or negedge m_rst_n) begin
        if ((!m_rst_n) || (control_bit15)) begin
            if (!registers_addr_data_test_operation) begin // normal operation
              control_bit15    <= #1 0;
              control_bit14_10 <= #1 {1'b0, ((~speed_i[2]) & speed_i[1]), `AUTO_NEG_EN, 2'b0};
              control_bit9     <= #1 0;
              control_bit8_0   <= #1 {`DUPLEX_MODE, 1'b0, speed_i[2], 6'b0};
            end
        end
        else begin
            if (registers_addr_data_test_operation) begin // test operation
                if (md_put_reg_data_in) begin
                    data_mem[reg_address] <= #1 register_bus_in[15:0];
                end
            end
            else begin // normal operation
                // bits that are normaly written
                if (md_put_reg_data_in) begin
                    case (reg_address)
                      5'h0: 
                      begin
                          control_bit14_10 <= #1 register_bus_in[14:10];
                          control_bit8_0   <= #1 register_bus_in[8:0];
                      end
                      default: ;
                    endcase
                end
                // self cleared bits written
                if ((md_put_reg_data_in) && (reg_address == 5'h0)) begin
                    control_bit15 <= #1 register_bus_in[15];
                    control_bit9  <= #1 register_bus_in[9];
                end
                else if (self_clear_d3) begin // self cleared bits cleared
                    control_bit15 <= #1 1'b0;
                    control_bit9  <= #1 1'b0;
                end
            end
        end
    end

    //////////////////////////////////////////////////////////////////////
    //
    // PHY <-> MAC control (RX and TX clocks are at the begining)
    //
    //////////////////////////////////////////////////////////////////////

    // CARRIER SENSE & COLLISION
    
    // MAC common signals
    // Internal signals controling Carrier sense & Collision
    // MAC common signals generated when appropriate transfer
    reg             mcrs_rx;
    reg             mcrs_tx;
    // delayed mtx_en_i signal for generating delayed tx carrier sense
    reg             mtxen_d1;
    reg             mtxen_d2;
    reg             mtxen_d3;
    reg             mtxen_d4;
    reg             mtxen_d5;
    reg             mtxen_d6;
    // collision signal set or reset within task for controling collision
    reg             task_mcoll;
    // carrier sense signal set or reset within task for controling carrier sense
    reg             task_mcrs;
    reg             task_mcrs_lost;
    // do not generate collision in half duplex - not normal operation
    reg             no_collision_in_half_duplex;
    // generate collision in full-duplex mode also - not normal operation
    reg             collision_in_full_duplex;
    // do not generate carrier sense in half duplex mode - not normal operation
    reg             no_carrier_sense_in_tx_half_duplex;
    reg             no_carrier_sense_in_rx_half_duplex;
    // generate carrier sense during TX in full-duplex mode also - not normal operation
    reg             carrier_sense_in_tx_full_duplex;
    // do not generate carrier sense during RX in full-duplex mode - not normal operation
    reg             no_carrier_sense_in_rx_full_duplex;
    // on RX: delay after carrier sense signal; on TX: carrier sense delayed (delay is one clock period)
    reg             real_carrier_sense;

    initial begin
        mcrs_rx = 0;
        mcrs_tx = 0;
        task_mcoll = 0;
        task_mcrs = 0;
        task_mcrs_lost = 0;
        no_collision_in_half_duplex = 0;
        collision_in_full_duplex = 0;
        no_carrier_sense_in_tx_half_duplex = 0;
        no_carrier_sense_in_rx_half_duplex = 0;
        carrier_sense_in_tx_full_duplex = 0;
        no_carrier_sense_in_rx_full_duplex = 0;
        real_carrier_sense = 0;
    end

    // Collision
    always @(*) begin
        if (!m_rst_n)
            mcol_o = 0;
        else begin
            if (control_bit8_0[8]) begin // full duplex
                if (collision_in_full_duplex) begin // collision is usually not asserted in full duplex
                    mcol_o = ((mcrs_rx && mcrs_tx) || task_mcoll);
                    `ifdef VERBOSE
                    if (mcrs_rx && mcrs_tx)
                        $fdisplay(phy_log, "   (%0t)(%m) Collision set in FullDuplex!", $time);
                    if (task_mcoll)
                        $fdisplay(phy_log, "   (%0t)(%m) Collision set in FullDuplex from TASK!", $time);
                    `endif
                end
                else begin
                    mcol_o = task_mcoll;
                    `ifdef VERBOSE
                    if (task_mcoll)
                        $fdisplay(phy_log, "   (%0t)(%m) Collision set in FullDuplex from TASK!", $time);
                    `endif
                end
            end
            else begin // half duplex
                mcol_o = ((mcrs_rx && mcrs_tx && !no_collision_in_half_duplex) || 
                            task_mcoll);
                `ifdef VERBOSE
                if (mcrs_rx && mcrs_tx)
                    $fdisplay(phy_log, "   (%0t)(%m) Collision set in HalfDuplex!", $time);
                if (task_mcoll)
                    $fdisplay(phy_log, "   (%0t)(%m) Collision set in HalfDuplex from TASK!", $time);
                `endif
            end
        end
    end

    // Carrier sense
    always @(*) begin
        if (!m_rst_n)
            mcrs_o = 0;
        else begin
            if (control_bit8_0[8]) begin // full duplex
                if (carrier_sense_in_tx_full_duplex) // carrier sense is usually not asserted during TX in full duplex
                    mcrs_o = ((mcrs_rx && !no_carrier_sense_in_rx_full_duplex) || 
                               mcrs_tx || task_mcrs) && !task_mcrs_lost;
                else
                    mcrs_o = ((mcrs_rx && !no_carrier_sense_in_rx_full_duplex) || 
                               task_mcrs) && !task_mcrs_lost;
            end
            else begin // half duplex
                mcrs_o = ((mcrs_rx && !no_carrier_sense_in_rx_half_duplex) || 
                          (mcrs_tx && !no_carrier_sense_in_tx_half_duplex) || 
                           task_mcrs) && !task_mcrs_lost;
            end
        end
    end

    // MAC TX CONTROL (RECEIVING AT PHY)
    
    // storage memory for TX data received from MAC
    reg     [7:0]  tx_mem [0:4194303]; // 4194304 locations (22 address lines) of 8-bit data width
    reg    [31:0]  tx_mem_addr_in; // address for storing to TX memory
    reg     [7:0]  tx_mem_data_in; // data for storing to TX memory
    reg    [31:0]  tx_cnt;        // counts cycles of tx_en_i

    // control data of a TX packet for upper layer of testbench
    reg            tx_preamble_ok;
    reg            tx_sfd_ok;
    // if there is a drible nibble, then tx packet is not byte aligned!
    reg            tx_byte_aligned_ok;
    // complete length of TX packet (Bytes) received (without preamble and SFD)
    reg    [31:0]  tx_len;
    // complete length of TX packet (Bytes) received (without preamble and SFD) untill MTxErr signal was set first
    reg    [31:0]  tx_len_err;

    //select TX clock
    wire tx_clk = (eth_speed == 2'b10) ? mgtx_clk : mtx_clk;

    // TX control
    always @(posedge tx_clk) begin
        // storing data and basic checking of frame
        if (!m_rst_n) begin
            tx_cnt   <= 0;
            tx_preamble_ok <= 0;
            tx_sfd_ok      <= 0;
            tx_len         <= 0;
            tx_len_err     <= 0;
        end
        else begin
            if (!mtx_en_i) begin
                tx_cnt  <= 0;
            end
            else begin
                tx_cnt <= tx_cnt + 1;

                // set initial values and check first preamble nibble/octet
                if (tx_cnt == 0) begin
                    `ifdef VERBOSE
                    $fdisplay(phy_log, "   (%0t)(%m) TX frame started with tx_en set!", $time);
                    `endif

                    if (eth_speed == 2'b10 && mtxd_i[7:0] == 8'h55)     //1000Mbps
                      tx_preamble_ok <= 1;
                    else if (eth_speed != 2'b10 && mtxd_i[3:0] == 4'h5) //100/10Mbps
                      tx_preamble_ok <= 1;
                    else
                      tx_preamble_ok <= 0;

                    tx_sfd_ok <= 0;
                    tx_byte_aligned_ok <= 0;
                    tx_len <= 0;
                    tx_len_err <= 0;
                    // tx_mem_addr_in <= 0;
                end
    
                // check preamble
                if (eth_speed == 2'b10 && (tx_cnt > 0) && (tx_cnt <= 6)) begin        //1000Mbps
                    if ((tx_preamble_ok != 1) || (mtxd_i[7:0] != 8'h55))
                        tx_preamble_ok <= 0;
                end
                else if (eth_speed != 2'b10 && (tx_cnt > 0) && (tx_cnt <= 13)) begin   //100/10Mbps
                    if ((tx_preamble_ok != 1) || (mtxd_i[3:0] != 4'h5))
                        tx_preamble_ok <= 0;
                end

                // check SFD
                if (eth_speed == 2'b10) begin    //1000Mbps
                    if( tx_cnt == 7) begin
                        `ifdef VERBOSE
                        if (tx_preamble_ok == 1)
                            $fdisplay(phy_log, "   (%0t)(%m) TX frame preamble OK!", $time);
                        else
                            $fdisplay(phy_log, "*E (%0t)(%m) TX frame preamble NOT OK!", $time);
                        `endif

                        if (mtxd_i[7:0] == 8'hd5)
                            tx_sfd_ok <= 1;
                        else
                            tx_sfd_ok <= 0;
                    end
                end
                else begin  //100/10Mbps
                    if (tx_cnt == 14) begin
                        `ifdef VERBOSE
                        if (tx_preamble_ok == 1)
                            $fdisplay(phy_log, "   (%0t)(%m) TX frame preamble OK!", $time);
                        else
                            $fdisplay(phy_log, "*E (%0t)(%m) TX frame preamble NOT OK!", $time);
                        `endif
                        if (mtxd_i[3:0] == 4'h5)
                            tx_sfd_ok <= 1;
                        else
                            tx_sfd_ok <= 0;
                    end
                    if (tx_cnt == 15) begin
                        if ((tx_sfd_ok != 1) || (mtxd_i[3:0] != 4'hD))
                            tx_sfd_ok <= 0;
                    end
                end
    
                // control for storing addresses, type/length, data and FCS to TX memory
                if (eth_speed == 2'b10) begin   //1000Mbps
                    if (tx_cnt > 7) begin
                        if (tx_cnt == 8) begin
                            `ifdef VERBOSE
                            if (tx_sfd_ok == 1)
                                $fdisplay(phy_log, "   (%0t)(%m) TX frame SFD OK!", $time);
                            else
                                $fdisplay(phy_log, "*E (%0t)(%m) TX frame SFD NOT OK!", $time);
                            `endif
                        end

                        tx_byte_aligned_ok <= 1; // always ok for GMII
    
                        tx_mem[tx_mem_addr_in[21:0]] <= mtxd_i[7:0]; // storing data into tx memory
                        tx_len <= tx_len + 1; // enlarge byte length counter
                        tx_mem_addr_in <= tx_mem_addr_in + 1'b1;
    
                        if (mtx_er_i)
                            tx_len_err <= tx_len;
                    end
                end
                else begin //100/10Mbps
                    if (tx_cnt > 15) begin
                        if (tx_cnt == 16) begin
                            `ifdef VERBOSE
                            if (tx_sfd_ok == 1)
                                $fdisplay(phy_log, "   (%0t)(%m) TX frame SFD OK!", $time);
                            else
                                $fdisplay(phy_log, "*E (%0t)(%m) TX frame SFD NOT OK!", $time);
                            `endif
                        end
    
                        if (tx_cnt[0] == 0) begin
                            tx_mem_data_in[3:0] <= mtxd_i; // storing LSB nibble
                            tx_byte_aligned_ok <= 0; // if transfer will stop after this, then there was drible nibble
                        end
                        else begin
                            tx_mem[tx_mem_addr_in[21:0]] <= {mtxd_i, tx_mem_data_in[3:0]}; // storing data into tx memory
                            tx_len <= tx_len + 1; // enlarge byte length counter
                            tx_byte_aligned_ok <= 1; // if transfer will stop after this, then transfer is byte alligned
                            tx_mem_addr_in <= tx_mem_addr_in + 1'b1;
                        end
    
                        if (mtx_er_i)
                            tx_len_err <= tx_len;
                    end
                end  //100/10Mbps
            end //else tx_en
        end  //else if
    
        // generating CARRIER SENSE for TX with or without delay
        if (!m_rst_n) begin
            mcrs_tx  <= 0;
            mtxen_d1 <= 0;
            mtxen_d2 <= 0;
            mtxen_d3 <= 0;
            mtxen_d4 <= 0;
            mtxen_d5 <= 0;
            mtxen_d6 <= 0;
        end
        else begin
            mtxen_d1 <= mtx_en_i;
            mtxen_d2 <= mtxen_d1;
            mtxen_d3 <= mtxen_d2;
            mtxen_d4 <= mtxen_d3;
            mtxen_d5 <= mtxen_d4;
            mtxen_d6 <= mtxen_d5;

            if (real_carrier_sense)
              mcrs_tx  <= mtxen_d6;
            else
              mcrs_tx  <= mtx_en_i;
        end
    end //always

    `ifdef VERBOSE
    reg             frame_started;

    initial begin
        frame_started = 0;
    end

    always @(posedge mtx_en_i) begin
        frame_started <= 1;
    end

    always @(negedge mtx_en_i) begin
        if (frame_started) begin
            $fdisplay(phy_log, "   (%0t)(%m) TX frame ended with tx_en reset!", $time);
            frame_started <= 0;
        end
    end
    
    always @(posedge mrx_er_o) begin
        $fdisplay(phy_log, "   (%0t)(%m) RX frame ERROR signal was set!", $time);
    end
    `endif

    //////////////////////////////////////////////////////////////////////
    // 
    // Tasks for PHY <-> MAC transactions
    // 
    //////////////////////////////////////////////////////////////////////

    initial begin
        tx_mem_addr_in = 0;
    end

    // setting the address of tx_mem, to set the starting point of tx packet
    task set_tx_mem_addr;
        input [31:0] tx_mem_address;
    begin
        #1 tx_mem_addr_in = tx_mem_address;
    end
    endtask // set_tx_mem_addr

    // storage memory for RX data to be transmited to MAC
    reg     [7:0]  rx_mem [0:4194303]; // 4194304 locations (22 address lines) of 8-bit data width

    // MAC RX signals
    initial begin
        mrxd_o = 0;
        mrx_dv_o = 0;
        mrx_er_o = 0;
        mcrs_rx = 0;
    end

    task send_rx_packet;
        input  [(8*8)-1:0] preamble_data; // preamble data to be sent - correct is 64'h0055_5555_5555_5555
        input   [3:0] preamble_len; // length of preamble in bytes - max is 4'h8, correct is 4'h7 
        input   [7:0] sfd_data; // SFD data to be sent - correct is 8'hD5
        input  [31:0] start_addr; // start address
        input  [31:0] len; // length of frame in Bytes (without preamble and SFD)
        input         plus_drible_nibble; // if length is longer for one nibble
        integer       rx_cnt;
        reg    [31:0] rx_mem_addr_in; // address for reading from RX memory       
        reg     [7:0] rx_mem_data_out; // data for reading from RX memory
    begin
        @(posedge mrx_clk);

        // generating CARRIER SENSE for TX with or without delay
        if (real_carrier_sense)
          #1 mcrs_rx = 1;
        else
          #1 mcrs_rx = 0;

        @(posedge mrx_clk);

        #1 mcrs_rx = 1;
        #1 mrx_dv_o = 1;
        `ifdef VERBOSE
        $fdisplay(phy_log, "   (%0t)(%m) RX frame started with rx_dv set!", $time);
        `endif
        // set initial rx memory address
        rx_mem_addr_in = start_addr;
       
        // send preamble
        if(eth_speed == 2'b10)  begin  //1000Mbps
            for (rx_cnt = 0; (rx_cnt < preamble_len) && (rx_cnt < 8); rx_cnt = rx_cnt + 1)
            begin
                #1 mrxd_o = preamble_data[7:0];
                #1 preamble_data = preamble_data >> 8;
                @(posedge mrx_clk);
            end
        end
        else begin    //100/10Mbps
            for (rx_cnt = 0; (rx_cnt < (preamble_len << 1)) && (rx_cnt < 16); rx_cnt = rx_cnt + 1)
            begin
                #1 mrxd_o = preamble_data[3:0];
                #1 preamble_data = preamble_data >> 4;
                @(posedge mrx_clk);
            end
        end
       
        // send SFD
        if(eth_speed == 2'b10)  begin  //1000Mbps
            #1 mrxd_o = sfd_data[7:0];
            @(posedge mrx_clk);
        end
        else begin  //100/10Mbps
            for (rx_cnt = 0; rx_cnt < 2; rx_cnt = rx_cnt + 1)
            begin
                #1 mrxd_o = sfd_data[3:0];
                #1 sfd_data = sfd_data >> 4;
                @(posedge mrx_clk);
            end
        end

        `ifdef VERBOSE
        $fdisplay(phy_log, "   (%0t)(%m) RX frame preamble and SFD sent!", $time);
        `endif

        // send packet's addresses, type/length, data and FCS
        if(eth_speed == 2'b10)  begin  //1000Mbps
            for (rx_cnt = 0; rx_cnt < len; rx_cnt = rx_cnt + 1)
            begin
                #1;
                rx_mem_data_out = rx_mem[rx_mem_addr_in[21:0]];
                mrxd_o = rx_mem_data_out[7:0];
                rx_mem_addr_in = rx_mem_addr_in + 1;
                @(posedge mrx_clk);
                #1;
            end
        end
        else begin  //100/10Mbps
            for (rx_cnt = 0; rx_cnt < len; rx_cnt = rx_cnt + 1)
            begin
                #1;
                rx_mem_data_out = rx_mem[rx_mem_addr_in[21:0]];
                mrxd_o = rx_mem_data_out[3:0];
                @(posedge mrx_clk);
                #1;
                mrxd_o = rx_mem_data_out[7:4];
                rx_mem_addr_in = rx_mem_addr_in + 1;
                @(posedge mrx_clk);
                #1;
            end
            if (plus_drible_nibble)
            begin
                rx_mem_data_out = rx_mem[rx_mem_addr_in[21:0]];
                mrxd_o = rx_mem_data_out[3:0];
                @(posedge mrx_clk);
            end
        end

        `ifdef VERBOSE
        $fdisplay(phy_log, "   (%0t)(%m) RX frame addresses, type/length, data and FCS sent!", $time);
        `endif
        #1 mcrs_rx = 0;
        #1 mrx_dv_o = 0;

        @(posedge mrx_clk);
        `ifdef VERBOSE
        $fdisplay(phy_log, "   (%0t)(%m) RX frame ended with rx_dv reset!", $time);
        `endif
    end
    endtask // send_rx_packet

    //////////////////////////////////////////////////////////////////////
    //
    // Tastks for controling PHY statuses and rx error
    //
    //////////////////////////////////////////////////////////////////////
    
    // Link control tasks
    task link_up_down;
        input   test_op;
    begin
        #1 status_bit6_0[2] = test_op; // 1 - link up; 0 - link down
    end
    endtask

    // RX error
    task rx_err;
        input   test_op;
    begin
        #1 mrx_er_o = test_op; // 1 - RX error set; 0 - RX error reset
    end
    endtask

    //////////////////////////////////////////////////////////////////////
    //
    // Tastks for controling PHY carrier sense and collision
    //
    //////////////////////////////////////////////////////////////////////

    // Collision
    task collision;
        input   test_op;
    begin
        #1 task_mcoll = test_op;
    end
    endtask

    // Carrier sense
    task carrier_sense;
        input   test_op;
    begin
        #1 task_mcrs = test_op;
    end
    endtask

    // Carrier sense lost - higher priority than Carrier sense task
    task carrier_sense_lost;
        input   test_op;
    begin
        #1 task_mcrs_lost = test_op;
    end
    endtask

    // No collision detection in half duplex
    task no_collision_hd_detect;
        input   test_op;
    begin
        #1 no_collision_in_half_duplex = test_op;
    end
    endtask

    // Collision detection in full duplex also
    task collision_fd_detect;
        input   test_op;
    begin
        #1 collision_in_full_duplex = test_op;
    end
    endtask

    // No carrier sense detection at TX in half duplex
    task no_carrier_sense_tx_hd_detect;
        input   test_op;
    begin
        #1 no_carrier_sense_in_tx_half_duplex = test_op;
    end
    endtask

    // No carrier sense detection at RX in half duplex
    task no_carrier_sense_rx_hd_detect;
        input   test_op;
    begin
        #1 no_carrier_sense_in_rx_half_duplex = test_op;
    end
    endtask

    // Carrier sense detection at TX in full duplex also
    task carrier_sense_tx_fd_detect;
        input   test_op;
    begin
        #1 carrier_sense_in_tx_full_duplex = test_op;
    end
    endtask

    // No carrier sense detection at RX in full duplex
    task no_carrier_sense_rx_fd_detect;
        input   test_op;
    begin
        #1 no_carrier_sense_in_rx_full_duplex = test_op;
    end
    endtask

    // Set real delay on carrier sense signal (and therefor collision signal)
    task carrier_sense_real_delay;
        input   test_op;
    begin
        #1 real_carrier_sense = test_op;
    end
    endtask

    //////////////////////////////////////////////////////////////////////
    //
    // Tastks for controling PHY management test operation
    //
    //////////////////////////////////////////////////////////////////////

    // Set registers to test operation and respond to all phy addresses
    task test_regs;
        input   test_op;
    begin
        #1 registers_addr_data_test_operation = test_op;
        respond_to_all_phy_addr = test_op;
    end
    endtask

    // Clears data memory for testing the MIIM
    task clear_test_regs;
        integer i;
    begin
        for (i = 0; i < 32; i = i + 1)
        begin
            #1 data_mem[i] = 16'h0;
        end
    end
    endtask

    // Accept frames with preamble suppresed for MIIM
    task preamble_suppresed;
        input   test_op;
    begin
        #1 no_preamble = test_op;
        md_transfer_cnt_reset = 1'b1;
        @(posedge mdc_i);
        #1 md_transfer_cnt_reset = 1'b0;
    end
    endtask

endmodule

