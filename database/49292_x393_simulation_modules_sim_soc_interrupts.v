// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sim_soc_interrupts
 * @file sim_soc_interrupts.v
 * @date 2016-05-05  
 * @author Andrey Filippov     
 *
 * @brief SOC interrupts simulation
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sim_soc_interrupts.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sim_soc_interrupts.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  sim_soc_interrupts #(
    parameter NUM_INTERRUPTS = 8
    )(
    input                           clk,
    input                           rst,
    input                           irq_en,   // automatically handled for the main thread
    input      [NUM_INTERRUPTS-1:0] irqm,     // individual interrupts enable (bit = 1 - enable, 0 - disable)
    input      [NUM_INTERRUPTS-1:0] irq,      // async interrupt requests
    input      [NUM_INTERRUPTS-1:0] irq_done, // end of ISR, turn off inta bit, re-enable arbitration
    output     [NUM_INTERRUPTS-1:0] irqs,     // synchronized by clock masked interrupts
    output     [NUM_INTERRUPTS-1:0] inta,     // interrupt acknowledge
    output                          main_go   // enable main thread to proceed 
);

    reg        [NUM_INTERRUPTS-1:0] inta_r;
    reg        [NUM_INTERRUPTS-1:0] irqs_r;
    wire       [NUM_INTERRUPTS  :0] irqs_ext = {irqs_r,!irq_en};
    wire       [NUM_INTERRUPTS-1:0] irqs_pri_w;
    
    assign inta = inta_r;
    assign irqs = irqs_r;
    assign main_go = !(|inta_r) && !(irq_en && |irqs);
    
    generate
        genvar i;
        for (i=0; i < NUM_INTERRUPTS; i=i+1) begin: pri_enc_block
            assign irqs_pri_w[i] = irqs_r[i] && !(|irqs_ext[i:0]);
        end
    endgenerate
    always @ (posedge clk or posedge rst) begin
        if      (rst)        inta_r <= 0;
        else if (!(|inta_r)) inta_r <= irqs_pri_w;
        else                 inta_r <=  inta_r & ~irq_done;
        
        if      (rst)        irqs_r <= 0;
        else                 irqs_r <= irq & irqm;
          
    end    

endmodule

