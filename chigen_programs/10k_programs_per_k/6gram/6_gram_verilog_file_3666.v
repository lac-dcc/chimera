// Seed: 2336949631
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wor id_6 = 1, id_7;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  xnor primCall (id_1, id_3, id_6, id_5, id_4);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_1
  );
endmodule
module module_2 (
    output tri0  id_0,
    input  uwire id_1,
    output tri1  id_2,
    output logic id_3
);
  wire id_5;
  assign id_2 = 1;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  assign id_9 = id_8;
  reg id_10;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_9,
      id_5
  );
  always @(posedge 1 or posedge 1) id_3 = #1 id_10;
endmodule
