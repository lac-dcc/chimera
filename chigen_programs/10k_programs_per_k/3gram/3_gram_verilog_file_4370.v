// Seed: 3550857749
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_7;
  ;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1,
      id_3,
      id_1
  );
  output wire id_2;
  inout wire id_1;
  wire id_4;
endmodule
module module_2 (
    input  tri   id_0,
    input  tri0  id_1,
    output wire  id_2,
    input  tri   id_3,
    output tri0  id_4,
    input  wand  id_5,
    output tri0  id_6,
    input  tri1  id_7,
    output uwire id_8,
    input  tri0  id_9,
    input  wire  id_10
);
  assign module_3.id_29 = 0;
endmodule
module module_3 #(
    parameter id_3 = 32'd27,
    parameter id_7 = 32'd4
) (
    output logic id_0,
    input tri1 id_1
    , id_27,
    input tri0 id_2,
    input tri1 _id_3,
    output wire id_4,
    output wire id_5,
    output wor id_6,
    input tri0 _id_7,
    output supply0 id_8,
    input wand id_9,
    input tri1 id_10,
    input uwire id_11,
    input wor id_12,
    input wire id_13,
    output tri1 id_14,
    input tri id_15,
    output wire id_16,
    output uwire id_17,
    input supply1 id_18,
    input supply0 id_19,
    output tri id_20,
    output wire id_21,
    output tri id_22,
    input wire id_23,
    input tri id_24,
    input tri0 id_25
);
  wire [-1 : id_7  +  -1] id_28;
  tri1 id_29;
  wire [1 : id_3] id_30;
  wire id_31;
  wire id_32;
  ;
  assign id_29 = 1;
  always_ff @(1 - id_18 or -1) begin : LABEL_0
    id_0 = 1;
    $signed(29);
    ;
  end
  assign id_21 = id_28;
  wire id_33, id_34;
  module_2 modCall_1 (
      id_19,
      id_23,
      id_22,
      id_10,
      id_6,
      id_9,
      id_20,
      id_19,
      id_6,
      id_12,
      id_10
  );
  wire id_35;
endmodule
