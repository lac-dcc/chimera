// Seed: 3819768906
module module_0 (
    output logic id_0,
    input  tri   id_1,
    input  wor   id_2
);
  initial begin : LABEL_0
    id_0 = id_1;
    id_0 <= 1;
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  wor   id_1,
    output uwire id_2
);
  wor id_4, id_5, id_6;
  assign id_5 = 1'b0;
  always
  fork : SymbolIdentifier
    id_7;
    $clog2(8);
    ;
  join : SymbolIdentifier
  module_0 modCall_1 (
      id_7,
      id_1,
      id_1
  );
endmodule
module module_2 (
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
  inout wor id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_12 = (id_10) ? id_9 : 1 ? 1 : 1;
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
    id_13
);
  input wire id_13;
  module_2 modCall_1 (
      id_8,
      id_5,
      id_8,
      id_5,
      id_2,
      id_8,
      id_7,
      id_13,
      id_6,
      id_8,
      id_10,
      id_5
  );
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_14;
  nor primCall (id_11, id_10, id_5, id_9, id_7, id_2, id_13, id_4, id_8, id_3, id_6);
  wire id_15;
endmodule
