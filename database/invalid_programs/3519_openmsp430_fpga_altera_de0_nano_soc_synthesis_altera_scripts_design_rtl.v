// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2001 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: openMSP430_fpga_top.v
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev: 23 $
// $LastChangedBy: olivier.girard $
// $LastChangedDate: 2009-08-30 18:39:26 +0200 (Sun, 30 Aug 2009) $
//----------------------------------------------------------------------------

//=============================================================================
// FPGA Specific modules
//=============================================================================

`include "../../../rtl/verilog/openMSP430_fpga.v"
`include "../../../rtl/verilog/omsp_de0_nano_soc_led_key_sw.v"
`include "../../../rtl/verilog/sync_debouncer_10ms.v"
`include "../../../rtl/verilog/mega/ram_16x75k.v"
`include "../../../rtl/verilog/mega/ram_16x512.v"
`include "../../../rtl/verilog/mega/ram_16x16k.v"
`include "../../../rtl/verilog/mega/ram_16x8k.v"
`include "../../../rtl/verilog/mega/io_buf.v"
`include "../../../rtl/verilog/mega/in_buf.v"

//=============================================================================
// openMSP430
//=============================================================================

`include "../../../rtl/verilog/openmsp430/openMSP430.v"
`include "../../../rtl/verilog/openmsp430/omsp_frontend.v"
`include "../../../rtl/verilog/openmsp430/omsp_execution_unit.v"
`include "../../../rtl/verilog/openmsp430/omsp_register_file.v"
`include "../../../rtl/verilog/openmsp430/omsp_alu.v"
`include "../../../rtl/verilog/openmsp430/omsp_sfr.v"
`include "../../../rtl/verilog/openmsp430/omsp_mem_backbone.v"
`include "../../../rtl/verilog/openmsp430/omsp_clock_module.v"
`include "../../../rtl/verilog/openmsp430/omsp_dbg.v"
`include "../../../rtl/verilog/openmsp430/omsp_dbg_hwbrk.v"
`include "../../../rtl/verilog/openmsp430/omsp_dbg_uart.v"
`include "../../../rtl/verilog/openmsp430/omsp_dbg_i2c.v"
`include "../../../rtl/verilog/openmsp430/omsp_watchdog.v"
`include "../../../rtl/verilog/openmsp430/omsp_multiplier.v"
`include "../../../rtl/verilog/openmsp430/omsp_sync_reset.v"
`include "../../../rtl/verilog/openmsp430/omsp_sync_cell.v"
`include "../../../rtl/verilog/openmsp430/omsp_scan_mux.v"
`include "../../../rtl/verilog/openmsp430/omsp_and_gate.v"
`include "../../../rtl/verilog/openmsp430/omsp_wakeup_cell.v"
`include "../../../rtl/verilog/openmsp430/omsp_clock_gate.v"
`include "../../../rtl/verilog/openmsp430/omsp_clock_mux.v"

`include "../../../rtl/verilog/openmsp430/periph/omsp_timerA.v"

//=============================================================================
// openMSP430
//=============================================================================

`include "../../../rtl/verilog/opengfx430/openGFX430.v"
`include "../../../rtl/verilog/opengfx430/ogfx_reg.v"
`include "../../../rtl/verilog/opengfx430/ogfx_reg_fifo.v"
`include "../../../rtl/verilog/opengfx430/ogfx_reg_vram_if.v"
`include "../../../rtl/verilog/opengfx430/ogfx_reg_vram_addr.v"
`include "../../../rtl/verilog/opengfx430/ogfx_if_lt24.v"
`include "../../../rtl/verilog/opengfx430/ogfx_backend.v"
`include "../../../rtl/verilog/opengfx430/ogfx_backend_frame_fifo.v"
`include "../../../rtl/verilog/opengfx430/ogfx_backend_lut_fifo.v"
`include "../../../rtl/verilog/opengfx430/ogfx_gpu.v"
`include "../../../rtl/verilog/opengfx430/ogfx_gpu_reg.v"
`include "../../../rtl/verilog/opengfx430/ogfx_gpu_dma.v"
`include "../../../rtl/verilog/opengfx430/ogfx_gpu_dma_addr.v"
`include "../../../rtl/verilog/opengfx430/ogfx_ram_arbiter.v"
