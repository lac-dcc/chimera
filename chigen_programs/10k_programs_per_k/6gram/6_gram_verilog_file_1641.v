// Seed: 76123127
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_5;
  always @(*) id_1 <= !id_5#(.id_5(1));
  wire id_6;
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
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_8,
      id_9
  );
  wire id_11, id_12, id_13;
  always @(posedge 1) begin : LABEL_0
    id_7 = #0 1;
  end
endmodule
