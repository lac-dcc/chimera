// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the simplifyed IO headerfile definition.
 * 
 * Copyright (C) 2017  Iulian Gheorghiu
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

`timescale 1ns / 1ps

/*
--------------------------------------------------------------------------
TWI - Two-Wire Interface
--------------------------------------------------------------------------
*/

/* TWI - Two-Wire Interface */
`define TWI_CTRL						0

`define TWI_MASTER_CTRLA				1 /* Control Register A */
`define TWI_MASTER_CTRLB				2 /* Control Register B */
`define TWI_MASTER_CTRLC				3 /* Control Register C */
`define TWI_MASTER_STATUS				4 /* Status Register */
`define TWI_MASTER_BAUD					5 /* Baurd Rate Control Register */
`define TWI_MASTER_ADDR					6 /* Address Register */
`define TWI_MASTER_DATA					7 /* Data Register */

`define TWI_SLAVE_CTRLA					8 /* Control Register A */
`define TWI_SLAVE_CTRLB					9 /* Control Register B */
`define TWI_SLAVE_STATUS				10 /* Status Register */
`define TWI_SLAVE_ADDR					11 /* Address Register */
`define TWI_SLAVE_DATA					12 /* Data Register */
`define TWI_SLAVE_ADDRMASK				13 /* Address Mask Register */

`define TOS								14 /* Timeout Status Register */
`define TOCONF							15/* Timeout Configuration Register */


/* TWI - Two-Wire Interface */
/* TWI.CTRL  bit masks and bit positions */
/* SDA Hold Time */
`define TWI_SDAHOLD_OFF_gc				(8'h00<<1)  /* SDA Hold Time off */
`define TWI_SDAHOLD_50NS_gc				(8'h01<<1)  /* SDA Hold Time 50 ns */
`define TWI_SDAHOLD_300NS_gc			(8'h02<<1)  /* SDA Hold Time 300 ns */
`define TWI_SDAHOLD_400NS_gc			(8'h03<<1)  /* SDA Hold Time 400 ns */

/* TWI_MASTER.CTRLA  bit masks and bit positions */
/* Master Interrupt Level */
`define TWI_MASTER_INTLVL_OFF_gc		(8'h00<<6)  /* Interrupt Disabled */
`define TWI_MASTER_INTLVL_LO_gc			(8'h01<<6)  /* Low Level */
`define TWI_MASTER_INTLVL_MED_gc		(8'h02<<6)  /* Medium Level */
`define TWI_MASTER_INTLVL_HI_gc			(8'h03<<6)  /* High Level */

/* TWI_MASTER.CTRLB  bit masks and bit positions */
/* Inactive Timeout */
`define TWI_MASTER_TIMEOUT_DISABLED_gc	(8'h00<<2)  /* Bus Timeout Disabled */
`define TWI_MASTER_TIMEOUT_50US_gc		(8'h01<<2)  /* 50 Microseconds */
`define TWI_MASTER_TIMEOUT_100US_gc		(8'h02<<2)  /* 100 Microseconds */
`define TWI_MASTER_TIMEOUT_200US_gc		(8'h03<<2)  /* 200 Microseconds */

/* TWI_MASTER.CTRLC  bit masks and bit positions */
/* Master Command */
`define TWI_MASTER_CMD_NOACT_gc			(8'h00<<0)  /* No Action */
`define TWI_MASTER_CMD_REPSTART_gc		(8'h01<<0)  /* Issue Repeated Start Condition */
`define TWI_MASTER_CMD_RECVTRANS_gc		(8'h02<<0)  /* Receive or Transmit Data */
`define TWI_MASTER_CMD_STOP_gc			(8'h03<<0)  /* Issue Stop Condition */

/* TWI_MASTER.STATUS  bit masks and bit positions */
/* Master Bus State */
`define TWI_MASTER_BUSSTATE_UNKNOWN_gc	(8'h00<<0)  /* Unknown Bus State */
`define TWI_MASTER_BUSSTATE_IDLE_gc		(8'h01<<0)  /* Bus is Idle */
`define TWI_MASTER_BUSSTATE_OWNER_gc	(8'h02<<0)  /* This Module Controls The Bus */
`define TWI_MASTER_BUSSTATE_BUSY_gc		(8'h03<<0)  /* The Bus is Busy */

/* TWI_SLAVE.CTRLA  bit masks and bit positions */
/* Slave Interrupt Level */
`define TWI_SLAVE_INTLVL_OFF_gc			(8'h00<<6)  /* Interrupt Disabled */
`define TWI_SLAVE_INTLVL_LO_gc			(8'h01<<6)  /* Low Level */
`define TWI_SLAVE_INTLVL_MED_gc			(8'h02<<6)  /* Medium Level */
`define TWI_SLAVE_INTLVL_HI_gc			(8'h03<<6)  /* High Level */

/* TWI_SLAVE.CTRLB  bit masks and bit positions */
/* Slave Command */
`define TWI_SLAVE_CMD_NOACT_gc			(8'h00<<0)  /* No Action */
`define TWI_SLAVE_CMD_COMPTRANS_gc		(8'h02<<0)  /* Used To Complete a Transaction */
`define TWI_SLAVE_CMD_RESPONSE_gc		(8'h03<<0)  /* Used in Response to Address/Data Interrupt */


/* TWI_MASTER.CTRLA  bit masks and bit positions */
`define TWI_MASTER_INTLVL_gm			8'hC0  /* Interrupt Level group mask. */
`define TWI_MASTER_INTLVL_gp			6  /* Interrupt Level group position. */
`define TWI_MASTER_INTLVL0_bm			(1<<6)  /* Interrupt Level bit 0 mask. */
`define TWI_MASTER_INTLVL0_bpv6  /* Interrupt Level bit 0 position. */
`define TWI_MASTER_INTLVL1_bm			(1<<7)  /* Interrupt Level bit 1 mask. */
`define TWI_MASTER_INTLVL1_bp			7  /* Interrupt Level bit 1 position. */

`define TWI_MASTER_RIEN_bm				8'h20  /* Read Interrupt Enable bit mask. */
`define TWI_MASTER_RIEN_bp				5  /* Read Interrupt Enable bit position. */

`define TWI_MASTER_WIEN_bm				8'h10  /* Write Interrupt Enable bit mask. */
`define TWI_MASTER_WIEN_bp				4  /* Write Interrupt Enable bit position. */

`define TWI_MASTER_ENABLE_bm			8'h08  /* Enable TWI Master bit mask. */
`define TWI_MASTER_ENABLE_bp			3  /* Enable TWI Master bit position. */

/* TWI_MASTER.CTRLB  bit masks and bit positions */
`define TWI_MASTER_TIMEOUT_gm			8'h0C  /* Inactive Bus Timeout group mask. */
`define TWI_MASTER_TIMEOUT_gp			2  /* Inactive Bus Timeout group position. */
`define TWI_MASTER_TIMEOUT0_bm			(1<<2)  /* Inactive Bus Timeout bit 0 mask. */
`define TWI_MASTER_TIMEOUT0_bp			2  /* Inactive Bus Timeout bit 0 position. */
`define TWI_MASTER_TIMEOUT1_bm			(1<<3)  /* Inactive Bus Timeout bit 1 mask. */
`define TWI_MASTER_TIMEOUT1_bp			3  /* Inactive Bus Timeout bit 1 position. */

`define TWI_MASTER_QCEN_bm				8'h02  /* Quick Command Enable bit mask. */
`define TWI_MASTER_QCEN_bp				1  /* Quick Command Enable bit position. */

`define TWI_MASTER_SMEN_bm				8'h01  /* Smart Mode Enable bit mask. */
`define TWI_MASTER_SMEN_bp				0  /* Smart Mode Enable bit position. */

/* TWI_MASTER.CTRLC  bit masks and bit positions */
`define TWI_MASTER_ACKACT_bm			8'h04  /* Acknowledge Action bit mask. */
`define TWI_MASTER_ACKACT_bp			2  /* Acknowledge Action bit position. */

`define TWI_MASTER_CMD_gm				8'h03  /* Command group mask. */
`define TWI_MASTER_CMD_gp				0  /* Command group position. */
`define TWI_MASTER_CMD0_bm				(1<<0)  /* Command bit 0 mask. */
`define TWI_MASTER_CMD0_bp				0  /* Command bit 0 position. */
`define TWI_MASTER_CMD1_bm				(1<<1)  /* Command bit 1 mask. */
`define TWI_MASTER_CMD1_bp				1  /* Command bit 1 position. */

/* TWI_MASTER.STATUS  bit masks and bit positions */
`define TWI_MASTER_RIF_bm				8'h80  /* Read Interrupt Flag bit mask. */
`define TWI_MASTER_RIF_bp				7  /* Read Interrupt Flag bit position. */

`define TWI_MASTER_WIF_bm				8'h40  /* Write Interrupt Flag bit mask. */
`define TWI_MASTER_WIF_bp				6  /* Write Interrupt Flag bit position. */

`define TWI_MASTER_CLKHOLD_bm			8'h20  /* Clock Hold bit mask. */
`define TWI_MASTER_CLKHOLD_bp			5  /* Clock Hold bit position. */

`define TWI_MASTER_RXACK_bm				8'h10  /* Received Acknowledge bit mask. */
`define TWI_MASTER_RXACK_bp				4  /* Received Acknowledge bit position. */

`define TWI_MASTER_ARBLOST_bm			8'h08  /* Arbitration Lost bit mask. */
`define TWI_MASTER_ARBLOST_bp			3  /* Arbitration Lost bit position. */

`define TWI_MASTER_BUSERR_bm			8'h04  /* Bus Error bit mask. */
`define TWI_MASTER_BUSERR_bp			2  /* Bus Error bit position. */

`define TWI_MASTER_BUSSTATE_gm			8'h03  /* Bus State group mask. */
`define TWI_MASTER_BUSSTATE_gp			0  /* Bus State group position. */
`define TWI_MASTER_BUSSTATE0_bm			(1<<0)  /* Bus State bit 0 mask. */
`define TWI_MASTER_BUSSTATE0_bp			0  /* Bus State bit 0 position. */
`define TWI_MASTER_BUSSTATE1_bm			(1<<1)  /* Bus State bit 1 mask. */
`define TWI_MASTER_BUSSTATE1_bp			1  /* Bus State bit 1 position. */

/* TWI_SLAVE.CTRLA  bit masks and bit positions */
`define TWI_SLAVE_INTLVL_gm				8'hC0  /* Interrupt Level group mask. */
`define TWI_SLAVE_INTLVL_gp				6  /* Interrupt Level group position. */
`define TWI_SLAVE_INTLVL0_bm			(1<<6)  /* Interrupt Level bit 0 mask. */
`define TWI_SLAVE_INTLVL0_bp			6  /* Interrupt Level bit 0 position. */
`define TWI_SLAVE_INTLVL1_bm			(1<<7)  /* Interrupt Level bit 1 mask. */
`define TWI_SLAVE_INTLVL1_bp			7  /* Interrupt Level bit 1 position. */

`define TWI_SLAVE_DIEN_bm				8'h20  /* Data Interrupt Enable bit mask. */
`define TWI_SLAVE_DIEN_bp				5  /* Data Interrupt Enable bit position. */

`define TWI_SLAVE_APIEN_bm				8'h10  /* Address/Stop Interrupt Enable bit mask. */
`define TWI_SLAVE_APIEN_bp				4  /* Address/Stop Interrupt Enable bit position. */

`define TWI_SLAVE_ENABLE_bm				8'h08  /* Enable TWI Slave bit mask. */
`define TWI_SLAVE_ENABLE_bp				3  /* Enable TWI Slave bit position. */

`define TWI_SLAVE_PIEN_bm				8'h04  /* Stop Interrupt Enable bit mask. */
`define TWI_SLAVE_PIEN_bp				2  /* Stop Interrupt Enable bit position. */

`define TWI_SLAVE_PMEN_bm				8'h02  /* Promiscuous Mode Enable bit mask. */
`define TWI_SLAVE_PMEN_bp				1  /* Promiscuous Mode Enable bit position. */

`define TWI_SLAVE_SMEN_bm				8'h01  /* Smart Mode Enable bit mask. */
`define TWI_SLAVE_SMEN_bp				0  /* Smart Mode Enable bit position. */

/* TWI_SLAVE.CTRLB  bit masks and bit positions */
`define TWI_SLAVE_ACKACT_bm				8'h04  /* Acknowledge Action bit mask. */
`define TWI_SLAVE_ACKACT_bp				2  /* Acknowledge Action bit position. */

`define TWI_SLAVE_CMD_gm				8'h03  /* Command group mask. */
`define TWI_SLAVE_CMD_gp				0  /* Command group position. */
`define TWI_SLAVE_CMD0_bm				(1<<0)  /* Command bit 0 mask. */
`define TWI_SLAVE_CMD0_bp				0  /* Command bit 0 position. */
`define TWI_SLAVE_CMD1_bm				(1<<1)  /* Command bit 1 mask. */
`define TWI_SLAVE_CMD1_bp				1  /* Command bit 1 position. */

/* TWI_SLAVE.STATUS  bit masks and bit positions */
`define TWI_SLAVE_DIF_bm				8'h80  /* Data Interrupt Flag bit mask. */
`define TWI_SLAVE_DIF_bp				7  /* Data Interrupt Flag bit position. */

`define TWI_SLAVE_APIF_bm				8'h40  /* Address/Stop Interrupt Flag bit mask. */
`define TWI_SLAVE_APIF_bp				6  /* Address/Stop Interrupt Flag bit position. */

`define TWI_SLAVE_CLKHOLD_bm			8'h20  /* Clock Hold bit mask. */
`define TWI_SLAVE_CLKHOLD_bp			5  /* Clock Hold bit position. */

`define TWI_SLAVE_RXACK_bm				8'h10  /* Received Acknowledge bit mask. */
`define TWI_SLAVE_RXACK_bp				4  /* Received Acknowledge bit position. */

`define TWI_SLAVE_COLL_bm				8'h08  /* Collision bit mask. */
`define TWI_SLAVE_COLL_bp				3  /* Collision bit position. */

`define TWI_SLAVE_BUSERR_bm				8'h04  /* Bus Error bit mask. */
`define TWI_SLAVE_BUSERR_bp				2  /* Bus Error bit position. */

`define TWI_SLAVE_DIR_bm				8'h02  /* Read/Write Direction bit mask. */
`define TWI_SLAVE_DIR_bp				1  /* Read/Write Direction bit position. */

`define TWI_SLAVE_AP_bm					8'h01  /* Slave Address or Stop bit mask. */
`define TWI_SLAVE_AP_bp					0  /* Slave Address or Stop bit position. */

/* TWI_SLAVE.ADDRMASK  bit masks and bit positions */
`define TWI_SLAVE_ADDRMASK_gm			8'hFE  /* Address Mask group mask. */
`define TWI_SLAVE_ADDRMASK_gp			1  /* Address Mask group position. */
`define TWI_SLAVE_ADDRMASK0_bm			(1<<1)  /* Address Mask bit 0 mask. */
`define TWI_SLAVE_ADDRMASK0_bp			1  /* Address Mask bit 0 position. */
`define TWI_SLAVE_ADDRMASK1_bm			(1<<2)  /* Address Mask bit 1 mask. */
`define TWI_SLAVE_ADDRMASK1_bp			2  /* Address Mask bit 1 position. */
`define TWI_SLAVE_ADDRMASK2_bm			(1<<3)  /* Address Mask bit 2 mask. */
`define TWI_SLAVE_ADDRMASK2_bp			3  /* Address Mask bit 2 position. */
`define TWI_SLAVE_ADDRMASK3_bm			(1<<4)  /* Address Mask bit 3 mask. */
`define TWI_SLAVE_ADDRMASK3_bp			4  /* Address Mask bit 3 position. */
`define TWI_SLAVE_ADDRMASK4_bm			(1<<5)  /* Address Mask bit 4 mask. */
`define TWI_SLAVE_ADDRMASK4_bp			5  /* Address Mask bit 4 position. */
`define TWI_SLAVE_ADDRMASK5_bm			(1<<6)  /* Address Mask bit 5 mask. */
`define TWI_SLAVE_ADDRMASK5_bp			6  /* Address Mask bit 5 position. */
`define TWI_SLAVE_ADDRMASK6_bm			(1<<7)  /* Address Mask bit 6 mask. */
`define TWI_SLAVE_ADDRMASK6_bp			7  /* Address Mask bit 6 position. */

`define TWI_SLAVE_ADDREN_bm				8'h01  /* Address Enable bit mask. */
`define TWI_SLAVE_ADDREN_bp				0  /* Address Enable bit position. */

/* TWI.CTRL  bit masks and bit positions */
`define TWI_SDAHOLD_gm					8'h06  /* SDA Hold Time Enable group mask. */
`define TWI_SDAHOLD_gp					1  /* SDA Hold Time Enable group position. */
`define TWI_SDAHOLD0_bm					(1<<1)  /* SDA Hold Time Enable bit 0 mask. */
`define TWI_SDAHOLD0_bp					1  /* SDA Hold Time Enable bit 0 position. */
`define TWI_SDAHOLD1_bm					(1<<2)  /* SDA Hold Time Enable bit 1 mask. */
`define TWI_SDAHOLD1_bp					2  /* SDA Hold Time Enable bit 1 position. */

`define TWI_EDIEN_bm					8'h01  /* External Driver Interface Enable bit mask. */
`define TWI_EDIEN_bp					0  /* External Driver Interface Enable bit position. */

