// Seed: 3291491794
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input tri id_2,
    input tri id_3,
    input uwire id_4,
    input supply0 id_5,
    output wand id_6,
    output tri0 id_7,
    output wire id_8,
    input tri1 id_9,
    input wand id_10,
    output wor id_11,
    output supply0 id_12,
    output tri id_13,
    input tri0 id_14,
    input uwire id_15,
    output wire id_16,
    output wand id_17,
    output tri id_18
);
  wire id_20, id_21 = !id_15 + id_1;
  assign module_1._id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd31,
    parameter id_3 = 32'd83
) (
    input supply1 id_0,
    output tri0 id_1,
    input supply1 _id_2,
    input tri0 _id_3,
    output tri0 id_4,
    output tri id_5
);
  wire [id_2 : id_2] id_7;
  nor primCall (id_4, id_7, id_8, id_9, id_0);
  wire [id_3 : id_2] id_8;
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_1,
      id_5,
      id_4
  );
  wire id_10;
  localparam id_11 = -1;
endmodule
