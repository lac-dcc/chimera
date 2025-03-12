// Seed: 63193722
module module_0 (
    output tri1 id_0
    , id_14,
    input wire id_1,
    input tri1 id_2,
    output tri0 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output tri id_7,
    input tri0 id_8,
    input wand id_9,
    input supply1 id_10,
    output supply1 id_11,
    output supply1 id_12
);
  logic id_15;
  ;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd30
) (
    input uwire id_0,
    output wire id_1,
    input tri0 id_2,
    input wand id_3,
    input wand _id_4,
    output supply0 id_5,
    output uwire id_6,
    output wire id_7,
    input wand id_8
);
  assign id_6 = id_0;
  tri0 id_10;
  wire [id_4 : -1] id_11;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_3,
      id_1,
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_8,
      id_2,
      id_6,
      id_5
  );
  assign id_6  = (id_11) ==? id_4;
  assign id_10 = -1;
endmodule
