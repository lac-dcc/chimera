// Seed: 1252270086
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(1 < id_2 or posedge id_4) $display(id_4, 1, ~id_2);
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
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_5,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
