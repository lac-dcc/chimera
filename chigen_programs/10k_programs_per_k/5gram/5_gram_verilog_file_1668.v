// Seed: 1025786322
module module_0 (
    output wor id_0,
    output tri1 id_1,
    output tri id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply1 id_6
);
  parameter id_8 = 1;
  wand id_9;
  assign id_9 = 1 && id_4;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wor id_0,
    output wor id_1,
    input uwire id_2,
    output wand id_3,
    output supply1 id_4,
    input wor id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_2,
      id_1
  );
endmodule
module module_0 #(
    parameter id_0  = 32'd21,
    parameter id_18 = 32'd19,
    parameter id_4  = 32'd84
) (
    input uwire _id_0,
    output supply1 id_1,
    output logic id_2
    , id_34,
    input supply1 id_3,
    input supply0 _id_4,
    input uwire id_5,
    output tri id_6,
    output tri id_7,
    input tri0 id_8,
    output tri1 id_9,
    input tri0 id_10,
    output tri0 id_11,
    output supply1 id_12,
    output supply0 id_13,
    input wire id_14,
    input supply0 id_15,
    output wor id_16,
    input wire id_17,
    input supply1 _id_18
    , id_35,
    input wor id_19,
    output tri0 id_20,
    input uwire id_21,
    input wand id_22,
    input tri1 id_23,
    input supply0 id_24,
    output tri0 id_25,
    output wire id_26,
    inout wire id_27,
    input wire id_28,
    output wire id_29,
    input tri0 id_30,
    input wor id_31,
    output tri0 id_32
);
  supply1 module_2 = 1;
  wire id_36, id_37, id_38;
  always @(-1, posedge id_5) id_2 <= -1;
  logic [id_0 : -1] id_39;
  logic [id_18 : id_4] id_40;
  wire id_41;
  ;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_16,
      id_8,
      id_15,
      id_23,
      id_25
  );
  assign modCall_1.id_0 = 0;
endmodule
