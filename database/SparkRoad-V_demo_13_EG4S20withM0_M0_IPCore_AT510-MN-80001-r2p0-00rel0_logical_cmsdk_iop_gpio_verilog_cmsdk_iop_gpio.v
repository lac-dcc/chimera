//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2012-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-01-10 15:38:18 +0000 (Thu, 10 Jan 2013) $
//
//      Revision            : $Revision: 233272 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Simple IOP GPIO
//-----------------------------------------------------------------------------
//-------------------------------------
// Programmer's model
// -------------------------------
// 0x000 RW    Data
// 0x004 RW    Data Output latch
// 0x010 RW    Output Enable Set
// 0x014 RW    Output Enable Clear
// 0x018 RW    Alternate Function Set
// 0x01C RW    Alternate Function Clear
// 0x020 RW    Interrupt Enable Set
// 0x024 RW    Interrupt Enable Clear
// 0x028 RW    Interrupt Type Set
// 0x02C RW    Interrupt Type Clear
// 0x030 RW    Interrupt Polarity Set
// 0x034 RW    Interrupt Polarity Clear
// 0x038 R     Interrupt Status
//       W     Interrupt Status Clear
// 0x400 - 0x7FC : Byte 0 masked access
// 0x800 - 0xBFC : Byte 1 masked access
//-------------------------------------
module cmsdk_iop_gpio
 #(// Parameter to define valid bit pattern for Alternate functions
   // If an I/O pin does not have alternate function its function mask
   // can be set to 0 to reduce gate count.
   //
   // By default every bit can have alternate function
   parameter  ALTERNATE_FUNC_MASK = 16'hFFFF,

   // Default alternate function settings
   parameter  ALTERNATE_FUNC_DEFAULT = 16'h0000,

   // By default use little endian
   parameter  BE                  = 0
  )

// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  (// Inputs
   input wire                  FCLK,       // Free-running clock
   input wire                  HCLK,       // System clock
   input wire                  HRESETn,    // System reset
   input wire                  IOSEL,      // Decode for peripheral
   input wire  [11:0]          IOADDR,     // I/O transfer address
   input wire                  IOWRITE,    // I/O transfer direction
   input wire  [1:0]           IOSIZE,     // I/O transfer size
   input wire                  IOTRANS,    // I/O transaction
   input wire  [31:0]          IOWDATA,    // I/O write data bus

   input wire  [3:0]           ECOREVNUM,  // Engineering-change-order revision bits

   input wire  [15:0]          PORTIN,     // GPIO Interface input

   // Outputs
   output wire [31:0]          IORDATA,    // I/0 read data bus

   output wire [15:0]          PORTOUT,    // GPIO output
   output wire [15:0]          PORTEN,     // GPIO output enable
   output wire [15:0]          PORTFUNC,   // Alternate function control

   output wire [15:0]          GPIOINT,    // Interrupt output for each pin
   output wire                 COMBINT);   // Combined interrupt

