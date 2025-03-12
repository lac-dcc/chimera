// Seed: 248336181
macromodule module_0 (
    output wand id_0,
    input tri0 id_1,
    output logic id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri id_5,
    output tri id_6,
    output uwire id_7,
    input uwire id_8,
    input tri1 id_9
);
  initial id_2 = -1'd0;
  assign id_6 = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd56,
    parameter id_9 = 32'd34
) (
    output supply1 id_0,
    input tri id_1,
    input supply1 id_2,
    output supply0 id_3,
    input wor id_4,
    output tri id_5,
    input wand _id_6,
    output uwire id_7,
    output supply1 id_8,
    input wand _id_9,
    input supply1 id_10,
    output tri id_11,
    output logic id_12,
    input wire id_13,
    output uwire id_14,
    input supply0 id_15
);
  wire id_17;
  initial begin : LABEL_0
    id_12 <= 1'h0;
  end
  wire id_18 = id_6;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_10,
      id_3,
      id_1,
      id_11,
      id_3,
      id_10,
      id_15
  );
  assign modCall_1.id_1 = 0;
  logic ["" -  id_9 : id_6] id_19;
  logic id_20;
  assign id_8  = 1'd0;
  assign id_20 = id_19;
endmodule
