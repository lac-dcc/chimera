// Seed: 240503556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7, id_8, id_9, id_10;
  wire id_11;
  wire id_12;
  wire id_13;
  always @(posedge id_2) begin : LABEL_0
    disable id_14;
  end
  wire id_15 = id_13;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_2 = 1;
endmodule
