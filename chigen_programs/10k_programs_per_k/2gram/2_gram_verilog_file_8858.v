// Seed: 2707796966
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
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  module_2 modCall_1 (
      id_7,
      id_1,
      id_6
  );
  assign id_1 = 1;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_3;
  id_4(
      .id_0(1)
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_5;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always id_3 = id_1 - 1;
  for (id_4 = id_1; id_4; id_4 = 1) begin : LABEL_0
    wire id_5;
  end
endmodule
