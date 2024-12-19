// Seed: 219857787
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    input wand id_3,
    input wor id_4,
    input tri id_5,
    output tri0 id_6,
    input tri id_7,
    input wor id_8,
    input supply1 id_9,
    input wand id_10,
    input wire id_11,
    output uwire id_12,
    input tri0 id_13,
    output tri0 id_14,
    input supply1 id_15,
    output wor id_16,
    input wire id_17,
    input wand id_18,
    input tri id_19
);
  assign id_12 = {id_1};
endmodule
module module_1 (
    output logic id_0,
    inout supply1 id_1,
    output wand id_2,
    input tri1 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.type_6 = 0;
  always id_0 = #1 1;
endmodule
