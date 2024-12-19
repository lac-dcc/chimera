// Seed: 4061855663
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
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_11;
  wire id_12;
  assign id_5 = 1;
  for (id_13 = id_5 > 1; id_5; id_2 = 1) begin : LABEL_0
    wire id_14;
  end
  assign id_1 = 1;
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
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8 = id_5;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_1,
      id_1,
      id_5,
      id_6,
      id_7,
      id_4,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
