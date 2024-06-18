// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0

// `include "rtl/clocks.svh"

module core(
  input RESETn,
  input CLKSYS,
  output HBLANK,
  output VBLANK,
  output VSync,
  output HSync,
  output ce_pix,
  output [2:0] grb,
  input [10:0] ps2_key,
  input cin,
  output motor,
  output SVIDEOCLK,
  output [13:0] audio_out,
  output buzzer,
  input [1:0] bootrom_sel
);

wire [15:0] MADDRBUS;
wire [7:0] MDATABUS_in;
wire [7:0] MDATABUS_out;
wire [7:0] ROMDATA;
wire [7:0] MRAM_dout;
wire [7:0] TIMER_out;
wire [7:0] CLKCTRL_out;
wire [7:0] PERIPH_out;
wire [7:0] MFD_out;
wire [7:0] RS232_dout;
wire [7:0] PALDATA;
wire [7:0] MKDATA;
wire [7:0] SOUND_dout;

wire [15:0] SADDRBUS;
wire [7:0] SDATABUS_in;
wire [7:0] SDATABUS_out;
wire [7:0] SMEM_dout;
wire [7:0] CRTRAMDATA;
wire [7:0] SKDATA;

wire [7:0] SRDATA_out;


wire WFD0Fn;
wire RDQEn;
wire FCXXn;
wire RAM1HB1n;
wire RAM1HB2n;
wire BTRDYn;
wire BTROMn;
wire SUBSELn;
wire MIOSn;
wire Z80W;
wire GHn;
wire NMIn = 1;
wire IRQn;
wire FIRQn;
wire DMAn;
wire Z80;
wire RESETBn;
wire QB;
wire EB;
wire BAB;
wire BSB;
wire RWB;
wire WTQEn;
wire REFGRVTn;
wire RDEn;
wire RWBn;
wire E;
wire IOSn;
wire FD0Xn;
wire PLTREGn;
wire AB3n;
wire WFD00n;
wire WFD01n;
wire WFD02n;
wire WFD03n;
wire WFD05n;
wire WFD37n;
wire WFD0En;
wire WFD0Dn;
wire RFD00n;
wire RFD01n;
wire RFD02n;
wire RFD04n;
wire RFD03n;
wire RFD05n;
wire RFD0En;
wire RFD0Fn;
wire BUZZERn;
wire ATTENTn;
wire BUSY;
wire BREAKn;
wire EXTDETn = 0; // ?
wire SOUND;
wire SCLKNMIn;
wire LPMASKn;
wire LPINTn;
wire IRQCLRn;
wire LPBUSY;
wire CANCELn;
wire SUBHALTREQn;
wire KEYINn;
wire TMMASK;
wire MRDYn;
wire _2MS;
wire EXTIRQ;
wire MCPUCLK;
wire SCPUCLK;
wire SUBIRQn;
wire KSTROBEn;
wire SHALTn;
wire SWTQEn;
wire SQANDEn;
wire SRDQEn;
wire SQB;
wire SEB;
wire SHALTSTn;
wire SRWB;
wire SRWBn;
wire SBA;
wire SCRTSWn;
wire SRESETn = RESETBn;
wire SLEDn;
wire SIRQCLRn;
wire SVDHALT;
wire SVRACSn;
wire SBUSYSETn;
wire SVDOFFn;
wire SHALTACn;
wire VPAGE1n;
wire VPAGE2n;
wire VPAGE3n;
wire DPAGE1;
wire DPAGE2;
wire DPAGE3;
wire INS;
wire SCLK1;
wire SCLK2;
wire SCPUWEn;
wire SRDEn;
wire SROMSELn;
wire SRAM1CSn;
wire SRAM2CSn;
wire SROMDn;
wire SSMEMn;
wire SREGHn;
wire SREGLn;
wire KDATAn;
wire KACKNGn;
wire SDRAMGn;
wire SDRAMRn;
wire SDRAMBn;
wire SDRAMV1n;
wire SDRAMV2n;
wire SDRAMV3n;
wire EIRQn;
wire FD_MRn;
wire [7:0] FD_Din;
wire [7:0] FD_Dout;
wire [2:0] FD_RS;
wire FD_DRQn;
wire FD_INTRQn;
wire FD_CSn;
wire FD_WEn;
wire FD_REn;
wire RS232_CEn;
wire FD1Fn;
wire [7:0] SVDATAB;
wire [7:0] SVDATAR;
wire [7:0] SVDATAG;
wire SADRSEL;
wire SFTCLK;
wire [13:0] SVRADRS;
wire SVSYNCn;
wire SHSYNCn;
wire SFTLODn;
wire SBLANKn;
wire SCSYNCn;
wire SCASSEL;
wire SVCASBn;
wire SVCASRn;
wire SVCASGn;
wire SVWEn;
wire HBLANKn;
wire VBLANKn;
wire fm8_switch;
wire CLK2_5;
wire CLK1_2;
wire CLK0_3;

