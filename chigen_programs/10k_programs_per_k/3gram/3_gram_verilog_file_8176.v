// Seed: 1066944852
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    output tri id_4,
    output supply0 id_5,
    output wor id_6,
    input tri id_7,
    input supply1 id_8,
    output tri id_9,
    input tri id_10,
    input wire id_11,
    input wand id_12,
    output tri0 id_13,
    output uwire id_14,
    output uwire id_15,
    output wire id_16,
    input supply0 id_17,
    output tri1 id_18,
    input wand id_19,
    input uwire id_20,
    input wor id_21,
    output tri1 id_22,
    input wire id_23,
    input supply0 id_24,
    input wire id_25
);
  assign id_13 = {id_21, 1 + id_25};
  id_27(
      .id_0(), .id_1(id_11), .id_2(1), .id_3(id_11), .id_4(1), .id_5(id_22)
  );
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1
);
  wire id_3;
  nand (id_0, id_3, id_1);
  module_0(
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1
  );
  wire id_4;
endmodule
