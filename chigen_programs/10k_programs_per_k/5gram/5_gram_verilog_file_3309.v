// Seed: 4089589058
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_2;
endmodule
module module_1 #(
    parameter id_12 = 32'd15,
    parameter id_6  = 32'd96
) (
    output logic id_0,
    input tri id_1,
    input supply0 id_2,
    input tri id_3,
    input wor id_4,
    input wire id_5,
    input tri _id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wand id_9,
    input tri id_10,
    output logic id_11,
    input wand _id_12,
    output logic id_13
);
  assign id_0 = id_12;
  bit [1 : id_6] id_15;
  final begin : LABEL_0
    id_15 <= 1;
    `define pp_16 0
    id_13 = id_3;
    id_13#(.id_12(1 - 1)) = 1 == id_7;
    id_15 <= id_10;
    id_11 = "";
    id_0 <= 1;
  end
  xnor primCall (id_13, id_1, id_2, id_3, id_8, id_20, id_15, id_7, id_18, id_17, id_5, id_10);
  logic [-1 : id_12] id_17 = id_7;
  wire [-1 : 1] id_18, id_19;
  wire id_20;
  module_0 modCall_1 (
      id_20,
      id_19,
      id_20,
      id_19
  );
endmodule
