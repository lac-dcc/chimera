////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2022 Efinix Inc. All rights reserved.              
//
// This   document  contains  proprietary information  which   is        
// protected by  copyright. All rights  are reserved.  This notice       
// refers to original work by Efinix, Inc. which may be derivitive       
// of other work distributed under license of the authors.  In the       
// case of derivative work, nothing in this notice overrides the         
// original author's license agreement.  Where applicable, the           
// original license agreement is included in it's original               
// unmodified form immediately below this header.                        
//                                                                       
// WARRANTY DISCLAIMER.                                                  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND        
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH               
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,  
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF          
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR    
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED       
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.           
//                                                                       
// LIMITATION OF LIABILITY.                                              
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY       
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT    
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY   
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,      
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY    
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF      
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR   
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN    
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER    
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR            
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT   
//     APPLY TO LICENSEE.                                                
//
////////////////////////////////////////////////////////////////////////////////

sapphire0 u_sapphire0(
.io_systemClk ( io_systemClk ),
.jtagCtrl_enable ( jtagCtrl_enable ),
.jtagCtrl_tdi ( jtagCtrl_tdi ),
.jtagCtrl_capture ( jtagCtrl_capture ),
.jtagCtrl_shift ( jtagCtrl_shift ),
.jtagCtrl_update ( jtagCtrl_update ),
.jtagCtrl_reset ( jtagCtrl_reset ),
.jtagCtrl_tdo ( jtagCtrl_tdo ),
.jtagCtrl_tck ( jtagCtrl_tck ),
.system_spi_0_io_data_0_read ( system_spi_0_io_data_0_read ),
.system_spi_0_io_data_0_write ( system_spi_0_io_data_0_write ),
.system_spi_0_io_data_0_writeEnable ( system_spi_0_io_data_0_writeEnable ),
.system_spi_0_io_data_1_read ( system_spi_0_io_data_1_read ),
.system_spi_0_io_data_1_write ( system_spi_0_io_data_1_write ),
.system_spi_0_io_data_1_writeEnable ( system_spi_0_io_data_1_writeEnable ),
.system_spi_0_io_data_2_read ( system_spi_0_io_data_2_read ),
.system_spi_0_io_data_2_write ( system_spi_0_io_data_2_write ),
.system_spi_0_io_data_2_writeEnable ( system_spi_0_io_data_2_writeEnable ),
.system_spi_0_io_data_3_read ( system_spi_0_io_data_3_read ),
.system_spi_0_io_data_3_write ( system_spi_0_io_data_3_write ),
.system_spi_0_io_data_3_writeEnable ( system_spi_0_io_data_3_writeEnable ),
.system_spi_0_io_sclk_write ( system_spi_0_io_sclk_write ),
.system_spi_0_io_ss ( system_spi_0_io_ss ),
.system_spi_1_io_data_0_read ( system_spi_1_io_data_0_read ),
.system_spi_1_io_data_0_write ( system_spi_1_io_data_0_write ),
.system_spi_1_io_data_0_writeEnable ( system_spi_1_io_data_0_writeEnable ),
.system_spi_1_io_data_1_read ( system_spi_1_io_data_1_read ),
.system_spi_1_io_data_1_write ( system_spi_1_io_data_1_write ),
.system_spi_1_io_data_1_writeEnable ( system_spi_1_io_data_1_writeEnable ),
.system_spi_1_io_data_2_read ( system_spi_1_io_data_2_read ),
.system_spi_1_io_data_2_write ( system_spi_1_io_data_2_write ),
.system_spi_1_io_data_2_writeEnable ( system_spi_1_io_data_2_writeEnable ),
.system_spi_1_io_data_3_read ( system_spi_1_io_data_3_read ),
.system_spi_1_io_data_3_write ( system_spi_1_io_data_3_write ),
.system_spi_1_io_data_3_writeEnable ( system_spi_1_io_data_3_writeEnable ),
.system_spi_1_io_sclk_write ( system_spi_1_io_sclk_write ),
.system_spi_1_io_ss ( system_spi_1_io_ss ),
.userInterruptA ( userInterruptA ),
.io_asyncReset ( io_asyncReset ),
.io_systemReset ( io_systemReset ),
.system_uart_0_io_txd ( system_uart_0_io_txd ),
.system_uart_0_io_rxd ( system_uart_0_io_rxd ),
.system_i2c_0_io_scl_read ( system_i2c_0_io_scl_read ),
.system_i2c_0_io_scl_write ( system_i2c_0_io_scl_write ),
.system_i2c_0_io_sda_read ( system_i2c_0_io_sda_read ),
.system_i2c_0_io_sda_write ( system_i2c_0_io_sda_write ),
.system_gpio_0_io_writeEnable ( system_gpio_0_io_writeEnable ),
.system_gpio_0_io_write ( system_gpio_0_io_write ),
.system_gpio_0_io_read ( system_gpio_0_io_read )
);
