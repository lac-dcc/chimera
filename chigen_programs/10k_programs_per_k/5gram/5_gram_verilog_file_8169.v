// Seed: 1632197876
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wand id_2,
    output tri1 id_3,
    input wire id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7
);
  wire id_9;
endmodule
module module_1 #(
    parameter id_11 = 32'd68,
    parameter id_3  = 32'd67,
    parameter id_5  = 32'd29
) (
    input supply0 id_0,
    input uwire id_1,
    output uwire id_2,
    output uwire _id_3,
    output tri id_4,
    input tri _id_5
);
  logic id_7;
  ;
  logic [id_5 : id_3] id_8;
  wire id_9;
  ;
  localparam id_10 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
  assign id_9 = id_9;
  _id_11 :
  assert property (@(posedge id_7[id_11][{-1}!=1]) id_8 - 1)
  else $clog2(58);
  ;
endmodule
