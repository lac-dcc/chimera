// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  microstep PWM controler
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module microstep_pwm_control
        #(
            parameter   PAHSE_WIDTH     = 32,
            parameter   Q_WIDTH         = 16,
            parameter   OUTPUT_WIDTH    = PAHSE_WIDTH - Q_WIDTH,
            parameter   MICROSTEP_WIDTH = 12
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire                        microstep_en,
            input   wire                        nanostep_en,
            input   wire                        asyc_update_en,
            
            input   wire    [PAHSE_WIDTH-1:0]   phase,
            output  wire                        update,
            
            output  wire    [OUTPUT_WIDTH-1:0]  out_val
        );
    
    localparam NANOSTEP_WIDTH = Q_WIDTH > MICROSTEP_WIDTH ? Q_WIDTH - MICROSTEP_WIDTH : 1;
    
    
    function [PAHSE_WIDTH-1:0]  microstep_cnv(input [MICROSTEP_WIDTH-1:0] microstep);
    begin
        if ( Q_WIDTH > MICROSTEP_WIDTH ) begin
            microstep_cnv = microstep << (Q_WIDTH - MICROSTEP_WIDTH);
        end
        else begin
            microstep_cnv = microstep >> (MICROSTEP_WIDTH - Q_WIDTH);
        end
    end
    endfunction
    
    function [PAHSE_WIDTH-1:0]  nanostep_cnv(input [NANOSTEP_WIDTH-1:0] nanostep);
    integer i;
    begin
        nanostep_cnv = 0;
        if ( Q_WIDTH > MICROSTEP_WIDTH ) begin
            for ( i = 0; i < NANOSTEP_WIDTH; i = i+1 ) begin
                nanostep_cnv[i] = nanostep[NANOSTEP_WIDTH-1 - i];
            end
        end
    end
    endfunction
    
    
    reg     [MICROSTEP_WIDTH-1:0]   st0_micro_counter;
    reg     [NANOSTEP_WIDTH-1:0]    st0_nano_counter;
    wire    [PAHSE_WIDTH-1:0]       st0_micro_step = microstep_en ? microstep_cnv(st0_micro_counter) : 0;
    wire    [PAHSE_WIDTH-1:0]       st0_nano_step  = nanostep_en  ? nanostep_cnv(st0_nano_counter)   : 0;
    reg     [PAHSE_WIDTH-1:0]       st0_phase;
    reg     [PAHSE_WIDTH-1:0]       st1_phase;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_micro_counter <= {MICROSTEP_WIDTH{1'b0}};
            st0_nano_counter  <= {NANOSTEP_WIDTH{1'b0}};
            st0_phase         <= {PAHSE_WIDTH{1'b0}};
            st1_phase         <= {PAHSE_WIDTH{1'b0}};
        end
        else begin
            // stage 0
            if ( update || asyc_update_en ) begin
                st0_phase <= phase;
            end
            st0_micro_counter <= st0_micro_counter + 1'b1;
            if ( update ) begin
                st0_nano_counter <= st0_nano_counter + 1'b1;
            end
            
            // stage 1
            st1_phase <= st0_phase + st0_micro_step + st0_nano_step;
        end
    end
    
    assign update = (st0_micro_counter == {MICROSTEP_WIDTH{1'b1}});
    
    assign out_val = (st1_phase >> Q_WIDTH);
    
endmodule


`default_nettype wire


// end of file

