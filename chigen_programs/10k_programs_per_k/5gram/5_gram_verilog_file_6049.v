// Seed: 1147346045
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output wor id_5,
    input wor id_6,
    input uwire id_7,
    input uwire id_8,
    input wire id_9,
    input uwire id_10,
    output tri0 id_11
);
  tri0 id_13;
  supply0 id_14 = 1'b0;
  supply0 id_15 = 1;
  assign id_15 = 1;
  wire id_16;
  wire id_17;
  wire id_18;
  wire id_19;
  id_20(
      .id_0(), .id_1(id_9), .id_2(1), .id_3(id_17), .id_4(1), .id_5(id_4 == id_13)
  );
endmodule
module module_1 (
    input  logic id_0,
    output tri1  id_1,
    input  wire  id_2,
    output tri0  id_3,
    output logic id_4,
    input  wire  id_5
);
  logic id_7;
  uwire id_8 = 1;
  wire  id_9;
  assign id_4 = id_2 == id_5;
  assign id_4 = id_7;
  wire id_10 = id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_1,
      id_2,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3
  );
  always #0 begin : LABEL_0
    id_7 <= id_0;
  end
  wire id_11;
  nand primCall (id_4, id_7, id_9, id_10, id_5, id_8);
endmodule
