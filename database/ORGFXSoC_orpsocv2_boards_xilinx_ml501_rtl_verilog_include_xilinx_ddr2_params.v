
  // memory controller parameters
   parameter BANK_WIDTH            = 2;      // # of memory bank addr bits
   parameter CKE_WIDTH             = 2;      // # of memory clock enable outputs
   parameter CLK_WIDTH             = 2;      // # of clock outputs
   parameter CLK_TYPE              = "SINGLE_ENDED";       // # of clock type
   parameter COL_WIDTH             = 10;     // # of memory column bits
   parameter CS_NUM                = 1;      // # of separate memory chip selects
   parameter CS_WIDTH              = 2;      // # of total memory chip selects
   parameter CS_BITS               = 0;      // set to log2(CS_NUM) (rounded up)
   parameter DM_WIDTH              = 8;      // # of data mask bits
   parameter DQ_WIDTH              = 64;      // # of data width
   parameter DQ_PER_DQS            = 8;      // # of DQ data bits per strobe
   parameter DQS_WIDTH             = 8;      // # of DQS strobes
   parameter DQ_BITS               = 6;      // set to log2(DQS_WIDTH*DQ_PER_DQS)
   parameter DQS_BITS              = 3;      // set to log2(DQS_WIDTH)
   parameter HIGH_PERFORMANCE_MODE = "TRUE"; // Sets the performance mode for IODELAY elements
   parameter ODT_WIDTH             = 2;      // # of memory on-die term enables
   parameter ROW_WIDTH             = 13;     // # of memory row & # of addr bits
// Can't change this!!
parameter APPDATA_WIDTH         = 128;     // # of usr read/write data bus bits
//parameter APPDATA_WIDTH         = 32;     // # of usr read/write data bus bits

   parameter ADDITIVE_LAT          = 0;      // additive write latency
// Controller with cache!
   parameter BURST_LEN             = 8;      // burst length (in double words)
// Old controller
//   parameter BURST_LEN             = 4;      // burst length (in double words)
   parameter BURST_TYPE            = 0;      // burst type (=0 seq; =1 interlved)
   parameter CAS_LAT               = 4;      // CAS latency
   parameter ECC_ENABLE            = 0;      // enable ECC (=1 enable)
   parameter MULTI_BANK_EN         = 1;      // enable bank management
   parameter TWO_T_TIME_EN         = 1;      // 2t timing for unbuffered dimms
   parameter ODT_TYPE              = 1;      // ODT (=0(none),=1(75),=2(150),=3(50))
   parameter REDUCE_DRV            = 0;      // reduced strength mem I/O (=1 yes)
   parameter REG_ENABLE            = 0;      // registered addr/ctrl (=1 yes)
   parameter TREFI_NS              = 7800;   // auto refresh interval (ns)
   parameter TRAS                  = 40000;  // active->precharge delay
   parameter TRCD                  = 15000;  // active->read/write delay
   parameter TRFC                  = 105000;  // ref->ref, ref->active delay
   parameter TRP                   = 15000;  // precharge->command delay
   parameter TRTP                  = 7500;   // read->precharge delay
   parameter TWR                   = 15000;  // used to determine wr->prech
   parameter TWTR                  = 7500;   // write->read delay
// Synthesize with this set to one if running post-synthesis simulations (don't have to wait forever for powerup delay on DDR2 controller)
//   parameter SIM_ONLY              = 1;      // = 0 to allow power up delay
   parameter SIM_ONLY              = 0;      // = 0 to allow power up delay
   parameter DEBUG_EN              = 0;      // Enable debug signals/controls
   parameter RST_ACT_LOW           = 0;      // =1 for active low reset, =0 for active high
   parameter DLL_FREQ_MODE         = "HIGH"; // DCM Frequency range
parameter CLK_PERIOD            = 3750;   // 266MHz Core/Mem clk period (in ps)
//   parameter CLK_PERIOD            = 5000;   // 200MHz Core/Mem clk period (in ps)

