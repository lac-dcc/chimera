// Seed: 716760948
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input uwire id_2,
    output tri id_3,
    input tri1 id_4,
    input tri id_5,
    output wor id_6,
    input wire id_7,
    input tri1 id_8,
    output tri1 id_9,
    input supply1 id_10,
    input wand id_11,
    input tri1 id_12,
    input wand id_13,
    input tri id_14,
    input tri id_15
);
  wire id_17;
  wire [1 'b0 : 1] id_18;
  wire id_19;
  ;
  assign id_1 = id_4;
  assign module_1.id_5 = 0;
  assign id_18 = id_4;
  wire id_20;
  wire id_21;
  id_22 :
  assert property (@(posedge 1 or posedge 1'b0 - -1'b0) id_2)
  else;
  parameter id_23 = -1'd0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output wand id_2,
    output uwire id_3,
    input uwire id_4,
    output tri0 id_5,
    output supply1 id_6
);
  wire id_8;
  ;
  xnor primCall (id_2, id_8, id_4, id_0, id_1);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_5,
      id_0,
      id_4,
      id_5,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_4
  );
endmodule
