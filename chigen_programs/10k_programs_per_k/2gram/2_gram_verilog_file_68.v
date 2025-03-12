// Seed: 3798784171
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7,
    input tri1 id_8,
    input wire id_9,
    input wor id_10,
    output wire id_11,
    output tri1 id_12,
    input supply0 id_13,
    input wand id_14,
    output wand id_15,
    output supply1 id_16
);
endmodule
module module_1 #(
    parameter id_10 = 32'd60,
    parameter id_8  = 32'd42
) (
    input wand id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply0 id_4,
    output tri0 id_5,
    input uwire id_6
);
  wire _id_8;
  assign id_5 = 'h0;
  logic id_9;
  wire  _id_10;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_6,
      id_4,
      id_6,
      id_6,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3,
      id_2,
      id_5,
      id_5
  );
  assign id_5 = id_9;
  assign id_9 = -1;
  wire [-1 'b0 : id_8] id_11;
  xor primCall (id_5, id_9, id_6, id_2, id_4);
  wire [1 : id_10] id_12;
endmodule
