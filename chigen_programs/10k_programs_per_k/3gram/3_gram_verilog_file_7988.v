// Seed: 1792194572
module module_0 (
    output wor id_0,
    output wire id_1
    , id_14,
    input tri id_2,
    output wor id_3,
    input tri1 id_4,
    input wire id_5,
    input wand id_6,
    input supply0 id_7,
    input tri id_8,
    input wand id_9,
    input tri0 id_10,
    input tri id_11,
    input tri1 id_12
);
endmodule
module module_1 #(
    parameter id_4 = 32'd11,
    parameter id_9 = 32'd99
) (
    output supply0 id_0,
    output wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input wand _id_4
);
  wire id_6;
  ;
  logic [1 : -1] id_7, id_8;
  wire _id_9;
  assign id_8[id_9 : 1] = id_7;
  wire id_10;
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
  nmos #(-1) (id_2, -1 == id_7, -1, id_0, id_6);
endmodule
