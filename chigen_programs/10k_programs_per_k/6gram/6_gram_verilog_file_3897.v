// Seed: 3634619007
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  uwire id_4 = id_2 * 1;
  bit   id_5 = id_4;
  wire  id_6;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4,
      id_6,
      id_3,
      id_6
  );
  always @(-1 or id_3) begin : LABEL_0
    id_5 <= 1'b0;
  end
endmodule
