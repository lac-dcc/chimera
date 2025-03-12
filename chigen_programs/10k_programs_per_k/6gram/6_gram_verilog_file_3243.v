// Seed: 1463466224
module module_0 #(
    parameter id_27 = 32'd96
) (
    input tri0 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wand id_3,
    output wire id_4,
    output wor id_5,
    input wand id_6
    , id_26,
    input wor id_7,
    input supply0 id_8,
    input supply1 id_9,
    input wor id_10,
    input supply0 id_11,
    input uwire id_12,
    output tri1 id_13,
    output supply1 id_14,
    input supply1 id_15
    , _id_27,
    input supply0 id_16,
    output tri0 id_17,
    input wand id_18,
    input supply0 id_19,
    output uwire id_20,
    input supply1 id_21,
    output tri0 id_22,
    output supply0 id_23,
    input tri1 id_24
);
  supply0 [1 : -1] id_28 = -1;
  assign module_1.id_0 = 0;
  logic id_29;
  logic [id_27 : 1] id_30 = id_28 - -1;
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    output wand  id_2,
    input  uwire id_3,
    output uwire id_4
);
  wire id_6;
  always @* begin : LABEL_0
    id_0 = id_3;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_4,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1,
      id_1,
      id_4,
      id_1,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_1
  );
endmodule
