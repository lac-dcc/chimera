// Seed: 480302120
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output uwire id_2,
    output tri id_3,
    input wire id_4,
    input tri0 id_5,
    input tri1 id_6
    , id_20,
    output tri1 id_7,
    output supply1 id_8,
    output tri0 id_9,
    input wor id_10,
    input wire id_11,
    input wand id_12,
    input tri0 id_13,
    input wand id_14,
    output tri0 id_15,
    input uwire id_16,
    input wire id_17,
    input wand id_18
);
  always_ff @(posedge id_20);
  assign module_1.id_20 = 0;
  assign id_20 = id_4;
endmodule
module module_1 #(
    parameter id_10 = 32'd6,
    parameter id_11 = 32'd15,
    parameter id_6  = 32'd57
) (
    output wand id_0,
    input wor id_1,
    output uwire id_2,
    input wor id_3,
    output tri1 id_4,
    input wor id_5,
    input wand _id_6,
    output tri0 id_7,
    input wand id_8,
    output tri1 id_9,
    output supply0 _id_10,
    input tri1 _id_11,
    input wire id_12,
    input wor id_13,
    output wand id_14,
    input supply0 id_15,
    output wor id_16,
    output supply0 id_17,
    input supply1 id_18,
    input supply0 id_19#(1),
    output supply0 id_20,
    output wor id_21,
    input wand id_22,
    input wor id_23,
    input supply0 id_24,
    output wor id_25,
    input uwire id_26
);
  wire id_28;
  module_0 modCall_1 (
      id_22,
      id_1,
      id_2,
      id_20,
      id_24,
      id_19,
      id_8,
      id_0,
      id_25,
      id_25,
      id_5,
      id_15,
      id_3,
      id_3,
      id_24,
      id_20,
      id_8,
      id_24,
      id_26
  );
  struct packed {
    logic [1 : id_10] id_29;
    struct packed {
      logic [-1 : 1 'h0] id_30;
      logic [-1 : -1] id_31;
    } [id_6 : id_11] id_32;
  } [-1 'b0 : 1] id_33;
endmodule
