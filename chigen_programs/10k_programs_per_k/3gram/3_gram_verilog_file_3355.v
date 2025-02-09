// Seed: 46682274
module module_0 (
    input uwire id_0,
    output wire id_1,
    input wand id_2,
    output supply0 id_3,
    input tri0 id_4,
    input supply0 id_5,
    output wire id_6,
    input wor id_7,
    input uwire id_8,
    output supply1 id_9,
    input wand id_10
);
  wire id_12;
  assign module_1.type_3 = 0;
  static id_13(
      .id_0(1), .id_1(1'b0), .id_2(1), .id_3(id_0), .id_4(1'b0), .id_5(1)
  );
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    input supply1 id_2,
    inout tri id_3,
    output wor id_4
);
  id_6(
      .id_0(1), .id_1(1), .id_2(id_2)
  );
  always_comb @(posedge 1);
  assign id_4 = id_2;
  wire id_7;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_3
  );
endmodule
