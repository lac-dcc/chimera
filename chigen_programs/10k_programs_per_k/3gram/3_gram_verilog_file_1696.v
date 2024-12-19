// Seed: 1240190356
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  initial id_1 = id_2[{1, 1}];
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
module module_2 (
    output wire id_0,
    input uwire id_1,
    input supply0 id_2,
    input wor id_3,
    input supply1 id_4,
    output wor id_5,
    input tri1 id_6,
    input tri1 id_7,
    output tri0 id_8,
    output tri0 id_9
);
  wire id_11 = id_2;
  wire id_12;
  wire id_13;
  wire id_14;
endmodule
module module_3 (
    output wand id_0,
    input tri id_1,
    output tri0 id_2,
    output wire id_3,
    output wand id_4,
    output wor id_5,
    input wand id_6,
    output tri id_7,
    input wand id_8,
    input wand id_9,
    output wire id_10,
    output wor id_11,
    output logic id_12,
    output supply1 id_13
);
  always @(posedge id_1) begin : LABEL_0
    id_12 <= "";
  end
  module_2 modCall_1 (
      id_3,
      id_8,
      id_6,
      id_9,
      id_9,
      id_11,
      id_6,
      id_8,
      id_4,
      id_2
  );
  assign modCall_1.type_18 = 0;
endmodule
