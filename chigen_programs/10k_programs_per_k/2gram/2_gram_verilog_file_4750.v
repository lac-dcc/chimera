// Seed: 3498500480
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4,
    output uwire id_5,
    output tri1 id_6,
    output supply0 id_7,
    output uwire id_8
    , id_25,
    input supply1 id_9,
    input uwire id_10,
    input wand id_11,
    output tri1 id_12,
    input tri1 id_13,
    input supply0 id_14,
    input uwire id_15,
    input wand id_16,
    input tri1 id_17
    , id_26,
    input supply1 id_18,
    input wire id_19,
    output supply1 id_20,
    output supply0 id_21,
    input wor id_22,
    output tri1 id_23
);
  assign id_25 = 1;
endmodule
module module_1 (
    input wire id_0,
    inout tri id_1,
    input tri id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    output tri1 id_6,
    output logic id_7,
    input tri id_8,
    input tri1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    input wand id_12,
    input uwire id_13,
    output supply1 id_14,
    output supply1 id_15,
    input wor id_16,
    input tri0 id_17,
    input tri0 id_18,
    input tri0 id_19,
    output wor id_20,
    output uwire id_21,
    output tri id_22,
    input wire id_23,
    output tri0 id_24
);
  wire id_26;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_4,
      id_9,
      id_1,
      id_14,
      id_20,
      id_22,
      id_15,
      id_0,
      id_18,
      id_18,
      id_21,
      id_16,
      id_11,
      id_2,
      id_19,
      id_11,
      id_1,
      id_3,
      id_14,
      id_15,
      id_23,
      id_1
  );
  assign modCall_1.id_11 = 0;
  logic id_27;
  ;
  initial begin : LABEL_0
    assert (1'b0);
    id_7 <= 1 + id_26;
  end
endmodule
