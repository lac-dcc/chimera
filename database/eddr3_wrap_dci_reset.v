/*******************************************************************************
 * Module: dci_reset
 * Date:2014-06-01  
 * Author: Andrey Filippov
 * Description: DCIRESET primitivbe wrapper
 *
 * Copyright (c) 2014 Elphel, Inc.
 * dci_reset.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dci_reset.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  dci_reset(
    input reset,
    output ready
);
    DCIRESET DCIRESET_i (
        .LOCKED(ready), // output 
        .RST(reset) // input 
    );

endmodule

