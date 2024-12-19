// Seed: 1424956893
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
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_11 = id_1, id_12;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1
);
  reg  id_3;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  wire id_5;
  initial
    #($display) begin : LABEL_0
      id_3 <= ~id_3 == 1;
      cover (1);
    end
endmodule
