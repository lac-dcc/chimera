// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_74109
`define V_74109
// JK flipflop https://assets.nexperia.com/documents/data-sheet/74HC_HCT109.pdf
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off INITIALDLY
// verilator lint_off COMBDLY

`timescale 1ns/1ns

module hct74109 ( 
    input j,
    input _k,
    input clk,
    input _sd, _rd,
    output q, 
    output _q
);

    parameter LOG=0; 
    parameter PROP_DELAY=17; 
    parameter ASYNC_DELAY=15; 
    parameter SETUP_TIME=8;  // JK must be setup AHEAD fo the clock - see datasheet

    reg Q,J,_K;

    assign #(SETUP_TIME) J = j;
    assign #(SETUP_TIME) _K = _k;

    if (LOG) always @*
        $display($time, " 74109  clk ", clk, 
                    " j ", J, " _k ", _K, " q ", Q,
                    " j' ", j, " _k' ", _k, " q' ", q,
                    "   ",
                    " _sd " , _sd, " _rd ", _rd
                );

    task checkSR;
        // explicitely state args so these become part fo sensitivity list
        // https://www.verilogpro.com/systemverilog-always_comb-always_ff/
        input _sd, _rd;

        if (!_sd & _rd) begin
            #(ASYNC_DELAY) Q<=1;
        end
        else if (_sd & !_rd) begin
            #(ASYNC_DELAY) Q<=0;
        end
        else if (!_sd & !_rd) begin
            #(ASYNC_DELAY) Q<=1;
        end
    endtask

    initial begin
        // explicitely state args so these become part fo sensitivity list
        // https://www.verilogpro.com/systemverilog-always_comb-always_ff/
        checkSR(_sd, _rd);
    end 

    always @* begin
        // explicitely state args so these become part fo sensitivity list
        // https://www.verilogpro.com/systemverilog-always_comb-always_ff/
        checkSR(_sd, _rd);
    end 
 
    always @(posedge clk)
    begin
        if (_sd & _rd) begin
            #(PROP_DELAY) case ({J,_K})
                2'b01 :  
                    Q = Q;
                2'b00 :  
                    Q = 0;
                2'b11 :  
                    Q = 1;
                2'b10 :  
                    Q = !Q;
            endcase
        end

    end

    assign q = Q;
    assign _q = !Q;

endmodule

`endif
