// Seed: 4006708705
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign module_2.id_8 = 0;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  wire id_5;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  always @(negedge 1 or negedge id_1) begin : LABEL_0
    fork
      id_8;
    join
  end
  wire id_9;
endmodule
