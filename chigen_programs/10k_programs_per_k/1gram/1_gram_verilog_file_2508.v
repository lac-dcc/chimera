// Seed: 288400794
module module_0 (
    input supply1 id_0,
    output wor id_1,
    input uwire id_2,
    input wor id_3,
    input supply1 id_4,
    input tri id_5,
    input wor id_6,
    input tri1 id_7,
    input uwire id_8
);
  tri id_10 = (-1);
  wire id_11;
  supply1 id_12 = -1'b0, id_13 = id_4;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd24
) (
    input wire id_0,
    input tri1 id_1,
    output logic id_2,
    input uwire _id_3,
    input tri1 id_4,
    input wor id_5,
    output wand id_6,
    output uwire id_7,
    input wire id_8,
    output wire id_9,
    input supply0 id_10,
    input supply1 id_11,
    input tri id_12,
    input tri id_13,
    input tri1 id_14,
    output logic id_15,
    input tri id_16
);
  wire id_18, id_19;
  assign id_19 = id_13;
  wire [1 : id_3] id_20, id_21;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_11,
      id_4,
      id_4,
      id_10,
      id_13,
      id_11,
      id_11
  );
  always id_15 <= -1;
  always_comb begin : LABEL_0
    if (1) begin : LABEL_1
      id_2 <= id_3;
    end
  end
  wire id_22, id_23;
endmodule
