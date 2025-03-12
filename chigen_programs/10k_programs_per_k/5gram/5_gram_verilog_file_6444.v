// Seed: 527611142
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply0 id_3,
    output tri id_4
);
  wire id_6;
endmodule
module module_1 #(
    parameter id_15 = 32'd21,
    parameter id_3  = 32'd47,
    parameter id_5  = 32'd7
) (
    input uwire id_0,
    output uwire id_1,
    output wor id_2,
    input supply1 _id_3,
    output wand id_4,
    input tri0 _id_5,
    input tri id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output uwire id_11,
    input uwire id_12
);
  wire id_14;
  wire _id_15;
  parameter id_16 = -1 && 1;
  xnor primCall (id_11, id_14, id_8, id_10, id_9, id_7, id_12, id_0, id_16, id_6);
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_7,
      id_11
  );
  assign modCall_1.id_2 = 0;
  wire [id_15 : id_3] id_17;
  wire [1 : id_5] id_18;
endmodule
