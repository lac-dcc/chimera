// This program was cloned from: https://github.com/3b3al-MV/Spartan6-FPGA-DSP48A1-Slice-Design
// License: MIT License

module DSP_block_TB1();
    reg [17:0] A_tb, B_tb, D_tb, BCIN_tb;
    reg [47:0] C_tb, PCIN_tb;
    reg [7:0] OPMODE_tb;
    reg CARRYIN_tb, CLK_tb, RSTA_tb, RSTB_tb, RSTC_tb,
        RSTD_tb, RSTP_tb, RSTM_tb, RSTCARRYIN_tb, RSTOPMODE_tb,
        CEA_tb, CEB_tb, CEC_tb, CED_tb, CEP_tb, CEM_tb, CECARRYIN_tb,
        CEOPMODE_tb;
    wire [47:0] PCOUT_tb, P_tb;
    wire [17:0] BCOUT_tb;
    wire [35:0] M_tb;
    wire CARRYOUT_tb, CARRYOUTF_tb;
    DSP_block #(
        .A0REG(1), .A1REG(1), .B0REG(1), .B1REG(1), .CREG(1), .DREG(1), .OPMODEREG(1), .MREG(1),
        .CARRYINREG(1), .CARRYOUTREG(1), .PREG(1),
        .CARRYINSEL("OPMODE5"), .BINPUT("DIRECT"), .RSTTYPE("SYNCH")
    ) F0 (
        .A(A_tb), .B(B_tb), .C(C_tb), .D(D_tb), .BCIN(BCIN_tb), .CARRYIN(CARRYIN_tb), .OPMODE(OPMODE_tb), .CLK(CLK_tb),
        .RSTA(RSTA_tb), .RSTB(RSTB_tb), .RSTC(RSTC_tb), .RSTD(RSTD_tb), .RSTP(RSTP_tb), .RSTM(RSTM_tb),
        .RSTCARRYIN(RSTCARRYIN_tb), .RSTOPMODE(RSTOPMODE_tb),
        .CEA(CEA_tb), .CEB(CEB_tb), .CEC(CEC_tb), .CED(CED_tb), .CEP(CEP_tb), .CEM(CEM_tb), .CECARRYIN(CECARRYIN_tb),
        .CEOPMODE(CEOPMODE_tb),
        .BCOUT(BCOUT_tb), .PCIN(PCIN_tb), .PCOUT(PCOUT_tb), .P(P_tb), .M(M_tb), .CARRYOUT(CARRYOUT_tb),
        .CARRYOUTF(CARRYOUTF_tb)
    );
    integer i;
    initial begin
        CLK_tb = 0;
        forever
            #5 CLK_tb = ~CLK_tb;

        RSTA_tb = 1;
        RSTB_tb = 1;
        RSTC_tb = 1;
        RSTD_tb = 1;
        RSTP_tb = 1;
        RSTM_tb = 1;
        RSTCARRYIN_tb = 1;
        RSTOPMODE_tb = 1;
        for (i = 0; i < 20; i = i + 1) begin
            CEA_tb = $random;
            CEB_tb = $random;
            CEC_tb = $random;
            CED_tb = $random;
            CEP_tb = $random;
            CEM_tb = $random;
            CECARRYIN_tb = $random;
            CEOPMODE_tb = $random;
            CARRYIN_tb = $random;
            A_tb = $random;
            B_tb = $random;
            D_tb = $random;
            BCIN_tb = $random;
            C_tb = $random;
            PCIN_tb = $random;
            OPMODE_tb = $random;
            @(negedge CLK_tb);
        end
        RSTA_tb = 0;
        RSTB_tb = 0;
        RSTC_tb = 0;
        RSTD_tb = 0;
        RSTP_tb = 0;
        RSTM_tb = 0;
        RSTCARRYIN_tb = 0;
        RSTOPMODE_tb = 0;
        CEA_tb = 1;
        CEB_tb = 1;
        CEC_tb = 1;
        CED_tb = 1;
        CEP_tb = 1;
        CEM_tb = 1;
        CECARRYIN_tb = 1;
        CEOPMODE_tb = 1;
        OPMODE_tb = 8'b00010000;
        for (i = 0; i < 40; i = i + 1) begin
            CARRYIN_tb = $random;
            A_tb = $urandom_range(0, 600);
            B_tb = $urandom_range(0, 600);
            D_tb = $urandom_range(0, 600);
            BCIN_tb = $urandom_range(0, 600);
            C_tb = $urandom_range(0, 5000);
            PCIN_tb = $urandom_range(0, 5000);
            @(negedge CLK_tb);
        end
        OPMODE_tb = 8'b00111001;
        for (i = 0; i < 40; i = i + 1) begin
            CARRYIN_tb = $random;
            A_tb = $urandom_range(0, 600);
            B_tb = $urandom_range(0, 600);
            D_tb = $urandom_range(0, 600);
            BCIN_tb = $urandom_range(0, 600);
            C_tb = $urandom_range(0, 5000);
            PCIN_tb = $urandom_range(0, 5000);
            @(negedge CLK_tb);
        end
        OPMODE_tb = 8'b11101110;
        for (i = 0; i < 40; i = i + 1) begin
            CARRYIN_tb = $random;
            A_tb = $urandom_range(0, 600);
            B_tb = $urandom_range(0, 600);
            D_tb = $urandom_range(0, 600);
            BCIN_tb = $urandom_range(0, 600);
            C_tb = $urandom_range(0, 5000);
            PCIN_tb = $urandom_range(0, 5000);
            @(negedge CLK_tb);
        end
        OPMODE_tb = 8'b11000111;
        for (i = 0; i < 40; i = i + 1) begin
            CARRYIN_tb = $random;
            A_tb = $urandom_range(0, 600);
            B_tb = $urandom_range(0, 600);
            D_tb = $urandom_range(0, 600);
            BCIN_tb = $urandom_range(0, 600);
            C_tb = $urandom_range(0, 5000);
            PCIN_tb = $urandom_range(0, 5000);
            @(negedge CLK_tb);
        end
        $stop;
    end
endmodule