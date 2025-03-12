// Seed: 830740363
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
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout supply1 id_2;
  input wire id_1;
  generate
    assign id_2 = 1;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3[1] = id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_1,
      id_6,
      id_1,
      id_6,
      id_2
  );
endmodule
