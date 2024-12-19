// Seed: 108158661
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
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
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    for (id_7 = id_5 != 1'b0; id_4 && id_7; id_6++) begin : LABEL_0
      assign id_7 = id_4;
    end
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_4
  );
  tri1 id_8 = 1;
endmodule
