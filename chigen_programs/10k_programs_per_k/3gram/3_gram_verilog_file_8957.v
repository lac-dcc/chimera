// Seed: 3335101148
module module_0 (
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
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    wand id_14 = id_12;
  endgenerate
  wire id_15;
  wire id_16;
  assign module_1.type_3 = 0;
  assign id_12 = (id_10 + 1);
endmodule
module module_1 (
    input wand  id_0,
    input uwire id_1
);
  tri id_3;
  final begin : LABEL_0
    id_3 = id_1;
  end
  uwire id_4 = 1'h0;
  assign id_4 = id_3++;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
