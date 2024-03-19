module srl
(
    input      [31:0] rt,
    input      [4:0]  shamt,
    output     [31:0] rd
);

    assign rd = rt >> shamt;

endmodule
