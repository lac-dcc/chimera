// Seed: 2265436173
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output supply0 id_2,
    output tri1 id_3
);
endmodule
module module_1 #(
    parameter id_38 = 32'd67
) (
    input tri id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input tri0 id_5,
    output supply1 id_6,
    output tri0 void id_7,
    output tri1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input wor id_11,
    output tri1 id_12,
    input supply1 id_13,
    output wand id_14,
    input wire id_15,
    output wand id_16,
    output tri0 id_17,
    input supply0 id_18,
    input tri1 id_19,
    input wor id_20,
    input tri0 id_21,
    input supply1 id_22,
    output tri id_23,
    input tri0 id_24,
    output wor id_25,
    output supply0 id_26,
    output tri0 id_27,
    input tri0 id_28,
    input wand id_29,
    input uwire id_30,
    input supply1 id_31,
    id_37,
    output tri id_32,
    output supply1 id_33,
    output tri id_34,
    output supply0 id_35
);
  defparam id_38 = -1;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_17,
      id_8
  );
  assign modCall_1.type_5 = 0;
  tri0 id_39;
  assign id_7 = id_0 - id_11;
  always_comb begin : LABEL_0
    begin : LABEL_0
      id_23 = !-1;
    end
  end
  id_40(
      id_32
  );
  assign id_23 = id_29;
  wire id_41;
  id_42(
      .id_0(id_3), .id_1(-1 + 1)
  );
endmodule
