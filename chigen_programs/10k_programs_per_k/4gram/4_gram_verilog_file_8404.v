// Seed: 4252121972
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input uwire id_2,
    input wire id_3,
    input tri id_4,
    output supply1 id_5,
    input uwire id_6
);
  wire [1 'd0 : ""] id_8;
  id_9 :
  assert property (@(negedge -1) -1'h0)
  else $clog2(67);
  ;
  wire  id_10;
  logic id_11;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    input wand id_4,
    output supply1 id_5,
    output wand id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_6,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
