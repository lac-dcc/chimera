// Seed: 4182101395
module module_0 (
    output logic id_0,
    input tri id_1,
    input wire id_2,
    input tri id_3,
    input supply1 id_4
);
  always begin : LABEL_0
    if (1) begin : LABEL_1
      if (1) begin : LABEL_2
        id_0 <= 1'd0;
      end else if ((1 & 1 & -1'd0)) begin : LABEL_3
        id_0 = -1;
      end
    end
    id_0 = {(-1) {id_4}} && id_3;
  end
endmodule
module module_1 #(
    parameter id_20 = 32'd24,
    parameter id_9  = 32'd76
) (
    output wire id_0,
    output tri id_1,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output wand id_5,
    output logic id_6,
    input tri id_7,
    input uwire id_8,
    input wor _id_9,
    input wand id_10,
    input tri0 id_11,
    input wor id_12,
    output tri0 id_13,
    input supply0 id_14,
    input wor id_15,
    input wand id_16,
    output tri id_17,
    input wand id_18,
    output uwire id_19,
    input supply1 _id_20,
    output logic id_21,
    output tri id_22,
    input tri1 id_23
);
  final begin : LABEL_0
    id_6  = 1;
    id_21 = id_10;
  end
  assign id_19 = 1;
  wire [1 'b0 : id_20  -  id_9] id_25;
  wire id_26;
  wire id_27;
  wire id_28;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_4,
      id_8,
      id_7
  );
  assign modCall_1.id_0 = 0;
  logic id_29;
endmodule
