// Seed: 3779635814
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    input tri id_3,
    output tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wire id_7,
    input wand id_8,
    input wire id_9,
    input wire id_10,
    input tri0 id_11,
    output supply1 id_12,
    output supply0 id_13,
    input supply1 id_14,
    input tri0 id_15,
    input tri0 id_16,
    output tri1 id_17
    , id_20,
    input wire id_18
);
  wire id_21;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output tri0 id_1,
    input uwire id_2,
    output logic id_3
);
  wire id_5;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
  always @(posedge -1) begin : LABEL_0
    id_3 <= id_5 < -1;
  end
endmodule
