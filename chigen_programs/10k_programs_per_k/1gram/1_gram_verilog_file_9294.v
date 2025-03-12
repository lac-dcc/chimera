// Seed: 2235059086
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    output wire id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wand id_7,
    input tri1 id_8,
    input supply1 id_9,
    input uwire id_10
);
  logic id_12;
  logic [7:0] id_13 = id_0;
  logic id_14;
  logic [7:0][-1 : 1] id_15, id_16;
  wire id_17, id_18;
  final @(id_13) id_13[""] = 1 ? -1 : -1;
  wire id_19;
  wire id_20;
endmodule
module module_1 #(
    parameter id_6 = 32'd7
) (
    input  uwire id_0,
    output wor   id_1,
    input  wor   id_2,
    input  wor   id_3
    , id_9,
    input  uwire id_4,
    output tri0  id_5,
    output wor   _id_6,
    output wire  id_7
);
  wire id_10;
  xor primCall (id_1, id_9, id_11, id_0, id_2, id_3, id_4);
  logic id_11, id_12[id_6 : 1];
  module_0 modCall_1 (
      id_0,
      id_5,
      id_0,
      id_0,
      id_5,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
