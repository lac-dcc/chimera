// Seed: 3716439248
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input wand id_2,
    output tri id_3,
    input tri0 id_4,
    input supply1 id_5,
    input supply1 id_6,
    output tri id_7,
    output supply1 id_8,
    input tri1 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input tri id_12,
    input supply0 id_13,
    input wire id_14,
    output wire id_15,
    output tri0 id_16,
    input tri1 id_17,
    input supply0 id_18,
    output tri id_19
);
  id_21 :
  assert property (@(posedge {id_0, 1'b0}) 1)
  else;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd44,
    parameter id_8 = 32'd49
) (
    input uwire id_0,
    output wand _id_1,
    output uwire id_2,
    input wor id_3,
    input supply0 id_4,
    input wand id_5,
    input supply1 id_6,
    input wand id_7,
    input supply0 _id_8,
    output wire id_9,
    input wor id_10,
    output supply1 id_11
);
  assign id_9 = id_5 == 1'b0;
  wire id_13;
  wire id_14;
  ;
  logic [1  &&  id_1 : id_8] id_15;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_7,
      id_2,
      id_7,
      id_7,
      id_6,
      id_11,
      id_11,
      id_7,
      id_10,
      id_0,
      id_5,
      id_7,
      id_7,
      id_11,
      id_9,
      id_7,
      id_6,
      id_9
  );
  wire id_16;
  assign id_11 = 1;
endmodule
