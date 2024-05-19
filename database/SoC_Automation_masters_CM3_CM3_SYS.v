// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

module CM3_SYS
  (
   // Inputs
   nTRST, SWCLKTCK, SWDITMS, TDI, 
   PORESETn, HRESETn, 
   HCLK, INTISR, //INTNMI, 
   HREADY, HREADYOUT, HRDATA, HRESP, 
   // Outputs
   TDO, nTDOEN, 
   HTRANS, HSIZE, HADDR, HBURST, 
   HPROT, HWRITE, HWDATA, 
  );
  //----------------------------------------------------------------------------
  // Port declarations
  //----------------------------------------------------------------------------
  // Debug
  input          nTRST;              // Test reset
  input          SWDITMS;            // Test Mode Select/SWDIN
  input          SWCLKTCK;           // Test clock / SWCLK
  input          TDI;                // Test Data In
  
  // RESET and CLK
  input          PORESETn;           // PowerOn reset
  input          HRESETn;            // System reset
  input          HCLK;               // System clock
 
  // Interrupt
  input  [239:0] INTISR;             // Interrupts
  //input          INTNMI;           // Non-maskable Interrupt

  // AHB Master Port
  input          HREADYOUT;          // ICode-bus ready
  input   [31:0] HRDATA;             // ICode-bus read data
  input    [1:0] HRESP;              // ICode-bus transfer response
  
  // Output Ports
  // Debug
  output         TDO;                // Test Data Out
  output         nTDOEN;             // Test Data Out Enable

  output   [1:0]  HTRANS;            // ICode-bus transfer type
  output   [2:0]  HSIZE;             // ICode-bus transfer size
  output   [31:0] HADDR;             // ICode-bus address
  output   [2:0]  HBURST;            // ICode-bus burst length
  output   [3:0]  HPROT;             // ICode-bus protection
  output          HWRITE;            // DCode-bus write not read
  output  [31:0]  HWDATA;            // DCode-bus write data

  output HREADY;

 
  wire dpower = 1'b1;
  wire dground = 1'b0;

  wire   [1:0] HTRANSI;            
  wire   [2:0] HSIZEI;             
  wire   [31:0] HADDRI;             
  wire   [2:0] HBURSTI;            
  wire   [3:0] HPROTI;   
  wire   [0:0] HWRITEI;      
  wire          HREADYI;            
  wire   [31:0] HRDATAI;
  wire    [1:0] HRESPI;
  wire [31:0] HWDATAI;

  wire   [1:0] HTRANSD;            
  wire   [2:0] HSIZED;             
  wire   [31:0] HADDRD;             
  wire   [2:0] HBURSTD;            
  wire   [3:0] HPROTD;   
  wire   [0:0] HWRITED;      
  wire          HREADYD;            
  wire   [31:0] HRDATAD;
  wire    [1:0] HRESPD;
  wire [31:0] HWDATAD;

  wire   [1:0] HTRANSS;            
  wire   [2:0] HSIZES;             
  wire   [31:0] HADDRS;             
  wire   [2:0] HBURSTS;            
  wire   [3:0] HPROTS;   
  wire   [0:0] HWRITES;      
  wire          HREADYS;            
  wire   [31:0] HRDATAS;
  wire    [1:0] HRESPS;
  wire [31:0] HWDATAS;

  CORTEXM3INTEGRATIONDS u_CORTEXM3INTEGRATION (
       // Inputs
       .ISOLATEn       (dpower),      // Isolate core power domain
       .RETAINn        (dpower),      // Retain core state during power-down
       // Resets
       .PORESETn       (PORESETn),    //check m3ds_user_partition // Power on reset - reset processor and debugSynchronous to FCLK and HCLK
       .SYSRESETn      (HRESETn),     // System reset   - reset processor onlySynchronous to FCLK and HCLK
       .RSTBYPASS      (dpower),      // Reset bypass - disable internal generated reset for testing (e.gATPG)
       .CGBYPASS       (dpower),      // Clock gating bypass - disable internal clock gating for testing.
       .SE             (dground),

       // Clocks
       .FCLK           (HCLK),           // Free running clock - NVIC, SysTick, debug
       .HCLK           (HCLK),           // System clock - AHB, processor
                                             // it is separated so that it can be gated off when no debugger is attached
       .TRACECLKIN     (HCLK),     // Trace clock input.
       // SysTick
       .STCLK          (dpower),          // External reference clock for SysTick (Not really a clock, it is sampled by DFF)
       .STCALIB        (),        // Calibration info for SysTick

       .AUXFAULT       ({32{1'b0}}),       // Auxiliary Fault Status Register inputs (1 cycle pulse)

       // Configuration - system
       .BIGEND         (dground),        // Big Endian - select when exiting system reset
       .DNOTITRANS     (dpower),          // I-CODE & D-CODE merging configuration.
                                             // Set to 1 when using cm3_code_mux to merge I-CODE and D-CODE
                                             // This disable I-CODE from generating a transfer when D-CODE bus need a transfer

       //SWJDAP signal for single processor mode
       .nTRST          (nTRST),              // JTAG TAP Reset
       .SWCLKTCK       (SWCLKTCK),           // SW/JTAG Clock
       .SWDITMS        (SWDITMS),            // SW Debug Data In / JTAG Test Mode Select
       .TDI            (TDI),                // JTAG TAP Data In / Alternative input function
       .CDBGPWRUPACK   (dground),   // Debug Power Domain up acknowledge.

       // IRQs
      //  .INTISR         ({ 208'b0, IRQ[31:0]}),             // Interrupts
        .INTISR         ({ 208'b0, 32'h0}),        
       .INTNMI         (dground),         // Non-maskable Interrupt

       // I-CODE Bus
       .HREADYI        (HREADYI),            // I-CODE bus ready
       .HRDATAI        (HRDATAI),            // I-CODE bus read data
       .HRESPI         (HRESPI),             // I-CODE bus response
       .IFLUSH         (dground),               // Recerved input

       // D-CODE Bus
       .HREADYD        (HREADYD),            // D-CODE bus ready
       .HRDATAD        (HRDATAD),            // D-CODE bus read data
       .HRESPD         (HRESPD),             // D-CODE bus response
       .EXRESPD        (dground),            // D-CODE bus exclusive response


       // System Bus
       .HREADYS        (HREADYS),            // System bus ready
       .HRDATAS        (HRDATAS),            // System bus read data
       .HRESPS         (HRESPS),             // System bus response
       .EXRESPS        (dground),            // System bus exclusive response

       // Sleep
       .RXEV           (dground),           // Receive Event input
       .SLEEPHOLDREQn  (),  // Extend Sleep request

       // External Debug Request
       .EDBGRQ         (),         // External Debug Request
       .DBGRESTART     (),     // Debug Restart request

       // DAP HMASTER override
       .FIXMASTERTYPE  (dground),  // Override HMASTER for AHB-AP accesses

       // WIC
       .WICENREQ       (dground),       // Enable WIC interface function

       // Timestamp interface
       .TSVALUEB       (),       // Binary coded timestamp value for trace
       // Timestamp clock ratio change is rarely used

       // Configuration - debug
       .DBGEN          (dground),          // Halting Debug Enable
       .NIDEN          (dground),          // Non-invasive debug enable for ETM
       .MPUDISABLE     (dpower),     // Disable MPU functionality

       // Outputs
       //SWJDAP signal for single processor mode
       .TDO            (TDO),                // JTAG TAP Data Out
       .nTDOEN         (nTDOEN),             // TDO enable

       // AHB I-Code bus
       .HADDRI         (HADDRI),             // I-CODE bus address
       .HTRANSI        (HTRANSI),            // I-CODE bus transfer type
       .HSIZEI         (HSIZEI),             // I-CODE bus transfer size
       .HBURSTI        (HBURSTI),            // I-CODE bus burst length
       .HPROTI         (HPROTI),             // i-code bus protection
       .MEMATTRI       (),           // I-CODE bus memory attributes

       // AHB D-Code bus
       .HADDRD         (HADDRD),             // D-CODE bus address
       .HTRANSD        (HTRANSD),            // D-CODE bus transfer type
       .HSIZED         (HSIZED),             // D-CODE bus transfer size
       .HWRITED        (HWRITED),            // D-CODE bus write not read
       .HBURSTD        (HBURSTD),            // D-CODE bus burst length
       .HPROTD         (HPROTD),             // D-CODE bus protection
       .MEMATTRD       (),           // D-CODE bus memory attributes
       .HMASTERD       (),           // D-CODE bus master
       .HWDATAD        (HWDATAD),            // D-CODE bus write data
       .EXREQD         (),             // D-CODE bus exclusive request

      // AHB System bus
       .HADDRS         (HADDRS),             // D-CODE bus address
       .HTRANSS        (HTRANSS),            // D-CODE bus transfer type
       .HSIZES         (HSIZES),             // D-CODE bus transfer size
       .HWRITES        (HWRITES),            // D-CODE bus write not read
       .HBURSTS        (HBURSTS),            // D-CODE bus burst length
       .HPROTS         (HPROTS),             // D-CODE bus protection
       .MEMATTRS       (),           // D-CODE bus memory attributes
       .HMASTERS       (),           // D-CODE bus master
       .HWDATAS        (HWDATAS),            // D-CODE bus write data
       .EXREQS         ()             // D-CODE bus exclusive request

   );


  cmsdk_ahb_master_mux #(
    .PORT0_ENABLE (1),
    .PORT1_ENABLE (1),
    .PORT2_ENABLE (1),
    .DW           (32)
    )
  u_ahb_master_mux (
    .HCLK         (HCLK),
    .HRESETn      (HRESETn),

    //D Interface
    .HSELS0       (1'b1),
    .HADDRS0      (HADDRD),
    .HTRANSS0     (HTRANSD),
    .HSIZES0      (HSIZED),
    .HWRITES0     (HWRITED),
    .HREADYS0     (HREADYD), 
    .HPROTS0      (HPROTD),
    .HBURSTS0     (HBURSTD),
    .HMASTLOCKS0  (), //????
    .HWDATAS0     (HWDATAD),

    .HREADYOUTS0  (HREADYD), 
    .HRESPS0      (HRESPD), 
    .HRDATAS0     (HRDATAD), 

    // Not used!
    .HSELS1       (1'b1),
    .HADDRS1      (HADDRS),
    .HTRANSS1     (HTRANSS),
    .HSIZES1      (HSIZES),
    .HWRITES1     (HWRITES),
    .HREADYS1     (HREADYS),
    .HPROTS1      (HPROTS),
    .HBURSTS1     (HBURSTS),
    .HMASTLOCKS1  (),
    .HWDATAS1     (HWDATAS),

    .HREADYOUTS1  (HREADYS),
    .HRESPS1      (HRESPS),
    .HRDATAS1     (HRDATAS),

    // I Interface
    .HSELS2       (1'b1),
    .HADDRS2      (HADDRI),
    .HTRANSS2     (HTRANSI),
    .HSIZES2      (HSIZEI),
    .HWRITES2     (1'b0),
    .HREADYS2     (HREADYI), 
    .HPROTS2      (HPROTI),
    .HBURSTS2     (HBURSTI),
    .HMASTLOCKS2  (), //?????
    .HWDATAS2     (HWDATAI), 

    .HREADYOUTS2  (HREADYI), 
    .HRESPS2      (HRESPI), 
    .HRDATAS2     (HRDATAI), 

  // Output master port
    .HSELM        (), 
    .HADDRM       (HADDR),
    .HTRANSM      (HTRANS),
    .HSIZEM       (HSIZE),
    .HWRITEM      (HWRITE),
    .HREADYM      (HREADY), //
    .HPROTM       (HPROT),
    .HBURSTM      (HBURST),
    .HMASTLOCKM   (),
    .HWDATAM      (HWDATA),
    .HMASTERM     (),

    .HREADYOUTM   (HREADYOUT), //
    .HRESPM       (HRESP),
    .HRDATAM      (HRDATA)
  );


endmodule

