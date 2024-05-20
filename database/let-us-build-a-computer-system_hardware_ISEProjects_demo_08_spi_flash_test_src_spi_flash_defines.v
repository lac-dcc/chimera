// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`define CMD_WREN          8'h06
`define CMD_WRDI          8'h04
`define CMD_RDID          8'h9f       //EPCS4 EPCS16 is 0'hab st spi flash is 8'h9f
`define CMD_RDSR          8'h05
`define CMD_WRSR          8'h01
`define CMD_READ          8'h03
`define CMD_FAST_READ     8'h0b
`define CMD_PP            8'h02
`define CMD_SE            8'hd8
`define CMD_BE            8'hc7