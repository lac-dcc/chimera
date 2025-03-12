// Seed: 1560997749
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout reg id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1
  );
  always_ff @(posedge 1)
    if (1) begin : LABEL_0
      $clog2(52);
      ;
      id_5 <= id_2 == 1;
    end
endmodule
