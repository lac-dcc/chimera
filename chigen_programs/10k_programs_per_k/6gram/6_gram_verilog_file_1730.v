// Seed: 3113845020
module module_0 #(
    parameter id_24 = 32'd89,
    parameter id_25 = 32'd68
) (
    output supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri id_6,
    input tri1 id_7,
    input uwire id_8,
    output wor id_9,
    input tri0 id_10,
    input wor id_11,
    input uwire id_12,
    input uwire id_13,
    input wand id_14,
    output wire id_15,
    output uwire id_16,
    output tri0 id_17,
    input wand id_18,
    input wire id_19,
    output uwire id_20,
    output tri1 id_21
);
  generate
    if (1 == id_14) begin : LABEL_0
      assign id_20 = 1;
    end else begin : LABEL_0
      wire id_23;
    end
  endgenerate
  defparam id_24.id_25 = 1'b0;
endmodule
module module_1 (
    input  tri id_0,
    input  wor id_1,
    output wor id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.type_31 = 0;
endmodule
