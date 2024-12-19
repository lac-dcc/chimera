// Seed: 3176600748
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_4 = id_4;
  initial begin : LABEL_0
    id_4 = 1;
  end
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_1;
  reg id_5;
  reg id_6, id_7, id_8, id_9 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  reg id_10, id_11, id_12;
  always id_5 <= ~id_12 - id_2;
  assign id_4 = !id_6;
  initial begin : LABEL_0
    id_12 <= id_6 + 1;
    id_8  <= id_6;
    @(posedge id_11 or id_1) id_9 = 1;
  end
  wire id_13;
endmodule
