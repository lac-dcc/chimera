// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 02/26/2021 04:34:09 PM
// Design Name: 
// Module Name: approx_units_array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps


//`define DRUM_APTPU
//`define ALM 
//`define MITCHELL
//`define ROBA
//`define DRALM
//`define ASM
//`define HIGH_REG

`include "options_definitions.vh"


module approx_units_array #(
   parameter MULT_DW = 4,              //Accurate multiplier size 
   parameter A_BW    = 8,              // Operand A bitwith 
   parameter B_BW    = 8,             // Operand B bitwidth 
   parameter N = 3,
   parameter M = 3,
   parameter ADDER_PARAM = 6,
   parameter ROUN_WIDTH = 1,
   parameter max_bw = (A_BW>B_BW)? A_BW:B_BW,
   parameter bw_lg = $clog2(max_bw), 
   parameter truncation_width = MULT_DW+1,
   parameter NIBBLE_WIDTH = 4,
   parameter LOG2_NIBBLE_WIDTH = $clog2(NIBBLE_WIDTH),
   parameter NIBBLES = A_BW/4
    )                      (
   input [A_BW*M-1:0] data,
   input [B_BW*N-1:0] kernel,
   
   `ifdef DRUM_APTPU
        output [MULT_DW*M-1:0]      syst_data,
        output [MULT_DW*N-1:0]      syst_kernel,
        output [M-1:0]              d_sign,
        output [N-1:0]              w_sign,
        output [$clog2(A_BW)*M-1:0] d_shamt,
        output [$clog2(B_BW)*N-1:0] w_shamt
        );
        
   `elsif ALM
        output [($clog2(A_BW)+A_BW-1)*M-1:0]	log_concat_format_A_bus,
        output [M-1:0]                          zero_flag_A_bus,
        output [($clog2(B_BW)+B_BW-1)*N-1:0]	log_concat_format_B_bus,
        output [N-1:0]                          zero_flag_B_bus
        );
   
   `elsif MITCHELL
        output [($clog2(A_BW))*M-1:0]   A_k_1,
        output [($clog2(B_BW))*N-1:0]   B_k_1,
        output [A_BW*M-1:0]             A_x_1,
        output [B_BW*N-1:0]             B_x_1,
        output [M-1:0]                  zero_flag_A_bus,
        output [N-1:0]                  zero_flag_B_bus
        );
            
    `elsif ROBA
        output [$clog2(A_BW)*M-1:0]	    K_wireA,
        output	[(A_BW+1)*M-1:0]        Ar_wire,
        output [$clog2(B_BW)*N-1:0]	    K_wireB
        );
    
    `elsif DRALM
        output	[(bw_lg+truncation_width+1)*M-1:0]	LC_OP_A_wire,
        output	[(bw_lg+truncation_width+1)*N-1:0]	LC_OP_B_wire
        );
    
    `elsif ASM
        `ifdef HIGH_REG             // If High register parameter is used, we choose to share the pre_compute unit at the Weight side
            output [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0]  SL_out,
            output [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0]  SEL_out,
            output [(B_BW+3)*M-1:0]                     I1_wire, 
            output [(B_BW+3)*M-1:0]                     I3_wire, 
            output [(B_BW+3)*M-1:0]                     I5_wire, 
            output [(B_BW+3)*M-1:0]                     I7_wire
            );
        
        `else                       // Else, we keep Pre_Compute unit in each PE and reduce the overall registers used to pypass the data 
            output [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] SL_out,
            output [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] SEL_out,
            output [B_BW*N-1:0]                        Kernel_copied
            );
            
        
        `endif 
    `else
        output [MULT_DW*M-1:0]      syst_data,
        output [MULT_DW*N-1:0]      syst_kernel,
        output [M-1:0]              d_sign,
        output [N-1:0]              w_sign,
        output [$clog2(A_BW)*M-1:0] d_shamt,
        output [$clog2(B_BW)*N-1:0] w_shamt
        );
    
    `endif
    
    
    
    //output [($clog2(A_BW)+A_BW-1)*M-1:0]	log_concat_format_A_bus;
    
    
    
    genvar n,m;
    
    /* Instantiation of Approximate units for the IFmap data */
    generate //begin : IFMAP_APPROX_UNITS
        for (m=0; m<M; m=m+1) begin
        
            `ifdef DRUM_APTPU  
                shared_approx_units #(.MULT_DW(MULT_DW),.A_BW(A_BW)) data_approx_unit (
                .a(data[(A_BW*(m+1))-1: A_BW*m]),
                .mult_a_in(syst_data[(MULT_DW*(m+1))-1: MULT_DW*m]),
                .a_sign(d_sign[m]),
                .a_shamt(d_shamt[($clog2(A_BW)*(m+1))-1: $clog2(A_BW)*m])
                );
            `elsif ALM
                ALM_Gen_pre_approximate #(.A_BW(A_BW),.ADDER_PARAM(ADDER_PARAM)) data_approx_unit (
                .A(data[(A_BW*(m+1))-1: A_BW*m]),
                .log_concat_format_A(log_concat_format_A_bus[(($clog2(A_BW)+A_BW-1)*(m+1))-1:($clog2(A_BW)+A_BW-1)*m]),
                .zero_flag(zero_flag_A_bus[m])
                );                      
            `elsif MITCHELL
                mitchell_pre_approximate #(.A_BW(A_BW)) data_approx_unit (
                .A(data[(A_BW*(m+1))-1: A_BW*m]),
                .k_1(A_k_1[(($clog2(A_BW))*(m+1))-1:($clog2(A_BW))*m]),
                .x_1(A_x_1[(A_BW*(m+1))-1: A_BW*m]),
                .zero_flag(zero_flag_A_bus[m])
                );
         
            `elsif ROBA
                RoBA_A_pre_approximate #(.A_BW(A_BW),.B_BW(B_BW),.ROUN_WIDTH(ROUN_WIDTH)) data_approx_unit (
                .A(data[(A_BW*(m+1))-1: A_BW*m]),
                .K_wireA(K_wireA[(($clog2(A_BW))*(m+1))-1:($clog2(A_BW))*m]),    // LOD A wire
                .Ar_wire(Ar_wire[((A_BW+1)*(m+1))-1: (A_BW+1)*m])          // Rounded A (coming from Rounding Unit) 
                );
         
            `elsif DRALM
                DR_ALM_pre_approximate #(.A_BW(A_BW),.B_BW(B_BW),.MULT_DW(MULT_DW)) data_approx_unit (
                .A(data[(A_BW*(m+1))-1: A_BW*m]),
                .LC_OP_A_wire(LC_OP_A_wire[((bw_lg+truncation_width+1)*(m+1))-1:(bw_lg+truncation_width+1)*m])
                );
         
            `elsif ASM
                `ifdef HIGH_REG             // If High register parameter is used, we choose to share the pre_compute unit at the Weight side
                    ASM_A_pre_approximate #(.WIDTH(A_BW),.NIBBLE_WIDTH(NIBBLE_WIDTH)) data_approx_unit (
                    .A(data[(A_BW*(m+1))-1: A_BW*m]),
                    .SL_out(SL_out[((LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1))-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]), 
                    .SEL_out(SEL_out[((LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1))-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m])
                    );
                        
                `else                       // Else, we keep Pre_Compute unit in each PE and reduce the overall registers used to pypass the data 
                    ASM_A_pre_approximate #(.WIDTH(A_BW),.NIBBLE_WIDTH(NIBBLE_WIDTH)) data_approx_unit (
                    .A(data[(A_BW*(m+1))-1: A_BW*m]),
                    .SL_out(SL_out[((LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1))-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]), 
                    .SEL_out(SEL_out[((LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1))-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m])
                    );        
                `endif 
            
            `else
                shared_approx_units #(.MULT_DW(MULT_DW),.A_BW(A_BW)) data_approx_unit (
                .a(data[(A_BW*(m+1))-1: A_BW*m]),
                .mult_a_in(syst_data[(MULT_DW*(m+1))-1: MULT_DW*m]),
                .a_sign(d_sign[m]),
                .a_shamt(d_shamt[($clog2(A_BW)*(m+1))-1: $clog2(A_BW)*m])
                );
            `endif
         end
      // end
     endgenerate





    /* Instantiation of Approximate units for the Kernel data */
     generate //begin : KERNEL_APPROX_UNITS
        for (n=0; n<N; n=n+1) begin
            `ifdef DRUM_APTPU
                shared_approx_units #(.MULT_DW(MULT_DW),.A_BW(B_BW)) filter_approx_unit (
                .a(kernel[(B_BW*(n+1))-1: B_BW*n]),
                .mult_a_in(syst_kernel[(MULT_DW*(n+1))-1: MULT_DW*n]),
                .a_sign(w_sign[n]),
                .a_shamt(w_shamt[($clog2(B_BW)*(n+1))-1: $clog2(B_BW)*n])
                );
            
            `elsif ALM
                ALM_Gen_pre_approximate #(.A_BW(B_BW),.ADDER_PARAM(ADDER_PARAM)) filter_approx_unit (
                .A(kernel[(B_BW*(n+1))-1: B_BW*n]),
                .log_concat_format_A(log_concat_format_B_bus[(($clog2(B_BW)+B_BW-1)*(n+1))-1:($clog2(B_BW)+B_BW-1)*n]),
                .zero_flag(zero_flag_B_bus[n])
                );          
            `elsif MITCHELL
                mitchell_pre_approximate #(.A_BW(B_BW)) filter_approx_unit (
                .A(kernel[(B_BW*(n+1))-1: B_BW*n]),
                .k_1(B_k_1[(($clog2(B_BW))*(n+1))-1:($clog2(B_BW))*n]),
                .x_1(B_x_1[(B_BW*(n+1))-1: B_BW*n]),
                .zero_flag(zero_flag_A_bus[n])
                );
         
            `elsif ROBA
                RoBA_B_pre_approximate #(.A_BW(A_BW),.B_BW(B_BW)) filter_approx_unit (
                .B(kernel[(B_BW*(n+1))-1: B_BW*n]),
                .K_wireB(K_wireB[(($clog2(B_BW))*(n+1))-1:($clog2(B_BW))*n])    // LOD A wire
                );
         
            `elsif DRALM
                DR_ALM_pre_approximate #(.A_BW(A_BW),.B_BW(B_BW),.MULT_DW(MULT_DW)) filter_approx_unit (
                .A(kernel[(B_BW*(n+1))-1: B_BW*n]),
                .LC_OP_A_wire(LC_OP_B_wire[((bw_lg+truncation_width+1)*(n+1))-1:(bw_lg+truncation_width+1)*n])
                );
            `elsif ASM
                `ifdef HIGH_REG             // If High register parameter is used, we choose to share the pre_compute unit at the Weight side
                    ASM_B_pre_approximate #(.WIDTH(B_BW)) filter_approx_unit (
                    .B(kernel[(B_BW*(n+1))-1: B_BW*n]),
                    .I1_wire(I1_wire[((B_BW+3)*(n+1))-1:(B_BW+3)*n]),
                    .I3_wire(I3_wire[((B_BW+3)*(n+1))-1:(B_BW+3)*n]), 
                    .I5_wire(I5_wire[((B_BW+3)*(n+1))-1:(B_BW+3)*n]), 
                    .I7_wire(I7_wire[((B_BW+3)*(n+1))-1:(B_BW+3)*n])
                    );                        
                                        
                `else                       // Else, we keep Pre_Compute unit in each PE and reduce the overall registers used to pypass the data 
                    assign Kernel_copied = kernel;                      
                                        
                `endif
            `else
                shared_approx_units #(.MULT_DW(MULT_DW),.A_BW(B_BW)) filter_approx_unit (
                .a(kernel[(B_BW*(n+1))-1: B_BW*n]),
                .mult_a_in(syst_kernel[(MULT_DW*(n+1))-1: MULT_DW*n]),
                .a_sign(w_sign[n]),
                .a_shamt(w_shamt[($clog2(B_BW)*(n+1))-1: $clog2(B_BW)*n])
                );    
            `endif
         end
        //end
      endgenerate
    
endmodule
