// Seed: 933460295
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    input wor id_3,
    input wor id_4,
    input supply0 id_5,
    output tri id_6
);
  wire id_8;
  wire id_9;
  wor  id_10, id_11 = id_3;
  wire module_0;
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    input tri0 id_2,
    output logic id_3,
    input wand id_4,
    input logic id_5,
    output supply1 id_6,
    output supply1 id_7
);
  always @(negedge 1 - id_5) begin
    if (id_2) id_3 <= id_5;
  end
  nor (id_1, id_0, id_4, id_2);
  module_0(
      id_2, id_6, id_4, id_0, id_0, id_4, id_1
  );
endmodule
