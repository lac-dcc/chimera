// Seed: 3940102308
module module_0 (
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
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  uwire id_7 = id_7;
  assign id_5 = 1'b0;
  always @(posedge id_3) if (1'b0) @(posedge 1'b0) id_1 = id_7;
  assign id_5 = id_7;
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
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_1,
      id_7,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
