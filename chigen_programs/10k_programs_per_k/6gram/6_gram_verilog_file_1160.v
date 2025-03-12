// Seed: 1832540704
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output supply0 id_3,
    input supply0 id_4
    , id_14,
    input wor id_5,
    output tri id_6,
    input uwire id_7,
    input wire id_8,
    input uwire id_9,
    output uwire id_10,
    input wor id_11,
    output supply0 id_12
);
  assign id_14[1] = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd79
) (
    output supply0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wor _id_3,
    output supply0 id_4
);
  tri [1 'b0 : id_3] id_6;
  nand primCall (id_2, id_7, id_1, id_8);
  logic id_7;
  logic id_8;
  reg   id_9;
  assign id_6 = id_9 - id_9;
  wire [-1 : -1] id_10;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_4,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  always id_9 = #(id_6  : id_7[id_3] : id_1 < id_3) 1;
endmodule
