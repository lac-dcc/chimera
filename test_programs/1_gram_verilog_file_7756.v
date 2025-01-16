// Seed: 520268297
module module_0;
  wire id_1 = 1;
  integer id_2;
  wire id_3, id_4, id_5;
endmodule
module module_1;
  assign id_1 = -1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input wire  id_0,
    input logic id_1,
    input logic id_2,
    input tri0  id_3
);
  assign id_5 = id_2;
  logic id_6 = id_1;
  logic id_7;
  if (id_2) begin : LABEL_0
    assign id_6 = id_7;
  end
  uwire id_8 = -1;
  wire  id_9;
  always
    if (id_6) id_7 = id_2;
    else id_5 <= -1;
endmodule
module module_3 (
    output logic id_0,
    input tri1 id_1,
    input wor id_2,
    input wand id_3,
    input logic id_4,
    input supply1 id_5,
    input logic id_6,
    input tri id_7,
    input tri0 id_8
);
  assign id_0 = id_6;
  module_2 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_8
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = id_4;
  logic id_10;
  genvar id_11;
  rpmos (id_0);
  always id_10 = 1;
  assign id_10 = {id_6{id_11}};
  wire id_12;
  always id_0 <= 1;
endmodule
