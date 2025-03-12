// Seed: 2494906351
module module_0 (
    input uwire id_0,
    input uwire id_1
    , id_18,
    output uwire id_2,
    input wor id_3,
    input wor id_4,
    output uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    input tri id_8,
    output tri id_9,
    input supply1 id_10,
    input wire id_11,
    input wire id_12,
    output tri1 id_13,
    input supply1 id_14,
    output tri1 id_15,
    output tri id_16
);
  logic [7:0] id_19;
  assign module_1.id_1 = 0;
  parameter id_20 = 1;
  assign id_19[-1] = -1;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  wand  id_3,
    output tri0  id_4,
    output logic id_5
);
  always @(posedge "" or -1) begin : LABEL_0
    id_5 = id_0;
    if (1) id_5 <= id_2;
  end
  xor primCall (id_5, id_1, id_3, id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_1,
      id_0,
      id_4,
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_1,
      id_1,
      id_4,
      id_3,
      id_4,
      id_4
  );
endmodule
