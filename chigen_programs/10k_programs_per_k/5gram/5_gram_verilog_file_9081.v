// Seed: 1148781479
module module_0 (
    input uwire id_0
    , id_13,
    input wire id_1,
    input uwire id_2,
    input supply0 id_3,
    input wire id_4,
    output tri0 id_5,
    output wand id_6,
    output wand id_7,
    input tri0 id_8,
    output wor id_9,
    input wand id_10,
    input uwire id_11
);
  always @({1} / id_3) id_9 = 1;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input tri id_2,
    output supply0 id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  reg id_5;
  always @(posedge 1 or posedge {1{id_0}}) begin : LABEL_0
    id_5 <= id_5;
  end
  always @* begin : LABEL_0
    disable id_6;
  end
  not primCall (id_3, id_2);
endmodule
