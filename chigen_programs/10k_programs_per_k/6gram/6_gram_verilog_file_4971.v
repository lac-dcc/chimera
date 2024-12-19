// Seed: 1374130661
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
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_13 = 1'b0 + id_7 + 1 + id_9 + 1 + id_8 + 1 + id_3 + 1 + id_8 + id_2 - 1;
  wire  id_14;
  assign module_1.id_5 = 0;
  wire id_15;
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
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire id_7;
  wire  id_8;
  wire  id_9;
  wire  id_10;
  always @(posedge 1'b0 or posedge id_7) begin : LABEL_0
    id_6 <= id_5;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_9,
      id_9,
      id_1,
      id_7,
      id_10,
      id_2,
      id_10,
      id_10,
      id_3
  );
endmodule
