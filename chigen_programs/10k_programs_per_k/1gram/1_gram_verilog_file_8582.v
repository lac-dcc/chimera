// Seed: 1710880388
module module_0 (
    input  wand id_0,
    input  tri0 id_1,
    input  wor  id_2
    , id_6 = 1,
    input  tri0 id_3,
    output wire id_4
);
  logic id_7, id_8;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd69,
    parameter id_6 = 32'd96
) (
    output wor   id_0 [(  id_3  ) : id_6],
    input  wand  id_1,
    input  wire  id_2,
    input  uwire _id_3,
    input  tri0  id_4,
    output logic id_5,
    output wand  _id_6
);
  assign id_6 = id_3;
  logic id_8;
  wire [-1 : -1] id_9 = id_9;
  struct packed {
    logic id_10;
    logic id_11;
  } id_12;
  ;
  id_13 :
  assert property (@(id_3) id_13[-1]) id_5 <= id_12.id_11;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_0
  );
endmodule
