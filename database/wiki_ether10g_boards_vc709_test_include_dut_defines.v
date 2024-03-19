/*******************************************************************************
** © Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
** This file contains confidential and proprietary information of Xilinx, Inc. and 
** is protected under U.S. and international copyright and other intellectual property laws.
*******************************************************************************
**   ____  ____ 
**  /   /\/   / 
** /___/  \  /   Vendor: Xilinx 
** \   \   \/    
**  \   \        
**  /   /          
** /___/   /\     
** \   \  /  \   Virtex-6 PCIe-10GDMA-DDR3-XAUI Targeted Reference Design
**  \___\/\___\ 
** 
**  Device: xc6vlx240t
**  Version: 1.2
**  Reference: UG372
**     
*******************************************************************************
**
**  Disclaimer: 
**
**    This disclaimer is not a license and does not grant any rights to the materials 
**              distributed herewith. Except as otherwise provided in a valid license issued to you 
**              by Xilinx, and to the maximum extent permitted by applicable law: 
**              (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, 
**              AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
**              INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
**              FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract 
**              or tort, including negligence, or under any other theory of liability) for any loss or damage 
**              of any kind or nature related to, arising under or in connection with these materials, 
**              including for any direct, or any indirect, special, incidental, or consequential loss 
**              or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered 
**              as a result of any action brought by a third party) even if such damage or loss was 
**              reasonably foreseeable or Xilinx had been advised of the possibility of the same.


**  Critical Applications:
**
**    Xilinx products are not designed or intended to be fail-safe, or for use in any application 
**    requiring fail-safe performance, such as life-support or safety devices or systems, 
**    Class III medical devices, nuclear facilities, applications related to the deployment of airbags,
**    or any other applications that could lead to death, personal injury, or severe property or 
**    environmental damage (individually and collectively, "Critical Applications"). Customer assumes 
**    the sole risk and liability of any use of Xilinx products in Critical Applications, subject only 
**    to applicable laws and regulations governing limitations on product liability.

**  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.

*******************************************************************************/
// This file defines the parameters for DUT.
// Change to these parameters impacts the testbench behavior hence avoid
// changing them if you are unsure of its implications.
//-------------------------------------------------------------------------

 
 // CH0_C2S_BD_COUNT defines the number of descriptors set up in C2S
 // direction for APP-0. It has an upper bound of 25.
 `define CH0_C2S_BD_COUNT 5'd10    
 
 // CH1_C2S_BD_COUNT defines the number of descriptors set up in C2S
 // direction for APP-1. It has an upper bound of 25.
 `define  CH1_C2S_BD_COUNT 5'd10  
 
 `define  CH2_C2S_BD_COUNT 5'd10  
 `define  CH3_C2S_BD_COUNT 5'd10  

  // Span count is applicable only when packet_spanning test is selected
  // This defines the number of descriptor over which a packet spans
 `define SPAN_COUNT 4'h2          

 // Descriptor base-limits
 `define TXDESC0_BASE 32'h0000_0020  //address of first descriptor in the descriptor chain for channel 0 in S2C direction
 `define TXDESC0_LIMIT 32'h0000_01FF

 `define TXDESC1_BASE 32'h0000_0200  //address of first descriptor in the descriptor chain for channel 1 in S2C direction.
 `define TXDESC1_LIMIT 32'h0000_03FF 

 `define TXDESC2_BASE 32'h0000_0400  //address of first descriptor in the descriptor chain for channel 1 in S2C direction.
 `define TXDESC2_LIMIT 32'h0000_05FF 

 `define TXDESC3_BASE 32'h0000_0600  //address of first descriptor in the descriptor chain for channel 1 in S2C direction.
 `define TXDESC3_LIMIT 32'h0000_07FF 
  

`define RXDESC0_BASE 32'h0000_0800  //address of first descriptor in the descriptor chain for channel 0 in C2S direction. 
 `define RXDESC0_LIMIT 32'h0000_09FF 

`define RXDESC1_BASE 32'h0000_0A00  //address of first descriptor in the descriptor chain for channel 1 in C2S direction.
 `define RXDESC1_LIMIT 32'h0000_0BFF 

`define RXDESC2_BASE 32'h0000_0C00  //address of first descriptor in the descriptor chain for channel 1 in C2S direction.
 `define RXDESC2_LIMIT 32'h0000_0DFF 

`define RXDESC3_BASE 32'h0000_0E00  //address of first descriptor in the descriptor chain for channel 1 in C2S direction.
 `define RXDESC3_LIMIT 32'h0000_0FFF 

// Buffer base-limits
 `define TXBUF0_BASE  32'h0001_0000
 `define TXBUF0_LIMIT 32'h0001_FFFF
 `define TXBUF1_BASE  32'h0002_0000
 `define TXBUF1_LIMIT 32'h0002_FFFF
 `define TXBUF2_BASE  32'h0003_0000
 `define TXBUF2_LIMIT 32'h0003_FFFF
 `define TXBUF3_BASE  32'h0004_0000
 `define TXBUF3_LIMIT 32'h0004_FFFF
 `define RXBUF0_BASE  32'h0005_0000
 `define RXBUF0_LIMIT 32'h0005_FFFF
 `define RXBUF1_BASE  32'h0006_0000
 `define RXBUF1_LIMIT 32'h0006_FFFF
 `define RXBUF2_BASE  32'h0007_0000
 `define RXBUF2_LIMIT 32'h0007_FFFF
 `define RXBUF3_BASE  32'h0008_0000
 `define RXBUF3_LIMIT 32'h0008_FFFF
 
 // Base addresses for channel in both directions
 `define CH0_S2C_REG_BASE 32'h0000_0000
 `define CH1_S2C_REG_BASE 32'h0000_0100
 `define CH2_S2C_REG_BASE 32'h0000_0200
 `define CH3_S2C_REG_BASE 32'h0000_0300
 `define CH0_C2S_REG_BASE 32'h0000_2000
 `define CH1_C2S_REG_BASE 32'h0000_2100
 `define CH2_C2S_REG_BASE 32'h0000_2200
 `define CH3_C2S_REG_BASE 32'h0000_2300

// Maximum BD supported
 `define MAX_BD 'd10
 
 // Read completion boundary for root port
 `define RP_RCB 'd64 
 
 // max payload for channels 
 `define MAX_BUFFER_LENGTH_CHNL0 'd512
 //`define MAX_BUFFER_LENGTH_CHNL0 'd1500
 // This has to be a multiple of 128 bytes (DUT_MPS)
 `define MAX_BUFFER_LENGTH_CHNL1 'd256
 `define MAX_BUFFER_LENGTH_CHNL2 'd512  //'d128
 `define MAX_BUFFER_LENGTH_CHNL3 'd256  //64

 `define MAX_ETH_SIZE 'd1024

 // max payload size in bytes
 `define DUT_MPS 12'd128
 `define DUT_MRRS 12'd128
 
 // DMA offset address maped to BAR0
 `define DMA_OFFSET_ADRS 32'hff00_0000
 
 // DMA Engine Control
 `define DMA_ENGN_CTRL 32'h0000_0004

 `define DMA_REG_NEXT_DESC_PTR 32'h0000_0008 
 `define DMA_CNTRL_REG 32'h0000_0004
 `define DMA_REG_SW_DESC_PTR 32'h0000_000C
 `define DMA_REG_CMPLT_DESC_PTR 32'h0000_0010


 // MSI related definitions
 // address reserved for MSI
 `define MSI_MAR_LOW_ADRS 32'h000F_FFF0
 //-- Data in MSI packet
 `define MSI_MDR_DATA 32'h0000_DEAD

 // DMA common register block
 `define DMA_COMMON_REG_BASE 32'h0000_4000
 `define DMA_COMMON_CNTRL_STS_OFFSET 0

 // -- BAR
 `define DUT_BADDR_LOWER 32'hff00_0000
 `define BFM_BADDR_LOWER 32'h0000_0000

 `define DUT_BAR2_LOWER 32'hfa00_0000
 `define DUT_BAR2_UPPER 32'h0000_0000  

  // XGMAC register offset definitions
 `define XGEMAC_RCW0      32'h00000400
 `define XGEMAC_RCW1      32'h00000404
 `define XGEMAC_TC        32'h00000408
 `define XGEMAC_FC        32'h0000040C
 `define XGEMAC_VER       32'h000004F8
 `define XGEMAC_MDIO      32'h00000500

 // Register Address corresponding to Channel 0
 `define PKT_LEN0                    32'h9104
 `define RAWDATA_ENABLE_GEN0         32'h9100
 `define RAWDATA_ENABLE_LB_OR_CHEC0  32'h9108
 `define RAWDATA_CHK0_STATUS         32'h910C 

 // Register Address corresponding to Channel 1
 `define PKT_LEN1                    32'h9204
 `define RAWDATA_ENABLE_GEN1         32'h9200
 `define RAWDATA_ENABLE_LB_OR_CHEC1  32'h9208
 `define RAWDATA_CHK1_STATUS         32'h920C 

 `define ENABLE_CHECKER             32'h0001
 `define ENABLE_LOOPBACK            32'h0002
 `define ENABLE_GENERATOR           32'h0001
 `define ENABLE_CHEC_GEN            32'h0005
 `define DISABLE_GENERATOR          32'h0000
 
