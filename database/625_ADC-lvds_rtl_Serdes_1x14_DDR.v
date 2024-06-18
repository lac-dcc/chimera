// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  F520
// Engineer: Caojiahui
// 
// Create Date: 2021/01/08 10:55:34
// Design Name: 
// Module Name: Serdes_1x14_DDR
// Project Name: 
// Target Devices: 
// Tool Versions: vivado 2017.4
// Description: 
// 
// Dependencies: 
// 
// Revision: Rev 1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Serdes_1x14_DDR(
    
    input CLK,
    input CLKB,
    input CLKDIV,
    input BITSLIP,
    input D_p,
    input D_n,
    input RST,
    
    output [13:0] Q
    );
    // have been tested on AD9252
    // why CLKB from MMCM do not work, I don't know
    // but simplely invert CLK worked. Just so
    wire clkb = ~CLK;
    wire        SHIFTOUT1;
    wire        SHIFTOUT2;
    // ISERDESE2: Input SERial/DESerializer with Bitslip
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    ISERDESE2 #(
        .DATA_RATE         ("DDR"), // DDR, SDR
        .DATA_WIDTH        (14), // Parallel data width (2-8,10,14)
        .DYN_CLKDIV_INV_EN ("FALSE"), // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
        .DYN_CLK_INV_EN    ("FALSE"), // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
        // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
        .INIT_Q1           (1'b0),
        .INIT_Q2           (1'b0),
        .INIT_Q3           (1'b0),
        .INIT_Q4           (1'b0),
        .INTERFACE_TYPE    ("NETWORKING"), // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
        .IOBDELAY          ("IBUF"), // NONE, BOTH, IBUF, IFD
        .NUM_CE            (2), // Number of clock enables (1,2)
        .OFB_USED          ("FALSE"), // Select OFB path (FALSE, TRUE)
        .SERDES_MODE       ("MASTER"), // MASTER, SLAVE
        // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
        .SRVAL_Q1          (1'b0),
        .SRVAL_Q2          (1'b0),
        .SRVAL_Q3          (1'b0),
        .SRVAL_Q4          (1'b0)
    )
    ISERDESE2_inst_master (
        .O            (    ), // 1-bit output: Combinatorial output
        // Q1 - Q8: 1-bit (each) output: Registered data outputs
        .Q1           (Q[0]),
        .Q2           (Q[1]),
        .Q3           (Q[2]),
        .Q4           (Q[3]),
        .Q5           (Q[4]),
        .Q6           (Q[5]),
        .Q7           (Q[6]),
        .Q8           (Q[7]),
        // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
        .SHIFTOUT1    (SHIFTOUT1),
        .SHIFTOUT2    (SHIFTOUT2),
        .BITSLIP      (BITSLIP), // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
        // CLKDIV when asserted (active High). Subsequently, the data seen on the Q1
        // to Q8 output ports will shift, as in a barrel-shifter operation, one
        // position every time Bitslip is invoked (DDR operation is different from
        // SDR).
        // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
        .CE1          (1'b1),
        .CE2          (1'b1),
        .CLKDIVP      (0  ), // 1-bit input: TBD
        // Clocks: 1-bit (each) input: ISERDESE2 clock input ports
        .CLK          (CLK), // 1-bit input: High-speed clock
        .CLKB         (clkb), // 1-bit input: High-speed secondary clock
        .CLKDIV       (CLKDIV), // 1-bit input: Divided clock
        .OCLK         (0  ), // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
        // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
        .DYNCLKDIVSEL (0  ), // 1-bit input: Dynamic CLKDIV inversion
        .DYNCLKSEL    (0  ), // 1-bit input: Dynamic CLK/CLKB inversion
        // Input Data: 1-bit (each) input: ISERDESE2 data input ports
        .D            (D_p), // 1-bit input: Data input
        .DDLY         (), // 1-bit input: Serial data from IDELAYE2
        .OFB          (), // 1-bit input: Data feedback from OSERDESE2
        .OCLKB        (), // 1-bit input: High speed negative edge output clock
        .RST          (RST), // 1-bit input: Active high asynchronous reset
        // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
        .SHIFTIN1     (SHIFTIN1),
        .SHIFTIN2     (SHIFTIN2)
    );
    
    
    // ISERDESE2: Input SERial/DESerializer with Bitslip
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    ISERDESE2 #(
        .DATA_RATE         ("DDR"), // DDR, SDR
        .DATA_WIDTH        (14), // Parallel data width (2-8,10,14)
        .DYN_CLKDIV_INV_EN ("FALSE"), // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
        .DYN_CLK_INV_EN    ("FALSE"), // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
        // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
        .INIT_Q1           (1'b0),
        .INIT_Q2           (1'b0),
        .INIT_Q3           (1'b0),
        .INIT_Q4           (1'b0),
        .INTERFACE_TYPE    ("NETWORKING"), // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
        .IOBDELAY          ("IBUF"), // NONE, BOTH, IBUF, IFD
        .NUM_CE            (2), // Number of clock enables (1,2)
        .OFB_USED          ("FALSE"), // Select OFB path (FALSE, TRUE)
        .SERDES_MODE       ("SLAVE"), // MASTER, SLAVE
        // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
        .SRVAL_Q1          (1'b0),
        .SRVAL_Q2          (1'b0),
        .SRVAL_Q3          (1'b0),
        .SRVAL_Q4          (1'b0)
    )
    ISERDESE2_inst_slave (
        .O            (     ), // 1-bit output: Combinatorial output
        // Q1 - Q8: 1-bit (each) output: Registered data outputs
        .Q1           (     ),
        .Q2           (     ),
        .Q3           (Q[8] ),
        .Q4           (Q[9] ),
        .Q5           (Q[10]),
        .Q6           (Q[11]),
        .Q7           (Q[12]),
        .Q8           (Q[13]),
        // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
        .SHIFTOUT1    (     ),
        .SHIFTOUT2    (     ),
        .BITSLIP      (BITSLIP), // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
        // CLKDIV when asserted (active High). Subsequently, the data seen on the Q1
        // to Q8 output ports will shift, as in a barrel-shifter operation, one
        // position every time Bitslip is invoked (DDR operation is different from
        // SDR).
        // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
        .CE1          (1'b1),
        .CE2          (1'b1),
        .CLKDIVP      (0  ), // 1-bit input: TBD
        // Clocks: 1-bit (each) input: ISERDESE2 clock input ports
        .CLK          (CLK), // 1-bit input: High-speed clock
        .CLKB         (clkb), // 1-bit input: High-speed secondary clock
        .CLKDIV       (CLKDIV), // 1-bit input: Divided clock
        .OCLK         (0  ), // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
        // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
        .DYNCLKDIVSEL (0  ), // 1-bit input: Dynamic CLKDIV inversion
        .DYNCLKSEL    (0  ), // 1-bit input: Dynamic CLK/CLKB inversion
        // Input Data: 1-bit (each) input: ISERDESE2 data input ports
        .D            (   ), // 1-bit input: Data input
        .DDLY         (   ), // 1-bit input: Serial data from IDELAYE2
        .OFB          (0  ), // 1-bit input: Data feedback from OSERDESE2
        .OCLKB        (0  ), // 1-bit input: High speed negative edge output clock
        .RST          (RST), // 1-bit input: Active high asynchronous reset
        // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
        .SHIFTIN1     (SHIFTOUT1),
        .SHIFTIN2     (SHIFTOUT2)
    );
endmodule
