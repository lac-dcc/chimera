// Seed: 2736955114
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout reg id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1
  );
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3;
  assign id_1 = id_5;
  always @(-1, negedge -1) begin : LABEL_0
    id_5 <= id_5 / id_4;
  end
endmodule
