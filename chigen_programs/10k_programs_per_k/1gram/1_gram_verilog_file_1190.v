// Seed: 3368838171
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
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always_ff #(1'b0) id_3 <= id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
