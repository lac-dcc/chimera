// Seed: 3904423845
module module_0 (
    output wand id_0,
    output wand id_1,
    input uwire id_2,
    input wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    input wire id_7,
    output tri id_8,
    input uwire id_9,
    input uwire id_10,
    output wire id_11,
    output uwire id_12,
    output uwire id_13
    , id_15
);
  wire [1 : -1] id_16;
  parameter id_17 = 1;
  tri0 id_18 = -1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  tri0  id_2,
    output logic id_3,
    input  wand  id_4,
    output wor   id_5
);
  initial begin : LABEL_0
    id_3 <= id_0;
  end
  parameter id_7 = 1;
  id_8 :
  assert property (@("") id_2)
  else if (id_7[""]) id_3 <= #1 id_0;
  else begin : LABEL_1
    id_3 <= -1'b0;
  end
  always id_1 = #id_9 1'd0;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_0,
      id_5,
      id_4,
      id_0,
      id_0,
      id_5,
      id_2,
      id_4,
      id_5,
      id_5,
      id_5
  );
endmodule
