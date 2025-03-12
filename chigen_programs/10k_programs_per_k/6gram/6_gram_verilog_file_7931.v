// Seed: 4189524664
module module_0 #(
    parameter id_13 = 32'd95
) (
    input uwire id_0,
    input wire id_1,
    input wand id_2,
    input uwire id_3,
    input supply0 id_4
    , id_12,
    input tri0 id_5
    , _id_13,
    output wor id_6,
    input supply1 id_7,
    input wand id_8,
    output wire id_9,
    input tri0 id_10
);
  wire id_14;
  assign id_12[(id_13) :-1'b0] = id_14;
  logic [id_13 : -1 'b0 ==  1] id_15;
  ;
  logic id_16[(  -1  ) : -1 'b0];
  ;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    output uwire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_5 = 0;
  logic id_6;
  assign id_3 = -1;
endmodule
