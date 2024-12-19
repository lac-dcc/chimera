// Seed: 638034562
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output supply0 id_2,
    input wand id_3,
    input supply1 id_4,
    input wand id_5,
    input tri id_6,
    output uwire id_7,
    input wire id_8,
    output supply1 id_9,
    output wire id_10
);
  if (id_8) begin : LABEL_0
    wire id_12;
  end
endmodule
module module_1 (
    input uwire id_0
    , id_12,
    output tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri1 id_5,
    input uwire id_6,
    input tri id_7,
    output wor id_8,
    output tri1 id_9,
    output uwire id_10
);
  wire id_13;
  integer id_14 = id_4;
  id_15 :
  assert property (@(id_14) 1 <-> 1)
  else;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_15,
      id_4,
      id_4,
      id_4,
      id_7,
      id_5,
      id_4,
      id_5,
      id_9
  );
  assign modCall_1.id_6 = 0;
endmodule
