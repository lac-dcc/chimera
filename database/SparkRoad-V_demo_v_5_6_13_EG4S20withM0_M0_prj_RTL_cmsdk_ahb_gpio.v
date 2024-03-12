//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-01-21 13:52:45 +0000 (Mon, 21 Jan 2013) $
//
//      Revision            : $Revision: 234293 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------

module cmsdk_ahb_gpio
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

// ----------------------------------------------------------------------------
// Port Definitions
// ----------------------------------------------------------------------------
  (// AHB Inputs
   input  wire                 HCLK,      // system bus clock
   input  wire                 HRESETn,   // system bus reset
   input  wire                 FCLK,      // system bus clock
   input  wire                 HSEL,      // AHB peripheral select
   input  wire                 HREADY,    // AHB ready input
   input  wire  [1:0]          HTRANS,    // AHB transfer type
   input  wire  [2:0]          HSIZE,     // AHB hsize
   input  wire                 HWRITE,    // AHB hwrite
   input  wire [11:0]          HADDR,     // AHB address bus
   input  wire [31:0]          HWDATA,    // AHB write data bus

   input wire  [3:0]           ECOREVNUM,  // Engineering-change-order revision bits

   input wire  [15:0]          PORTIN,     // GPIO Interface input

   // AHB Outputs
   output wire                 HREADYOUT, // AHB ready output to S->M mux
   output wire                 HRESP,     // AHB response
   output wire [31:0]          HRDATA,

   output wire [15:0]          PORTOUT,    // GPIO output
   output wire [15:0]          PORTEN,     // GPIO output enable
   output wire [15:0]          PORTFUNC,   // Alternate function control

   output wire [15:0]          GPIOINT,    // Interrupt output for each pin
   output wire                 COMBINT);   // Combined interrupt

// ----------------------------------------------------------------------------
// Internal wires
// ----------------------------------------------------------------------------

   wire [31:0]           IORDATA;    // I/0 read data bus
   wire                  IOSEL;      // Decode for peripheral
   wire  [11:0]          IOADDR;     // I/O transfer address
   wire                  IOWRITE;    // I/O transfer direction
   wire  [1:0]           IOSIZE;     // I/O transfer size
   wire                  IOTRANS;    // I/O transaction
   wire [31:0]           IOWDATA;    // I/O write data bus

// ----------------------------------------------------------------------------
// Block Instantiations
// ----------------------------------------------------------------------------
  // Convert AHB Lite protocol to simple I/O port interface
  cmsdk_ahb_to_iop
    u_ahb_to_gpio  (
    // Inputs
    .HCLK         (HCLK),
    .HRESETn      (HRESETn),
    .HSEL         (HSEL),
    .HREADY       (HREADY),
    .HTRANS       (HTRANS),
    .HSIZE        (HSIZE),
    .HWRITE       (HWRITE),
    .HADDR        (HADDR),
    .HWDATA       (HWDATA),

    .IORDATA      (IORDATA),

    // Outputs
    .HREADYOUT    (HREADYOUT),
    .HRESP        (HRESP),
    .HRDATA       (HRDATA),

    .IOSEL        (IOSEL),
    .IOADDR       (IOADDR[11:0]),
    .IOWRITE      (IOWRITE),
    .IOSIZE       (IOSIZE),
    .IOTRANS      (IOTRANS),
    .IOWDATA      (IOWDATA));

  // GPIO module with I/O port interface
  cmsdk_iop_gpio #(
    .ALTERNATE_FUNC_MASK     (ALTERNATE_FUNC_MASK),
    .ALTERNATE_FUNC_DEFAULT  (ALTERNATE_FUNC_DEFAULT), // All pins default to GPIO
    .BE                      (BE))
    u_iop_gpio  (
    // Inputs
    .HCLK         (HCLK),
    .HRESETn      (HRESETn),
    .FCLK         (FCLK),
    .IOADDR       (IOADDR[11:0]),
    .IOSEL        (IOSEL),
    .IOTRANS      (IOTRANS),
    .IOSIZE       (IOSIZE),
    .IOWRITE      (IOWRITE),
    .IOWDATA      (IOWDATA),

    // Outputs
    .IORDATA      (IORDATA),

    .ECOREVNUM    (ECOREVNUM),// Engineering-change-order revision bits

    .PORTIN       (PORTIN),   // GPIO Interface inputs
    .PORTOUT      (PORTOUT),  // GPIO Interface outputs
    .PORTEN       (PORTEN),
    .PORTFUNC     (PORTFUNC), // Alternate function control

    .GPIOINT      (GPIOINT),  // Interrupt outputs
    .COMBINT      (COMBINT)
  );

endmodule
