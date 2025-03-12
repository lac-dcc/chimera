// Seed: 1218139293
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output wire id_2,
    input tri1 id_3
    , id_8,
    input tri1 id_4,
    input wand id_5,
    output wor id_6
);
  logic id_9;
  assign id_6 = id_5;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1
    , id_4,
    inout wor id_2
);
  assign id_4 = 1;
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  localparam id_6 = 1;
endmodule
module module_2 #(
    parameter id_2 = 32'd73,
    parameter id_5 = 32'd47
) (
    input  wor   id_0,
    output wor   id_1,
    output uwire _id_2,
    input  uwire id_3,
    output tri   id_4
    , id_7,
    input  wand  _id_5
);
  wire [id_5 : {  id_2  }] id_8;
  nor primCall (id_4, id_8, id_3, id_0);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_0,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_6 = 0;
  assign id_1 = (1);
  localparam id_9 = 1;
  localparam id_10 = id_9;
endmodule
