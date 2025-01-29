// Seed: 1304816559
module module_0 (
    output wire id_0,
    input tri0 void id_1,
    input tri1 id_2,
    input wire void id_3,
    input wand id_4,
    input tri0 id_5,
    input supply0 id_6,
    id_9,
    input tri1 id_7
);
  wire id_10, id_11;
  wire id_12;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input logic id_2,
    output uwire id_3,
    input supply1 id_4,
    input tri1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    output tri id_9,
    output tri1 id_10,
    input supply0 id_11,
    output logic id_12,
    input logic id_13
);
  id_15 :
  assert property (@(posedge 1'd0) -1 / id_8) begin : LABEL_0
    if (-1) begin : LABEL_0
      id_9 = id_8;
    end else id_12 = id_2;
  end
  wand id_16;
  logic id_17, id_18;
  wire id_19;
  assign id_12 = id_18;
  tri id_20;
  always id_18 = id_16 * id_1;
  initial id_17 = (id_2);
  assign id_17 = 1 < id_20 == id_8;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_11,
      id_4,
      id_4,
      id_7,
      id_8,
      id_11
  );
  initial id_18 <= id_13;
endmodule
