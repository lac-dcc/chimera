// Seed: 3971455769
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    input  tri   id_3,
    input  tri   id_4
);
  wire id_6;
  wire id_7;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri id_5,
    output tri id_6,
    output uwire id_7,
    input wor id_8,
    input logic id_9,
    input supply1 id_10,
    output logic id_11,
    input tri1 id_12,
    input tri1 id_13,
    input uwire id_14
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_0,
      id_5,
      id_1
  );
  always begin : LABEL_0
    id_11 <= id_9;
  end
  wire id_17;
  nor primCall (id_0, id_14, id_16, id_10, id_8, id_2, id_12, id_4);
  wor id_18, id_19 = 1;
  assign id_19 = id_4;
  assign id_16 = id_16;
  wire id_20 = id_3++;
endmodule
