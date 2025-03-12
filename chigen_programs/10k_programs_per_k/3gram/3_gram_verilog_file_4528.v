// Seed: 1063759785
module module_0 (
    output wand id_0,
    output tri0 id_1,
    output supply0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    output wire id_5
);
  wire id_7;
  ;
  module_2 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_4
  );
endmodule
module module_1 #(
    parameter id_1 = 32'd75
) (
    input tri1 id_0,
    input uwire _id_1,
    output tri id_2,
    output supply0 id_3,
    input wire id_4,
    input tri0 id_5
);
  logic [-1 : id_1] id_7;
  nor primCall (id_3, id_0, id_7, id_5);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.type_8 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input wand id_3
    , id_5
);
  assign id_0 = id_2 - 1'd0;
  assign id_1 = id_2;
  assign module_0.id_4 = 0;
endmodule
