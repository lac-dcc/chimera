// Seed: 3591081517
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input  wand  id_2
);
  assign id_0 = id_2;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    output uwire id_2
    , id_10 = 1'd0,
    input  tri1  id_3,
    input  tri0  id_4,
    input  tri   id_5,
    output uwire id_6,
    inout  tri0  id_7,
    input  wor   id_8
);
  assign id_2 = id_3 | {id_0{id_4}};
  parameter id_11 = "" && -1'd0;
  assign id_7 = id_4;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1
  );
  assign id_6 = -1;
  tri0 id_12 = -1 ? id_11[1 : 1'b0] - id_3 : id_3, id_13 = id_12, id_14 = -1'b0, id_15 = -1;
  assign id_2 = ~id_10;
  nor primCall (id_6, id_0, id_11, id_4, id_10, id_3, id_7, id_5, id_8);
endmodule