// The GPIO width by default is 16-bit, but is coded in a way that it is
// easy to customise the width.
localparam  PortWidth                      = 16;
// Local parameter for IDs, IO PORT GPIO has part number of 820
localparam  ARM_CMSDK_IOP_GPIO_PID0        = {32'h00000020}; // 0xFE0 : PID 0 IOP GPIO part number[7:0]
localparam  ARM_CMSDK_IOP_GPIO_PID1        = {32'h000000B8}; // 0xFE4 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
localparam  ARM_CMSDK_IOP_GPIO_PID2        = {32'h0000001B}; // 0xFE8 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
localparam  ARM_CMSDK_IOP_GPIO_PID3        = {32'h00000000}; // 0xFEC : PID 3
localparam  ARM_CMSDK_IOP_GPIO_PID4        = {32'h00000004}; // 0xFD0 : PID 4
localparam  ARM_CMSDK_IOP_GPIO_PID5        = {32'h00000000}; // 0xFD4 : PID 5
localparam  ARM_CMSDK_IOP_GPIO_PID6        = {32'h00000000}; // 0xFD8 : PID 6
localparam  ARM_CMSDK_IOP_GPIO_PID7        = {32'h00000000}; // 0xFDC : PID 7
localparam  ARM_CMSDK_IOP_GPIO_CID0        = {32'h0000000D}; // 0xFF0 : CID 0
localparam  ARM_CMSDK_IOP_GPIO_CID1        = {32'h000000F0}; // 0xFF4 : CID 1 PrimeCell class
localparam  ARM_CMSDK_IOP_GPIO_CID2        = {32'h00000005}; // 0xFF8 : CID 2
localparam  ARM_CMSDK_IOP_GPIO_CID3        = {32'h000000B1}; // 0xFFC : CID 3
//    Note : Customer changing the design should modify
//          - jep106 value (www.jedec.org)
//          - part number (customer define)
//          - Optional revision and modification number (e.g. rXpY)

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------

  reg    [31:0]          read_mux;
  reg    [31:0]          read_mux_le;

  // Signals for Control registers
  wire   [31:0]          reg_datain32;
  wire   [PortWidth-1:0] reg_datain;
  wire   [PortWidth-1:0] reg_dout;
  wire   [PortWidth-1:0] reg_douten;
  wire   [PortWidth-1:0] reg_altfunc;
  wire   [PortWidth-1:0] reg_inten;    // Interrupt enable
  wire   [PortWidth-1:0] reg_inttype;  // Interrupt edge(1)/level(0)
  wire   [PortWidth-1:0] reg_intpol;   // Interrupt active level
  wire   [PortWidth-1:0] reg_intstat;  // interrupt status

  // interrupt signals
  wire   [PortWidth-1:0] new_raw_int;

  wire                   bigendian;
  reg    [31:0]          IOWDATALE; // Little endian version of IOWDATA

  // Detect a valid write to this slave
  wire        write_trans  = IOSEL & IOWRITE & IOTRANS;

  wire  [1:0] iop_byte_strobe;

  assign bigendian = (BE!=0) ? 1'b1 : 1'b0;

  // Generate byte strobes to allow the GPIO registers to handle different transfer sizes
  assign iop_byte_strobe[0] = (IOSIZE[1] | ((IOADDR[1]==1'b0) & IOSIZE[0]) | (IOADDR[1:0]==2'b00)) & IOSEL;
  assign iop_byte_strobe[1] = (IOSIZE[1] | ((IOADDR[1]==1'b0) & IOSIZE[0]) | (IOADDR[1:0]==2'b01)) & IOSEL;

  // Read operation
  always @(IOADDR or reg_datain32 or reg_dout or reg_douten or
    reg_altfunc or reg_inten or reg_inttype or reg_intpol or
    reg_intstat or ECOREVNUM)
  begin
  case (IOADDR[11:10])
    2'b00: begin
           if (IOADDR[9:6]==4'h0)
             case (IOADDR[5:2])
              4'h0      : read_mux_le = reg_datain32;
              4'h1      : read_mux_le = {{32-PortWidth{1'b0}}, reg_dout};
              4'h2, 4'h3: read_mux_le = {32{1'b0}};
              4'h4, 4'h5: read_mux_le = {{32-PortWidth{1'b0}}, reg_douten };
              4'h6, 4'h7: read_mux_le = {{32-PortWidth{1'b0}}, reg_altfunc};
              4'h8, 4'h9: read_mux_le = {{32-PortWidth{1'b0}}, reg_inten  };
              4'hA, 4'hB: read_mux_le = {{32-PortWidth{1'b0}}, reg_inttype};
              4'hC, 4'hD: read_mux_le = {{32-PortWidth{1'b0}}, reg_intpol };
              4'hE      : read_mux_le = {{32-PortWidth{1'b0}}, reg_intstat};
              4'hF      : read_mux_le = {32{1'b0}};
              default: read_mux_le = {32{1'bx}}; // X-propagation if address is X
             endcase
           else
             read_mux_le = {32{1'b0}};
           end
    2'b01: begin
           // lower byte mask read
           read_mux_le = {{24{1'b0}}, (reg_datain32[7:0] & IOADDR[9:2])};
           end
    2'b10: begin
           // upper byte mask read
           read_mux_le = {{16{1'b0}}, (reg_datain32[15:8] & IOADDR[9:2]), {8{1'b0}}};
           end
    2'b11: begin
           if (IOADDR[9:6]==4'hF) // Peripheral IDs and Component IDs.
             case (IOADDR[5:2])   // IOP GPIO has part number of 820
              4'h0, 4'h1,
              4'h2, 4'h3: read_mux_le = {32{1'b0}};   // 0xFC0-0xFCC : not used
              4'h4      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID4; // 0xFD0 : PID 4
              4'h5      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID5; // 0xFD4 : PID 5
              4'h6      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID6; // 0xFD8 : PID 6
              4'h7      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID7; // 0xFDC : PID 7
              4'h8      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID0; // 0xFE0 : PID 0 AHB GPIO part number[7:0]
              4'h9      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID1;
                          // 0xFE0 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
              4'hA      : read_mux_le = ARM_CMSDK_IOP_GPIO_PID2;
                          // 0xFE0 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
              4'hB      : read_mux_le = {ARM_CMSDK_IOP_GPIO_PID3[31:8],ECOREVNUM[3:0], 4'h0};
                          // 0xFE0  PID 3 [7:4] ECO revision, [3:0] modification number
              4'hC      : read_mux_le = ARM_CMSDK_IOP_GPIO_CID0; // 0xFF0 : CID 0
              4'hD      : read_mux_le = ARM_CMSDK_IOP_GPIO_CID1; // 0xFF4 : CID 1 PrimeCell class
              4'hE      : read_mux_le = ARM_CMSDK_IOP_GPIO_CID2; // 0xFF8 : CID 2
              4'hF      : read_mux_le = ARM_CMSDK_IOP_GPIO_CID3; // 0xFFC : CID 3
              default: read_mux_le = {32{1'bx}}; // X-propagation if address is X
             endcase
           // Note : Customer changing the design should modify
           // - jep106 value (www.jedec.org)
           // - part number (customer define)
           // - Optional revision and modification number (e.g. rXpY)
           else
             read_mux_le = {32{1'b0}};
           end
    default: begin
           read_mux_le = {32{1'bx}}; // X-propagation if address is X
           end
  endcase
  end

  // endian conversion
  always @(bigendian or IOSIZE or read_mux_le or IOWDATA)
  begin
    if ((bigendian)&(IOSIZE==2'b10))
      begin
      read_mux = {read_mux_le[ 7: 0],read_mux_le[15: 8],
                  read_mux_le[23:16],read_mux_le[31:24]};
      IOWDATALE = {IOWDATA[ 7: 0],IOWDATA[15: 8],IOWDATA[23:16],IOWDATA[ 31:24]};
      end
    else if ((bigendian)&(IOSIZE==2'b01))
      begin
      read_mux = {read_mux_le[23:16],read_mux_le[31:24],
                  read_mux_le[ 7: 0],read_mux_le[15: 8]};
      IOWDATALE = {IOWDATA[23:16],IOWDATA[ 31:24],IOWDATA[ 7: 0],IOWDATA[15: 8]};
      end
    else
      begin
      read_mux = read_mux_le;
      IOWDATALE = IOWDATA;
      end
  end

  // ----------------------------------------------------------
  // Synchronize input with double stage flip-flops
  // ----------------------------------------------------------
  // Signals for input double flop-flop synchroniser
  reg    [PortWidth-1:0] reg_in_sync1;
  reg    [PortWidth-1:0] reg_in_sync2;

  always @(posedge FCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      begin
      reg_in_sync1 <= {PortWidth{1'b0}};
      reg_in_sync2 <= {PortWidth{1'b0}};
      end
    else
      begin
      reg_in_sync1 <= PORTIN;
      reg_in_sync2 <= reg_in_sync1;
      end
  end

  assign reg_datain = reg_in_sync2;
  // format to 32-bit for data read
  assign reg_datain32 = {{32-PortWidth{1'b0}},reg_datain};

  // ----------------------------------------------------------
  // Data Output register
  // ----------------------------------------------------------
  wire [32:0] current_dout_padded;
  wire [PortWidth-1:0] nxt_dout_padded;
  reg  [PortWidth-1:0] reg_dout_padded;
  wire        reg_dout_normal_write0;
  wire        reg_dout_normal_write1;
  wire        reg_dout_masked_write0;
  wire        reg_dout_masked_write1;

  assign      reg_dout_normal_write0 = write_trans &
              ((IOADDR[11:2]  == 10'h000)|(IOADDR[11:2]  == 10'h001)) & iop_byte_strobe[0];
  assign      reg_dout_normal_write1 = write_trans &
              ((IOADDR[11:2]  == 10'h000)|(IOADDR[11:2]  == 10'h001)) & iop_byte_strobe[1];
  assign      reg_dout_masked_write0 = write_trans &
              (IOADDR[11:10] == 2'b01) & iop_byte_strobe[0];
  assign      reg_dout_masked_write1 = write_trans &
              (IOADDR[11:10] == 2'b10) & iop_byte_strobe[1];

  // padding to 33-bit for easier coding
  assign current_dout_padded = {{(33-PortWidth){1'b0}},reg_dout};

  // byte #0
  assign nxt_dout_padded[7:0] = // simple write
     (reg_dout_normal_write0) ? IOWDATALE[7:0] :
     // write lower byte with bit mask
     ((IOWDATALE[7:0] & IOADDR[9:2])|(current_dout_padded[7:0] & (~(IOADDR[9:2]))));

  // byte #0 registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_dout_padded[7:0] <= 8'h00;
    else if (reg_dout_normal_write0 | reg_dout_masked_write0)
      reg_dout_padded[7:0] <= nxt_dout_padded[7:0];
  end

  // byte #1
  assign nxt_dout_padded[15:8] = // simple write
     (reg_dout_normal_write1) ? IOWDATALE[15:8] :
     // write higher byte with bit mask
     ((IOWDATALE[15:8] & IOADDR[9:2])|(current_dout_padded[15:8] & (~(IOADDR[9:2]))));

  // byte #1 registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_dout_padded[15:8] <= 8'h00;
    else if (reg_dout_normal_write1 | reg_dout_masked_write1)
      reg_dout_padded[15:8] <= nxt_dout_padded[15:8];
  end

  assign reg_dout[PortWidth-1:0] = reg_dout_padded[PortWidth-1:0];


  // ----------------------------------------------------------
  // Output enable register
  // ----------------------------------------------------------

  reg     [PortWidth-1:0] reg_douten_padded;
  integer                 loop1;              // loop variable for register
  wire    [PortWidth-1:0] reg_doutenclr;
  wire    [PortWidth-1:0] reg_doutenset;


  assign    reg_doutenset[7:0]   = ((write_trans == 1'b1) & (IOADDR[11:2]  == 10'h004)
                                   & (iop_byte_strobe[0] == 1'b1)) ?  IOWDATALE[7:0] : {8{1'b0}};

  assign    reg_doutenset[15:8]  = ((write_trans == 1'b1) & (IOADDR[11:2]  == 10'h004)
                                   & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};

  assign    reg_doutenclr[7:0]   = ((write_trans == 1'b1) & (IOADDR[11:2]  == 10'h005)
                                   & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign    reg_doutenclr[15:8]  = ((write_trans == 1'b1) & (IOADDR[11:2]  == 10'h005)
                                   & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};


  // registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_douten_padded <= {PortWidth{1'b0}};
    else
      for (loop1 = 0; loop1 < PortWidth; loop1 = loop1 + 1)
      begin
        if (reg_doutenset[loop1] | reg_doutenclr[loop1])
          reg_douten_padded[loop1] <= reg_doutenset[loop1];
      end
  end

  assign reg_douten[PortWidth-1:0] = reg_douten_padded[PortWidth-1:0];


  // ----------------------------------------------------------
  // Alternate function register
  // ----------------------------------------------------------


  reg  [PortWidth-1:0] reg_altfunc_padded;
  integer              loop2;              // loop variable for register
  wire [PortWidth-1:0] reg_altfuncset;
  wire [PortWidth-1:0] reg_altfuncclr;

  assign  reg_altfuncset[7:0]  =  ((write_trans == 1'b1) & (IOADDR[11:2]  == 10'h006)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_altfuncset[15:8] =  ((write_trans == 1'b1) & (IOADDR[11:2]  == 10'h006)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};

  assign  reg_altfuncclr[7:0]  =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h007)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_altfuncclr[15:8] =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h007)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};


  // registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_altfunc_padded <= ALTERNATE_FUNC_DEFAULT;
    else
      for(loop2 = 0; loop2 < PortWidth; loop2 = loop2 + 1)
    begin
        if (reg_altfuncset[loop2] | reg_altfuncclr[loop2])
          reg_altfunc_padded[loop2] <= reg_altfuncset[loop2];
      end
  end

  assign reg_altfunc[PortWidth-1:0] = reg_altfunc_padded[PortWidth-1:0] & ALTERNATE_FUNC_MASK;


  // ----------------------------------------------------------
  // Interrupt enable register
  // ----------------------------------------------------------

  reg  [PortWidth-1:0] reg_inten_padded;
  integer              loop3;              // loop variable for register
  wire [PortWidth-1:0] reg_intenset;
  wire [PortWidth-1:0] reg_intenclr;

  assign  reg_intenset[7:0]    =   ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h008)
                                   & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_intenset[15:8]   =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h008)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};

  assign  reg_intenclr[7:0]    =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h009)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_intenclr[15:8]   =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h009)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};


  // registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_inten_padded <= {PortWidth{1'b0}};
    else
      for(loop3 = 0; loop3 < PortWidth; loop3 = loop3 + 1)
      begin
        if (reg_intenclr[loop3] | reg_intenset[loop3])
        reg_inten_padded[loop3] <= reg_intenset[loop3];
      end
  end

  assign reg_inten[PortWidth-1:0] = reg_inten_padded[PortWidth-1:0];


  // ----------------------------------------------------------
  // Interrupt Type register
  // ----------------------------------------------------------

  reg  [PortWidth-1:0] reg_inttype_padded;
  integer              loop4;              // loop variable for register
  wire [PortWidth-1:0] reg_inttypeset;
  wire [PortWidth-1:0] reg_inttypeclr;

  assign  reg_inttypeset[7:0]  =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00A)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_inttypeset[15:8] =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00A)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};

  assign  reg_inttypeclr[7:0]  =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00B)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_inttypeclr[15:8] =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00B)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};


  // registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_inttype_padded <= {PortWidth{1'b0}};
    else
    for(loop4 = 0; loop4 < PortWidth; loop4 = loop4 + 1)
    begin
      if (reg_inttypeset[loop4] | reg_inttypeclr[loop4])
        reg_inttype_padded[loop4] <= reg_inttypeset[loop4];
      end
  end

  assign reg_inttype[PortWidth-1:0] = reg_inttype_padded[PortWidth-1:0];


  // ----------------------------------------------------------
  // Interrupt Polarity register
  // ----------------------------------------------------------


  reg  [PortWidth-1:0] reg_intpol_padded;
  integer              loop5;              // loop variable for register
  wire [PortWidth-1:0] reg_intpolset;
  wire [PortWidth-1:0] reg_intpolclr;

  assign  reg_intpolset[7:0]   =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00C)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_intpolset[15:8]  =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00C)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};

  assign  reg_intpolclr[7:0]   =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00D)
                                  & (iop_byte_strobe[0] == 1'b1)) ? IOWDATALE[7:0] : {8{1'b0}};

  assign  reg_intpolclr[15:8]  =  ((write_trans  == 1'b1) & (IOADDR[11:2]  == 10'h00D)
                                  & (iop_byte_strobe[1] == 1'b1)) ? IOWDATALE[15:8] : {8{1'b0}};

  // registering stage
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_intpol_padded <= {PortWidth{1'b0}};
    else
    for(loop5 = 0; loop5 < PortWidth; loop5 = loop5 + 1)
      begin
      if (reg_intpolset[loop5] | reg_intpolclr[loop5])
          reg_intpol_padded[loop5] <= reg_intpolset[loop5];
      end
  end

  assign reg_intpol[PortWidth-1:0] = reg_intpol_padded[PortWidth-1:0];


  // ----------------------------------------------------------
  // Interrupt status/clear register
  // ----------------------------------------------------------

  reg  [PortWidth-1:0]  reg_intstat_padded;
  integer               loop6;              // loop variable for register
  wire [PortWidth-1:0]  reg_intclr_padded;
  wire                  reg_intclr_normal_write0;
  wire                  reg_intclr_normal_write1;

  wire [PortWidth-1:0]  new_masked_int;

  assign      reg_intclr_normal_write0 = write_trans &
              (IOADDR[11:2]  == 10'h00E) & iop_byte_strobe[0];
  assign      reg_intclr_normal_write1 = write_trans &
              (IOADDR[11:2]  == 10'h00E) & iop_byte_strobe[1];

  assign      reg_intclr_padded[ 7:0] = {8{reg_intclr_normal_write0}} & IOWDATALE[ 7:0];
  assign      reg_intclr_padded[15:8] = {8{reg_intclr_normal_write1}} & IOWDATALE[15:8];

  assign      new_masked_int[PortWidth-1:0] = new_raw_int[PortWidth-1:0] & reg_inten[PortWidth-1:0];

  // registering stage
  always @(posedge FCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_intstat_padded <= {PortWidth{1'b0}};
    else
      for (loop6=0;loop6<PortWidth;loop6=loop6+1)
        begin
        if (new_masked_int[loop6] | reg_intclr_padded[loop6])
          reg_intstat_padded[loop6] <= new_masked_int[loop6];
        end
  end

  assign reg_intstat[PortWidth-1:0] = reg_intstat_padded[PortWidth-1:0];

  // ----------------------------------------------------------
  // Interrupt generation
  // ----------------------------------------------------------
  // reg_datain is the synchronized input

  reg   [PortWidth-1:0] reg_last_datain; // last state of synchronized input
  wire  [PortWidth-1:0] high_level_int;
  wire  [PortWidth-1:0] low_level_int;
  wire  [PortWidth-1:0] rise_edge_int;
  wire  [PortWidth-1:0] fall_edge_int;

  // Last input state for edge detection
  always @(posedge FCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_last_datain <= {PortWidth{1'b0}};
    else  if (|reg_inttype)
      reg_last_datain <= reg_datain;
  end

  assign high_level_int =   reg_datain  &                        reg_intpol  & (~reg_inttype);
  assign low_level_int  = (~reg_datain) &                      (~reg_intpol) & (~reg_inttype);
  assign rise_edge_int  =   reg_datain  & (~reg_last_datain) &   reg_intpol  &   reg_inttype;
  assign fall_edge_int  = (~reg_datain) &   reg_last_datain  & (~reg_intpol) &   reg_inttype;
  assign new_raw_int    = high_level_int | low_level_int | rise_edge_int | fall_edge_int;

  // ----------------------------------------------------------
  // Output to external
  // ----------------------------------------------------------
  assign PORTOUT = reg_dout;
  assign PORTEN  = reg_douten;
  assign PORTFUNC = reg_altfunc;

  assign IORDATA   = read_mux;

  // Connect interrupt signal to top level
  assign GPIOINT = reg_intstat;
  assign COMBINT = (|reg_intstat);

 // --------------------------------------------------------------------------------
 // Assertion properties
 // --------------------------------------------------------------------------------

`ifdef ARM_AHB_ASSERT_ON
`include "std_ovl_defines.h"

  // OVL Registers for the IOADDR and control signals
  reg[11:0]    ovl_ioaddr_d;
  reg          ovl_iotrans_d;
  reg[1:0]     ovl_iosize_d;

  // OVL Registers for internal GPIO registers
  reg[PortWidth-1:0]    ovl_reg_douten_d;
  reg[PortWidth-1:0]    ovl_reg_altfunc_d;
  reg[PortWidth-1:0]    ovl_reg_inten_d;
  reg[PortWidth-1:0]    ovl_reg_inttype_d;
  reg[PortWidth-1:0]    ovl_reg_intpol_d;
  reg[PortWidth-1:0]    ovl_reg_intstat_d;

  reg                   ovl_reg_intclr_write1_d;
  reg                   ovl_reg_intclr_write0_d;
  wire[PortWidth-1:0]   ovl_reg_intclr_wr_d_msk;

  reg[PortWidth-1:0]    ovl_iowdata_d;      //Update based on HCLK
  reg[PortWidth-1:0]    ovl_iowdata_fclk_d; //Update based on FCLK
  reg[31:0]             ovl_iowdatale;

  reg[PortWidth-1:0]    ovl_portout_d;

  reg [1:0]             ovl_iop_byte_strobe_d;

  reg[PortWidth-1:0]    ovl_new_masked_int_d;

  wire         ovl_gpio_wr =(IOSEL == 1'b1) & (IOTRANS) & (IOWRITE ==1'b1);
  wire         ovl_gpio_rd =(IOSEL == 1'b1) & (IOTRANS) & (IOWRITE ==1'b0);

  // Register the internal register value
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn) begin
      ovl_reg_douten_d  <= {PortWidth{1'b0}};
      ovl_reg_altfunc_d <= {PortWidth{1'b0}};
      ovl_reg_inten_d   <= {PortWidth{1'b0}};
      ovl_reg_inttype_d <= {PortWidth{1'b0}};
      ovl_reg_intpol_d  <= {PortWidth{1'b0}};
    end
    else begin
      ovl_reg_douten_d  <= reg_douten;
      ovl_reg_altfunc_d <= reg_altfunc;
      ovl_reg_inten_d   <= reg_inten;
      ovl_reg_inttype_d <= reg_inttype;
      ovl_reg_intpol_d  <= reg_intpol;
    end
  end

  // Register the int state register related signals
  always @ (posedge FCLK or negedge HRESETn)
  begin
    if (~HRESETn) begin
       ovl_reg_intstat_d <= {PortWidth{1'b0}};
       ovl_reg_intclr_write1_d <= 1'b0;
       ovl_reg_intclr_write0_d <= 1'b0;
    end
    else begin
       ovl_reg_intstat_d <= reg_intstat;
       ovl_reg_intclr_write1_d <= reg_intclr_normal_write1;
       ovl_reg_intclr_write0_d <= reg_intclr_normal_write0;
    end
  end

  assign   ovl_reg_intclr_wr_d_msk =  {{8{ovl_reg_intclr_write1_d}},{8{ovl_reg_intclr_write0_d}}};

  // Register the write data
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      ovl_iowdata_d <= {PortWidth{1'b0}};
    else if (ovl_gpio_wr)
      ovl_iowdata_d <= ovl_iowdatale[PortWidth-1:0];
  end

  // Register the write data using FCLK, for interrupt state register assertion
  always @(posedge FCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      ovl_iowdata_fclk_d <= {PortWidth{1'b0}};
    else if (ovl_gpio_wr)
      ovl_iowdata_fclk_d <= ovl_iowdatale[PortWidth-1:0];
  end

 // Register the IO Port control signals
 always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn) begin
      ovl_ioaddr_d  <= 12'b0;
      ovl_iotrans_d <= 1'b0;
      ovl_iosize_d  <= 2'b0;
    end
    else begin
      ovl_ioaddr_d  <= IOADDR;
      ovl_iotrans_d <= IOTRANS;
      ovl_iosize_d  <= IOSIZE[1:0];
    end
  end

  // IOWDATA endian conversion
  always @(bigendian or IOSIZE or IOWDATA)
  begin
    if ((bigendian)&(IOSIZE==2'b10))
      begin
      ovl_iowdatale = {IOWDATA[ 7: 0],IOWDATA[15: 8],IOWDATA[23:16],IOWDATA[ 31:24]};
      end
    else if ((bigendian)&(IOSIZE==2'b01))
      begin
      ovl_iowdatale = {IOWDATA[23:16],IOWDATA[ 31:24],IOWDATA[ 7: 0],IOWDATA[15: 8]};
      end
    else
      begin
      ovl_iowdatale = IOWDATA;
      end
  end

  // Register the data output
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn) begin
      ovl_portout_d  <= {PortWidth{1'b0}};
    end
    else begin
      ovl_portout_d <= PORTOUT;
    end
  end

 // Register the byte_strobe signal
 always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn) begin
       ovl_iop_byte_strobe_d  <= 2'b0;
    end
    else begin
       ovl_iop_byte_strobe_d  <= iop_byte_strobe;
    end
  end

  wire[15:0] ovl_iop_byte_strobe_d_msk ={{8{ovl_iop_byte_strobe_d[1]}},{8{ovl_iop_byte_strobe_d[0]}}};

 // Register the int signal
 always @(posedge FCLK or negedge HRESETn)
  begin
    if (~HRESETn) begin
        ovl_new_masked_int_d <= {PortWidth{1'b0}};
    end
    else begin
        ovl_new_masked_int_d <= new_masked_int;
    end
  end


  // Check after asserting I/O write, the GPIO output should be valid in the next cycle.
  // Depending on the write type (normal or mask), the output data is checked against
  // the ovl_iowdata_d

  // For normal write, lower 8 bits
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "Write data should be valid on output 1 cycle after IOP write transaction"
    )
  u_ovl_gpio_write_delay_low
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event (ovl_gpio_wr  &  //write operation
                 ((IOADDR[11:2]==10'h000) | (IOADDR[11:2]==10'h001)) & //data register, normal write
                 iop_byte_strobe[0] //lower 8 bits
                 ),
   .test_expr   (
                 PORTOUT[7:0] == ovl_iowdata_d[7:0]
                 )
   );

  // For normal write, higher 8 bits
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "Write data should be valid on output 1 cycle after IOP write transaction"
    )
  u_ovl_gpio_write_delay_high
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event (ovl_gpio_wr &  //write operation
                 ((IOADDR[11:2]==10'h000) | (IOADDR[11:2]==10'h001)) & //data register, normal write
                 iop_byte_strobe[1] //higher 8 bits
                 ),
   .test_expr   (
                 PORTOUT[15:8] == ovl_iowdata_d[15:8]
                 )
   );

  // For normal write, 16 bits
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "Write data should be valid on output 1 cycle after IOP write transaction"
    )
  u_ovl_gpio_write_delay_both
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event (ovl_gpio_wr &  //write operation
                 ((IOADDR[11:2]==10'h000) | (IOADDR[11:2]==10'h001)) & //data register, normal write
                 iop_byte_strobe[0] &//lower 8 bits
                 iop_byte_strobe[1]  //higher 8 bits
                 ),
   .test_expr   (
                 PORTOUT[15:0] == ovl_iowdata_d[15:0]
                 )
   );

  // For mask write, lower 8 bits
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "Write data should be valid on output 1 cycle after IOP write transaction"
    )
  u_ovl_gpio_write_delay_msk_low
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event (ovl_gpio_wr &  //write operation
                 (IOADDR[11:10]==2'b01)  & //data register, mask write, lower 8 bit
                 iop_byte_strobe[0] //lower 8 bits
                 ),
   .test_expr   (
                 PORTOUT[7:0] == ((ovl_iowdata_d[7:0] & ovl_ioaddr_d[9:2]) |(PORTOUT[7:0] & (~ovl_ioaddr_d[9:2])))
                 )
   );

  // For mask write, higher 8 bits
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "Write data should be valid on output 1 cycle after IOP write transaction"
    )
  u_ovl_gpio_write_delay_msk_high
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event (ovl_gpio_wr &  //write operation
                 (IOADDR[11:10]==2'b10)  & //data register, mask write, higher 8 bit
                 iop_byte_strobe[1] //higher 8 bits
                 ),
   .test_expr   (
                 PORTOUT[15:8] == ((ovl_iowdata_d[15:8] & ovl_ioaddr_d[9:2]) |(PORTOUT[15:8] & (~ovl_ioaddr_d[9:2])))
                 )
   );

  // Check MASK read at address 0x400
  assert_implication
  #(
    .severity_level (`OVL_ERROR),
    .property_type  (`OVL_ASSERT),
    .msg            ("Read data from 0x400 will be 0")
    )
  u_ovl_iop_gpio_mask_read_0x400
  (.clk             ( HCLK ),
   .reset_n         (HRESETn),
   .antecedent_expr (ovl_gpio_rd &  //read operation
                    (IOADDR[11:0]==12'h400)  // mask read
                    ),
   .consequent_expr (IORDATA == 32'h00000000)
   );

  // Check MASK read at address 0x800
  assert_implication
  #(
    .severity_level (`OVL_ERROR),
    .property_type  (`OVL_ASSERT),
    .msg            ("Read data from 0x800 will be 0")
    )
  u_ovl_iop_gpio_mask_read_0x800
  (.clk             ( HCLK ),
   .reset_n         (HRESETn),
   .antecedent_expr (ovl_gpio_rd &  //read operation
                    (IOADDR[11:0]==12'h800)  // mask read
                    ),
   .consequent_expr (IORDATA == 32'h00000000)
   );

  // COMBINT check
  assert_implication
  #(
    .severity_level (`OVL_ERROR),
    .property_type  (`OVL_ASSERT),
    .msg            ("COMBINT must be valid when GPIOINT is not equal to 0")
    )
  u_ovl_iop_gpio_comb_int_gen
  (.clk             (FCLK),
   .reset_n         (HRESETn),
   .antecedent_expr ((|GPIOINT) != 1'b0 ),
   .consequent_expr (COMBINT == 1'b1)
   );

  // Interrupt will not be generate if all the interrupt enable bits is cleared
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "Interrupt will not be generated if all the interrupt enable bits are cleared"
    )
  u_ovl_iop_gpio_int_enable
  (.clk         ( FCLK ),
   .reset_n     (HRESETn),
   .start_event ((reg_inten == 16'b0) & (COMBINT ==1'b0)
                 ),
   .test_expr   (
                 COMBINT == 1'b0
                 )
   );

  // Check register set command: OUTENSET register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to SET the register bit"
    )
  u_ovl_iop_gpio_set_reg_douten
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h010) // OUTENSET
                 ),
   .test_expr   (
                  reg_douten == (ovl_reg_douten_d | (ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk ))
                 )
   );

  // Check register SET command: ALTFUNCSET register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to SET the register bit"
    )
  u_ovl_iop_gpio_set_reg_altfunc
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h018)  // ALTFUNCSET
                 ),
   .test_expr   (
                  reg_altfunc == ((ovl_reg_altfunc_d | (ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk)) & ALTERNATE_FUNC_MASK)
                 )
   );


  // Check register SET command:  INTENSET register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to SET the register bit"
    )
  u_ovl_iop_gpio_set_reg_inten
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h020)  // INTENSET
                 ),
   .test_expr   (
                  reg_inten == (ovl_reg_inten_d | (ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk))
                 )
   );

  // Check register SET command:  INTTYPESET register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to SET the register bit"
    )
  u_ovl_iop_gpio_set_reg_inttype
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h028)  // INTTYPESET
                 ),
   .test_expr   (
                  reg_inttype == (ovl_reg_inttype_d | (ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk))
                 )
   );

  // Check register SET command:  INTPOLSET register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to SET the register bit"
    )
  u_ovl_iop_gpio_set_reg_intpol
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h030)  // INTPOLSET
                 ),
   .test_expr   (
                  reg_intpol == (ovl_reg_intpol_d | (ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk))
                 )
   );

  // Check register clear command: OUTENCLR register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to clear the register bit"
    )
  u_ovl_iop_gpio_clear_reg_douten
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h014) // OUTENCLR
                 ),
   .test_expr   (
                  reg_douten == (ovl_reg_douten_d & (~ (ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk)))
                 )
   );

  // Check register clear command: ALTFUNCCLR register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to clear the register bit"
    )
  u_ovl_iop_gpio_clear_reg_altfunc
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h01C)  // ALTFUNCCLR
                 ),
   .test_expr   (
                  reg_altfunc == (ovl_reg_altfunc_d &( ~(ovl_iowdata_d[15:0] & ovl_iop_byte_strobe_d_msk)) & ALTERNATE_FUNC_MASK)
                 )
   );

  // Check register clear command:  INTENCLR register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to clear the register bit"
    )
  u_ovl_iop_gpio_clear_reg_inten
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h024)  // INTENCLR
                 ),
   .test_expr   (
                  reg_inten == (ovl_reg_inten_d & (~(ovl_iowdata_d[15:0]& ovl_iop_byte_strobe_d_msk)))
                 )
   );

  // Check register clear command:  INTTYPECLR register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to clear the register bit"
    )
  u_ovl_iop_gpio_clear_reg_inttype
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h02C)  // INTTYPECLR
                 ),
   .test_expr   (
                  reg_inttype == (ovl_reg_inttype_d & (~(ovl_iowdata_d[15:0]& ovl_iop_byte_strobe_d_msk)))
                 )
   );

  // Check register clear command:  INTPOLCLR register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to clear the register bit"
    )
  u_ovl_iop_gpio_clear_reg_intpol
  (.clk         ( HCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h034)  // INTPOLCLR
                 ),
   .test_expr   (
                  reg_intpol == (ovl_reg_intpol_d & (~(ovl_iowdata_d[15:0]& ovl_iop_byte_strobe_d_msk)))
                 )
   );

  // Check register clear command:  INTCLR register
  assert_next
  #(`OVL_ERROR, 1,1,0,
    `OVL_ASSERT,
    "write 1 to clear the register bit"
    )
  u_ovl_iop_gpio_clear_reg_intclr
  (.clk         ( FCLK ),
   .reset_n     (HRESETn),
   .start_event ((ovl_gpio_wr) &
                 (IOADDR[11:0]==12'h038)  // INTCLR
                 ),
   .test_expr   (
                  reg_intstat == ((ovl_reg_intstat_d & (~(ovl_iowdata_fclk_d[15:0]& ovl_reg_intclr_wr_d_msk))) |
                                  ( ovl_new_masked_int_d) )
                 )
   );


//****************************************
// X check
//****************************************

  // Port out should not go to X
  assert_never_unknown
  #(`OVL_ERROR, PortWidth, `OVL_ASSERT,
    "GPIO PORTOUT went X")
   u_ovl_iop_gpio_portout_x (
   .clk(HCLK),
   .reset_n(HRESETn),
   .qualifier(1'b1),
   .test_expr(PORTOUT)
   );

  // Port enable should not go to X
  assert_never_unknown
  #(`OVL_ERROR, PortWidth, `OVL_ASSERT,
    "GPIO port enable went X")
   u_ovl_iop_gpio_porten_x (
   .clk(HCLK),
   .reset_n(HRESETn),
   .qualifier(1'b1),
   .test_expr(PORTEN)
   );

  // Port alt function should not go to X
  assert_never_unknown
  #(`OVL_ERROR, PortWidth, `OVL_ASSERT,
    "GPIO alt function went X")
   u_ovl_iop_gpio_altfunc_x (
   .clk(HCLK),
   .reset_n(HRESETn),
   .qualifier(1'b1),
   .test_expr(PORTFUNC)
   );

  // Interrupt should not go to X
  assert_never_unknown
  #(`OVL_ERROR, PortWidth, `OVL_ASSERT,
    "GPIO INT went X")
   u_ovl_iop_gpio_gpioint_x (
   .clk(HCLK),
   .reset_n(HRESETn),
   .qualifier(1'b1),
   .test_expr(GPIOINT)
   );

  // Interrupt should not go to X
  assert_never_unknown
  #(`OVL_ERROR, 1, `OVL_ASSERT,
    "GPIO COMB INT went X")
   u_ovl_iop_gpio_combint_x (
   .clk(HCLK),
   .reset_n(HRESETn),
   .qualifier(1'b1),
   .test_expr(COMBINT)
   );


`endif

endmodule
