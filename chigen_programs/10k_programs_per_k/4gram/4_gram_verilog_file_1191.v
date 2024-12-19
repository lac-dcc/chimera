// Seed: 584252103
module module_0 (
    output wire id_0,
    input uwire id_1,
    input wor id_2
    , id_15,
    input uwire id_3,
    input tri id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    input uwire id_8,
    input wor id_9,
    output supply0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input wor id_13
);
  assign id_10 = 1'b0;
  assign module_1.type_0 = 0;
endmodule
module module_1 #(
    parameter id_8 = 32'd31,
    parameter id_9 = 32'd73
) (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    inout wire id_4,
    input supply1 id_5,
    output tri0 id_6
);
  defparam id_8.id_9 = 1'b0;
  wire  id_10;
  uwire id_11 = id_5;
  module_0 modCall_1 (
      id_11,
      id_2,
      id_1,
      id_11,
      id_3,
      id_1,
      id_11,
      id_5,
      id_2,
      id_5,
      id_11,
      id_4,
      id_5,
      id_2
  );
endmodule
