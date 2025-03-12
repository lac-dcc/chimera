// Seed: 3286124263
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wor id_4,
    input tri0 id_5,
    output wire id_6
);
  assign id_6 = id_5;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd57
) (
    output uwire id_0,
    output tri   id_1,
    output tri1  id_2,
    input  wire  id_3,
    output uwire id_4
    , id_14,
    input  uwire id_5,
    output uwire id_6,
    input  tri   id_7,
    input  logic id_8,
    output wire  id_9,
    output wire  id_10,
    input  wand  id_11,
    output logic id_12
);
  always id_12 = -1 + id_5;
  assign id_10 = id_11;
  wire id_15;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_4,
      id_11,
      id_9,
      id_11,
      id_0
  );
  id_16 :
  assert property (@(posedge 1'h0 ? -1 : id_8) id_8.id_16)
  else;
  assign id_12 = id_15;
  wire _id_17;
  always id_16 = id_17;
  parameter id_18 = 1'b0;
  logic id_19;
  wire [-1 : id_17] id_20;
endmodule
