// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>drp_other_registers
 * @file drp_other_registers.v
 * @date 2016-03-13
 * @author Andrey Filippov     
 *
 * @brief Additional registers controlled/read back over DRP
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * drp_other_registers.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  drp_other_registers.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  drp_other_registers#(
    parameter DRP_ABITS =       8,
    parameter DRP_REG0 =        8,
    parameter DRP_REG1 =        9,
    parameter DRP_REG2 =       10,
    parameter DRP_REG3 =       11
)(
    input                   drp_rst,
    input                   drp_clk,
    input                   drp_en, // @aclk strobes drp_ad
    input                   drp_we,
    input   [DRP_ABITS-1:0] drp_addr,       
    input            [15:0] drp_di,
    output reg              drp_rdy,
    output reg       [15:0] drp_do,
    output           [15:0] drp_register0,
    output           [15:0] drp_register1,
    output           [15:0] drp_register2,
    output           [15:0] drp_register3
);
    
    reg           [DRP_ABITS-1:0] drp_addr_r;
    reg                           drp_wr_r;
    reg                    [ 1:0] drp_rd_r;
    reg                    [15:0] drp_di_r;
    reg                           drp_reg0_set;
    reg                           drp_reg1_set;
    reg                           drp_reg2_set;
    reg                           drp_reg3_set;
    reg                           drp_reg0_get;
    reg                           drp_reg1_get;
    reg                           drp_reg2_get;
    reg                           drp_reg3_get;
    
    reg                    [15:0] drp_register0_r;
    reg                    [15:0] drp_register1_r;
    reg                    [15:0] drp_register2_r;
    reg                    [15:0] drp_register3_r;
    
    assign drp_register0 = drp_register0_r;
    assign drp_register1 = drp_register1_r;
    assign drp_register2 = drp_register2_r;
    assign drp_register3 = drp_register3_r;
    
    // DRP interface
    always @ (posedge drp_clk) begin
        drp_addr_r <=           drp_addr;
        drp_wr_r <=             drp_we && drp_en;
        drp_rd_r <=             {drp_rd_r[0],~drp_we & drp_en};
        drp_di_r <=             drp_di;
        
        drp_reg0_set <=         drp_wr_r &&    (drp_addr_r == DRP_REG0);
        drp_reg1_set <=         drp_wr_r &&    (drp_addr_r == DRP_REG1);
        drp_reg2_set <=         drp_wr_r &&    (drp_addr_r == DRP_REG2);
        drp_reg3_set <=         drp_wr_r &&    (drp_addr_r == DRP_REG3);
        drp_reg0_get <=         drp_rd_r[0] && (drp_addr_r == DRP_REG0);       
        drp_reg1_get <=         drp_rd_r[0] && (drp_addr_r == DRP_REG1);       
        drp_reg2_get <=         drp_rd_r[0] && (drp_addr_r == DRP_REG2);       
        drp_reg3_get <=         drp_rd_r[0] && (drp_addr_r == DRP_REG3);       
        
        drp_rdy <=              drp_wr_r || drp_rd_r[1];
        drp_do <=               ({16{drp_reg0_get}} & drp_register0_r) |
                                ({16{drp_reg1_get}} & drp_register1_r) |
                                ({16{drp_reg2_get}} & drp_register2_r) |
                                ({16{drp_reg3_get}} & drp_register3_r);
                                
        if      (drp_rst)       drp_register0_r <= 0;
        else if (drp_reg0_set)  drp_register0_r <= drp_di_r;
        
        if      (drp_rst)       drp_register1_r <= 0;
        else if (drp_reg1_set)  drp_register1_r <= drp_di_r;
        
        if      (drp_rst)       drp_register2_r <= 0;
        else if (drp_reg2_set)  drp_register2_r <= drp_di_r;
        
        if      (drp_rst)       drp_register3_r <= 0;
        else if (drp_reg3_set)  drp_register3_r <= drp_di_r;
        
    end

endmodule

