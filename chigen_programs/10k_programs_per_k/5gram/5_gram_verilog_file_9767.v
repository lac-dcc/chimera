// Seed: 3950307642
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wire id_2,
    output tri id_3,
    input uwire id_4,
    output supply1 id_5,
    output uwire id_6,
    input wand id_7,
    input wand id_8,
    input uwire id_9,
    input tri1 id_10,
    input supply0 id_11,
    output supply1 id_12
);
  wire id_14;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wire id_0,
    output logic id_1,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri1 id_6
);
  always @(negedge 1) begin : LABEL_0
    id_1 = -1 - 1;
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_5,
      id_3,
      id_4,
      id_6
  );
endmodule
