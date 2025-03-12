// Seed: 328730540
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input supply1 id_2
);
  assign {~1, id_0, 1} = 1'h0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd39
) (
    output tri   id_0,
    input  uwire id_1,
    output tri1  id_2,
    input  wor   id_3,
    input  wor   _id_4,
    output wire  id_5
    , id_11,
    output tri1  id_6,
    output tri0  id_7,
    output tri0  id_8,
    input  uwire id_9
);
  real id_12;
  logic id_13;
  logic [id_4 : -1] id_14;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire id_15 = id_11;
  id_16 :
  assert property (@(id_13) id_16)
  else id_13 <= 1;
endmodule
