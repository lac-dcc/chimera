/*******************************************************************************
 * Module: simul_axi_slow_ready
 * Date:2014-03-24  
 * Author: Andrey Filippov    
 * Description: Simulation model for AXI: slow ready generation
 *
 * Copyright (c) 2014 Elphel, Inc..
 * simul_axi_slow_ready.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_slow_ready.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  simul_axi_slow_ready(
    input         clk,
    input         reset,
    input  [3:0]  delay,
    input         valid,
    output        ready
    );
    reg   [14:0]  rdy_reg;
    assign ready=(delay==0)?1'b1: ((((rdy_reg[14:0] >> (delay-1)) & 1) != 0)?1'b1:1'b0);
    always @ (posedge clk or posedge reset) begin
        if (reset)                rdy_reg <=0;
        else if (!valid || ready) rdy_reg <=0;
        else rdy_reg <={rdy_reg[13:0],valid};
    end
    

endmodule

