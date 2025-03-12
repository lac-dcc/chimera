// Seed: 44471342
module module_0 (
    output tri0 id_0,
    output supply1 id_1,
    output wand id_2,
    output tri0 id_3,
    output wire id_4,
    input supply0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input tri0 id_8,
    output wand id_9,
    input tri0 id_10,
    output tri1 id_11,
    input tri0 id_12,
    input uwire id_13,
    output tri1 id_14,
    input wire id_15,
    input uwire id_16,
    input wire id_17
    , id_24,
    input wand id_18,
    input tri0 id_19,
    input wor id_20,
    input wand id_21,
    output uwire id_22
);
  wire id_25;
  wire [1 : 1] id_26;
  generate
    wire id_27;
  endgenerate
  initial $clog2(55);
  ;
  id_28 :
  assert property (@(posedge 1'b0) id_16)
  else;
  assign id_26 = id_17;
  wire id_29;
  wire id_30;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd49,
    parameter id_4 = 32'd21
) (
    input supply1 id_0,
    output supply1 _id_1,
    input wand id_2,
    output supply1 id_3,
    output supply0 _id_4,
    input supply0 id_5
);
  integer [id_1  -  id_4 : -1] id_7 = 1'b0 & id_7 - 1 & ~1;
  xor primCall (id_3, id_7, id_5, id_2, id_0);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_5,
      id_3,
      id_2,
      id_3,
      id_5,
      id_0,
      id_3,
      id_0,
      id_5,
      id_5,
      id_0,
      id_0,
      id_2,
      id_5,
      id_3
  );
endmodule
