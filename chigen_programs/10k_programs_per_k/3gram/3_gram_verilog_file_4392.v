// Seed: 1959918652
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1
  );
  logic id_7;
endmodule
module module_2 (
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
  input wire id_7;
  inout reg id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_3,
      id_5
  );
  inout tri id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = -1 * -1 + -1;
  always @(posedge 1 or id_6 or posedge id_4 or negedge 1 or negedge id_7 == id_6 or posedge id_5)
    id_6 <= 1;
endmodule
