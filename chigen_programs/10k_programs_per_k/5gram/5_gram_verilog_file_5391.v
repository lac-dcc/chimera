// Seed: 3526118707
module module_0 #(
    parameter id_18 = 32'd34,
    parameter id_19 = 32'd90
) (
    input supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    output wire id_4,
    input tri id_5,
    input supply0 id_6,
    output supply0 id_7,
    output supply0 id_8,
    input wor id_9,
    input wor id_10,
    input wire id_11,
    input supply0 id_12,
    input tri0 id_13,
    input supply1 id_14
);
  assign id_4 = 1;
  wire id_16;
  wire id_17;
  defparam id_18.id_19 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply0 id_4
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
