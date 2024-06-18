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

module tb_emac();

    //System signals
    reg               sys_rst_n;               //async. reset, active low
    reg               clk_125m ;
    reg               clk_user ;
    wire [2:0]        speed    ;               //3'b100: 1000Mbps, 3'b010: 100Mbps, 3'b001: 10Mbps
    
    //32 bits on chip host bus access interface
    reg               bus2ip_clk     ;         
    reg               bus2ip_rst_n   ;
    wire [31:0]       bus2ip_addr    ;
    wire [31:0]       bus2ip_data    ;
    wire              bus2ip_rd_ce   ;         //active high
    wire              bus2ip_wr_ce   ;         //active high
    wire [31:0]       ip2bus_data    ; 
    
    //RX FIFO user interface
    wire              rx_mac_ra      ;
    wire              rx_mac_rd      ;
    wire [31:0]       rx_mac_data    ;
    wire [1:0]        rx_mac_be      ;
    wire              rx_mac_pa      ;
    wire              rx_mac_sop     ;
    wire              rx_mac_eop     ;
    
    //TX FIFO user interface 
    wire              tx_mac_wa      ;
    wire              tx_mac_wr      ;
    wire [31:0]       tx_mac_data    ;
    wire [1:0]        tx_mac_be      ;
    wire              tx_mac_sop     ;
    wire              tx_mac_eop     ;

    //MAC-PHY GMII/MII interface
    wire              mgtx_clk; // from MAC to PHY
    wire              mtx_clk ; // from PHY to MAC
    wire              mrx_clk ; // from PHY to MAC
    
    wire   [7:0]      MTxD;
    wire              MTxEn;
    wire              MTxEr;
    
    wire   [7:0]      MRxD;     // from PHY to MAC
    wire              MRxDv;    // from PHY to MAC
    wire              MRxEr;    // from PHY to MAC
    wire              MCol;     // from PHY to MAC
    wire              MCrs;     // from PHY to MAC
    
    wire              Mdi_I;
    wire              Mdo_O;
    wire              Mdo_OE;
    tri               Mdio_IO;
    wire              Mdc_O;

    // Connecting Ethernet MAC top module
    emac_top emac_top 
    (
        //System signals
        .sys_rst_n            (sys_rst_n),             
        .clk_125m             (clk_125m ),
        .clk_user             (clk_user ),
        .speed_o              (speed    ),
        .dl_xmt_i             (1'b0     ),
    
        //32 bits on chip host bus access interface
        .bus2ip_clk           (bus2ip_clk    ),         
        .bus2ip_rst_n         (bus2ip_rst_n  ),
        .bus2ip_addr_i        (bus2ip_addr   ),
        .bus2ip_data_i        (bus2ip_data   ),
        .bus2ip_rd_ce_i       (bus2ip_rd_ce  ),         
        .bus2ip_wr_ce_i       (bus2ip_wr_ce  ),        
        .ip2bus_data_o        (ip2bus_data   ), 
    
        //RX FIFO user interface
        .rx_mac_ra_o          (rx_mac_ra    ),
        .rx_mac_rd_i          (rx_mac_rd    ),
        .rx_mac_data_o        (rx_mac_data  ),
        .rx_mac_be_o          (rx_mac_be    ),
        .rx_mac_pa_o          (rx_mac_pa    ),
        .rx_mac_sop_o         (rx_mac_sop   ),
        .rx_mac_eop_o         (rx_mac_eop   ),
    
        //TX FIFO user interface 
        .tx_mac_wa_o          (tx_mac_wa    ),
        .tx_mac_wr_i          (tx_mac_wr    ),
        .tx_mac_data_i        (tx_mac_data  ),
        .tx_mac_be_i          (tx_mac_be    ),
        .tx_mac_sop_i         (tx_mac_sop   ),
        .tx_mac_eop_i         (tx_mac_eop   ),
    
        //PHY GMII/MII rx interface
        .rx_clk               (mrx_clk),
        .rx_dv_i              (MRxDv  ), 
        .rx_er_i              (MRxEr  ), 
        .rxd_i                (MRxD   ), 
        .crs_i                (MCrs   ),                
        .col_i                (MCol   ),               
          
        //PHY GMII/MII tx interface
        .gtx_clk              (mgtx_clk),               
        .tx_clk               (mtx_clk ),               
        .tx_en_o              (MTxEn   ),
        .tx_er_o              (MTxEr   ),
        .txd_o                (MTxD    ),
    
        //PHY mdio interface
        .mdc_o                (Mdc_O   ),              
        .mdo_en_o             (Mdo_OE  ),              
        .mdo_o                (Mdo_O   ),              
        .mdi_i                (Mdi_I   )               
    );

    // Connecting Ethernet PHY Model
    assign Mdio_IO = Mdo_OE ? Mdo_O : 1'bz ;
    assign Mdi_I   = Mdio_IO;
    integer phy_log_file_desc;

    ephy_model ephy_model  // Simplified PHY model
    (
        // MAC miscellaneous signals
        .m_rst_n              (sys_rst_n),
        .speed_i              (speed    ),
        // MAC TX signals
        .mgtx_clk             (mgtx_clk),    //from MAC to PHY
        .mtx_clk              (mtx_clk ),    //from PHY to MAC
        .mtxd_i               (MTxD    ),
        .mtx_en_i             (MTxEn   ),
        .mtx_er_i             (MTxEr   ),
        // MAC RX signals
        .mrx_clk              (mrx_clk),
        .mrxd_o               (MRxD   ),
        .mrx_dv_o             (MRxDv  ),
        .mrx_er_o             (MRxEr  ),
        // MAC common signals
        .mcol_o               (MCol),
        .mcrs_o               (MCrs),
        // MAC management signals
        .mdc_i                (Mdc_O  ),
        .md_io                (Mdio_IO),
        // SYSTEM
        .phy_log              (phy_log_file_desc)
    );

    // Connecting Bus Master
    bus_master bus_master 
    (
        .bus2ip_clk           (bus2ip_clk    ),
        .bus2ip_rst_n         (bus2ip_rst_n  ),
        .bus2ip_addr_o        (bus2ip_addr   ),
        .bus2ip_data_o        (bus2ip_data   ),
        .bus2ip_rd_ce_o       (bus2ip_rd_ce  ), 
        .bus2ip_wr_ce_o       (bus2ip_wr_ce  ),
        .ip2bus_data_i        (ip2bus_data   ) 
    );  

    // Connecting user interface agent
    emac_user_agent emac_user_agent 
    (
        .rst_n                (sys_rst_n    ),
        .clk_user             (clk_user     ),
    
        //RX FIFO user interface
        .rx_mac_ra_i          (rx_mac_ra    ), 
        .rx_mac_rd_o          (rx_mac_rd    ),
        .rx_mac_data_i        (rx_mac_data  ),
        .rx_mac_be_i          (rx_mac_be    ),
        .rx_mac_pa_i          (rx_mac_pa    ), 
        .rx_mac_sop_i         (rx_mac_sop   ), 
        .rx_mac_eop_i         (rx_mac_eop   ), 
    
        //TX FIFO user interface 
        .tx_mac_wa_i          (tx_mac_wa    ), 
        .tx_mac_wr_o          (tx_mac_wr    ),
        .tx_mac_data_o        (tx_mac_data  ),
        .tx_mac_be_o          (tx_mac_be    ),
        .tx_mac_sop_o         (tx_mac_sop   ),
        .tx_mac_eop_o         (tx_mac_eop   ) 
    );
    

    reg         StartTB;
    integer     tb_log_file;

    // Generating Clock And Reset Signals
    // assign bus2ip_rst_n = sys_rst_n;
    initial begin
        sys_rst_n = 1;
        bus2ip_rst_n = 1;
        StartTB = 0;

        #55 
        sys_rst_n = 0;
        bus2ip_rst_n = 0;

        #355
        sys_rst_n = 1;
        bus2ip_rst_n = 1;

        #355 
        StartTB = 1;
    end

    initial begin
        clk_125m = 0;

        forever #4 clk_125m = ~clk_125m;     //2*4ns->125MHz
    end

    initial begin
        clk_user = 0;

        forever #5 clk_user = ~clk_user;     //2*5ns->100MHz
    end

    initial begin
        bus2ip_clk = 0;

        forever #5 bus2ip_clk = ~bus2ip_clk;  //2*5ns->100MHz
    end

    //reset MAC registers
    task hard_reset;
    begin
        @(posedge bus2ip_clk);
        #2 bus2ip_rst_n = 0;
        repeat(2) @(posedge bus2ip_clk);  
        #2 bus2ip_rst_n = 1;
    end
    endtask

endmodule
