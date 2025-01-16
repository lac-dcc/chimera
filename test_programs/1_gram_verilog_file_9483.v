// Seed: 1045214549
module module_0;
  tri1 id_1;
  always
    if (id_1) id_2#(1'b0, 1) [-1'h0] <= 1;
    else $display(-1);
endmodule
module module_1 ();
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_2;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    if (id_3) @(-1 or negedge id_1 or posedge id_5 or posedge id_1 or posedge 1) id_4 <= id_3;
    else id_4 <= id_5;
  reg id_6;
  assign id_1 = id_6;
  wire id_7;
  wire id_8;
  nor primCall (id_1, id_2, id_3, id_5, id_6, id_7, id_8);
  module_0 modCall_1 ();
  assign modCall_1.type_3 = 0;
endmodule
