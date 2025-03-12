// Seed: 2262701
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri id_2,
    output supply0 id_3,
    input tri0 id_4,
    output tri id_5,
    output wand id_6,
    output supply1 id_7,
    input wor id_8,
    input wor id_9
);
  logic id_11;
  ;
  logic id_12;
  localparam id_13 = -1'b0;
  logic [1 : 1] id_14;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd56,
    parameter id_2  = 32'd39
) (
    output wor id_0,
    input tri1 id_1,
    output tri1 _id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wire id_5,
    input tri1 id_6
);
  parameter id_8 = 1;
  wire id_9;
  logic [1 : -1 'h0] id_10 = -1'h0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_0,
      id_0,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
  logic [id_2 : 1  ^  1] _id_11;
  ;
  assign id_0#(
      .id_5 (id_8[id_11==~(-1'h0) : (1)]),
      .id_10(id_8.id_8)
  ) = -1;
endmodule
