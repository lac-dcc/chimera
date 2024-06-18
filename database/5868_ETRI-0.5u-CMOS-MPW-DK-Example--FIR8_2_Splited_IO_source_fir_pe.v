// This program was cloned from: https://github.com/GoodKook/ETRI-0.5u-CMOS-MPW-DK-Example--FIR8
// License: GNU General Public License v3.0

// Filename : fir_pe.v
// Purpose  : Processing Element for FIR filter
// Author   : goodkook@gmail.com
// History  : Mar. 2024, First Release

/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNDRIVEN */

module fir_pe (clk, Cin, Xin, Xout, Yin, Yout, Rdy, Vld, Vld_LED);
input           clk;
input   [7:0]   Cin;
input   [3:0]   Xin;
output  [3:0]   Xout;
input   [3:0]   Yin;
output  [3:0]   Yout;
input           Rdy;
output          Vld;
output          Vld_LED;

    // Load Control --------------------------------------------
    integer i;
    reg     [4:0]   LoadCtl;
    //reg             Vld;
    always @(posedge clk)
    begin
        LoadCtl[0] <= Rdy;
        //LoadCtl[1] <= LoadCtl[0];
        //LoadCtl[2] <= LoadCtl[1];
        //LoadCtl[3] <= LoadCtl[2];
        //LoadCtl[4] <= LoadCtl[3];
        for (i=0; i<4; i=i+1)
            LoadCtl[i+1] <= LoadCtl[i];
    end
    assign Vld = LoadCtl[4];
    assign Vld_LED = LoadCtl[4];
    
    // Xin -----------------------------------------------------
    reg     [3:0]   XinL, XinH;
    always @(posedge clk)
    begin
        if (LoadCtl[0])         XinL <= Xin;
        else if (LoadCtl[1])    XinH <= Xin;
    end
    // Yin -----------------------------------------------------
    reg     [3:0]   Yin3, Yin2, Yin1, Yin0;
    always @(posedge clk)
    begin
        if (LoadCtl[0])         Yin0 <= Yin;
        else if (LoadCtl[1])    Yin1 <= Yin;
        else if (LoadCtl[2])    Yin2 <= Yin;
        else if (LoadCtl[3])    Yin3 <= Yin;
    end
    // Mult-Acc ------------------------------------------------
    reg     [15:0]  y, _y;
    wire    [7:0]   XinHL   = {XinH, XinL};
    wire    [15:0]  Yin3210 = {Yin3, Yin2, Yin1, Yin0};
    always @(posedge clk)
    begin
        if (LoadCtl[4]) begin
            y  <= _y;
            _y <= XinHL * Cin + Yin3210;
        end
    end
    // Xout & Yout ---------------------------------------------
    reg     [3:0]   Xout, Yout;
    always @*
    begin
        if (LoadCtl[0]) begin
            Xout = XinL;
            Yout = y[3:0];
        end
        else if (LoadCtl[1]) begin
            Xout = XinH;
            Yout = y[7:4];
        end
        else if (LoadCtl[2]) begin
            Xout = 4'bxxxx;
            Yout = y[11:8];
        end
        else if (LoadCtl[3]) begin
            Xout = 4'bxxxx;
            Yout = y[15:12];
        end
        else begin
            Xout = 4'bxxxx;
            Yout = 4'bxxxx;
        end
    end
endmodule
