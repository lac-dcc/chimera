// Seed: 1444015901
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_10 :
  assert property (@(posedge id_3) id_7)
  else;
  wire id_11;
  assign id_8 = id_1;
  wire id_12;
  assign id_12 = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4,
    output wand id_5
);
  if (id_2) begin : LABEL_0
    wire id_7;
  end else begin : LABEL_0
    wire id_8;
  end
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_7
  );
endmodule
