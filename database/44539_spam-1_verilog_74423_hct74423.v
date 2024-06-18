// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/*

partial impl - for a single configuration where we get a negative pulse triggered by a positive edge

74HCT423 RC MONOSTABLE
    to https://www.mouser.co.uk/ProductDetail/Texas-Instruments/CD74HCT423E?qs=sGAEpiMZZMvlv4093HnhKZ8bAgIsdcd%2FsXgnN672tig%3D
see also 74HCT123 RC MONOSTABLE
    https://www.mouser.co.uk/ProductDetail/Texas-Instruments/CD74HCT123E?qs=sGAEpiMZZMvlv4093HnhKZ8bAgIsdcd%2FlNYxPTBpeBQ%3D
 */
`timescale 1ns/1ns
module hct74423 (
    input _A, B, _R, 
    output Q, _Q
);
    
    parameter PulseWidth=100;
    parameter TriggerPD=25;

    // NEEDED FOR SHORT /WE PULSE ON RISING EDGE OF CLOCK FOR
    // 74HCT670 WHOSE MIN write pulse width is 20ns.
    // HOW IN PRACTICE? RC? OR MORE GATES AS SHOWN HERE?

    // simulate 74HCT123
    reg q;
    assign Q = q;
    assign _Q = !Q;

    always @* begin
        if (_R) begin
            if (_A) 
                q=0;
            else if (!B) 
                q=0;
        end
        else
        begin
            q=0;
        end
    end
    

    always @(posedge B) begin
        if (!_A) begin
            #TriggerPD
            q=1;
            #PulseWidth
            q=0;
        end
    end

    always @(negedge _A) begin
        if (B) begin
            #TriggerPD
            q=1;
            #PulseWidth
            q=0;
        end
    end
    
endmodule
