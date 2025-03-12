// Seed: 52903746
module module_0 (
    input supply0 id_0
    , id_13,
    input wor id_1,
    input tri1 id_2,
    input tri1 id_3,
    input uwire id_4,
    output uwire id_5,
    input tri1 id_6,
    input wire id_7,
    output supply0 id_8,
    output wand id_9,
    input wire id_10,
    input wire id_11
);
  id_14 :
  assert property (@(posedge -1) id_13) if (-1) if (1) $unsigned(51);
  ;
endmodule
module module_1 #(
    parameter id_14 = 32'd71,
    parameter id_4  = 32'd80
) (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri1 id_3,
    input wor _id_4,
    output supply0 id_5,
    output tri1 id_6,
    input tri0 id_7,
    output wor id_8,
    output uwire id_9,
    output supply0 id_10
);
  wire id_12;
  ;
  logic id_13;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_5,
      id_3,
      id_7,
      id_6,
      id_8,
      id_0,
      id_1
  );
  assign modCall_1.id_11 = 0;
  assign id_13 = 1;
  wire _id_14, id_15[id_4 : id_14];
  if (1) logic id_16;
  logic id_17 = -1;
  parameter id_18 = 1;
  assign id_16 = id_0;
  assign id_10 = id_0 && id_3;
endmodule
