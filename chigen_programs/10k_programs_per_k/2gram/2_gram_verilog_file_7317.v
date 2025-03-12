// Seed: 3946528551
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    output tri id_2,
    input wor id_3,
    input tri1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    output wand id_7,
    input tri0 id_8,
    output wor id_9,
    output supply0 id_10,
    output tri0 id_11,
    output tri0 id_12,
    output wand id_13,
    output uwire id_14,
    output supply1 id_15,
    input tri id_16,
    output supply1 id_17,
    input wire id_18,
    output wire id_19
);
  wire id_21;
  assign id_14 = 1;
endmodule
module module_1 (
    output logic   id_0,
    output supply0 id_1,
    input  supply1 id_2,
    output logic   id_3
);
  always begin : LABEL_0
    id_0 <= id_2;
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_9 = 0;
  struct packed {logic id_5;} id_6;
endmodule
