// Seed: 504824762
module module_0 (
    input wor id_0,
    output wor id_1,
    output uwire id_2,
    output uwire id_3,
    input tri id_4
    , id_25,
    output wand id_5,
    input wire id_6,
    output uwire id_7,
    input uwire id_8,
    input uwire id_9,
    input supply0 id_10,
    input tri id_11,
    output tri id_12,
    output supply1 id_13,
    input wire id_14,
    input wire id_15,
    output wor id_16,
    output supply0 id_17,
    output supply1 id_18,
    input wand id_19,
    input supply1 id_20
    , id_26,
    input supply0 id_21,
    output supply1 id_22,
    input tri id_23
);
  wire id_27;
  assign id_26 = "" ? id_8 : id_4;
  always @(posedge 1'h0 or posedge 1'h0) begin : LABEL_0
    id_7 = id_26;
  end
  assign module_1.id_0 = 0;
  assign id_12 = id_20;
  wire id_28;
endmodule
module module_1 (
    input wor id_0,
    output wand id_1,
    input supply1 id_2,
    output logic id_3,
    output supply0 id_4
);
  tri  id_6;
  wire id_7;
  initial id_3 = #1 1 * id_6;
  timeprecision 1ps;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_1,
      id_0,
      id_2,
      id_0,
      id_4,
      id_2
  );
endmodule
