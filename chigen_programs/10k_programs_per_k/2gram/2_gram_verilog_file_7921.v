// Seed: 2763648553
module module_0 (
    input tri id_0
);
endmodule
module module_1 (
    input tri id_0
);
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
  initial id_2[1] <= 1'b0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire  id_14;
  uwire id_15 = 1 & id_12;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_4 <= id_7;
    begin : LABEL_0
      id_4 = 1 - id_10;
    end
    id_2 <= 1;
    $display;
    $display(id_8, 1, id_10);
    id_4 <= id_7;
  end
  module_2 modCall_1 (
      id_10,
      id_1,
      id_10,
      id_1,
      id_9,
      id_1,
      id_1,
      id_5,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1
  );
endmodule
