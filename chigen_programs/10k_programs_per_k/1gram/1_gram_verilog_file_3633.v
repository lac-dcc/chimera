// Seed: 1297765121
module module_0 ();
  assign id_1 = 1'b0;
  module_2 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = ~id_1;
endmodule
module module_3 (
    input wor id_0,
    input tri1 id_1,
    output logic id_2,
    input logic id_3,
    output tri id_4,
    input supply1 id_5,
    output logic id_6
);
  wire id_8;
  always
    if (1) begin : LABEL_0
      id_6 = 1;
      id_4 = 1;
      id_2 <= !1'b0;
      id_6 <= id_3;
    end
  tri id_9, id_10;
  assign id_9 = 1;
  module_2 modCall_1 (
      id_10,
      id_10
  );
  wire id_11, id_12;
endmodule
