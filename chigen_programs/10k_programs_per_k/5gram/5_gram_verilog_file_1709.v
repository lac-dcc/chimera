// Seed: 61626078
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wand id_5,
    input wire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input wand id_10,
    input uwire id_11,
    output tri1 id_12,
    output wire id_13,
    input tri1 id_14,
    output supply1 id_15,
    input tri id_16
);
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    input wire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.type_4 = 0;
  always @(posedge id_2) #1;
endmodule
