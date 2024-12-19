// Seed: 2183697399
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  reg id_5, id_6;
  always begin : LABEL_0
    if (1) id_6 <= id_3;
    else id_4 <= id_1;
    id_6 <= 1;
  end
  tri id_7;
  assign module_1.type_6 = 0;
  always_ff id_1 = id_7 == id_3;
  reg id_8 = id_5;
  initial id_6 <= id_8;
endmodule
module module_1 (
    output tri id_0,
    output supply0 id_1
    , id_4,
    input logic id_2
);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  always begin : LABEL_0
    id_4 <= id_2;
  end
endmodule
