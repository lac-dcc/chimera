// Seed: 410114419
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  always @(posedge -id_3 !=? id_1)
    if (id_2++) begin : LABEL_0
      assign id_2.id_1 = id_1;
    end else id_2 <= 1'd0;
  wor id_4 = id_3;
  wor id_5;
  assign id_5 = 1;
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
endmodule
