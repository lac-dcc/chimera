// Seed: 1742348323
macromodule module_0 (
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
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout supply1 id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_8
  );
  output wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_5[-1 : 1'b0] <= id_10 ^ id_5;
  end
  assign id_1 = -1;
endmodule
