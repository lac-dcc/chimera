// Seed: 2647345775
module module_0 #(
    parameter id_13 = 32'd19,
    parameter id_14 = 32'd40
) (
    input wor id_0,
    input supply0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    output tri0 id_4,
    output wire id_5
    , id_10,
    output supply0 id_6,
    input wire id_7
    , id_11,
    output wor id_8
);
  generate
    for (id_12 = 1; id_12; id_11 = id_7) begin : LABEL_0
      defparam id_13.id_14 = 1 - 1;
    end
  endgenerate
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wand id_3,
    input logic id_4,
    output logic id_5
);
  always @(posedge id_4 or posedge id_4)
    if (id_4) begin : LABEL_0
      id_5 <= id_4;
    end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule
