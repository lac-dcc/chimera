// Seed: 2735114724
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
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
  initial begin : LABEL_0
    id_1 = id_3;
    id_3 = ~(id_1);
  end
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign id_1 = id_3;
endmodule
