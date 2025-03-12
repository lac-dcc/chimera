// Seed: 822363379
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_8;
  tri   id_10;
  uwire id_11 = -1;
  assign id_10 = 1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout tri id_2;
  inout reg id_1;
  assign id_2 = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_3,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4
  );
  parameter id_5 = 1 - 1;
  wire id_6;
  always @(posedge id_1)
    if (id_5)
      if (1'b0) id_1 = id_4;
      else if (id_5) begin : LABEL_0
        id_1 = -1;
      end
endmodule
