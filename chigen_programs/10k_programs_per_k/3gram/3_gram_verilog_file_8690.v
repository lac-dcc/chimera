// Seed: 3446554849
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri1 id_6,
    input wire id_7
    , id_10,
    input supply1 id_8
);
  assign id_1 = id_10 > id_2;
  id_11 :
  assert property (@(posedge id_10) id_7)
  else id_1 = 1;
  id_12(
      .id_0(1 == 1 - id_10), .id_1(1)
  );
  wire id_13;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1
    , id_5,
    output wand id_2,
    input wire id_3
);
  initial begin : LABEL_0
    id_5 <= 1;
    id_2 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.type_2 = 0;
endmodule
