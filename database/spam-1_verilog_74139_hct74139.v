// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_74139
`define V_74139
// DUAL 2 to 4 line decoder
// https://books.google.co.uk/books?id=pkW5DwAAQBAJ&pg=PA362&lpg=PA362&dq=verilog+%2274139%22&source=bl&ots=p5Lb0vS6Gc&sig=ACfU3U39tOIUbv0jCeofuICsNqxWo7PJJA&hl=en&sa=X&ved=2ahUKEwjVp6ecno3oAhXEoFwKHdR-BX0Q6AEwAXoECDIQAQ#v=onepage&q=verilog%20%2274139%22&f=false

// see also discussion on delays that tranmit glitches ...
// https://stackoverflow.com/questions/64083950/why-are-icarus-verilog-specify-times-not-respected/64085508?noredirect=1#comment113337822_64085508

// names and HCT timings from https://assets.nexperia.com/documents/data-sheet/74HC_HCT139.pdf
`timescale 1ns/1ns
module hct74139(
input _Ea, 
input _Eb, 
input [1:0] Aa,
input [1:0] Ab,
output logic [3:0] _Ya,
output logic [3:0] _Yb
); 

    parameter LOG = 0;

    parameter AY_PD = 13;
    parameter EY_PD = 13;

    function [3:0] f74139(input [1:0] A, input _E); 

        logic [3:0] f74139;

        // data sheet shows Y0-Y1-Y2-Y3 in that order with HH=>1111, HL=>1110, LH=>1101, LL=>0111
        if (_E == 0) begin 
            case (A) 
                // per https://assets.nexperia.com/documents/data-sheet/74HC_HCT139.pdf _Y0 is lsb
                0: f74139 = 4'b1110;
                1: f74139 = 4'b1101;
                2: f74139 = 4'b1011; 
                3: f74139 = 4'b0111; 
            endcase
        end 
        else
        if (_E == 1) begin 
            f74139 = 4'b1111;
        end

    endfunction


    logic _Ea_d;
    logic _Eb_d;
    logic [1:0] Aa_d;
    logic [1:0] Ab_d;

    always @*
         Aa_d = #(AY_PD) Aa;
    always @*
         Ab_d = #(AY_PD) Ab;
    always @*
         _Ea_d = #(EY_PD) _Ea;
    always @*
         _Eb_d = #(EY_PD) _Eb;

    always @*
         _Ya = f74139(Aa_d,_Ea_d);

    always @*
        _Yb = f74139(Ab_d,_Eb_d);

   if (LOG) always @*
        $display("%9t ", $time, " DEMUX   _Ea=%1b", _Ea, " Aa=%2b", Aa, " _Ya=%4b", _Ya, "  /  _Eb=%1b", _Eb, " Ab=%2b", Ab, " _Yb=%4b", _Yb);

endmodule

`endif


