// Seed: 879579782
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_2.id_3 = 0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout tri id_7;
  inout tri id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7
  );
  input wire id_1;
  assign id_7 = 1;
  wire id_8;
  assign id_6 = 1;
endmodule
module module_2 (
    output supply1 id_0,
    output wand id_1
    , id_20,
    input supply0 id_2,
    output wand id_3,
    input wand id_4,
    input wand id_5,
    input wire id_6,
    output wand id_7,
    output tri id_8,
    input tri id_9,
    input supply0 id_10,
    output wor id_11,
    output tri id_12,
    output logic id_13,
    output wor id_14,
    output uwire id_15,
    output uwire id_16,
    output wire id_17,
    input tri id_18
);
  always @(1 or posedge 1) begin : LABEL_0
    id_13 <= {-1'd0, 1} == -1;
  end
  wire id_21;
  ;
  assign id_15 = -1'd0;
  module_0 modCall_1 (
      id_21,
      id_20,
      id_21
  );
  assign id_13 = 1;
  parameter id_22 = -1;
endmodule
