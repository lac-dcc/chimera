// Seed: 3071472365
module module_0 (
    output wor id_0,
    input wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    input tri1 id_4
);
  parameter id_6 = 1;
  logic id_7, id_8, id_9;
  assign module_1.id_0 = 0;
  wire id_10;
endmodule
module module_1 #(
    parameter id_19 = 32'd33
) (
    input tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    output tri1 id_5,
    output wand id_6,
    output wor id_7,
    output tri id_8,
    output wire id_9,
    output uwire id_10,
    input wand id_11,
    output tri0 id_12,
    output tri0 id_13,
    output logic id_14,
    input tri0 id_15,
    input tri0 id_16
);
  static integer [-1  -  1 : 1] id_18;
  module_0 modCall_1 (
      id_7,
      id_16,
      id_4,
      id_2,
      id_4
  );
  localparam id_19 = 1;
  generate
    for (id_20 = id_11; -1'b0; id_14 = -1) begin : LABEL_0
      defparam id_19.id_19 = 1;
    end
  endgenerate
endmodule
