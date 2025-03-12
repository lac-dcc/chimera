// Seed: 3286331998
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_2.id_2 = 0;
  integer id_5, id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  buf primCall (id_1, id_2);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
  logic id_4;
  ;
endmodule
module module_2 #(
    parameter id_1 = 32'd87,
    parameter id_3 = 32'd61
) (
    output supply0 id_0,
    input tri0 _id_1,
    output wand id_2,
    input tri1 _id_3,
    input wand id_4,
    output wor id_5,
    input tri0 id_6,
    output uwire id_7,
    output wand id_8
);
  wire [  id_1 : -1  >  1] id_10;
  wire [id_3  ==  -1 : -1] id_11;
  assign id_5 = {id_10 - id_11, id_6} == 'b0 ? id_3 : id_3;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10
  );
endmodule
