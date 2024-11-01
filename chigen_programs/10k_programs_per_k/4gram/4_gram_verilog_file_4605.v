// Seed: 742561620
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3,
    output tri1 id_4,
    input wor id_5,
    input uwire id_6,
    input tri id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri0 id_10
    , id_12
);
  wand id_13 = 1;
  wire id_14;
  id_15 :
  assert property (@(posedge (1'b0)) id_12)
  else $display(1, 1, 1);
  id_16(
      .id_0(1'd0), .id_1(id_14)
  );
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wor   id_3,
    input  wor   id_4,
    output uwire id_5
    , id_11,
    input  uwire id_6,
    input  uwire id_7,
    output wand  id_8,
    output wire  id_9
);
  assign id_9 = 1 - id_7 ? id_11 : id_2;
  module_0(
      id_2, id_7, id_1, id_9, id_9, id_1, id_11, id_6, id_0, id_11, id_11
  );
endmodule
