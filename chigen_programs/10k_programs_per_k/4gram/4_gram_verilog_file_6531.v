// Seed: 1090898062
module module_0 (
    output supply0 id_0
    , id_9,
    input tri id_1,
    output supply1 id_2,
    input wire id_3,
    input tri1 id_4,
    output uwire id_5,
    input tri0 id_6,
    input tri1 id_7
);
  wire id_10;
  assign id_5 = -1;
  id_11 :
  assert property (@(posedge id_9 == id_1) id_9)
  else $signed(47);
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd14,
    parameter id_3 = 32'd21,
    parameter id_5 = 32'd60
) (
    input tri0 id_0,
    output uwire _id_1,
    output tri id_2,
    output supply1 _id_3
);
  assign id_2 = id_0;
  wire _id_5;
  wire id_6;
  ;
  logic [!  id_1 : -1] id_7[id_5 : !  id_3];
  ;
  and primCall (id_2, id_7, id_0, id_6);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0
  );
endmodule
