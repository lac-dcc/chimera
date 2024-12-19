// Seed: 364127509
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    output tri   id_0,
    output tri   id_1,
    input  wand  id_2,
    input  wire  id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    output logic id_6,
    input  wire  id_7
);
  always @(negedge 1)
    if (({id_5{id_7}} / id_5)) begin : LABEL_0
      id_6 <= 1'b0;
    end
  wire  id_9;
  wire  id_10;
  uwire id_11;
  xor primCall (id_1, id_11, id_5, id_2, id_9, id_7, id_10, id_4, id_3);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_9,
      id_9,
      id_11
  );
endmodule
