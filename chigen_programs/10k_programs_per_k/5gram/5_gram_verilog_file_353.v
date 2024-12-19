// Seed: 1642997671
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6 = 1'b0 - 1'b0;
  always @* begin : LABEL_0
    id_6 = 1;
  end
  assign module_1.type_3 = 0;
  always @(posedge id_4, posedge id_7) id_2 = id_5;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output uwire id_4,
    input uwire id_5,
    output uwire id_6,
    input uwire id_7,
    output wor id_8
);
  assign id_4 = id_1;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
  assign id_4 = 1;
  nand primCall (id_6, id_1, id_10, id_0, id_2, id_3, id_7, id_5);
  wire id_11;
  wire id_12;
endmodule
