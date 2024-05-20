// This program was cloned from: https://github.com/gfg-development/grayblastVGA
// License: Apache License 2.0

/* The core array for the GPU.
 *
 * -----------------------------------------------------------------------------
 *
 * Copyright (c) 2024 Gerrit Grutzeck (g.grutzeck@gfg-development.de)
 * SPDX-License-Identifier: Apache-2.0
 *
 * -----------------------------------------------------------------------------
 *
 * Author   : Gerrit Grutzeck g.grutzeck@gfg-development.de
 * File     : core_array.v
 * Create   : Mai 11, 2024
 * Revise   : Mai 11, 2024
 * Revision : 1.0
 *
 * -----------------------------------------------------------------------------
 */

`default_nettype none

module core_array #(
    parameter NR_CORES      = 4,
    parameter BIT_WIDTH     = 8
) (
    /* Control signals */
    input  wire                             clk,                    // clock
    input  wire [15:0]                      opcode,                 // OP code to execute
    input  wire                             execute,

    /* Output signals */
    output reg                              valid_bit,
    output reg                              output_bit
);
    parameter CORE_ADDR_WIDTH           = $clog2(NR_CORES);

    wire [CORE_ADDR_WIDTH - 1 : 0] core_id_reg;
    assign core_id_reg                  = opcode[CORE_ADDR_WIDTH + 8 : 9];

    /* Global registers */
    reg [BIT_WIDTH - 1 : 0] global_registers [0 : 15];

    /* Handling the core specific commands */
    reg [NR_CORES - 1 : 0] execute_core;
    integer i;
    always @(posedge clk) begin
        valid_bit                       <= 0;
        if (execute == 1) begin

            // Misc commands
            if (opcode[15:14] == 2'b11) begin
                /* Glboal store command */
                if (opcode[7] == 1) begin
                    for (i = 0; i < NR_CORES; i++) begin
                        if (execute_core[i] == 1) begin
                            global_registers[opcode[12:9]]  <= accu_core[i][7 : 0]; 
                        end
                    end
                end

                /* Core enable and disable */
                case (opcode[6:5])
                    2'b01:
                        begin
                            execute_core                    <= 0;
                            for (i = 0; i < NR_CORES; i++) begin
                                execute_core[core_id_reg]  <= 1;
                            end
                        end
                        
                    2'b10:
                        execute_core                        <= {NR_CORES{1'b1}};
                    default: begin end 
                endcase

                /* Output the LSB of the accumulator from the selected core */
                if (opcode[4] == 1) begin
                    output_bit                              <= accu_core[core_id_reg][0]; 
                end
            end
        end
    end

    /* Instanciate the cores */
    wire [2 * BIT_WIDTH - 1 : 0]    accu_core [0 : NR_CORES - 1];
    wire [16 * BIT_WIDTH - 1 : 0]   flatten_global_reg;

    generate
        genvar z;
        for (z = 0; z < 16; z = z + 1) begin
            assign flatten_global_reg[BIT_WIDTH * (z + 1) - 1 : BIT_WIDTH * z] = global_registers[z];
        end
    endgenerate

    generate
        genvar y;
        for (y = 0; y < NR_CORES; y = y + 1) begin
            core #(
                .CORE_ID(y),
                .BIT_WIDTH(BIT_WIDTH)
            ) core (
                .clk(clk),
                .opcode(opcode),
                .execute(execute_core[y] & execute),
                .accu(accu_core[y]),
                .global_registers_in(flatten_global_reg)
            );
        end
    endgenerate

endmodule
