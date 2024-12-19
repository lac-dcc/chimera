// Seed: 20416449
module module_0 #(
    parameter id_20 = 32'd53,
    parameter id_21 = 32'd97
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  tri0  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ;
  assign id_10 = id_13;
  assign id_9  = 1 ? id_2 : 1;
  defparam id_20.id_21 = id_21;
endmodule
module module_1 #(
    parameter id_23 = 32'd65,
    parameter id_24 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_21;
  generate
    if (1)
      if (1 && id_21 - id_17) begin : LABEL_0
        wire id_22;
      end else begin : LABEL_0
        defparam id_23.id_24 = 1;
      end
    else begin : LABEL_0
      assign id_6[1] = id_13;
    end
  endgenerate
  module_0 modCall_1 (
      id_20,
      id_18
  );
  assign modCall_1.id_18 = 0;
endmodule
