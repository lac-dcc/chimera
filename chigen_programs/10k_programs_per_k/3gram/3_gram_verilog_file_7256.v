// Seed: 3324323586
module module_0 (
    output tri id_0,
    input uwire id_1
    , id_19,
    input wire id_2,
    input wor id_3,
    input supply0 id_4,
    output supply1 id_5,
    output wand id_6,
    output supply1 id_7,
    output uwire id_8,
    input wor id_9,
    input wor id_10,
    input uwire id_11
    , id_20,
    input uwire id_12,
    input uwire id_13,
    input wand id_14,
    input supply0 id_15,
    input tri id_16,
    output supply0 id_17
    , id_21
);
  supply1 id_22 = 1;
  static logic id_23;
  ;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4,
    output logic id_5,
    input tri id_6,
    output supply0 id_7
);
  always_ff @(negedge "") begin : LABEL_0
    id_5 <= id_4;
  end
  localparam id_9 = 1;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_1,
      id_0,
      id_3,
      id_7,
      id_7,
      id_7,
      id_7,
      id_2,
      id_4,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_2,
      id_7
  );
  assign modCall_1.id_11 = 0;
  logic id_10;
  wire  id_11;
  ;
  logic [1 : -1] id_12;
  ;
  assign id_12 = id_4;
endmodule
