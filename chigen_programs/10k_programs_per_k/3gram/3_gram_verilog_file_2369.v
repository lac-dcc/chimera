// Seed: 3258591880
program module_0 (
    output supply1 id_0,
    input wand id_1,
    output tri1 id_2,
    output tri1 id_3,
    output wor id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri0 id_7
);
  wire id_9;
endprogram
module module_1 (
    output supply0 id_0,
    input wire id_1,
    input wor id_2,
    output tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output wire id_6,
    input supply0 id_7,
    input wor id_8,
    output logic id_9,
    input supply0 id_10,
    output supply1 id_11,
    input tri id_12,
    input supply1 id_13,
    input wor id_14
);
  always @(posedge id_4 or 1 * 1'h0) begin
    if (1) id_9 <= 1;
  end
  nand (id_11, id_2, id_12, id_7, id_13, id_1, id_10);
  module_0(
      id_0, id_2, id_11, id_6, id_11, id_4, id_7, id_4
  );
endmodule
