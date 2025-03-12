// Seed: 2925396746
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input supply1 id_2
);
  logic id_4;
endmodule
module module_1 #(
    parameter id_4 = 32'd90,
    parameter id_5 = 32'd3,
    parameter id_6 = 32'd33,
    parameter id_7 = 32'd63,
    parameter id_8 = 32'd97
) (
    output wire id_0,
    input wire id_1,
    input supply0 id_2,
    output uwire id_3,
    input wand _id_4,
    output tri0 _id_5,
    output wor _id_6,
    output wire _id_7,
    input supply0 _id_8,
    input tri1 id_9,
    output uwire id_10,
    input tri1 id_11,
    input wire id_12,
    input supply0 id_13,
    output supply1 id_14
);
  union packed {
    logic [1 'h0 -  id_6 : id_7] id_16;
    struct packed {
      logic id_17;
      struct packed {
        logic id_18;
        id_19 id_20;
      } [id_5 : id_4] id_21;
    } [1 : ""] id_22;
  } id_23;
  logic [id_8 : -1] id_24;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_12
  );
endmodule
