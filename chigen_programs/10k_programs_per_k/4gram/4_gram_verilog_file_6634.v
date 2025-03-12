// Seed: 493822499
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    input wand id_3,
    output supply0 id_4,
    output uwire id_5,
    input wire id_6,
    output tri0 id_7,
    output wor id_8,
    output wire id_9,
    input wire id_10,
    input tri id_11,
    input wor id_12,
    input supply0 id_13,
    input wand id_14
);
  wire id_16;
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd63
) (
    input wor id_0,
    output wire _id_1,
    input wand id_2,
    output tri id_3,
    input uwire id_4,
    output uwire id_5,
    output supply0 id_6
);
  wire id_8;
  logic [id_1 : 1 'b0] id_9;
  wire id_10;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_5,
      id_3,
      id_0,
      id_6,
      id_3,
      id_6,
      id_4,
      id_0,
      id_0,
      id_4,
      id_2
  );
  wire id_11;
  initial begin : LABEL_0
    id_9 <= id_0;
  end
endmodule
