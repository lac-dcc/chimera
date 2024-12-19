// Seed: 2308739933
module module_0 (
    output tri id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wand id_4,
    output uwire id_5,
    input supply0 module_0,
    input wire id_7,
    input tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input uwire id_11,
    input supply1 id_12,
    output tri1 id_13,
    output tri1 id_14,
    input tri id_15
);
  wire id_17;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    input  wand  id_2,
    output tri0  id_3,
    output logic id_4
);
  initial begin : LABEL_0
    id_4 <= 1;
    wait (id_0);
  end
  assign id_3 = 1;
  wire id_6;
  tri  id_7;
  wire id_8;
  wor  id_9 = 1'b0;
  wire id_10;
  tri1 id_11 = 1;
  wire id_12;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_1,
      id_7,
      id_2,
      id_7,
      id_1,
      id_0,
      id_7,
      id_1,
      id_1,
      id_7,
      id_3,
      id_0
  );
  assign id_10 = id_6;
endmodule
