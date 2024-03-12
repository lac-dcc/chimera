/*===========================================================================*/
/* Copyright (C) 2001 Authors                                                */
/*                                                                           */
/* This source file may be used and distributed without restriction provided */
/* that this copyright statement is not removed from the file and that any   */
/* derivative work contains the original copyright notice and the associated */
/* disclaimer.                                                               */
/*                                                                           */
/* This source file is free software; you can redistribute it and/or modify  */
/* it under the terms of the GNU Lesser General Public License as published  */
/* by the Free Software Foundation; either version 2.1 of the License, or    */
/* (at your option) any later version.                                       */
/*                                                                           */
/* This source is distributed in the hope that it will be useful, but WITHOUT*/
/* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or     */
/* FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public       */
/* License for more details.                                                 */
/*                                                                           */
/* You should have received a copy of the GNU Lesser General Public License  */
/* along with this source; if not, write to the Free Software Foundation,    */
/* Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA        */
/*                                                                           */
/*===========================================================================*/
/*                               CLOCK MODULE                                */
/*---------------------------------------------------------------------------*/
/* Sandbox test                                                              */
/*                                                                           */
/* Author(s):                                                                */
/*             - Olivier Girard,    olgirard@gmail.com                       */
/*                                                                           */
/*---------------------------------------------------------------------------*/
/* $Rev: 19 $                                                                */
/* $LastChangedBy: olivier.girard $                                          */
/* $LastChangedDate: 2009-08-04 23:47:15 +0200 (Tue, 04 Aug 2009) $          */
/*===========================================================================*/

`define LONG_TIMEOUT

integer wait_wr;
integer wait_rd;

initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");

      repeat(5) @(posedge mclk);

      stimulus_done = 0;

      wait_wr       = 0;
      wait_rd       = 0;

      repeat(50) @(posedge mclk);
if (0)
  begin
      dma_write_16b(16'hF900, 16'h1234);
      repeat(wait_wr) @(posedge mclk);
      dma_write_16b(16'hF902, 16'h5678);
      repeat(wait_wr) @(posedge mclk);
      dma_write_16b(16'hF904, 16'h9ABC);
      repeat(wait_wr) @(posedge mclk);
      dma_write_16b(16'hF906, 16'hDEF0);

      repeat(10) @(posedge mclk);

      dma_read_16b(16'hF900, 16'h1234);
      repeat(wait_rd) @(posedge mclk);
      dma_read_16b(16'hF902, 16'h5678);
      repeat(wait_rd) @(posedge mclk);
      dma_read_16b(16'hF904, 16'h9ABC);
      repeat(wait_rd) @(posedge mclk);
      dma_read_16b(16'hF906, 16'hDEF0);
  end

      repeat(50) @(posedge mclk);

      stimulus_done = 1;
   end