assign HSync = SHSYNCn;
assign VSync = SVSYNCn;
assign HBLANK = ~HBLANKn;
assign VBLANK = ~VBLANKn;
assign ce_pix = SFTCLK;
assign buzzer = SOUND;

assign MDATABUS_in =
  ~(RFD00n & RFD01n) ? MKDATA :
  ~(IOSn | RFD02n) ? PERIPH_out :
  ~(IOSn | RFD03n) ? CLKCTRL_out :
  ~(IOSn | (RFD04n & RFD05n)) ? TIMER_out :
  ~(IOSn | RFD0En) ? SOUND_dout :
  ~(IOSn | FD1Fn) ? MFD_out :
  ~(IOSn | FD_CSn) ? MFD_out :
  ~(IOSn | RS232_CEn) ? RS232_dout :
  ~PLTREGn ? PALDATA :
  ~IOSn ? 8'hff :

  ~(SUBSELn | RDQEn) ? SRDATA_out :
  ~(BTROMn | BTRDYn) | ~RAM1HB2n ? ROMDATA :
  ~(RAM1HB1n & RAM1HB2n) || MADDRBUS <= 16'h8000 ? MRAM_dout :
  8'h0;

assign SDATABUS_in =
  ~(KDATAn & KACKNGn) ? SKDATA :
  ~(SDRAMBn & SDRAMGn & SDRAMRn) ? CRTRAMDATA :
	~(SSMEMn | SRWBn) ? SRDATA_out :
  ~(SROMDn & SROMSELn & SRAM1CSn & SRAM2CSn) ? SMEM_dout :
  8'hff;

