// Seed: 2450791236
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
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
  wire id_6 = id_2 - 1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_6,
      id_6,
      id_3
  );
  reg id_7;
  assign id_5 = id_4;
  initial begin : LABEL_0
    id_4 <= id_7;
  end
endmodule
