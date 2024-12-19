// Seed: 3476411468
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
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_8 = 1 ? id_11 : 1;
  initial begin : LABEL_0
    begin : LABEL_0
      if (1'b0) id_6 -= id_8;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_5,
      id_1,
      id_5,
      id_3,
      id_5,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_11 = 0;
endmodule
