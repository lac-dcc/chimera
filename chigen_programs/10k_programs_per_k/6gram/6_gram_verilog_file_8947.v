// Seed: 2814974008
module module_0 (
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
    id_12
);
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13;
  assign id_12 = id_13;
  wire id_14;
  assign module_1.id_4 = 0;
endmodule
module module_1;
  supply1 id_1, id_2;
  supply1 id_3 = id_3 + id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1
  );
  always @(1 or posedge 1) begin : LABEL_0
    disable id_4;
  end
endmodule
