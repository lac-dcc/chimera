// Seed: 3838123835
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wire id_2,
    input supply0 id_3,
    output uwire id_4,
    output tri id_5,
    input wor id_6,
    input supply1 id_7,
    input tri1 id_8,
    input tri0 id_9,
    input supply0 id_10,
    inout wor id_11
);
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd1,
    parameter id_4  = 32'd68
) (
    input tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input uwire id_3[-1 : -1],
    input tri _id_4 id_12,
    input tri1 id_5,
    input wand id_6,
    input uwire id_7[id_4 : id_10],
    input supply1 id_8,
    output logic id_9,
    output supply1 _id_10
);
  always_ff id_9 <= 1;
  module_0 modCall_1 (
      id_12,
      id_6,
      id_5,
      id_7,
      id_1,
      id_1,
      id_7,
      id_12,
      id_12,
      id_2,
      id_8,
      id_12
  );
endmodule
