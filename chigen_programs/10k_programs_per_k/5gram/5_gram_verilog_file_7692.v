// Seed: 374597764
module module_0 (
    output wor id_0,
    input wand id_1,
    input supply1 id_2,
    input wire id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wand id_6,
    input tri1 id_7
);
  wire id_9;
  ;
  assign id_0 = -1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd24,
    parameter id_8 = 32'd6
) (
    input wand id_0,
    output supply0 id_1,
    input wire id_2,
    output wand id_3,
    output supply0 id_4,
    output supply0 id_5,
    input supply0 _id_6,
    input wire id_7,
    input tri _id_8
    , id_11,
    input wire id_9
);
  wire [id_8 : id_6] id_12;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_7,
      id_9,
      id_9,
      id_0,
      id_5,
      id_9
  );
  wire id_13;
  xnor primCall (id_1, id_11, id_9, id_0, id_2, id_7, id_12);
endmodule
