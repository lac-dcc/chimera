// Seed: 2006846089
module module_0 (
    output logic id_0,
    input uwire id_1,
    output wor id_2,
    input supply0 id_3,
    input wire id_4,
    output supply0 id_5,
    output tri0 id_6,
    input wire id_7,
    output tri0 id_8,
    input uwire id_9,
    input tri id_10,
    input tri0 id_11
);
  assign id_8 = id_11;
  wire id_13;
  parameter id_14 = {1{1 + 1}};
  assign id_5 = -1 ? id_3 : -1;
  wire id_15;
  ;
  wire id_16, id_17, id_18, id_19, id_20;
  logic id_21, id_22, id_23;
  always @(negedge "" & id_4) begin : LABEL_0
    id_0 <= id_16;
  end
endmodule
module module_1 (
    output wor   id_0,
    input  tri1  id_1,
    output logic id_2,
    input  wire  id_3,
    input  wire  id_4,
    output uwire id_5
);
  always_comb id_2 <= 1'b0;
  wire id_7;
  assign id_5 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_5,
      id_3,
      id_3,
      id_0,
      id_5,
      id_1,
      id_0,
      id_4,
      id_3,
      id_4
  );
endmodule
