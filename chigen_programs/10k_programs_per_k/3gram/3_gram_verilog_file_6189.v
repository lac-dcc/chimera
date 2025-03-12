// Seed: 2136069024
module module_0 #(
    parameter id_13 = 32'd43,
    parameter id_14 = 32'd46
) (
    input wor id_0,
    output supply0 id_1,
    input uwire id_2
    , id_11,
    output supply0 id_3,
    input tri id_4,
    input wand id_5,
    output supply0 id_6,
    output wor id_7,
    input wand id_8,
    input supply1 id_9
);
  integer id_12 = id_2;
  logic _id_13;
  wire [-1 : -1  +  id_13] _id_14;
  parameter id_15 = 1;
  wire [id_13 : id_14] id_16;
  wire id_17;
  reg id_18;
  always @(id_2 or posedge id_0) id_18 <= id_9;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input wor id_4,
    input tri1 id_5,
    input tri id_6
);
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_1,
      id_5,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5
  );
  assign modCall_1.id_9 = 0;
endmodule
