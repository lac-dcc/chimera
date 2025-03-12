// Seed: 4230786293
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    output supply1 id_2,
    output supply1 id_3
    , id_10,
    input supply0 id_4,
    output supply0 id_5,
    output uwire id_6,
    input tri id_7,
    input tri1 id_8
);
  wire [1 : -1 'b0] id_11;
  localparam time id_12 = -1'h0;
  wire [1 : -1 'b0] id_13;
  wire id_14;
  ;
endmodule
macromodule module_1 (
    output supply0 id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri1 id_3
    , id_12,
    input supply1 id_4,
    input uwire id_5,
    input uwire id_6,
    input uwire id_7,
    input wor id_8,
    input wor id_9,
    input tri1 id_10
);
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_10,
      id_10
  );
  assign modCall_1.id_4 = 0;
endmodule
