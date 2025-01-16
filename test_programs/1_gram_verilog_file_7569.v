// Seed: 1602105955
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4,
    input wor id_5,
    output tri0 id_6,
    input wand id_7,
    input wire id_8
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    id_11,
    input logic id_1,
    input wor id_2,
    input logic id_3,
    input uwire id_4,
    output uwire id_5,
    input wand id_6,
    input tri0 id_7,
    input wor id_8,
    input supply1 id_9
);
  assign id_0 = id_1;
  wire id_12;
  bit id_13, id_14;
  always begin : LABEL_0
    begin : LABEL_0
      id_5 = id_2;
    end
    id_11 <= id_13;
  end
  initial id_0 <= id_3;
  genvar id_15, id_16;
  assign id_5 = id_9;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_8,
      id_5,
      id_2,
      id_5,
      id_4,
      id_9
  );
  assign id_15 = id_13;
  initial $display;
  integer id_17 (
      .id_0(id_2),
      .id_1(id_1),
      .id_2(id_6),
      .id_3(id_16)
  );
  id_18(
      -1, id_2, 1
  );
  parameter id_19 = -1;
endmodule
