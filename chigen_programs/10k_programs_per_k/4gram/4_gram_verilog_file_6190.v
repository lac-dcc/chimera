// Seed: 2139339418
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
  assign {1, 1} = id_6;
  supply1 id_13 = 1;
endmodule
module module_1 (
    input logic id_0,
    input uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    output logic id_4,
    output tri id_5,
    output uwire id_6,
    output uwire id_7,
    input wand id_8,
    output wire id_9,
    output wand id_10,
    input tri id_11,
    input uwire id_12,
    input uwire id_13,
    input tri1 id_14,
    output wor id_15,
    input tri0 id_16,
    input tri0 id_17,
    output wire id_18,
    input tri1 id_19
    , id_24,
    output uwire id_20,
    output tri1 id_21,
    output supply0 id_22
);
  wire id_25;
  reg  id_26;
  always @(*) begin : LABEL_0
    id_6 = (id_16);
    id_26 <= id_0;
    id_25 = 1;
    id_4 <= !id_8;
    id_20 = 1;
    $display(1'h0);
  end
  xor primCall (
      id_22, id_12, id_8, id_2, id_24, id_25, id_16, id_11, id_1, id_14, id_26, id_13, id_19, id_17
  );
  module_0 modCall_1 (
      id_25,
      id_24,
      id_24,
      id_25,
      id_24,
      id_25,
      id_25,
      id_25,
      id_24,
      id_24
  );
endmodule
