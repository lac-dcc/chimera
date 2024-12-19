// Seed: 3981035431
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_5(.id_0(id_4), .id_1(id_2), .id_2(id_4), .id_3(id_1));
  end
  wire id_6;
  assign id_4 = {1, 1'b0};
  assign id_2 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  wire id_4;
endmodule
