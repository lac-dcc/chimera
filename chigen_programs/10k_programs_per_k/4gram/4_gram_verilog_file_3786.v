// Seed: 1778916384
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_1 = 0;
  always @(posedge id_7) $signed(65);
  ;
  assign id_3 = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1
);
  logic id_3 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    input tri0 id_0,
    output logic id_1,
    input wor id_2,
    input tri1 id_3,
    input wand id_4
    , id_9,
    output tri0 id_5,
    input supply1 id_6,
    output logic id_7
);
  wire id_10;
  xnor primCall (id_1, id_10, id_0, id_2, id_9, id_3, id_4);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_10
  );
  initial begin : LABEL_0
    id_7 = -1'b0;
    id_1 <= id_10;
  end
endmodule
