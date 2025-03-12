// Seed: 4136580883
module module_0 (
    output tri id_0,
    input tri id_1,
    input supply1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output uwire id_5
    , id_27,
    output wand id_6,
    output tri0 id_7,
    input wor id_8,
    output tri1 id_9,
    input uwire id_10,
    output wand id_11,
    output tri1 id_12,
    input wire id_13,
    output tri1 id_14,
    input wor id_15,
    input wor id_16,
    output wire id_17,
    input wor id_18,
    input uwire id_19,
    output wire id_20,
    output tri1 id_21,
    input tri1 id_22,
    output tri1 id_23,
    output tri id_24,
    output tri0 id_25
);
  wire id_28;
  wire id_29;
  id_30(
      -1
  );
  wire id_31;
  always_ff begin : LABEL_0
    assign id_28[-1'd0] = id_30;
  end
  assign id_7 = id_4;
  wire id_32;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wire id_4,
    output tri1 id_5,
    output logic id_6
);
  localparam id_8 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_0,
      id_5,
      id_5,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2,
      id_3,
      id_3,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.id_11 = 0;
  initial id_6 = "";
endmodule
