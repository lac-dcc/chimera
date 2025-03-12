// Seed: 3408360291
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    output wand id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri id_8,
    output uwire id_9,
    input wire id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    output supply0 id_14,
    input supply0 id_15,
    input wor id_16,
    input supply0 id_17,
    output tri id_18,
    input tri id_19,
    output supply0 id_20,
    output supply1 id_21,
    input tri0 id_22,
    input wire id_23,
    output uwire id_24,
    output tri1 id_25,
    input tri0 id_26,
    input tri0 id_27
);
  localparam id_29 = 1;
  wire id_30;
  assign module_1.id_19 = 0;
  specify
    if (1'd0) (posedge id_31 => (id_32 +: id_17)) = (id_15, 1'd0);
  endspecify
endmodule
module module_0 #(
    parameter id_20 = 32'd45,
    parameter id_21 = 32'd83
) (
    input wand id_0,
    input wor id_1,
    input wire id_2,
    output supply0 id_3,
    input wire id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input tri1 id_8,
    output tri1 module_1,
    input tri0 id_10,
    output tri id_11,
    input tri id_12,
    input wire id_13,
    output tri id_14,
    input wire id_15,
    input supply0 id_16,
    output supply0 id_17,
    input wire id_18,
    input supply1 id_19,
    input uwire _id_20,
    output supply1 _id_21,
    output wand id_22
);
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_13,
      id_3,
      id_17,
      id_5,
      id_11,
      id_11,
      id_17,
      id_5,
      id_11,
      id_10,
      id_18,
      id_14,
      id_0,
      id_2,
      id_5,
      id_6,
      id_1,
      id_3,
      id_22,
      id_5,
      id_2,
      id_22,
      id_3,
      id_0,
      id_0
  );
  logic [1 : id_20  -  id_21] id_24 = id_10#(
      .id_12(1),
      .id_7 (1)
  );
  or primCall (id_3, id_16, id_19, id_2, id_5, id_15, id_10, id_1, id_4, id_13);
endmodule
