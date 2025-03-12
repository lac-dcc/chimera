// Seed: 2179246047
module module_0 (
    output wor id_0,
    output wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    output tri1 id_4,
    input supply0 id_5,
    output uwire id_6,
    output supply0 id_7,
    input wor id_8,
    input tri0 id_9,
    input uwire id_10,
    input wor id_11,
    input uwire id_12
    , id_16,
    input supply0 id_13,
    input tri0 id_14
);
  assign id_0 = id_12;
  assign module_1.id_20 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd48
) (
    output uwire id_0,
    output tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    output uwire id_4,
    output logic id_5,
    output uwire id_6,
    input uwire id_7,
    input wire id_8,
    input wand id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply1 id_12,
    input wand id_13,
    input tri0 _id_14,
    input tri1 id_15,
    output wire id_16,
    input tri id_17,
    input wand id_18,
    input wire id_19,
    input uwire id_20,
    input uwire id_21
);
  reg [id_14 : 1 'b0] id_23, id_24;
  initial begin : LABEL_0
    id_24 = id_9;
  end
  always id_5 = id_14;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_2,
      id_10,
      id_4,
      id_20,
      id_0,
      id_6,
      id_2,
      id_9,
      id_15,
      id_8,
      id_7,
      id_15,
      id_7
  );
endmodule
