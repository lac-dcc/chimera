// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>debug_slave
 * @file debug_slave.v
 * @date 2015-09-03  
 * @author Andrey Filippov     
 *
 * @brief Send/receive debug data over the serial ring
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * debug_slave.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  debug_slave.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  debug_slave#(
      parameter SHIFT_WIDTH =       32, // data width (easier to use multiple of 32, but not required)
      parameter READ_WIDTH =        32, // number of status bits to send over the ring (LSB aligned to the shift register)
      parameter WRITE_WIDTH =       32, // number of status bits to receive over the ring (LSB aligned to the shift register)
      parameter DEBUG_CMD_LATENCY =  2 // >0 extra registers in the debug_sl (distriburted in parallel)
)(
    input   mclk,
    input   mrst,
    // 3-wire debug interface
    input   debug_di,    // debug data received over the ring
    input   debug_sl,    // 0 - idle, (1,0) - shift, (1,1) - load
    output  debug_do,    // debug data sent over the ring

    // payload interface
    input   [READ_WIDTH - 1 : 0] rd_data, // local data to send over the daisy-chained ring
    output [WRITE_WIDTH - 1 : 0] wr_data, // received data to be used here (some bits may be used as address and wr_en
    output                       stb
);
    reg     [SHIFT_WIDTH - 1 : 0] data_sr;
    reg                           cmd; //command stae (0 - idle)  
    reg   [DEBUG_CMD_LATENCY : 0] cmd_reg; // MSB not used and will be optimized out
    wire                          cmd_reg_dly = cmd_reg[DEBUG_CMD_LATENCY-1];
    wire  [SHIFT_WIDTH + READ_WIDTH - 1 :0] ext_rdata = {{SHIFT_WIDTH{1'b0}}, rd_data};
    assign wr_data = data_sr[WRITE_WIDTH - 1 : 0];
    assign stb = cmd &&  cmd_reg_dly;
    assign debug_do = data_sr[0];
    always @ (posedge mclk) begin

        if (mrst) cmd_reg <= 0;
        else      cmd_reg <= {cmd_reg[DEBUG_CMD_LATENCY - 1 : 0], debug_sl};
        
        if (mrst) cmd <= 0;
        else      cmd <= cmd_reg_dly & ~cmd;

        if      (cmd && !cmd_reg_dly) data_sr <= {debug_di, data_sr[SHIFT_WIDTH - 1 :1]};
        else if (cmd &&  cmd_reg_dly) data_sr <= ext_rdata[SHIFT_WIDTH - 1 : 0];
        
    end    

endmodule

