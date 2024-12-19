// Seed: 1815242420
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_8;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_1,
      id_4,
      id_5
  );
  tri0 id_9;
  always @((id_4) or posedge id_4) begin : LABEL_0
    if ({id_8, id_9} & |id_2) id_7 <= id_2;
  end
  nand primCall (id_5, id_7, id_2, id_4, id_8);
endmodule
