// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

module di(in, en, PU, PD, PAD);
    output in;
    
    input PU;
    input PD;
    input en;

    input PAD;

    assign in = PAD;
endmodule