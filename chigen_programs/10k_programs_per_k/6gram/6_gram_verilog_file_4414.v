// Seed: 3148021768
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3 = id_2;
  wire id_4;
  wand id_5 = 1 == 1;
  wire id_6;
endmodule
module module_1;
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign id_1 = 1;
endmodule
module module_2 #(
    parameter id_19 = 32'd31,
    parameter id_20 = 32'd62
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
    id_18
);
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    if (1'b0 == id_16) begin : LABEL_0
      defparam id_19.id_20 = id_19; id_21(
          .id_0(), .id_1(id_12 !== 1), .id_2(1), .id_3(id_6[1|1]), .id_4(1'd0), .id_5(1)
      );
    end else id_22(.id_0(id_17), .id_1(id_4));
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_11
  );
endmodule
