// Seed: 2536904564
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    output uwire id_2
);
  initial begin
    id_0 = 1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    output wor id_2,
    input supply1 id_3,
    input tri1 id_4,
    output uwire id_5,
    output tri id_6,
    input tri0 id_7,
    input wire id_8,
    input wand id_9,
    input tri0 id_10,
    input wand id_11,
    input tri0 id_12,
    input uwire id_13,
    input tri id_14,
    input wor id_15,
    output supply1 id_16,
    input tri id_17,
    input tri id_18
);
  wire id_20;
  xnor (id_6, id_15, id_11, id_13, id_4, id_14, id_3, id_18, id_17, id_9, id_10, id_12, id_7, id_8);
  module_0(
      id_5, id_11, id_6
  );
  always @(id_7) begin
    id_1 <= 1;
  end
endmodule
