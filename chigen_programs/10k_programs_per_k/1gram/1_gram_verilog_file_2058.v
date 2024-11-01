// Seed: 1561143972
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    output supply1 id_2,
    output tri1 id_3
    , id_12,
    input supply0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output supply0 id_8,
    input wire id_9,
    output tri1 id_10
);
  wand id_13 = id_9.id_5 || id_0 <= id_12.id_13;
  generate
    begin
      wire id_14;
    end
  endgenerate
  assign id_7 = 1;
  always id_3 = id_5;
  uwire id_15, id_16 = 1;
  wire id_17, id_18;
  wire id_19;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    output wand id_2,
    output supply1 id_3,
    input wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wire id_7,
    input wire id_8,
    output uwire id_9,
    output uwire id_10
);
  tri0 id_12 = id_8, id_13, id_14 = id_6;
  nor (id_10, id_13, id_5, id_14, id_0, id_8, id_12, id_6, id_7, id_4);
  module_0(
      id_8, id_10, id_13, id_9, id_5, id_8, id_6, id_14, id_12, id_6, id_10
  );
endmodule
