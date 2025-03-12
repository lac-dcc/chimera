// Seed: 3241944950
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  assign module_1.id_9 = 0;
  inout wire id_2;
  inout wire id_1;
  parameter id_4 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wand id_6,
    output wire id_7,
    input supply0 id_8
    , id_12, id_13,
    input uwire id_9,
    input wire id_10
);
  parameter id_14 = 1;
  wire id_15;
  wire id_16;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_15
  );
  always @(1 or posedge "") $unsigned(28);
  ;
  id_17 :
  assert property (@(posedge -1) id_13)
  else begin : LABEL_0
    if (id_14)
      if (-1) id_13 = "";
      else id_17 = id_1 <-> ~-1;
  end
endmodule
