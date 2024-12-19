// Seed: 1940317724
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4;
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
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_7,
      id_8
  );
  always_ff @(posedge 1 == id_6[{1{1}}]) begin : LABEL_0
    id_5 = 1;
    if (id_1) id_2 <= &id_5;
  end
endmodule
