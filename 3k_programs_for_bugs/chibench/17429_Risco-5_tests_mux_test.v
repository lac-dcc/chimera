// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module mux_tb();

reg [31:0] MUX_A, MUX_B;
reg MUX_Option;
wire [31:0] MUX_S;

MUX MUX(
    .A(MUX_A),
    .B(MUX_B),
    .S(MUX_S),
    .option(MUX_Option)
);

initial begin
    MUX_A = 5;
    MUX_B = 3;
    MUX_Option = 0;

    #1

    $display("Estado ", MUX_S);
    MUX_Option = 1;

    #1
    $display("Estado ", MUX_S);

end

endmodule
