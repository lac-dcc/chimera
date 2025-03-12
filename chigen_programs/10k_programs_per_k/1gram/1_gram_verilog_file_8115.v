// Seed: 3415795442
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wire id_3,
    input wand id_4
);
  reg id_6;
  ;
  always assume (-1) id_6 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    input supply1 id_3,
    output wor id_4
);
  assign id_2.id_3 = ~id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_6;
  wire id_7;
endmodule
module module_2 #(
    parameter id_0 = 32'd3,
    parameter id_2 = 32'd87,
    parameter id_3 = 32'd70,
    parameter id_6 = 32'd7
) (
    input tri0 _id_0,
    input tri0 id_1,
    input wire _id_2,
    input tri1 _id_3,
    input wor id_4,
    output logic id_5,
    input tri0 _id_6,
    output uwire id_7,
    output wand id_8[id_0 : id_2  &  id_3  ?  -1 : -1 'd0],
    inout supply0 id_9,
    input tri0 id_10,
    input tri1 id_11
);
  wire  id_13 [id_6 : 1];
  logic id_14;
  assign id_8 = {id_2{-1}};
  logic id_15 = id_13;
  assign id_5  = id_9;
  assign id_15 = id_6 > id_3;
  always if (1 & 1 ? 1 : 1 - -1) id_5 <= -1;
  assign id_7 = id_10;
  module_0 modCall_1 (
      id_9,
      id_4,
      id_10,
      id_9,
      id_9
  );
  assign modCall_1.id_1 = 0;
  wire id_16;
endmodule
