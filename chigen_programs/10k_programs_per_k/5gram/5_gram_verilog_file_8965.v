// Seed: 1216396577
module module_0 (
    input  wand  id_0,
    output logic id_1
    , id_3, id_4
);
  always @(posedge -1 or posedge id_4) begin : LABEL_0
    id_1 = -1'h0;
  end
  wire id_5;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    input wand id_2,
    input tri id_3,
    input wand id_4,
    input supply0 id_5,
    input uwire id_6,
    output uwire id_7,
    output supply0 id_8,
    output tri0 id_9,
    output supply0 id_10,
    output tri1 id_11,
    input wire id_12,
    input tri1 id_13,
    output wire id_14,
    output logic id_15
);
  logic id_17;
  ;
  logic [-1 'b0 : 1] id_18;
  nor primCall (id_10, id_19, id_13, id_6, id_2, id_3, id_17, id_5, id_1, id_4, id_18, id_12);
  wire id_19;
  initial begin : LABEL_0
    assume #1  (1) $signed(24);
    ;
    id_15 <= -1;
  end
  module_0 modCall_1 (
      id_4,
      id_15
  );
endmodule
