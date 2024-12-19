// Seed: 4042518684
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  assign module_2.type_9 = 0;
  assign module_1.id_4   = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wand id_3,
    input wand id_4,
    output wand id_5
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_7
  );
endmodule
module module_2 (
    output uwire id_0,
    input  tri   id_1,
    input  wire  id_2,
    output wor   id_3
);
  wire id_5;
  wire id_6;
  or primCall (id_3, id_2, id_1, id_6, id_5);
  assign id_5 = 1'b0;
  always @(posedge id_1 or posedge id_5) begin : LABEL_0
    id_3 = 1;
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
