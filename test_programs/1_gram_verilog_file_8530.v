// Seed: 465489281
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
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_14;
  tri  id_15;
  assign module_1.id_2 = 0;
  tri1 id_16, id_17;
  assign id_16 = -1;
  wire id_18;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  tri id_3, id_4;
  assign id_3 = 1 || id_3;
  wire id_5, id_7;
  always_comb begin : LABEL_0
    begin : LABEL_0
      #1 #id_8 id_1 <= 1;
    end
  end
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_7,
      id_5,
      id_6,
      id_7,
      id_4,
      id_4,
      id_4,
      id_8,
      id_6
  );
endmodule
