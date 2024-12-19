// Seed: 209851501
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
  assign module_1.id_17 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd18,
    parameter id_17 = 32'd45
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  tri1 id_15;
  defparam id_16.id_17 = id_8;
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_18,
      id_4,
      id_14,
      id_14,
      id_4
  );
  wire id_19;
  id_20(
      .id_0(1 < id_11#(.id_1(id_10 - id_2[1]))),
      .id_2(~id_15),
      .id_3(),
      .id_4(1),
      .id_5(1'b0 == id_14),
      .id_6(id_2)
  );
  or primCall (id_4, id_6, id_18, id_14, id_5, id_9, id_16, id_15, id_11, id_8, id_13, id_17);
endmodule
