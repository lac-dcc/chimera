// Seed: 3660454153
module module_0 (
    output supply0 id_0,
    input supply1 id_1[-1 'b0 ==  1 : -1 'b0],
    output tri0 id_2,
    output wand id_3,
    input tri id_4,
    input supply1 id_5,
    output wand id_6,
    input supply1 id_7,
    input tri id_8,
    input wor id_9,
    input wand id_10,
    input wire id_11,
    output supply0 id_12,
    input wire id_13,
    input uwire id_14,
    input wor id_15,
    input tri id_16,
    input uwire id_17,
    input supply0 id_18,
    output wor id_19,
    output wand id_20,
    output supply0 id_21,
    input supply1 id_22,
    output wand id_23,
    input wand id_24,
    input supply0 id_25,
    input wor id_26
);
  assign id_6#(
      .id_18(1),
      .id_10(1),
      .id_8 (1)
  ) = 1 ? id_4 : -1'b0;
  assign id_12 = id_18;
  assign id_12 = 1;
  logic id_28;
  ;
  wire id_29;
  ;
  parameter id_30 = 1'd0;
endmodule
module module_1 #(
    parameter id_14 = 32'd86
) (
    output supply1 id_0,
    input supply0 id_1
    , id_24,
    output tri id_2,
    input wire id_3,
    output supply1 id_4,
    output tri1 id_5#(
        .id_25(1),
        .id_26(-1),
        .id_27(1),
        .id_28(-1)
    ),
    input tri0 id_6,
    input wand id_7,
    input tri1 id_8,
    input tri id_9,
    input wire id_10,
    input tri id_11,
    input supply1 id_12[-1 : 1],
    output tri1 id_13,
    input tri0 _id_14,
    input tri id_15,
    output tri id_16,
    input tri0 id_17,
    output logic id_18,
    input supply0 id_19,
    output wand id_20,
    output tri0 id_21,
    output uwire id_22[1 : id_14]
    , id_29 = -1'b0
);
  id_30 :
  assert property (@(negedge -1 or posedge -1'b0 or id_1 or posedge 1) id_29[1'b0==-1])
    id_18 <= id_25;
  assign id_27 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_5,
      id_21,
      id_15,
      id_6,
      id_5,
      id_6,
      id_7,
      id_8,
      id_12,
      id_8,
      id_5,
      id_15,
      id_15,
      id_1,
      id_10,
      id_12,
      id_19,
      id_2,
      id_4,
      id_22,
      id_3,
      id_4,
      id_12,
      id_3,
      id_8
  );
  assign modCall_1.id_24 = 0;
  wire id_31 = id_31;
  assign id_22 = id_28;
endmodule
