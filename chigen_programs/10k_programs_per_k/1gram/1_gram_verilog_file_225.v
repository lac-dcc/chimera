// Seed: 4217346506
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri0 id_2,
    input wand id_3,
    input tri id_4,
    output tri0 id_5,
    output wire id_6,
    output supply0 id_7,
    input wor id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri1 id_11,
    input supply0 id_12,
    input wire id_13,
    output wand id_14,
    output supply0 id_15,
    input supply1 id_16,
    input uwire id_17
);
  assign id_5  = id_10;
  assign id_15 = (id_17);
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4,
    output wire id_5,
    input wand id_6,
    input tri0 id_7,
    input uwire id_8
);
  always begin : LABEL_0
    id_1 = (-1'b0);
  end
  module_0 modCall_1 (
      id_3,
      id_8,
      id_5,
      id_8,
      id_3,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_8,
      id_5,
      id_7,
      id_6,
      id_5,
      id_5,
      id_2,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
