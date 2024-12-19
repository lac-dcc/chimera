// Seed: 1500198686
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
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
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_3 <= #1 1;
    assign id_5 = id_1;
  end
  initial begin : LABEL_0
    id_8 <= id_4;
    id_1 <= 1;
  end
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_7,
      id_5
  );
endmodule
