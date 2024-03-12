/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// ClockInvToBool.v
// Copyright (c) 2010 Atomic Rules LLC, ALL RIGHTS RESERVED
// 2010-02-05 ssiegel Creation
// 2010-02-06 ssiegel Flop added
//
module ClockInvToBool(
  input  CLK_SLOW,
  input  CLK_FAST,
  output CLK_VAL);

FDRSE#(.INIT(1'b0)) FRDSE_inst (.Q(CLK_VAL), .C(CLK_FAST), .CE(1'b1), .D(CLK_SLOW), .R(1'b0), .S(1'b0));

  // Without the flop, invert the slow clock
  //wire      CLK_VAL;
  //assign    CLK_VAL = !CLK_SLOW;
endmodule
