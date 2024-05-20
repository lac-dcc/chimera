// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps

// SLIP special characters
`define SLIP_END     8'hC0
`define SLIP_ESC     8'hDB
`define SLIP_ESC_END 8'hDC
`define SLIP_ESC_ESC 8'hDD

// Message format
`define MSG_READ_LENGTH  3'd3
`define MSG_WRITE_LENGTH 3'd5

// Groups
`define ADDR_GROUP_ERASABLE     7'h00
`define ADDR_GROUP_FIXED        7'h01
`define ADDR_GROUP_CHANNELS     7'h02
`define ADDR_GROUP_SIM_ERASABLE 7'h10
`define ADDR_GROUP_SIM_FIXED    7'h11
`define ADDR_GROUP_CONTROL      7'h20
`define ADDR_GROUP_MON_REGS     7'h21
`define ADDR_GROUP_MON_CHANNELS 7'h22
`define ADDR_GROUP_MON_DSKY     7'h23
`define ADDR_GROUP_STATUS       7'h24
`define ADDR_GROUP_TRACE        7'h25
`define ADDR_GROUP_NASSP        7'h26

// Control Registers
`define CTRL_REG_START        16'h0
`define CTRL_REG_STOP         16'h1
`define CTRL_REG_STOP_CAUSE   16'h2
`define CTRL_REG_PROCEED      16'h3
`define CTRL_REG_MNHRPT       16'h4
`define CTRL_REG_MNHNC        16'h5
`define CTRL_REG_S1_S         16'h6
`define CTRL_REG_S1_BANK      16'h7
`define CTRL_REG_S1_S_IGN     16'h8
`define CTRL_REG_S1_BANK_IGN  16'h9
`define CTRL_REG_S2_S         16'hA
`define CTRL_REG_S2_BANK      16'hB
`define CTRL_REG_S2_S_IGN     16'hC
`define CTRL_REG_S2_BANK_IGN  16'hD
`define CTRL_REG_WRITE_W      16'hE
`define CTRL_REG_W_TIMES      16'hF
`define CTRL_REG_W_PULSES     16'h10
`define CTRL_REG_W_COMP_VAL   16'h11
`define CTRL_REG_W_COMP_IGN   16'h12
`define CTRL_REG_W_COMP_PAR   16'h13
`define CTRL_REG_I_COMP_VAL   16'h14
`define CTRL_REG_I_COMP_IGN   16'h15
`define CTRL_REG_I_COMP_STAT  16'h16
`define CTRL_REG_LDRD_S1_S2   16'h17
`define CTRL_REG_BANK_S       16'h18
`define CTRL_REG_ADVANCE_S    16'h19
`define CTRL_REG_CRS_BANK_EN0 16'h1A
`define CTRL_REG_CRS_BANK_EN1 16'h1B
`define CTRL_REG_CRS_BANK_EN2 16'h1C
`define CTRL_REG_CRS_BANK_EN3 16'h1D
`define CTRL_REG_EMS_BANK_EN  16'h1E
`define CTRL_REG_DOSCAL       16'h30
`define CTRL_REG_DBLTST       16'h31
`define CTRL_REG_NHALGA       16'h40
`define CTRL_REG_NHSTRT1      16'h41
`define CTRL_REG_NHSTRT2      16'h42
`define CTRL_REG_DOWNRUPT     16'h50
`define CTRL_REG_HANDRUPT     16'h51
`define CTRL_REG_LOAD_S       16'h70
`define CTRL_REG_LOAD_PRESET  16'h71
`define CTRL_REG_LOAD_CHAN    16'h72
`define CTRL_REG_READ_S       16'h73
`define CTRL_REG_READ_PRESET  16'h74
`define CTRL_REG_READ_CHAN    16'h75
`define CTRL_REG_START_S      16'h76
`define CTRL_REG_START_PRESET 16'h77

