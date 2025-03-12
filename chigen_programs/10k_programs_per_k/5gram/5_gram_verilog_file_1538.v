// Seed: 1294877034
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3,
    input wire id_4,
    input wor id_5
    , id_10,
    input tri0 id_6,
    output supply1 id_7,
    output tri id_8
);
  localparam id_11 = 1;
  localparam integer id_12 = 1;
  logic id_13;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    input supply0 id_2,
    output wire id_3,
    output wand id_4,
    output tri id_5,
    output uwire id_6
);
  wire [-1 : 1 'h0 &  1] id_8;
  always @(-1) begin : LABEL_0
    id_0 = #1 -1 == id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
