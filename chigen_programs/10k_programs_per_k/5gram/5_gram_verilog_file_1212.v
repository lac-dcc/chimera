// Seed: 1362450929
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output wire id_2,
    output tri id_3,
    input wand id_4,
    output wor id_5,
    input wire id_6,
    input supply1 id_7,
    input wor id_8,
    output wire id_9,
    output supply0 id_10,
    input uwire id_11,
    input tri id_12
);
  assign id_9  = id_12;
  assign id_10 = 1 === -1;
  id_14 :
  assert property (@(posedge -1) {id_12, id_12})
  else $clog2(83);
  ;
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    output uwire id_2
    , id_7,
    input  uwire id_3,
    input  uwire id_4,
    output tri   id_5
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_1,
      id_3,
      id_3,
      id_5,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
