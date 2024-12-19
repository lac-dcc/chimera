// Seed: 4204592946
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output uwire id_2,
    input wand id_3,
    input tri0 id_4,
    output wor id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply0 id_8,
    output wor id_9,
    output tri0 id_10,
    input wor id_11,
    output uwire id_12,
    input uwire id_13,
    output wire id_14,
    input uwire id_15,
    output tri0 id_16
);
  wire id_18;
  assign module_1.type_7 = 0;
  wire id_19;
endmodule
module module_1 (
    output tri0  id_0,
    output tri   id_1,
    input  wand  id_2,
    output logic id_3,
    input  logic id_4
);
  always begin : LABEL_0
    id_1 = id_2;
    $display(1'b0, 1, id_4);
    id_3 <= id_4;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1
  );
endmodule
