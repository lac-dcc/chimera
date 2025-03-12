// Seed: 2970111365
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    output supply0 id_2
);
  wire id_4;
  ;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    output wor id_2
);
  assign id_2 = ~id_1 < id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire id_6;
  ;
  logic id_7;
  ;
endmodule
module module_2 #(
    parameter id_1 = 32'd21,
    parameter id_6 = 32'd70
) (
    input  wire id_0,
    output tri1 _id_1,
    output wor  id_2,
    input  tri  id_3
    , _id_6,
    output wand id_4
);
  wire id_7;
  wire id_8;
  and primCall (id_4, id_8, id_7);
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4
  );
  logic [id_1 : id_6] id_9;
  ;
  assign id_6 = id_9;
endmodule
