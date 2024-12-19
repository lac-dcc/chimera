// Seed: 1894152846
module module_0 #(
    parameter id_16 = 32'd5,
    parameter id_17 = 32'd82
) (
    output supply0 id_0,
    input wand id_1,
    input wor id_2
    , id_14,
    input tri1 id_3
    , id_15,
    output uwire id_4,
    output wor id_5,
    input tri0 id_6,
    output tri0 id_7,
    input wor id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri id_11,
    output tri0 id_12
);
  generate
    defparam id_16.id_17 = 1;
  endgenerate
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input logic id_2,
    input wor id_3
);
  always_comb begin : LABEL_0
    assign id_1 = id_2;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1
  );
endmodule
