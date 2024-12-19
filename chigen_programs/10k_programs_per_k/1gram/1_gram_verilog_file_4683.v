// Seed: 1811636402
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always #1 #1 id_7 <= id_6;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_1,
      id_3,
      id_4
  );
  assign id_6 = 0 - 1'b0;
  assign id_5 = id_5;
  wire id_8;
  always id_4 = id_4;
  always @(posedge id_3 or negedge 1'h0 * 1, posedge id_4) if (id_5) id_5 <= 1'b0;
endmodule
