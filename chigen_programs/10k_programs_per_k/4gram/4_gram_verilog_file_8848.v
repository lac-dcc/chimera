// Seed: 2603317393
module module_0 (
    input wor  id_0,
    input tri1 id_1,
    input wire id_2
);
  assign {~id_2, -1'd0} = id_0;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri id_3,
    input wand id_4,
    output uwire id_5,
    input wire id_6,
    input uwire id_7,
    output uwire id_8,
    output uwire id_9,
    input supply0 id_10,
    input tri id_11,
    input tri id_12,
    output supply1 id_13
);
  assign id_8 = id_2;
  id_15 :
  assert property (@(posedge id_10) 1'd0)
  else $clog2(28);
  ;
  or primCall (id_9, id_7, id_3, id_1, id_10, id_2, id_6);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4
  );
  assign modCall_1.id_2 = 0;
  logic id_16;
  wire  id_17;
endmodule
