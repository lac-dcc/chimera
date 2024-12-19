// Seed: 3434738432
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  final begin : LABEL_0
    force id_1 = id_9 % 1;
    if (1) disable id_11;
    else begin : LABEL_0
      id_8 = id_7;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_7,
      id_1,
      id_7,
      id_5,
      id_3
  );
endmodule
