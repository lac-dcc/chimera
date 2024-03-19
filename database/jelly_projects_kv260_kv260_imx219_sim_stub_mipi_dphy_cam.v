`timescale 1ns/1ps

module mipi_dphy_cam
   (
       input                core_clk,
       input                core_rst,
       output               rxbyteclkhs,


       output               clkoutphy_out,
       output               pll_lock_out,
       output               system_rst_out,
       output               init_done,

       //Clock lane PPI RX interface 
       output               cl_rxclkactivehs,
       output               cl_stopstate,
       input                cl_enable,
       output               cl_rxulpsclknot,
       output               cl_ulpsactivenot,

       //Data lane - 0 PPI RX high speed signals
       output   [7:0]       dl0_rxdatahs,
       output               dl0_rxvalidhs,
       output               dl0_rxactivehs,
       output               dl0_rxsynchs,

       //Data lane - 0 RX control siganls
       input                dl0_forcerxmode,
       output               dl0_stopstate,
       input                dl0_enable,
       output               dl0_ulpsactivenot,

       //Data lane - 0 RX escape mode signals
       output               dl0_rxclkesc,
       output               dl0_rxlpdtesc,
       output               dl0_rxulpsesc,
       output   [3:0]       dl0_rxtriggeresc,
       output   [7:0]       dl0_rxdataesc,
       output               dl0_rxvalidesc,

       //Data lane - 0 RX error signals
       output               dl0_errsoths,
       output               dl0_errsotsynchs,
       output               dl0_erresc,
       output               dl0_errsyncesc,
       output               dl0_errcontrol,

       //Data lane - 1 PPI RX high speed signals
       output   [7:0]       dl1_rxdatahs,
       output               dl1_rxvalidhs,
       output               dl1_rxactivehs,
       output               dl1_rxsynchs,

       //Data lane - 1 RX control siganls
       input                dl1_forcerxmode,
       output               dl1_stopstate,
       input                dl1_enable,
       output               dl1_ulpsactivenot,

       //Data lane - 1 RX escape mode signals
       output               dl1_rxclkesc,
       output               dl1_rxlpdtesc,
       output               dl1_rxulpsesc,
       output   [3:0]       dl1_rxtriggeresc,
       output   [7:0]       dl1_rxdataesc,
       output               dl1_rxvalidesc,

       //Data lane - 1 RX error signals
       output               dl1_errsoths,
       output               dl1_errsotsynchs,
       output               dl1_erresc,
       output               dl1_errsyncesc,
       output               dl1_errcontrol,


       //IO I/F signals for SLAVE(RX)
       input                clk_rxp,
       input                clk_rxn,
       input    [2 -1:0]    data_rxp,
       input    [2 -1:0]    data_rxn
    );
    
    // テストベンチから force する前提
    reg     reset   /*verilator public_flat*/;
    reg     busy    /*verilator public_flat*/;
    reg     hs_clk  /*verilator public_flat*/;

    /*   
    parameter  RATE_HS = 8.768;
    
    reg     reset = 1;
    initial #100 reset = 0;
    
    reg     busy = 0;
    initial #1000 busy = 1;
    
    reg     hs_clk = 1;
    always #(RATE_HS/2.0) begin
        if ( busy ) begin
            hs_clk = ~hs_clk;
        end
    end
    */

    reg     [15:0]  reg_data0 = 0;
    reg     [15:0]  reg_data1 = 0;
    always @(posedge hs_clk) begin
        reg_data0 <= reg_data0 + 1;
        reg_data1 <= reg_data1 - 1;
        
        if ( reg_data0 >= 1234 ) begin
            reg_data0 <= 0;
            reg_data1 <= 0;
        end
    end
    
    
    
    assign rxbyteclkhs      = hs_clk;
    assign system_rst_out   = reset;
    assign init_done        = ~reset;
    
    assign cl_rxclkactivehs  = 0;
    assign cl_stopstate      = 0;
    assign cl_rxulpsclknot   = 0;
    assign cl_ulpsactivenot  = 0;
    
    assign dl0_rxdatahs      = reg_data0[7:0];
    assign dl0_rxvalidhs     = 1;
    assign dl0_rxactivehs    = 1;
    assign dl0_rxsynchs      = (reg_data0 == 0);
    
    assign dl0_stopstate     = 0;
    assign dl0_ulpsactivenot = 0;
    
    assign dl0_rxclkesc      = 0;
    assign dl0_rxlpdtesc     = 0;
    assign dl0_rxulpsesc     = 0;
    assign dl0_rxtriggeresc  = 0;
    assign dl0_rxdataesc     = 0;
    assign dl0_rxvalidesc    = 0;
    
    assign dl0_errsoths      = 0;
    assign dl0_errsotsynchs  = 0;
    assign dl0_erresc        = 0;
    assign dl0_errsyncesc    = 0;
    assign dl0_errcontrol    = 0;
    
    assign dl1_rxdatahs      = reg_data1[7:0];
    assign dl1_rxvalidhs     = 1;
    assign dl1_rxactivehs    = 1;
    assign dl1_rxsynchs      = (reg_data1 == 0);
    
    assign dl1_stopstate     = 0;
    assign dl1_ulpsactivenot = 0;
    
    assign dl1_rxclkesc = 0;
    assign dl1_rxlpdtesc = 0;
    assign dl1_rxulpsesc = 0;
    assign dl1_rxtriggeresc = 0;
    assign dl1_rxdataesc = 0;
    assign dl1_rxvalidesc = 0;

    assign dl1_errsoths = 0;
    assign dl1_errsotsynchs = 0;
    assign dl1_erresc       = 0;
    assign dl1_errsyncesc  = 0;
    assign dl1_errcontrol  = 0;
    
    
    
endmodule

