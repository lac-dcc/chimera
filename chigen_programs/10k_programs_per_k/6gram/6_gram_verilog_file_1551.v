// Seed: 275273764
module module_0 (
    input tri id_0,
    input wand id_1,
    input wand id_2,
    output uwire id_3,
    output wor id_4,
    input supply0 id_5,
    input wor id_6,
    input wand id_7
    , id_11,
    input tri1 id_8,
    output tri1 id_9
);
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    input supply0 id_2,
    input wire id_3,
    output tri0 id_4,
    output wand id_5
);
  specify
    $width(posedge id_7, {1{1}});
  endspecify
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_0,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
