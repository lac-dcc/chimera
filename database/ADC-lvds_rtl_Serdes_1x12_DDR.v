`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  F520
// Engineer: Caojiahui
// 
// Create Date: 2021/01/08 10:55:34
// Design Name: 
// Module Name: Serdes_1x12_DDR
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


module Serdes_1x12_DDR(
    
    input CLK,
    input CLKB,
    input CLKDIV,
    input BITSLIP,
    input D_p,
    input D_n,
    input RST,
    
    output [11:0] Q
    );
    // have been tested on AD9252

    // ISERDESE2: Input SERial/DESerializer with Bitslip
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    ISERDESE2 #(
        .DATA_RATE         ("SDR"), // DDR, SDR
        .DATA_WIDTH        (6), // Parallel data width (2-8,10,14)
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
        .SRVAL_Q4          (1'b0),
                
        .IS_CLK_INVERTED   (1'b0),
        .IS_CLKB_INVERTED  (1'b0),
        .IS_D_INVERTED     (1'b0)
    )
    ISERDESE2_inst_master (
        .O            (    ), // 1-bit output: Combinatorial output
        // Q1 - Q8: 1-bit (each) output: Registered data outputs
        .Q1           (Q[0]),
        .Q2           (Q[2]),
        .Q3           (Q[4]),
        .Q4           (Q[6]),
        .Q5           (Q[8]),
        .Q6           (Q[10]),
        .Q7           (),
        .Q8           (),
        // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
        .SHIFTOUT1    (),
        .SHIFTOUT2    (),
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
        .CLKB         (CLKB), // 1-bit input: High-speed secondary clock
        .CLKDIV       (CLKDIV), // 1-bit input: Divided clock
        .OCLK         (0  ), // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
        // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
        .DYNCLKDIVSEL (0  ), // 1-bit input: Dynamic CLKDIV inversion
        .DYNCLKSEL    (0  ), // 1-bit input: Dynamic CLK/CLKB inversion
        // Input Data: 1-bit (each) input: ISERDESE2 data input ports
        .D            (D_p), // 1-bit input: Data input
        .DDLY         (0), // 1-bit input: Serial data from IDELAYE2
        .OFB          (0  ), // 1-bit input: Data feedback from OSERDESE2
        .OCLKB        (0  ), // 1-bit input: High speed negative edge output clock
        .RST          (RST), // 1-bit input: Active high asynchronous reset
        // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
        .SHIFTIN1     (0),
        .SHIFTIN2     (0)
    );
    
    
    // ISERDESE2: Input SERial/DESerializer with Bitslip
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    ISERDESE2 #(
        .DATA_RATE         ("SDR"), // DDR, SDR
        .DATA_WIDTH        (6), // Parallel data width (2-8,10,14)
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
        .SRVAL_Q4          (1'b0),
        
        .IS_CLK_INVERTED   (1'b0),
        .IS_CLKB_INVERTED  (1'b0),
        .IS_D_INVERTED     (1'b1)
    )
    ISERDESE2_inst_slave (
        .O            (     ), // 1-bit output: Combinatorial output
        // Q1 - Q8: 1-bit (each) output: Registered data outputs
        .Q1           (Q[1] ),
        .Q2           (Q[3] ),
        .Q3           (Q[5] ),
        .Q4           (Q[7] ),
        .Q5           (Q[9] ),
        .Q6           (Q[11]),
        .Q7           (),
        .Q8           (),
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
        .CLK          (CLKB), // 1-bit input: High-speed clock
        .CLKB         (CLK), // 1-bit input: High-speed secondary clock
        .CLKDIV       (CLKDIV), // 1-bit input: Divided clock
        .OCLK         (0  ), // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
        // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
        .DYNCLKDIVSEL (0  ), // 1-bit input: Dynamic CLKDIV inversion
        .DYNCLKSEL    (0  ), // 1-bit input: Dynamic CLK/CLKB inversion
        // Input Data: 1-bit (each) input: ISERDESE2 data input ports
        .D            (D_n), // 1-bit input: Data input
        .DDLY         (0), // 1-bit input: Serial data from IDELAYE2
        .OFB          (0  ), // 1-bit input: Data feedback from OSERDESE2
        .OCLKB        (0  ), // 1-bit input: High speed negative edge output clock
        .RST          (RST), // 1-bit input: Active high asynchronous reset
        // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
        .SHIFTIN1     (0),
        .SHIFTIN2     (0)
    );

endmodule
