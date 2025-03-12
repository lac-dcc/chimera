// Seed: 4137505479
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input wire id_2,
    input wand id_3,
    input tri id_4,
    output wor id_5,
    input uwire id_6,
    input wand id_7
);
  supply1 id_9 = -1;
  parameter id_10 = 1'b0;
  localparam id_11 = id_10;
  wire id_12;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    output tri0 id_2,
    output wand id_3,
    output wand id_4,
    input tri0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    output tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output uwire id_11,
    output tri1 id_12,
    output logic id_13
);
  assign id_6 = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_9,
      id_5,
      id_8,
      id_10,
      id_5
  );
  logic id_15 = -1 == id_5;
  always if (1'd0) id_1 <= #id_9 |id_10;
  always_latch @(posedge 1 <= id_15) begin : LABEL_0
    id_13 <= -1;
  end
  assign id_12 = id_15;
  assign id_12 = {id_9, id_10, id_7};
  wire id_16;
endmodule
