// Seed: 2108931782
module module_0;
  bit id_2;
  supply1 id_3;
  generate
    always id_2 <= #1  (id_3) & 1;
    assign id_2 = id_1;
  endgenerate
  wand id_4 = 1;
  uwire id_5, id_6;
  wire id_7;
  assign id_5 = 1;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  assign id_1[!~1] = id_3;
  module_0 modCall_1 ();
  assign id_3 = id_4;
  wire id_5, id_6;
  nor primCall (id_1, id_3, id_4);
  wire id_7;
endmodule
