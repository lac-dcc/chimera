// Seed: 933019888
module module_0 (
    output uwire id_0
    , id_27,
    output uwire id_1,
    input uwire id_2
    , id_28,
    output wor id_3,
    output wor id_4
    , id_29,
    output uwire id_5,
    output uwire id_6
    , id_30,
    output supply0 id_7,
    input tri id_8,
    input tri id_9,
    output supply1 id_10,
    input wire id_11,
    input wire id_12,
    output tri1 id_13,
    input supply1 id_14,
    input tri1 id_15,
    input tri id_16,
    input tri id_17,
    output wand id_18,
    input wire id_19,
    input wor id_20,
    output supply0 id_21,
    output supply1 id_22,
    input wand id_23,
    input supply1 id_24,
    input supply0 id_25
);
endmodule
module module_1 #(
    parameter id_15 = 32'd47,
    parameter id_3  = 32'd71
) (
    input tri0 id_0,
    output logic id_1,
    input tri id_2,
    input supply1 _id_3,
    output tri id_4,
    input supply0 id_5,
    input wor id_6,
    input tri1 id_7,
    output uwire id_8,
    input wand id_9,
    input tri1 id_10,
    output tri1 id_11,
    output wor id_12,
    input wor id_13,
    input supply1 id_14,
    input tri _id_15,
    output wire id_16,
    input uwire id_17
);
  module_0 modCall_1 (
      id_16,
      id_12,
      id_14,
      id_8,
      id_11,
      id_4,
      id_11,
      id_4,
      id_14,
      id_14,
      id_12,
      id_6,
      id_6,
      id_11,
      id_17,
      id_14,
      id_0,
      id_2,
      id_8,
      id_7,
      id_2,
      id_8,
      id_8,
      id_7,
      id_7,
      id_13
  );
  assign modCall_1.id_17 = 0;
  id_19 :
  assert property (@(negedge -1'b0) -1)
  else id_1 <= 1;
  wire [id_3 : id_15] id_20;
endmodule
