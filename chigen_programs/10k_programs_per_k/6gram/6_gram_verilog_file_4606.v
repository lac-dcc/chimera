// Seed: 1331038402
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    output tri id_5,
    output tri0 id_6,
    input wor id_7,
    input wire id_8,
    input wor id_9,
    input wand id_10,
    input supply1 id_11
);
  assign id_6 = id_0;
  generate
    for (genvar id_13 = 1; 1; id_6 = 1'b0) begin : LABEL_0
      tri0 id_14;
      assign id_14 = 1;
    end
  endgenerate
  tri0 id_15 = 1'd0;
  module_0 modCall_1 (
      id_14,
      id_15,
      id_15,
      id_14,
      id_13,
      id_14,
      id_15
  );
endmodule
