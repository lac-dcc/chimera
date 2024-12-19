// Seed: 2494035382
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  if (1) begin : LABEL_0
    wire id_7;
    wire id_8 = id_2;
  end else begin : LABEL_0
    wire id_9;
  end
  wire id_10, id_11, id_12;
  assign module_1.id_4 = 0;
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
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_7(
      id_6, id_4, 1 == 1, id_2
  );
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_1,
      id_2,
      id_1
  );
endmodule
