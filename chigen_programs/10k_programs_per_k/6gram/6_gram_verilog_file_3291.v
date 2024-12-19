// Seed: 893789396
module module_0 ();
  wire id_1;
  assign module_1.type_9 = 0;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  tri id_7;
  assign id_6 = 1;
  tri id_8;
  always @(posedge 1 or posedge id_4)
    if (id_4)
      if (id_8)
        if (1 !== id_1 || id_7) id_6 <= 1;
        else id_2 <= 1;
      else module_1 <= ~id_4;
  module_0 modCall_1 ();
  assign id_7 = id_8;
endmodule
