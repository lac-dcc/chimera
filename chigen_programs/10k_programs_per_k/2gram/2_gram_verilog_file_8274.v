// Seed: 2553640778
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_5,
      id_4,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  if (1 * 1) wire id_4;
  else begin : LABEL_0
    assign id_2 = 1;
  end
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1
  );
  assign id_4 = id_2;
endmodule
