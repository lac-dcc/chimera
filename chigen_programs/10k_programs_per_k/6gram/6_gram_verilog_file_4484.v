// Seed: 1487871394
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
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  initial for (id_4 = id_7; 1'b0; id_2 = 1'b0) $display((id_1) == id_8 - 1);
endmodule
module module_1 (
    input wire id_0,
    output tri id_1,
    input uwire id_2,
    output uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input wire id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    input tri id_10
);
  wire id_12;
  nand primCall (id_3, id_8, id_2, id_10, id_0, id_4, id_6, id_5, id_12);
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
  assign id_1 = 1'h0;
  logic [7:0] id_13;
  assign id_13[1] = id_6;
endmodule
