// Seed: 1218343601
module module_0 (
    output supply1 id_0
);
  wire id_2, id_3;
  tri0 id_4;
  assign module_1.id_2 = 0;
  assign id_4 = 1;
  wire id_5, id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  wire id_10, id_11;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    input  tri0  id_2,
    output tri   id_3
);
  generate
    begin : LABEL_0
      wire id_5;
      assign id_1 = 1'b0 - 1;
    end
    final id_1 <= id_0;
  endgenerate
  xor primCall (id_3, id_0, id_5, id_2);
  module_0 modCall_1 (id_3);
  assign id_3 = id_2;
endmodule
