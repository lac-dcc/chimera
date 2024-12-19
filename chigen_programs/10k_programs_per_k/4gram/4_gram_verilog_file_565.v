// Seed: 346772528
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output wor id_2,
    input supply0 id_3,
    output tri id_4,
    output tri id_5,
    output supply1 id_6,
    input wire id_7,
    output uwire id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    input tri id_12,
    output wand id_13,
    output wire id_14,
    output wor id_15,
    output supply0 id_16
);
  wire id_18;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1
);
  supply0 id_3, id_4, id_5, id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_6 = 1'b0;
  id_8(
      .id_0(id_0), .sum(id_7), .id_1(1), .id_2(id_5), .id_3(1)
  );
  wor id_9 = 1;
endmodule
