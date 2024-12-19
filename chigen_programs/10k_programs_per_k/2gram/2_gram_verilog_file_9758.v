// Seed: 2500626596
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input wire id_2,
    output tri0 id_3,
    output supply1 id_4,
    input wor id_5,
    input supply1 id_6,
    input wand id_7,
    input wire id_8,
    output wire id_9,
    input wire id_10,
    input tri0 id_11,
    input supply0 id_12,
    output tri1 id_13
);
  assign id_4 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output tri1 id_2,
    output logic id_3,
    input supply1 id_4
);
  assign id_3 = id_4 <-> 1;
  buf primCall (id_3, id_4);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_1,
      id_2,
      id_4,
      id_0,
      id_4,
      id_0,
      id_2,
      id_4,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.type_2 = 0;
  always begin : LABEL_0
    id_3 <= 1'b0 * id_0;
  end
  wire id_6;
endmodule
