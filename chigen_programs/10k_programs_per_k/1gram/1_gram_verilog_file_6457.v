// Seed: 1776112710
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri id_2,
    input supply1 id_3,
    output tri id_4
);
  supply0 id_6;
  wire id_7, id_8;
  wire id_9;
  id_10(
      1
  );
  assign module_1.id_0 = 0;
  assign id_6 = (1);
  wire id_11;
  wire id_12;
  assign id_0 = 1;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input uwire id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5
);
  wire id_7, id_8 = 1'b0;
  always_comb begin : LABEL_0
    id_7 = id_3;
  end
  assign id_7 = id_2;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_1,
      id_0
  );
endmodule
