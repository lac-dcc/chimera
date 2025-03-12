// Seed: 3981295606
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri0 id_3,
    output supply1 id_4,
    output wand id_5,
    input tri id_6,
    input wor id_7,
    output supply1 id_8,
    input supply1 id_9,
    input wand id_10,
    input supply0 id_11
);
  wire id_13;
  ;
  tran (.id_0(-1), .id_1(1'd0));
  assign module_1.id_29 = 0;
  logic  id_14;
  string id_15 = "";
  wire   id_16;
  ;
  assign id_5 = 1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_25 = 32'd40,
    parameter id_27 = 32'd22
) (
    output wire id_0,
    input tri0 id_1["" : id_27],
    input supply1 id_2,
    input wor id_3,
    input supply1 id_4
    , id_31,
    input tri id_5,
    input tri1 id_6,
    input wor id_7,
    output uwire id_8,
    input supply1 id_9,
    input wor id_10,
    input wor id_11,
    input tri id_12,
    input tri0 id_13,
    output uwire id_14,
    input supply1 id_15,
    input uwire id_16,
    output wor id_17,
    input tri1 id_18,
    input wand id_19,
    output uwire id_20,
    output tri1 id_21,
    input supply1 id_22,
    input wand id_23,
    input wor id_24,
    input supply0 _id_25[-1 'b0 : 1],
    input wand id_26[-1 : id_25],
    input wor _id_27,
    output tri id_28,
    input uwire id_29
    , id_32
);
  rtran (1'b0, id_13, 1);
  module_0 modCall_1 (
      id_8,
      id_29,
      id_2,
      id_22,
      id_21,
      id_14,
      id_16,
      id_19,
      id_17,
      id_24,
      id_5,
      id_7
  );
endmodule
