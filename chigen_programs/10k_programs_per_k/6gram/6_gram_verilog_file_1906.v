// Seed: 369726693
module module_0 (
    input wand id_0,
    input tri id_1,
    input wor id_2,
    input wand id_3,
    output uwire id_4,
    input supply1 id_5,
    input uwire id_6,
    output wand id_7,
    output tri id_8,
    input wor id_9,
    input supply0 id_10,
    output uwire id_11
);
  assign id_7 = id_6 == 1;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output wand id_2,
    output supply1 id_3,
    output wand id_4
);
  id_6(
      id_4, ~id_4, 1
  );
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_6 = 0;
  always @(id_1 or posedge 1) begin : LABEL_0
    id_3 = 1;
  end
endmodule
