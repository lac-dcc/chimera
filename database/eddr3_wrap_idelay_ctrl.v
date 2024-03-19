/*******************************************************************************
 * Module: idelay_ctrl
 * Date:2014-04-25  
 * Author: Andrey Filippov
 * Description: IDELAYCTRL wrapper
 *
 * Copyright (c) 2014 Elphel, Inc.
 * idelay_ctrl.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  idelay_ctrl.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  idelay_ctrl
//SuppressWarnings VEditor - IODELAY_GRP used in (* *) construnt
# ( parameter  IODELAY_GRP  = "IODELAY_MEMORY"
) (
    input refclk,
    input rst,
    output rdy
);

(* IODELAY_GROUP = IODELAY_GRP *)
IDELAYCTRL idelay_ctrl_i(
    .RDY(rdy),
    .REFCLK(refclk),
    .RST(rst));
endmodule

