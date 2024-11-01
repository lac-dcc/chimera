// Seed: 3441021227
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_4;
  xnor (id_1, id_7, id_3, id_5, id_8, id_4, id_2);
  logic [7:0] id_5 = id_4;
  tri id_6, id_7;
  assign id_5[1] = id_7 - 1;
  wire id_8;
  module_0(
      id_3, id_6
  );
  wire id_9;
  wire id_10 = 1;
endmodule
module module_2 (
    output tri0 id_0,
    input supply0 id_1,
    output tri1 id_2,
    output wor id_3
    , id_10,
    input tri id_4,
    input wire id_5,
    input tri0 id_6,
    output wand id_7,
    output tri1 id_8
);
  assign id_0 = 1;
  id_11(
      .id_0(id_10), .id_1(id_2), .id_2(1)
  );
endmodule
module module_3 (
    input tri1 id_0,
    input supply1 id_1,
    output wire id_2,
    input tri1 id_3,
    output wor id_4,
    output logic id_5,
    input wire id_6,
    input tri1 id_7
);
  always @(posedge 1 or negedge id_3) id_5 <= 1;
  assign id_2 = id_7;
  module_2(
      id_2, id_0, id_4, id_2, id_6, id_6, id_1, id_2, id_4
  ); id_9(
      .id_0(), .id_1(~id_7 + 1), .id_2(1), .id_3(1), .id_4(1'b0)
  );
  assign id_4 = 1;
  wire id_10;
  wire id_11;
endmodule
