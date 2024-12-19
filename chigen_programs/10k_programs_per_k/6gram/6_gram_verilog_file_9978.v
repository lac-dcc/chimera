// Seed: 1596464389
module module_0 (
    output tri0  id_0,
    input  wor   id_1,
    input  wire  id_2,
    output uwire id_3
);
  wire id_5;
  xor primCall (id_3, id_1, id_5, id_2);
  module_2 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
module module_1 (
    output uwire id_0,
    output wor id_1,
    output wor id_2,
    input wor id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri0 id_6,
    inout logic id_7
);
  always @(posedge id_7) begin : LABEL_0
    id_7 = #1 1;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_2 = 0;
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
    id_9
);
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_0.type_7 = 0;
endmodule
