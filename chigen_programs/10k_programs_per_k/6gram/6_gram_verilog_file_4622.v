// Seed: 2155393101
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output uwire id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    input wor id_9,
    input wor id_10,
    output wire id_11,
    input tri1 id_12,
    input wand id_13,
    output uwire id_14
);
  wire id_16;
  assign id_8 = 1;
  assign module_1.id_0 = 0;
  wire id_17;
  wire id_18;
  assign id_18 = id_17;
endmodule
module module_1 #(
    parameter id_10 = 32'd82,
    parameter id_11 = 32'd58
) (
    input wor id_0,
    input supply1 id_1,
    inout supply1 id_2,
    input wire id_3,
    input wor id_4,
    input tri1 id_5
);
  wire id_7;
  wire id_8, id_9;
  defparam id_10.id_11 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_2,
      id_5,
      id_2,
      id_5,
      id_2,
      id_2,
      id_5,
      id_2,
      id_2
  );
endmodule
