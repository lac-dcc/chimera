// Seed: 3132767274
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
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
endmodule
module module_1 (
    output supply1 id_0
);
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3
  );
  wire id_4;
  assign id_2 = id_3;
endmodule
module module_2 (
    input wand id_0,
    input tri0 id_1,
    input tri0 id_2
    , id_14,
    output uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    output tri id_7,
    output supply0 id_8,
    input wor id_9,
    input tri0 id_10,
    output tri id_11,
    output supply1 id_12
);
  wire id_15;
endmodule
module module_3 (
    output wand id_0,
    input  tri0 id_1,
    input  wand id_2,
    input  wire id_3,
    input  wor  id_4
);
  always @(1'b0 == id_2 or(1)) begin : LABEL_0
    cover (id_3);
  end
  bufif1 primCall (id_0, id_2, id_1);
  module_2 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_1,
      id_2,
      id_0,
      id_0,
      id_4,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.type_20 = 0;
endmodule
