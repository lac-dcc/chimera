// This program was cloned from: https://github.com/3b3al-MV/Spartan6-FPGA-DSP48A1-Slice-Design
// License: MIT License

module DSP_block(
    A, B, C, D, BCIN, CARRYIN, OPMODE, CLK,
    RSTA, RSTB, RSTC, RSTD, RSTP, RSTM, RSTCARRYIN, RSTOPMODE,
    CEA, CEB, CEC, CED, CEP, CEM, CECARRYIN, CEOPMODE,
    BCOUT, PCIN, PCOUT, P, M, CARRYOUT, CARRYOUTF
);
parameter A0REG=0, A1REG=1, B0REG=0, B1REG=1, CREG=1, DREG=1, MREG=1, PREG=1, CARRYINREG=1, CARRYOUTREG=1, OPMODEREG=1;
parameter CARRYINSEL = "OPMODE5", BINPUT = "DIRECT", RSTTYPE = "SYNCH";
input [17:0] A, B, D, BCIN;
input [47:0] C, PCIN;
input [7:0] OPMODE;
input CARRYIN, CLK,
    RSTA, RSTB, RSTC, RSTD, RSTP, RSTM, RSTCARRYIN, RSTOPMODE,
    CEA, CEB, CEC, CED, CEP, CEM, CECARRYIN, CEOPMODE;
output [47:0] PCOUT, P;
output [17:0] BCOUT;
output [35:0] M;
output CARRYOUT, CARRYOUTF;
wire [17:0] path_A0, path_B0, path_A1, path_B1, path_D;
wire [47:0] path_C, D_A_B_concatenated, Post_adder_subtracter;
wire [7:0] path_OPMODE;
wire [17:0] Pre_adder_subtracter, Pre_adder_subtracter_priority;
wire [35:0] multiplier_out;
wire [35:0] path_MULTIPLIER;
reg [17:0] cascaded_B;
reg [47:0] path_MUX_X, path_MUX_Z;
reg cascaded_carry_in;
wire cascaded_carry_out, path_CIN;

always @(*) begin
    if (BINPUT == "DIRECT") begin
        cascaded_B = B;
    end
    else if (BINPUT == "CASCADE") begin
        cascaded_B = BCIN;
    end
    else cascaded_B = 0;
end

FF_selection #(RSTTYPE, 18, A0REG) A0_FF_selection(CLK, RSTA, CEA, A, path_A0);
FF_selection #(RSTTYPE, 18, B0REG) B0_FF_selection(CLK, RSTB, CEB, cascaded_B, path_B0);
FF_selection #(RSTTYPE, 18, DREG) D_FF_selection(CLK, RSTD, CED, D, path_D);
FF_selection #(RSTTYPE, 48, CREG) C_FF_selection(CLK, RSTC, CEC, C, path_C);
FF_selection #(RSTTYPE, 8, OPMODEREG) OPMODE_FF_selection(CLK, RSTOPMODE, CEOPMODE, OPMODE, path_OPMODE);

assign Pre_adder_subtracter = (path_OPMODE[6]) ? (path_D - path_B0) : (path_D + path_B0);
assign Pre_adder_subtracter_priority = (path_OPMODE[4]) ? (Pre_adder_subtracter) : (path_B0);

FF_selection #(RSTTYPE, 18, A1REG) A1_FF_selection(CLK, RSTA, CEA, path_A0, path_A1);
FF_selection #(RSTTYPE, 18, B1REG) B1_FF_selection(CLK, RSTB, CEB, Pre_adder_subtracter_priority, path_B1);

assign BCOUT = path_B1;
assign D_A_B_concatenated = {path_D[11:0], path_A1, path_B1};
assign multiplier_out = path_B1 * path_A1;

FF_selection #(RSTTYPE, 36, MREG) MULT_FF_selection(CLK, RSTM, CEM, multiplier_out, path_MULTIPLIER);
assign M = path_MULTIPLIER;

always @(*) begin
    case (OPMODE[1:0])
        2'b11: path_MUX_X = D_A_B_concatenated;
        2'b10: path_MUX_X = P;
        2'b01: path_MUX_X = {{12{path_MULTIPLIER[35]}}, path_MULTIPLIER};
        default: path_MUX_X = 0;
    endcase
    case (OPMODE[3:2])
        2'b11: path_MUX_Z = path_C;
        2'b10: path_MUX_Z = P;
        2'b01: path_MUX_Z = PCIN;
        default: path_MUX_Z = 0;
    endcase
end

always @(*) begin
    if (CARRYINSEL == "OPMODE5") begin
        cascaded_carry_in = OPMODE[5];
    end
    else if (CARRYINSEL == "CARRYIN") begin
        cascaded_carry_in = CARRYIN;
    end
    else cascaded_carry_in = 0;
end

FF_selection #(RSTTYPE, 1, CARRYINREG) CIN_FF_selection(CLK, RSTCARRYIN, CECARRYIN, cascaded_carry_in, path_CIN);
assign {cascaded_carry_out, Post_adder_subtracter} = (path_OPMODE[7]) ? (path_MUX_Z - (path_MUX_X + path_CIN)) : (path_MUX_Z + (path_MUX_X + path_CIN));

FF_selection #(RSTTYPE, 48, PREG) P_FF_selection(CLK, RSTP, CEP, Post_adder_subtracter, P);
FF_selection #(RSTTYPE, 1, CARRYOUTREG) COUT_FF_selection(CLK, RSTCARRYIN, CECARRYIN, cascaded_carry_out, CARRYOUT);

assign PCOUT = P;
assign CARRYOUTF = CARRYOUT;
endmodule

module FF_selection (clk, rst, clk_enable, D, out);
parameter RSTTYPE = "SYNCH";
parameter WIDTH = 18;
parameter REG = 1;
input clk, rst, clk_enable;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] out;
reg [WIDTH-1:0] Q;

generate
    if (RSTTYPE == "SYNCH") begin
        always @(posedge clk) begin
            if (rst)
                Q <= 0;
            else if (clk_enable)
                Q <= D;
        end
    end
    else if (RSTTYPE == "ASYNCH") begin
        always @(posedge clk or posedge rst) begin
            if (rst)
                Q <= 0;
            else if (clk_enable)
                Q <= D;
        end
    end
endgenerate

always @(*) begin
    if (REG)
        out = Q;
    else
        out = D;
end
endmodule