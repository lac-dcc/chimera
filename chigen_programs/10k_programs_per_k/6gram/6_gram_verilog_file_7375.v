// Seed: 599601529
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
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  tri1 id_12;
  always @(*)
    case (1 * 1 ** id_12 - 1)
      1: id_12 = 1;
      default: begin : LABEL_0
        #1 id_8 = id_9 ^ 1;
      end
    endcase
  assign id_3 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1
  );
endmodule
