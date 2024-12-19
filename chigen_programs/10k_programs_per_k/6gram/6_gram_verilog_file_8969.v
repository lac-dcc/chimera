// Seed: 3671946014
module module_0 (
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
    id_14
);
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_15 = 1;
  always id_15 <= #id_1 1;
  wire id_16;
  id_17(
      .id_0(1), .id_1(1), .id_2(), .id_3(1), .id_4(~(id_15)), .id_5(1 < id_7)
  );
endmodule
module module_1 (
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
    id_17
);
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire module_1;
  wire id_18;
  wire id_19;
  always @* begin : LABEL_0
    if (id_15) id_15 <= 1;
  end
  wire id_20;
  assign id_13[1==?1] = 1'd0;
  wire id_21, id_22;
  wire id_23;
  module_0 modCall_1 (
      id_21,
      id_12,
      id_14,
      id_6,
      id_12,
      id_1,
      id_1,
      id_2,
      id_6,
      id_9,
      id_12,
      id_8,
      id_7,
      id_20
  );
  assign modCall_1.type_18 = 0;
  assign id_4 = id_14;
endmodule
