// Seed: 681851301
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input tri id_2,
    input supply1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri id_8,
    output wire id_9,
    input wand id_10
);
  logic [1 : -1] id_12 = -1;
  wire id_13;
  logic [-1 : 1] id_14, id_15;
endmodule
module module_1 #(
    parameter id_4 = 32'd88
) (
    output tri1  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    output wor   _id_4
);
  wire id_6;
  struct {
    logic id_7;
    logic id_8;
    struct packed {
      logic ["" : id_4] id_9;
      id_10 id_11;
    } id_12;
    logic id_13;
  } [id_4 : 1] id_14;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1
  );
  id_15 :
  assert property (@(posedge id_14.id_13) id_14.id_8[(-1)])
  else;
endmodule
