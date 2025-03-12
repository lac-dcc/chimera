// Seed: 3447193869
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    output uwire id_3,
    input uwire id_4,
    output tri id_5,
    input wand id_6,
    input wire id_7,
    input uwire id_8,
    output uwire id_9,
    input supply0 id_10,
    output tri id_11,
    input tri id_12,
    output supply1 id_13,
    input wire id_14,
    output wire id_15,
    output tri1 id_16,
    output supply1 id_17,
    output wor id_18
);
  initial $unsigned(16);
  ;
endmodule
module module_3 (
    input supply0 id_0,
    output logic id_1,
    input tri1 id_2,
    input wire id_3,
    output wor id_4,
    inout wire id_5,
    input tri0 id_6,
    input wand id_7,
    input wand id_8
    , id_10
);
  localparam id_11 = 1;
  always @(negedge 1) begin : LABEL_0
    id_10 = #1 id_11[-1 : (-1)];
  end
  module_2 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_5,
      id_6,
      id_5,
      id_7,
      id_7,
      id_2,
      id_5,
      id_2,
      id_4,
      id_5,
      id_5,
      id_3,
      id_5,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
  assign id_10 = id_10;
  always @(~id_8 or id_8) begin : LABEL_1
    id_1 <= 1;
  end
  assign id_4 = {(1), id_5};
endmodule
