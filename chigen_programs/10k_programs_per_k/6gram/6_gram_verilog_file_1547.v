// Seed: 3002306148
module module_0 #(
    parameter id_20 = 32'd11,
    parameter id_21 = 32'd22,
    parameter id_22 = 32'd28,
    parameter id_23 = 32'd99
) (
    input wor id_0,
    output tri id_1,
    input uwire id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wand id_5,
    output wor id_6,
    output wand id_7,
    input supply1 id_8,
    input tri1 id_9
    , id_18,
    input uwire id_10,
    output wand id_11,
    output tri1 module_0,
    input supply0 id_13,
    input supply1 id_14,
    input supply0 id_15,
    output tri1 id_16
);
  wire id_19;
  assign id_11 = id_10;
  generate
    if (id_14 - id_0) begin : LABEL_0
      defparam id_20.id_21 = 1; defparam id_22.id_23 = "";
    end else if (1) begin : LABEL_0
      wire id_24, id_25, id_26, id_27;
    end else begin : LABEL_0
      for (id_28 = id_0; {1, id_5 <= 1}; id_12 = 1 + id_9 - id_10) begin : LABEL_0
        wire id_29;
        id_30(
            .id_0((1)), .id_1(1'b0), .id_2(id_1), .id_3(id_28), .id_4(id_6)
        );
      end
    end
  endgenerate
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1
);
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  wire id_5;
  wire id_6;
endmodule
