// Seed: 1750967126
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6 = id_5[1], id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6
  );
  initial begin : LABEL_0
    @(posedge -1);
  end
  assign id_6 = id_7;
endmodule
