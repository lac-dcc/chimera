// Seed: 896667260
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5, id_6;
endmodule
module module_1 (
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
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_8 = 1 || id_5;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_9
  );
  initial begin : LABEL_0
    assign id_9 = id_6;
    id_9 = id_2;
    id_8 <= 1;
    if (id_6) $display(1);
    id_5 = id_5;
  end
endmodule
