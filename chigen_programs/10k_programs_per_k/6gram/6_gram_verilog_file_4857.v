// Seed: 689149250
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3
);
  supply0 id_5;
  supply1 id_6 = 1;
  id_7(
      .id_0(1), .id_1(id_5), .id_2(1'b0)
  ); id_8(
      id_8 | id_5, ~id_8
  ); id_9(
      .id_0(1), .id_1((1)), .id_2(id_1), .id_3(id_8)
  );
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    input  logic id_2,
    output wand  id_3,
    output tri   id_4
);
  always while (id_2 && id_2 + 1) id_0 <= id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.type_2 = 0;
  assign id_4 = 1;
endmodule
