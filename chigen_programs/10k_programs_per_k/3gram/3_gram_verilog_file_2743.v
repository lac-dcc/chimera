// Seed: 3448462608
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output supply0 id_2,
    output wor id_3,
    output tri0 id_4,
    input wand id_5,
    output wire id_6,
    input tri id_7,
    input uwire id_8,
    input tri id_9,
    input wand id_10,
    input wire id_11,
    output uwire id_12,
    input tri1 id_13,
    output tri id_14,
    output wand id_15
);
  wire id_17;
  tri0 id_18;
  wire id_19;
  assign id_18 = 1;
endmodule
module module_1 (
    input  logic id_0,
    output tri1  id_1,
    output logic id_2,
    input  wire  id_3
);
  assign id_1 = 1;
  always begin
    #1 id_2 <= (id_0);
  end
  wire id_5;
  wire id_6;
  or (id_2, id_6, id_3);
  module_0(
      id_3, id_1, id_1, id_1, id_1, id_3, id_1, id_3, id_3, id_3, id_3, id_3, id_1, id_3, id_1, id_1
  );
endmodule
