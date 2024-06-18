// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** IO/UART                                                               **
** UART & IOR REG                                                        **
** SHEET 42 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module IO_UART_42(

   // Input signals
   input       CEUART_n,
   input       CLK,
   input       CONSOLE_n,
   input       EAUTO_n,
   input       EIOR_n,
   
   input       LCS_n,
   input       LOCK_n,
   input [1:0] MIS_1_0,
   input       PPOSC,
   input       RUART_n,

   input       XTR,

   // RS232 RX/TX signals
   input       RXD,
   output      TXD,          

   // Current loop signals
   input       I1P,
   output      O1P,
   output      O2P,

   // Baud rate settings
   input [4:0] BAUD_RATE_SWITCH,

   // Output and Input signals
   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,

   // Output signals
   output        DA_n,
   output        TBMT_n
   
);

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0]  s_logisimBus11;
   wire [7:0]  s_idb_15_0_in;
   wire [1:0]  s_mis_1_0;
   
   wire [15:0] s_io_idb_15_0_out;
   wire [15:0] s_uart_idb_15_0_out;



   wire        s_i1p;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet12;
   wire        s_ceuart_n;
   wire        s_xtr;
   wire        s_console_n;
   wire        s_logisimNet16;
   wire        s_rx;
   wire        s_lcs;
   wire        s_tbmt_n;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_ruart_n;
   wire        s_pposc;
   wire        s_logisimNet3;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_eiorn_n;
   wire        s_clk;
   wire        s_eauto_n;
   wire        s_lcs_n;
   wire        s_da_n;
   wire        s_rxd;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_txd;
   wire        s_gnd;
   wire        s_lock_n;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_mis_1_0[1:0]   = MIS_1_0;
   assign s_i1p            = I1P;
   assign s_lock_n         = LOCK_n;
   assign s_ceuart_n       = CEUART_n;
   assign s_xtr            = XTR;
   assign s_console_n      = CONSOLE_n;
   assign s_ruart_n        = RUART_n;
   assign s_pposc          = PPOSC;
   assign s_eiorn_n        = EIOR_n;
   assign s_clk            = CLK;
   assign s_eauto_n        = EAUTO_n;
   assign s_lcs_n          = LCS_n;
   assign s_rxd            = RXD;
   assign s_idb_15_0_in    = IDB_15_0_IN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DA_n          = s_da_n;
   assign IDB_15_0_OUT  = s_io_idb_15_0_out[15:0] | s_uart_idb_15_0_out[15:0];
   
   assign TXD           = s_txd;
   assign O1P           = s_txd;
   assign O2P           = s_txd;

   assign TBMT_n        = s_tbmt_n;
   

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/   
   assign s_gnd         = 1'b0;
   assign s_rx          = s_i1p | s_rxd;

  
   AM29C821   CHIP_33G (.CK(s_clk),
                        .OE_n(s_eiorn_n),
                        .D({s_tbmt_n, s_da_n, s_eauto_n, s_lock_n, s_console_n, BAUD_RATE_SWITCH[4:0]}),
                        .Y({s_io_idb_15_0_out[15:11], s_io_idb_15_0_out[4:0]})
                        );

   SC2661_UART   CHIP_32H (.ADDRESS(s_mis_1_0[1:0]),                           

                           .BRCLK(s_pposc),                        
                           .RESET(!s_lcs_n),

                           .CE_n(s_ceuart_n),
                           .READ_n(s_ruart_n),

                           
                           .CTS_n(s_gnd), // always low
                           .DCD_n(s_gnd), // always low
                           .DSR_n(s_gnd), // always low

                           .DTR_n(), // not connected
                           .RTS_n(), // not connected

                           .D(s_idb_15_0_in[7:0]),
                           .D_OUT(s_io_idb_15_0_out[7:0]),
                           
                           .RXC_n(s_xtr),
                           .RXD(s_rx),
                           .RXDRDY_n(s_da_n),

                           .TXC_n(s_xtr),
                           .TXD(s_txd),
                           .TXDRDY_n(s_tbmt_n),

                           .TXEMT_n()
                           );

endmodule

