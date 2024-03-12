// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// https://media.digikey.com/pdf/Data%20Sheets/NXP%20PDFs/74HC(T)670.pdf
// active low enable inputs

// NOTE:
// MIN _WE pulsewidth = 20ns   : http://www.ti.com/lit/ds/schs195c/schs195c.pdf?ts=1588009560263
// MIN _WE pulsewidth = 9-18ns : https://media.digikey.com/pdf/Data%20Sheets/NXP%20PDFs/74HC(T)670.pdf

`timescale 1ns/1ns
module hct74670 (input _wr_en,
                 input [1:0] wr_addr,
                 input [3:0] wr_data,
                 input _rd_en,
                 input [1:0] rd_addr,
                 output [3:0] rd_data);
    
    parameter LOG=0;

    localparam PD_RE_TO_Q=18;
    localparam PD_A_TO_Q=21;
    localparam PD_D_TO_Q=27;
    localparam PD_WE_TO_Q=28;

// verilator lint_off UNOPTFLAT
    // Register file storage
    reg [3:0] registers[3:0];
    reg [3:0] tmp_data;

// verilator lint_on UNOPTFLAT

    // necessary to make it possible to set an initial value into REGA so that I can do   NAME=0   
    // or any other operation without X into an ALU input causing an X on the output
    initial begin
        if (LOG) $display("INITIALISING EMPTY REGISTER %m FILE TO VALUES [0,1,2,3]");
        registers[0] = 0;
        registers[1] = 1;
        registers[2] = 2;
        registers[3] = 3;
    end
      
    reg [3:0] out_val;
    
    specify
        (_rd_en *> rd_data)  = PD_RE_TO_Q;
        (_wr_en *> rd_data)  = PD_WE_TO_Q;
        (rd_addr *> rd_data) = PD_A_TO_Q;
        (wr_data => rd_data) = PD_D_TO_Q;
    endspecify
    
    // write to register file
    always @* begin
        if (!_wr_en) begin
            registers[wr_addr] = wr_data;
        end
    end

    always @(registers[0]) begin
            if (LOG) $display("%9t ", $time, ": 74670 setting reg[0]  <= ", registers[0], " : %m");
    end
    always @(registers[1]) begin
            if (LOG) $display("%9t ", $time, ": 74670 setting reg[1]  <= ", registers[1], " : %m");
    end
    always @(registers[2]) begin
            if (LOG) $display("%9t ", $time, ": 74670 setting reg[2]  <= ", registers[2], " : %m");
    end
    always @(registers[3]) begin
            if (LOG) $display("%9t ", $time, ": 74670 setting reg[3]  <= ", registers[3], " : %m");
    end
        
        
    // reading from register file
    always_comb
    // always @(*)  << this gives warning: ./hct74670.v:32: warning: @* is sensitive to all 4 words in array 'registers'.
    begin
        out_val = registers[rd_addr];
    end
    
    assign rd_data = _rd_en ? 4'bz : out_val;
    
endmodule
