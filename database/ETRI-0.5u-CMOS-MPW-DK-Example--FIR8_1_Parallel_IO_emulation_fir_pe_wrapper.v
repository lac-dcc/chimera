// This program was cloned from: https://github.com/GoodKook/ETRI-0.5u-CMOS-MPW-DK-Example--FIR8
// License: GNU General Public License v3.0

//
// Co-Emulation warapper for parallel IO
//

module fir_pe_wrapper(Data_In, Data_Out, Addr, load_emu, get_emu, clk_emu, clk_dut, clk_LED);
    input  [7:0] Data_In;
    output [7:0] Data_Out;
    input  [7:0] Addr;
    input  load_emu, get_emu, clk_emu;
    input  clk_dut;
    output clk_LED;

    reg [7:0] Data_Out;

    // Stimulus & Output capture for DUT
    reg [7:0] stimIn[4];
    reg [7:0] vectOut[3];
    // DUT interface
    reg [ 7:0]  Cin;
    reg [ 7:0]  Xin;
    reg [15:0]  Yin;
    reg [ 7:0]  Xout;
    reg [15:0]  Yout;

    always @(posedge clk_emu)
    begin
        if (load_emu)   // Input stimulus to DUT
        begin
            Cin       <= stimIn[0];
            Xin       <= stimIn[1];
            Yin[15:8] <= stimIn[2];
            Yin[7:0]  <= stimIn[3];
        end
        else if (get_emu)   // Capure output from DUT
        begin
            vectOut[0] <= Xout;
            vectOut[1] <= Yout[15:8];
            vectOut[2] <= Yout[7:0];
        end
        else begin
            stimIn[Addr] <= Data_In;
            Data_Out <= vectOut[Addr];
        end
    end

    // Read-back DUT output
    assign clk_LED = clk_dut;   // Monitor emulation process
    
    // DUT
    fir_pe u_fir_pe(
        .clk(clk_dut),
        .Cin(Cin),
        .Xin(Xin),
        .Xout(Xout),
        .Yin(Yin),
        .Yout(Yout) );

endmodule
