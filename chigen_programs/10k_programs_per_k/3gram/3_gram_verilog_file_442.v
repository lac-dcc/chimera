// Seed: 575303754
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_1) id_4 <= 1 - 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_2;
  reg id_6, id_7;
  wire id_8;
  always_ff #1 id_7 <= id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1
  );
  assign id_7 = id_5;
  wire id_9;
  always @(posedge id_7) id_1 <= 1'b0;
endmodule
