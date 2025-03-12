// Seed: 397825887
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wand id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  assign id_3 = id_2 ? 1'b0 : ~id_2;
endmodule
module module_1 ();
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  logic id_3;
endmodule
module module_2 #(
    parameter id_6 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  input wire _id_6;
  output logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5[id_6] = -1;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8
  );
endmodule
