// Seed: 118933151
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd30
) (
    output uwire id_0,
    output uwire id_1[1 : id_5],
    input supply0 id_2,
    output wand id_3,
    input tri id_4,
    input wand _id_5
);
  wire id_7, id_8, id_9, id_10;
  nor primCall (id_1, id_7, id_9, id_2, id_10, id_8, id_4);
  assign id_10 = id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_7,
      id_7
  );
endmodule
