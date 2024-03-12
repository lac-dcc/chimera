// --=========================================================================--
//  This confidential and proprietary software may be used only as
//  authorised by a licensing agreement from ARM Limited
//    (C) COPYRIGHT 2007-2008 ARM Limited
//        ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorised
//  copies and copies may only be made to the extent permitted
//  by a licensing agreement from ARM Limited.
// -----------------------------------------------------------------------------
//
//  Version and Release Control Information:
//
//  File Name              : $RCSfile: SspDefs.v.rca $S
//  File Revision          : 20348
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//  Purpose : System Parameter definitions 
// --=========================================================================--
 
// -----------------------------------------------------------------------------
// State Definitions for the SSP Master mode State machine (SspMTxRxCntl)
// -----------------------------------------------------------------------------
`define ST_MTIIDLE               6'b000000
`define ST_MTISFRM2              6'b000001
`define ST_MTISHIFT1             6'b000011
`define ST_MTISTG2               6'b000010
`define ST_MTISHIFT2             6'b000110
`define ST_MTISSPOE1             6'b000111
`define ST_MTILASTBIT            6'b000101
`define ST_MTITXFNE              6'b000100
`define ST_MTISFRM1              6'b001100
`define ST_MTIDATAAVLBL          6'b001101
`define ST_MTISSPOE2             6'b001111

`define ST_MNMIDLE               6'b001110
`define ST_MNMDATAAVLBL          6'b001010
`define ST_MNMSFRM               6'b001011
`define ST_MNMTXBIT              6'b001001
`define ST_MNMTXBIT2             6'b001000
`define ST_MNMWAIT1              6'b011000
`define ST_MNMWAIT2              6'b011001
`define ST_MNMRX1                6'b011011
`define ST_MNMRX2                6'b011010
`define ST_MNMSFRMLAST           6'b011110
`define ST_MNMRXLAST             6'b011111
`define ST_MNMTXFNE              6'b011101

`define ST_MSPIIDLE              6'b011100
`define ST_MSPIDATAAVLBL         6'b010100
`define ST_MSPISFRM              6'b010101
`define ST_MSPITX1               6'b010111
`define ST_MSPIRX1               6'b010110
`define ST_MSPITX2               6'b010010
`define ST_MSPIRX2               6'b010011
`define ST_MSPISFRMEND           6'b010001
`define ST_MSPILASTTX            6'b010000
`define ST_MSPILASTRX            6'b110000
`define ST_MSPISD1               6'b110001
`define ST_MSPISD2               6'b110011

`define ST_MRESET                6'b110010

// -----------------------------------------------------------------------------
// State Definitions for the SSP Slave mode State machine (SspSTxRxCntl)
// -----------------------------------------------------------------------------
`define ST_SSPIIDLE              5'b00000 
`define ST_SNMIDLE               5'b00001 
`define ST_STIIDLE               5'b00010 
 
`define ST_STISTART              5'b00011 
`define ST_STIRX                 5'b00100 
`define ST_STITX                 5'b00101 
`define ST_STICONTX              5'b00110 
`define ST_STIDSSPOE1            5'b00111 
`define ST_STIDSSPOE2            5'b01000 
 
`define ST_SNMRX                 5'b01001 
`define ST_SNMTXINIT             5'b01010 
`define ST_SNMTXDRV0             5'b01011 
`define ST_SNMTX                 5'b01100 
`define ST_SNMRXCHK              5'b01101 
 
`define ST_SSPIRX                5'b01111
`define ST_SSPITX                5'b10001 
`define ST_SSPIFRMCHK            5'b10010 
`define ST_SSPIRXCONT            5'b10011 

// -----------------------------------------------------------------------------
// Normal mode registers' address `definedefinitions
// -----------------------------------------------------------------------------
`define  PA_SSPCR0   10'b0000000000
// SSPCR0 at offset 0x00
 
`define  PA_SSPCR1   10'b0000000001
// SSPCR1 at offset 0x04
 
`define  PA_SSPDR    10'b0000000010
// SSPDR at offset 0x08
 
`define  PA_SSPSR    10'b0000000011
// SSPSR at offset 0x0C
 
`define  PA_SSPCPSR  10'b0000000100
// SSPCPSR at offset 0x10
 
`define  PA_SSPIMSC   10'b0000000101
// SSPIMSC at offset 0x14
 
`define  PA_SSPRIS   10'b0000000110
// SSPRIS at offset 0x18
 
`define  PA_SSPMIS   10'b0000000111
// SSPMIS at offset 0x1C
 
`define  PA_SSPICR   10'b0000001000
// SSPICR at offset 0x20
 
`define  PA_SSPDMACR 10'b0000001001
// SSPDMACR at offset 0x24
 
// ----------------------------------------------------------------------------
// Test registers' address 'defines
// ----------------------------------------------------------------------------

`define PA_SSPTCR  10'b0000100000
// SSPTCR  at offset 0x080

`define PA_SSPITIP 10'b0000100001
// SSPITIP at offset 0x084
 
`define PA_SSPITOP 10'b0000100010
// SSPITOP at offset 0x088
 
`define PA_SSPTDR  10'b0000100011
// SSPTDR at offset 0x08C
 
// -----------------------------------------------------------------------------
// Peripheral Identification Register address constants
// -----------------------------------------------------------------------------

`define PA_PERIPHID0 10'b1111111000
// PERIPHERALID0 at offset 0xFE0
  
`define PA_PERIPHID1 10'b1111111001
// PERIPHERALID1 at offset 0xFE4
  
`define PA_PERIPHID2 10'b1111111010
// PERIPHERALID2 at offset 0xFE8
  
`define PA_PERIPHID3 10'b1111111011
// PERIPHERALID3 at offset 0xFEC
  
// -----------------------------------------------------------------------------
// PrimeCell Identification Register address 'defines
// -----------------------------------------------------------------------------

`define PA_PRIMECELLID0 10'b1111111100
// PRIMECELLID0 at offset 0xFF0
  
`define PA_PRIMECELLID1 10'b1111111101
// PRIMECELLID1 at offset 0xFF4
  
`define PA_PRIMECELLID2 10'b1111111110
// PRIMECELLID2 at offset 0xFF8
  
`define PA_PRIMECELLID3 10'b1111111111
// PRIMECELLID3 at offset 0xFFC

// -----------------------------------------------------------------------------
// Peripheral Identification Register value constants
// -----------------------------------------------------------------------------

`define PERIPHID0 8'b00100010
// PERIPHERALID0 at offset 0xFE0
  
`define PERIPHID1 8'b00010000
// PERIPHERALID1 at offset 0xFE4
  
`define PERIPHID2 Revision & 4'b0100
// PERIPHERALID2 at offset 0xFE8, coded via Revision in toplevel Ssp.
  
`define PERIPHID3 8'b00000000
// PERIPHERALID3 at offset 0xFEC
  
// -----------------------------------------------------------------------------
// PrimeCell Identification Register value constants
// -----------------------------------------------------------------------------

`define PRIMECELLID0 8'b00001101
// PRIMECELLID0 at offset 0xFF0
  
`define PRIMECELLID1 8'b11110000
// PRIMECELLID1 at offset 0xFF4
  
`define PRIMECELLID2 8'b00000101
// PRIMECELLID2 at offset 0xFF8
  
`define PRIMECELLID3 8'b10110001
// PRIMECELLID3 at offset 0xFFC

// --================================== End ==================================--
