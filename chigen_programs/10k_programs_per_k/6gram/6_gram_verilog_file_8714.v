// Seed: 1886649643
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_5 != 1'b0 or posedge 1) begin : LABEL_0
    id_6 <= 1;
  end
  wire id_9;
  wire id_10, id_11;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_4 or id_4) id_1 <= id_3;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
