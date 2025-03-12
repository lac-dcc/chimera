// Seed: 1843877516
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
  output tri id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  assign module_1.id_0 = 0;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  wire id_12;
  assign id_6 = id_2;
  wire [-1 'b0 : -1] id_13;
  assign id_11 = -1;
  assign id_3  = -1;
  wire id_14;
  ;
  logic id_15 = id_12;
  assign id_11 = -1'b0;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    inout  logic id_2,
    inout  tri0  id_3,
    input  uwire id_4,
    output tri1  id_5,
    input  wand  id_6
);
  wire id_8;
  ;
  reg id_9;
  ;
  logic [1 : 1] id_10;
  ;
  initial
    if (1) begin : LABEL_0
      id_2 <= id_4;
    end else @(posedge id_4) id_10 = #id_11 -1;
  always id_9 <= id_10;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  wire id_12;
  wire id_13;
  always #1 begin : LABEL_1
    id_10#(.id_3(1)) <= 1;
  end
  assign id_0  = id_1;
  assign id_13 = id_1;
endmodule
