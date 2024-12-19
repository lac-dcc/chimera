// Seed: 1726917771
module module_0 #(
    parameter id_10 = 32'd83,
    parameter id_11 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  wire id_9;
  defparam id_10.id_11 = 1 - id_6;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input wand id_2,
    input wor id_3,
    input tri id_4
    , id_14,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input uwire id_8,
    input wand id_9,
    input tri1 id_10,
    input wor id_11,
    output uwire id_12
);
  wire id_15;
  id_16(
      .id_0(1), .id_1(id_11), .id_2(1), .id_3(1), .id_4(1), .id_5(1)
  );
  wire id_17;
  module_0 modCall_1 (
      id_14,
      id_17,
      id_14,
      id_17,
      id_14,
      id_15,
      id_14
  );
  wire id_18;
  assign id_14 = id_6 / id_10 & 1;
endmodule
