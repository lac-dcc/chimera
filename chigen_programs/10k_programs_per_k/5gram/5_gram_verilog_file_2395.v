// Seed: 3742221406
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input supply1 id_2,
    output supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wor id_7,
    input wire id_8,
    input wand id_9,
    output tri id_10,
    output uwire id_11,
    output uwire id_12,
    output wor id_13,
    input wor id_14
);
  assign id_0 = id_2 ? 1 : id_6;
  wire id_16;
  assign module_1.type_16 = 0;
  wire id_17;
  wire id_18;
  id_19(
      .id_0(1), .id_1(1)
  );
  wire id_20;
  id_21(
      .id_0(id_13), .id_1(1), .id_2(id_8), .id_3(id_4)
  );
endmodule
module module_1 #(
    parameter id_10 = 32'd28,
    parameter id_9  = 32'd3
) (
    output uwire id_0,
    output wand id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wire id_4,
    input supply1 id_5
);
  assign id_1 = 1;
  uwire id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_0,
      id_1,
      id_3,
      id_5,
      id_1,
      id_2,
      id_5,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2
  );
  assign id_1 = id_4;
  tri0 id_8;
  assign id_8 = id_2;
  assign id_0 = id_3;
  defparam id_9.id_10 = (id_7);
  wire id_11;
endmodule
