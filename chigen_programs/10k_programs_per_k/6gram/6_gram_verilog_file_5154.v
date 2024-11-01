// Seed: 2088949698
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    output tri0 id_7,
    input wire id_8,
    input wire id_9,
    output logic id_10,
    input wor id_11,
    output wand id_12,
    input supply0 id_13,
    output wand id_14
);
  reg id_16, id_17;
  initial begin
    id_10 <= 1;
    id_5 = id_4;
    id_16 <= 1'b0;
  end
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output logic id_5
);
  always begin
    id_5 <= id_4 !== 1;
  end
  assign id_0 = id_4;
  module_0(
      id_2, id_0, id_0, id_1, id_2, id_3, id_4, id_3, id_2, id_1, id_5, id_1, id_3, id_1, id_3
  );
endmodule
