// Seed: 2942405304
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
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11, id_12, id_13;
  always #1 begin : LABEL_0
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_6 = id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_2,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_6
  );
endmodule
