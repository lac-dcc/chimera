// Seed: 491058691
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_3;
  assign id_3[1] = 1;
  assign module_1.id_3 = 0;
  tri0 id_4;
  wire id_5;
  assign id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_1,
      id_3
  );
  reg  id_4;
  tri0 id_5 = 1;
  tri  id_6;
  wor  id_7 = 1;
  reg  id_8 = 1;
  always #1 begin : LABEL_0
    id_8 <= 1;
    id_2 = id_3 !== id_6;
    id_2 <= id_4;
  end
endmodule
