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
// This file contains the user defined macros for DUT that user can change
//-------------------------------------------------------------------------

  /* ------------------------------------ */
  /*  USER CONTROLLED PARAMETERS/MACROS   */
  /* ------------------------------------ */
  
 // Enable DMA channels connected to APP-0 and APP-1 which is the network path
 `define CH0                      
 `define CH1                    
 `define CH2                    
 `define CH3                    
  
 // CH0_S2C_BD_COUNT defines the number of descriptors set up in S2C
 // direction for APP-0. It has an upper bound of 25.
 `define CH0_S2C_BD_COUNT 2 

 // CH1_S2C_BD_COUNT defines the number of descriptors set up in S2C
 // direction for APP-1. It has an upper bound of 25.
 `define CH1_S2C_BD_COUNT 2 
 
 `define CH2_S2C_BD_COUNT 2 
 `define CH3_S2C_BD_COUNT 2 
 
 // option to enable Legacy interrupts
  // `define LEGACY_INTR              
   
 // enable get a detailed log of PCIe transactions
 // `define DETAILED_LOG           