// Status registers
`define STATUS_REG_ALARMS       16'h00
`define STATUS_REG_SIMULATION   16'h01
`define STATUS_REG_MON_TEMP     16'h10
`define STATUS_REG_MON_VCCINT   16'h11
`define STATUS_REG_MON_VCCAUX   16'h12
`define STATUS_REG_MON_P3V3IO   16'h13
`define STATUS_REG_AGC_TEMP     16'h14
`define STATUS_REG_AGC_BPLSSW   16'h15
`define STATUS_REG_AGC_P4SW     16'h16
`define STATUS_REG_MM_ADDR      16'h40
`define STATUS_REG_MM_DATA      16'h41

// Monitor AGC Register Mirrors
`define MON_REG_A      16'h00
`define MON_REG_L      16'h01
`define MON_REG_Q      16'h02
`define MON_REG_Z      16'h03
`define MON_REG_BB     16'h04
`define MON_REG_B      16'h05
`define MON_REG_S      16'h06
`define MON_REG_G      16'h07
`define MON_REG_Y      16'h08
`define MON_REG_U      16'h09
`define MON_REG_I      16'h0A
`define MON_REG_STATUS 16'h0B
`define MON_REG_PAR    16'h0C
`define MON_REG_W      16'h40

`define DSKY_REG_PROG        16'h00
`define DSKY_REG_VERB        16'h01
`define DSKY_REG_NOUN        16'h02
`define DSKY_REG_REG1_L      16'h03
`define DSKY_REG_REG1_H      16'h04
`define DSKY_REG_REG2_L      16'h05
`define DSKY_REG_REG2_H      16'h06
`define DSKY_REG_REG3_L      16'h07
`define DSKY_REG_REG3_H      16'h08
`define DSKY_REG_MAIN_BUTTON 16'h09
`define DSKY_REG_PROCEED     16'h0A
`define DSKY_REG_STATUS      16'h0B
`define DSKY_REG_NAV_BUTTON  16'h0C

`define NASSP_REG_CH10     16'h00
`define NASSP_REG_CH30     16'h01
`define NASSP_REG_CH31     16'h02
`define NASSP_REG_CH32     16'h03
`define NASSP_REG_CH33     16'h04
`define NASSP_REG_TLOSS_W  16'h10
`define NASSP_REG_TLOSS_T  16'h11
`define NASSP_REG_DOWNRUPT 16'h12
`define NASSP_REG_PIPAX    16'h20
`define NASSP_REG_PIPAY    16'h21
`define NASSP_REG_PIPAZ    16'h22
`define NASSP_REG_CDUXCMD  16'h30
`define NASSP_REG_CDUYCMD  16'h31
`define NASSP_REG_CDUZCMD  16'h32
`define NASSP_REG_CDUTCMD  16'h33
`define NASSP_REG_CDUSCMD  16'h34
`define NASSP_REG_THRUST   16'h35
`define NASSP_REG_ALTM     16'h36

`define W_MODE_ALL 3'o0
`define W_MODE_S   3'o1
`define W_MODE_I   3'o2
`define W_MODE_S_I 3'o3
`define W_MODE_P   3'o4
`define W_MODE_P_I 3'o5
`define W_MODE_P_S 3'o6

`define W_PULSE_A   0
`define W_PULSE_L   1
`define W_PULSE_Q   2
`define W_PULSE_Z   3
`define W_PULSE_RCH 4
`define W_PULSE_WCH 5
`define W_PULSE_G   6
`define W_PULSE_B   7
`define W_PULSE_Y   8
`define W_PULSE_U   9

`define ADC_CHAN_TEMP   5'h00
`define ADC_CHAN_VCCINT 5'h01
`define ADC_CHAN_VCCAUX 5'h02
`define ADC_CHAN_VAUX7  5'h17
`define ADC_CHAN_VAUX12 5'h1C
`define ADC_CHAN_VAUX14 5'h1E
`define ADC_CHAN_VAUX15 5'h1F

`define ERASABLE_BASE_ADDR 12'o0010
`define FIXED_BASE_ADDR 16'o2000

`define EB 12'o0003
`define FB 12'o0004
`define BB 12'o0006

`define TCF_KEYRUPT1 16'o14024
`define TCF_KEYRUPT2 16'o14030
`define TCF_UPRUPT   16'o14034
`define TCF_DOWNRUPT 16'o14040
`define TCF_HANDRUPT 16'o14050
`define RESUME 16'o150017

`define SQ_RXOR 6'o06
`define SQ_DV 5'o4
`define SQ_IO 3'o0
`define IO_RUPT 3'o7

`define CYR     12'o0020
`define SR      12'o0021
`define CYL     12'o0022
`define EDOP    12'o0023
`define PIPAX   12'o0037
`define PIPAY   12'o0040
`define PIPAZ   12'o0041
`define CDUXCMD 12'o0050
`define CDUYCMD 12'o0051
`define CDUZCMD 12'o0052
`define CDUTCMD 12'o0053
`define CDUSCMD 12'o0054
`define THRUST  12'o0055
`define ALTM    12'o0060
