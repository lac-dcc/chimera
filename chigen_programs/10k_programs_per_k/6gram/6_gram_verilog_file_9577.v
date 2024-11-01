// Seed: 1499359917
module module_0 #(
    parameter id_34 = 32'd7,
    parameter id_35 = 32'd74
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  output wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_27;
  wire id_28;
  assign id_25 = module_0;
  wire id_29;
  generate
    for (id_30 = 1'd0; 1; id_16 = 1) begin : id_31
      id_32(
          .id_0(id_19),
          .id_1(id_12),
          .id_2(id_2),
          .id_3(1),
          .id_4(id_21),
          .id_5(1'b0),
          .id_6((1)),
          .id_7(id_26)
      );
    end
  endgenerate
  wire id_33;
  defparam id_34.id_35 = 1;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wor   id_4,
    output tri   id_5
);
  tri id_7;
  assign id_0 = id_7;
  assign id_0 = 1 ? id_7 : id_2;
  wire id_8;
  tri  id_9 = id_3 - 1;
  module_0(
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_9,
      id_9
  );
endmodule
