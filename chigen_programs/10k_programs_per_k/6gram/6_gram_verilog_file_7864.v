// Seed: 1552599764
module module_0 (
    output uwire id_0,
    input  tri   id_1,
    output wire  id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  tri   id_5,
    output wire  id_6
);
  assign id_6 = -1;
endmodule
module module_1 (
    output wire  id_0,
    input  wor   id_1,
    input  wire  id_2,
    output uwire id_3
);
  wire id_5;
  ;
  always @(id_5 or negedge id_2) begin : LABEL_0
    $signed(28);
    ;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_1,
      id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  always @(negedge id_3 or 1) begin : LABEL_0
    id_1[1] <= id_2;
  end
endmodule
module module_3 (
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
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_11[1] = id_7[-1];
  module_2 modCall_1 (
      id_7,
      id_13,
      id_6
  );
endmodule