CLKCTRL u_CLKCTRL(
  .SW2          ( 1'b0         ), // FM8 compatibility switch
  .CLKSYS       ( CLKSYS       ),
  .SCLK1        ( SCLK1        ),
  .SCLK2        ( SCLK2        ),
  .SCLKNMIn     ( SCLKNMIn     ),
  .RFD00n       ( RFD00n       ),
  .RFD03n       ( RFD03n       ),
  .KEYINn       ( KEYINn       ),
  .LPINTn       ( LPINTn       ),
  .TMMASK       ( TMMASK       ),
  .SVIDEOCLK    ( SVIDEOCLK    ),
  .IOSn         ( IOSn         ),
  .BTRDYn       ( BTRDYn       ),
  .EB           ( EB           ),
  .RESETBn      ( RESETBn      ),
  .MRDYn        ( MRDYn        ),
  ._2MS         ( _2MS         ),
  .IRQCLRn      ( IRQCLRn      ),
  .EXTIRQ       ( EXTIRQ       ),
  .MCPUCLK      ( MCPUCLK      ),
  .SCPUCLK      ( SCPUCLK      ),
  .MDATABUS_out ( CLKCTRL_out  ),
  .IRQn         ( IRQn         ),
  .switch       ( fm8_switch   ),
  .CLK2_5       ( CLK2_5       ),
  .CLK1_2       ( CLK1_2       ),
  .CLK0_3       ( CLK0_3       )
);

ROMS u_ROMS(
  .MADDRBUS ( MADDRBUS    ),
  .RESETBn  ( RESETBn     ),
  .RFD0Fn   ( RFD0Fn      ),
  .WFD0Fn   ( WFD0Fn      ),
  .RDQEn    ( RDQEn       ),
  .CLKSYS   ( CLKSYS      ),
  .FCXXn    ( FCXXn       ),
  .RAM1HB2n ( RAM1HB2n    ),
  .ROMDATA  ( ROMDATA     ),
  .BTRDYn   ( BTRDYn      ),
  .BTROMn   ( BTROMn      ),
  .SUBSELn  ( SUBSELn     ),
  .MIOSn    ( MIOSn       ),
  .RAM1HB1n ( RAM1HB1n    ),
  .SW2      ( bootrom_sel )
);

MRAM u_MRAM(
  .RAM1HB1n ( RAM1HB1n     ),
  .RAM1HB2n ( RAM1HB2n     ),
  .RWBn     ( RWBn         ),
  .CLKSYS   ( CLKSYS       ),
  .MADDRBUS ( MADDRBUS     ),
  .DIN      ( MDATABUS_out ),
  .RDQEn    ( RDQEn        ),
  .DOUT     ( MRAM_dout    )
);

MDECODE u_MDECODE(
  .MADDRBUS ( MADDRBUS ),
  .RDEn     ( RDEn     ),
  .E        ( E        ),
  .RWBn     ( RWBn     ),
  .WTQEn    ( WTQEn    ),
  .IOSn     ( IOSn     ),
  .FD0Xn    ( FD0Xn    ),
  .PLTREGn  ( PLTREGn  ),
  .AB3n     ( AB3n     ),
  .WFD00n   ( WFD00n   ),
  .WFD01n   ( WFD01n   ),
  .WFD02n   ( WFD02n   ),
  .WFD03n   ( WFD03n   ),
  .WFD05n   ( WFD05n   ),
  .WFD37n   ( WFD37n   ),
  .WFD0Dn   ( WFD0Dn   ),
  .WFD0En   ( WFD0En   ),
  .WFD0Fn   ( WFD0Fn   ),
  .RFD00n   ( RFD00n   ),
  .RFD01n   ( RFD01n   ),
  .RFD02n   ( RFD02n   ),
  .RFD04n   ( RFD04n   ),
  .RFD03n   ( RFD03n   ),
  .RFD05n   ( RFD05n   ),
  .RFD0En   ( RFD0En   ),
  .RFD0Fn   ( RFD0Fn   )
);

MCPU u_MCPU(
  .MDATABUS_in  ( MDATABUS_in  ),
  .RESETn       ( RESETn       ),
  .Z80W         ( Z80W         ),
  .MCPUCLK      ( MCPUCLK      ),
  .GHn          ( GHn          ),
  .NMIn         ( NMIn         ),
  .IRQn         ( IRQn         ),
  .FIRQn        ( FIRQn        ),
  .DMAn         ( DMAn         ),
  .CLKSYS       ( CLKSYS       ),
  .Z80          ( Z80          ),
  .RESETBn      ( RESETBn      ),
  .QB           ( QB           ),
  .EB           ( EB           ),
  .BAB          ( BAB          ),
  .BSB          ( BSB          ),
  .RWB          ( RWB          ),
  .WTQEn        ( WTQEn        ),
  .RDQEn        ( RDQEn        ),
  .REFGRVTn     ( REFGRVTn     ),
  .MDATABUS_out ( MDATABUS_out ),
  .MADDRBUS     ( MADDRBUS     ),
  .RDEn         ( RDEn         ),
  .RWBn         ( RWBn         ),
  .E            ( E            )
);

TIMER u_TIMER(
  .CLKSYS       ( CLKSYS       ),
  .MDATABUS_in  ( MDATABUS_in  ),
  .MDATABUS_out ( TIMER_out    ),
  .WFD03n       ( WFD03n       ),
  .BUZZERn      ( BUZZERn      ),
  .RESETBn      ( RESETBn      ),
  .EB           ( EB           ),
  .Z80W         ( Z80W         ),
  .REFGRVTn     ( REFGRVTn     ),
  .ATTENTn      ( ATTENTn      ),
  .RFD04n       ( RFD04n       ),
  .RFD05n       ( RFD05n       ),
  .BUSY         ( BUSY         ),
  .BREAKn       ( BREAKn       ),
  .EXTDETn      ( EXTDETn      ),
  .CLK0_3       ( CLK0_3       ),
  .SOUND        ( SOUND        ),
  .SCLKNMIn     ( SCLKNMIn     ),
  .DMAn         ( DMAn         ),
  .FIRQn        ( FIRQn        )
);

PERIPHERAL u_PERIPHERAL(
  .MDATABUS_in  ( MDATABUS_out ),
  .MDATABUS_out ( PERIPH_out   ),
  .WFD00n       ( WFD00n       ),
  .WFD01n       ( WFD01n       ),
  .WFD05n       ( WFD05n       ),
  .RFD02n       ( RFD02n       ),
  .RFD03n       ( RFD03n       ),
  .RESETBn      ( RESETBn      ),
  .LPMASKn      ( LPMASKn      ),
  .LPINTn       ( LPINTn       ),
  .IRQCLRn      ( IRQCLRn      ),
  .LPBUSY       ( LPBUSY       ),
  .GHn          ( GHn          ),
  .Z80W         ( Z80W         ),
  .CANCELn      ( CANCELn      ),
  .SUBHALTREQn  ( SUBHALTREQn  ),
  .motor        ( motor        ),
  .cin          ( cin          )
);

SCPU u_SCPU(
  .RESETBn      ( RESETBn      ),
  .SCPUCLK      ( SCPUCLK      ),
  .SCLKNMIn     ( SCLKNMIn     ),
  .SUBIRQn      ( SUBIRQn      ),
  .KSTROBEn     ( KSTROBEn     ),
  .SHALTn       ( SHALTn       ),
  .SADDRBUS     ( SADDRBUS     ),
  .SDATABUS_in  ( SDATABUS_in  ),
  .SDATABUS_out ( SDATABUS_out ),
  .SWTQEn       ( SWTQEn       ),
  .SQANDEn      ( SQANDEn      ),
  .SRDQEn       ( SRDQEn       ),
  .SQB          ( SQB          ),
  .SEB          ( SEB          ),
  .SHALTSTn     ( SHALTSTn     ),
  .SRWB         ( SRWB         ),
  .SRWBn        ( SRWBn        ),
  .SBA          ( SBA          )
);

FLAGS u_FLAGS(
  .SRWB        ( SRWB        ),
  .SCRTSWn     ( SCRTSWn     ),
  .SRESETn     ( 1'b0        ),
  .SLEDn       ( SLEDn       ),
  .CANCELn     ( CANCELn     ),
  .SIRQCLRn    ( SIRQCLRn    ),
  .MDATABUS_in ( MDATABUS_in ),
  .RESETBn     ( RESETBn     ),
  .WFD37n      ( WFD37n      ),
  .SRWBn       ( SRWBn       ),
  .SVDHALT     ( SVDHALT     ),
  .SVRACSn     ( SVRACSn     ),
  .SUBHALTREQn ( SUBHALTREQn ),
  .SBUSYSETn   ( SBUSYSETn   ),

  .SHALTSTn    ( SHALTSTn    ),
  .SHALTn      ( SHALTn      ),

  .SVDOFFn     ( SVDOFFn     ),
  .SUBIRQn     ( SUBIRQn     ),
  .BUSY        ( BUSY        ),
  .SHALTACn    ( SHALTACn    ),
  .VPAGE1n     ( VPAGE1n     ),
  .VPAGE2n     ( VPAGE2n     ),
  .VPAGE3n     ( VPAGE3n     ),
  .DPAGE1      ( DPAGE1      ),
  .DPAGE2      ( DPAGE2      ),
  .DPAGE3      ( DPAGE3      ),
  .INS         ( INS         )
);

SDECODE u_SDECODE(
  .SADDRBUS  ( SADDRBUS  ),
  .SQB       ( SQB       ),
  .SEB       ( SEB       ),
  .SBA       ( SBA       ),
  .SQANDEn   ( SQANDEn   ),
  .SRWB      ( SRWB      ),
  .VPAGE1n   ( VPAGE1n   ),
  .VPAGE2n   ( VPAGE2n   ),
  .VPAGE3n   ( VPAGE3n   ),
  .SCPUWEn   ( SCPUWEn   ),
  .SRDEn     ( SRDEn     ),
  .SROMSELn  ( SROMSELn  ),
  .SRAM1CSn  ( SRAM1CSn  ),
  .SRAM2CSn  ( SRAM2CSn  ),
  .SROMDn    ( SROMDn    ),
  .SSMEMn    ( SSMEMn    ),
  .SCRTSWn   ( SCRTSWn   ),
  .SVRACSn   ( SVRACSn   ),
  .SBUSYSETn ( SBUSYSETn ),
  .SLEDn     ( SLEDn     ),
  .SREGHn    ( SREGHn    ),
  .SREGLn    ( SREGLn    ),
  .KDATAn    ( KDATAn    ),
  .KACKNGn   ( KACKNGn   ),
  .SIRQCLRn  ( SIRQCLRn  ),
  .BUZZERn   ( BUZZERn   ),
  .ATTENTn   ( ATTENTn   ),
  .SDRAMGn   ( SDRAMGn   ),
  .SDRAMRn   ( SDRAMRn   ),
  .SDRAMBn   ( SDRAMBn   ),
  .SDRAMV1n  ( SDRAMV1n  ),
  .SDRAMV2n  ( SDRAMV2n  ),
  .SDRAMV3n  ( SDRAMV3n  )
);

SMEM u_SMEM(
  .CLKSYS       ( CLKSYS       ),
  .SADDRBUS     ( SADDRBUS     ),
  .SDATABUS_in  ( SDATABUS_out ),
  .SDATABUS_out ( SMEM_dout    ),
  .SRAM1CSn     ( SRAM1CSn     ),
  .SRAM2CSn     ( SRAM2CSn     ),
  .SWTQEn       ( SWTQEn       ),
  .SRDQEn       ( SRDQEn       ),
  .SROMSELn     ( SROMSELn     ),
  .SROMDn       ( SROMDn       )
);

// shared RAM
SRAM u_SRAM(
  .CLKSYS      ( CLKSYS       ),
  .SADDRBUS    ( SADDRBUS     ),
  .MADDRBUS    ( MADDRBUS     ),
  .SDATA_in    ( SDATABUS_out ),
  .MDATA_in    ( MDATABUS_out ),
  .SRDATA_out  ( SRDATA_out   ),
  .SHALTACn    ( SHALTACn     ),
  .RDQEn       ( RDQEn        ),
  .SRDQEn      ( SRDQEn       ),
  .WTQEn       ( WTQEn        ),
  .SWTQEn      ( SWTQEn       ),
  .SSMEMn      ( SSMEMn       ),
  .SUBSELn     ( SUBSELn      )
);

MFD u_MFD(
  .MADDRBUS     ( MADDRBUS     ),
  .MDATABUS_out ( MDATABUS_out ),
  .MFD_out      ( MFD_out      ),
  .IOSn         ( IOSn         ),
  .EB           ( EB           ),
  .QB           ( QB           ),
  .RESETBn      ( RESETBn      ),
  .RWB          ( RWB          ),
  .EIRQn        ( EIRQn        ),
  .FD1Fn        ( FD1Fn        ),
  // .FD18_1Dn     ( FD18_1Dn     ),
  // floppy disk interface MB8877
  .FD_CSn       ( FD_CSn       ),
  .FD_Dout      ( FD_Dout      ),
  .FD_Din       ( FD_Din       ),
  .FD_RS        ( FD_RS        ),
  .FD_DRQn      ( FD_DRQn      ),
  .FD_INTRQn    ( FD_INTRQn    ),
  .FD_MRn       ( FD_MRn       ),
  .FD_WEn       ( FD_WEn       ),
  .FD_REn       ( FD_REn       )
);

FDC u_FDC(
  .CLKSYS    ( CLKSYS    ),
  .FD_MRn    ( FD_MRn    ),
  .FD_Din    ( FD_Dout   ),
  .FD_Dout   ( FD_Din    ),
  .FD_RS     ( FD_RS     ),
  .FD_DRQn   ( FD_DRQn   ),
  .FD_INTRQn ( FD_INTRQn ),
  .FD_CSn    ( FD_CSn    ),
  .FD_WEn    ( FD_WEn    ),
  .FD_REn    ( FD_REn    )
);


RS232 RS232(
  .MADDRBUS  ( MADDRBUS   ),
  .RS232_CEn ( RS232_CEn  ),
  .dout      ( RS232_dout )
);

CRTRAM u_CRTRAM(
  .CLKSYS     ( CLKSYS       ),
  .SDATABUS   ( SDATABUS_out ),
  .CRTRAMDATA ( CRTRAMDATA   ),
  .SVWEn      ( SVWEn        ),
  .SCASSEL    ( SCASSEL      ),
  .SVRADRS    ( SVRADRS      ),
  .SVCASBn    ( SVCASBn      ),
  .SVCASRn    ( SVCASRn      ),
  .SVCASGn    ( SVCASGn      ),
  .SDRAMBn    ( SDRAMBn      ),
  .SDRAMRn    ( SDRAMRn      ),
  .SDRAMGn    ( SDRAMGn      ),
  .SVDATAB    ( SVDATAB      ),
  .SVDATAR    ( SVDATAR      ),
  .SVDATAG    ( SVDATAG      )
);

SUBCRTADDR u_SUBCRTADDR(
  .SDRAMV1n ( SDRAMV1n ),
  .SDRAMV2n ( SDRAMV2n ),
  .SDRAMV3n ( SDRAMV3n ),
  .SBLANKn  ( SBLANKn  ),
  .SCASSEL  ( SCASSEL  ),
  .SRWB     ( SRWB     ),
  .SVCASBn  ( SVCASBn  ),
  .SVCASRn  ( SVCASRn  ),
  .SVCASGn  ( SVCASGn  ),
  .SVWEn    ( SVWEn    ),
  .SADRSEL  ( SADRSEL  )
);

MB60H010 u_MB60H010(
  .SRESETn   ( SRESETn   ),
  .CLKSYS    ( CLKSYS    ),
  .SADDRBUS  ( SADDRBUS  ),
  .SDATA     ( SDATABUS_out ),
  .SREGLn    ( SREGLn    ),
  .SREGHn    ( SREGHn    ),
  .SADRSEL   ( SADRSEL   ),
  .SFTCLK    ( SFTCLK    ),
  .SCLK1     ( SCLK1     ),
  .SCLK2     ( SCLK2     ),
  .SVRADRS   ( SVRADRS   ),
  .SVIDEOCLK ( SVIDEOCLK ),
  .SVSYNCn   ( SVSYNCn   ),
  .SHSYNCn   ( SHSYNCn   ),
  .SVDHALT   ( SVDHALT   ),
  .SFTLODn   ( SFTLODn   ),
  .SBLANKn   ( SBLANKn   ),
  .SCSYNCn   ( SCSYNCn   ),
  .SCASSEL   ( SCASSEL   ),
  .VBLANKn   ( VBLANKn   ),
  .HBLANKn   ( HBLANKn   )
);

PAL PAL(
  .CLKSYS   ( CLKSYS       ),
  .SVDOFFn  ( SVDOFFn      ),
  .SBLANKn  ( SBLANKn      ),
  .SVDATAB  ( SVDATAB      ),
  .SVDATAR  ( SVDATAR      ),
  .SVDATAG  ( SVDATAG      ),
  .SFTCLK   ( SFTCLK       ),
  .SFTLODn  ( SFTLODn      ),
  .DPAGE1   ( DPAGE1       ),
  .DPAGE2   ( DPAGE2       ),
  .DPAGE3   ( DPAGE3       ),
  .MDATA    ( MDATABUS_out ),
  .PALDATA  ( PALDATA      ),
  .MADDRBUS ( MADDRBUS     ),
  .PLTREGn  ( PLTREGn      ),
  .RDQEn    ( RDQEn        ),
  .WTQEn    ( WTQEn        ),
  .RESETBn  ( RESETBn      ),
  .grb      ( grb          )
);

KEYBOARD KEYBOARD(
  .CLKSYS     ( CLKSYS       ),
  .RESETBn    ( RESETBn      ),
  .ps2_key    ( ps2_key      ),
  .MDATA_in   ( MDATABUS_out ),
  .SKDATA     ( SKDATA       ),
  .MKDATA     ( MKDATA       ),
  .KDATAn     ( KDATAn       ),
  .KACKNGn    ( KACKNGn      ),
  .RFD00n     ( RFD00n       ),
  .RFD01n     ( RFD01n       ),
  .SCLK2      ( SCLK2        ),
  .WFD02n     ( WFD02n       ),
  .KSTROBEn   ( KSTROBEn     ),
  .BREAKn     ( BREAKn       ),
  .fm8_switch ( fm8_switch   ),
  .LPMASKn    ( LPMASKn      ),
  .TMMASK     ( TMMASK       ),
  .KEYINn     ( KEYINn       )
);


SOUND u_SOUND(
  .CLKSYS       ( CLKSYS       ),
  .CLK1_2       ( CLK1_2       ),
  .RESETBn      ( RESETBn      ),
  .MDATABUS_in  ( MDATABUS_in  ),
  .MDATABUS_out ( SOUND_dout   ),
  .RFD0En       ( RFD0En       ),
  .WFD0En       ( WFD0En       ),
  .WFD0Dn       ( WFD0Dn       ),
  .mix_audio_o  ( audio_out    )
);


endmodule
