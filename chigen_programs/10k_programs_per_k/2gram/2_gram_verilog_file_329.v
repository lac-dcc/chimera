// Seed: 3132157084
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    output tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    input wor id_7,
    input tri1 id_8
);
  wire id_10;
  assign module_1.id_3 = 0;
  wire id_11;
endmodule
module module_1 #(
    parameter id_1  = 32'd86,
    parameter id_11 = 32'd25
) (
    input wor id_0,
    input supply0 _id_1
    , _id_11,
    input tri1 id_2,
    output uwire id_3,
    input wire id_4,
    output tri1 id_5,
    input tri0 id_6,
    input wand id_7,
    input supply0 id_8,
    output uwire id_9
    , id_12
);
  logic [id_11 : -1 'b0] id_13;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_9,
      id_5,
      id_6,
      id_7,
      id_4,
      id_7,
      id_6
  );
  assign id_9 = id_12[id_1 : id_11];
endmodule
