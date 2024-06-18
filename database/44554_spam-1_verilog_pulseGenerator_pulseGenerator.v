// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/*
 Generates low pulse following rising edge of clock.
	 Delayed vs clk by the tPD of n4.
	 Width determined by the tPD of n1/n2/n3
 */
`timescale 1ns/1ns
module pulseGenerator (input clk,
                       input clk_en, // hign enables the pulse 
                       output pulse_low // pulse goes low
                       );
    
    // NEEDED FOR SHORT /WE PULSE ON RISING EDGE OF CLOCK FOR
    // 74HCT670 WHOSE MIN write pulse width is 20ns.
    // HOW IN PRACTICE? RC? OR MORE GATES AS SHOWN HERE?

    // Using 74HCT00 NAND
    // https://assets.nexperia.com/documents/data-sheet/74HC_HCT00.pdf
    // tPD 10ns gives a 30ns pulse
    parameter tPD = 10;
    
    wire gclk;
    wire not_gclk;
    wire not_clk;

    nand #(tPD) n1(not_clk, clk);
    nand #(tPD) n2(gclk, not_clk, clk_en);
    nand #(tPD) n3(not_gclk, gclk);
    nand #(tPD) n4(pulse_low, clk , not_gclk);

    
endmodule
