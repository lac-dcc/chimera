// Seed: 3731525445
module module_0 (
    output uwire id_0,
    output wor id_1,
    output wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri id_6,
    output tri1 id_7,
    input wor id_8,
    output supply1 id_9,
    input supply1 id_10,
    input tri id_11,
    input supply1 id_12,
    input uwire id_13,
    input wire id_14,
    output wand id_15,
    output tri id_16,
    input tri0 id_17
);
  assign module_1.id_1 = 0;
endmodule
program module_1 (
    output wand id_0,
    input supply1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    output wire id_4,
    input tri0 id_5,
    output uwire id_6
);
  assign id_0 = id_1;
  assign id_0 = id_1;
  uwire id_8 = id_5, id_9;
  always begin : LABEL_0
    if (!~id_5) id_8 = (id_9);
  end
  module_0 modCall_1 (
      id_3,
      id_9,
      id_4,
      id_9,
      id_5,
      id_5,
      id_5,
      id_6,
      id_8,
      id_2,
      id_9,
      id_5,
      id_5,
      id_1,
      id_1,
      id_0,
      id_2,
      id_9
  );
endmodule
