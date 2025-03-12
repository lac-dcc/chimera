// Seed: 2040365514
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input tri id_7,
    input tri1 id_8,
    input wor id_9,
    output tri0 id_10,
    output uwire id_11,
    output tri0 id_12
);
  wire id_14;
  struct packed {
    logic id_15;
    logic id_16;
    logic id_17;
  } id_18;
  wire id_19;
  always_comb id_18.id_17 <= -1;
  tri1 id_20, id_21, id_22;
  assign id_22 = -1;
  assign module_1.id_1 = 0;
  logic id_23;
endmodule
module module_1 #(
    parameter id_2 = 32'd59
) (
    input wand id_0,
    output supply0 id_1,
    output tri0 _id_2,
    output logic id_3,
    input uwire id_4
);
  always id_3 = id_4;
  logic id_6[-1  ?  -1 : -1 : id_2];
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_0,
      id_1,
      id_1,
      id_1
  );
  always begin : LABEL_0
    id_3 = id_0 == 1;
  end
endmodule
