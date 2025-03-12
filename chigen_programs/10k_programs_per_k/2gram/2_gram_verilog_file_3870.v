// Seed: 4011444623
module module_0 (
    input wire id_0,
    input wand id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output supply1 id_5,
    input wor id_6,
    input tri1 id_7,
    input supply1 id_8,
    output tri id_9,
    input supply1 id_10,
    input uwire id_11,
    input uwire id_12,
    output supply0 id_13
);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input uwire id_2,
    output tri id_3,
    input supply1 id_4,
    input wire id_5,
    output supply1 id_6,
    input uwire id_7,
    output logic id_8
);
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0,
      id_5,
      id_3,
      id_5,
      id_0,
      id_0,
      id_6,
      id_4,
      id_0,
      id_5,
      id_1
  );
  generate
    assign id_8 = -1'b0;
    always begin : LABEL_0
      id_8 = -1;
    end
  endgenerate
endmodule
