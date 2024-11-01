// Seed: 2634020853
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
endmodule
module module_1 ();
  wire id_1;
  logic [7:0] id_2;
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1
  );
  assign id_2 = id_2[1];
endmodule
module module_2 (
    input  wire  id_0,
    output tri0  id_1,
    input  wand  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output wand  id_5
);
endmodule
module module_3 (
    output wand id_0,
    input tri1 id_1,
    output tri0 id_2,
    output wand id_3,
    output logic id_4,
    input wand id_5,
    input wire id_6,
    input logic id_7,
    input tri1 id_8,
    input wor id_9,
    output supply0 id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    input wire id_14,
    output tri1 id_15,
    output tri id_16,
    input wor id_17,
    input supply0 id_18
);
  always begin
    $display;
    id_2 = 1 <-> id_18 && 1;
    assert (id_17);
    #1 id_4 <= {1{id_7}};
  end
  nor (id_3, id_6, id_8, id_7, id_12, id_1, id_14, id_9, id_5, id_17, id_13, id_18);
  module_2(
      id_18, id_10, id_6, id_5, id_1, id_3
  );
endmodule
