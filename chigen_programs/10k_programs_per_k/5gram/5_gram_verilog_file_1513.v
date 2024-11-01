// Seed: 3644860358
module module_0 (
    output wand id_0,
    output wand id_1,
    output tri0 id_2
    , id_18,
    input wor id_3,
    output supply0 id_4,
    input wand id_5,
    output tri1 id_6,
    input wor id_7,
    input wand id_8,
    input tri1 id_9,
    input tri1 id_10,
    input wor id_11,
    output supply0 id_12
    , id_19,
    output supply0 id_13,
    input wire id_14,
    input supply0 id_15,
    input wor id_16
);
  initial begin
    fork
      begin
        wait (1'b0);
      end
    join_any
  end
  wire id_20;
  timeprecision 1ps;
endmodule
module module_1 (
    output tri0 id_0,
    output wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    input tri0 id_4
);
  assign id_1 = id_2;
  module_0(
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_4,
      id_3,
      id_4,
      id_2,
      id_4,
      id_0,
      id_0,
      id_3,
      id_4,
      id_3
  );
endmodule
