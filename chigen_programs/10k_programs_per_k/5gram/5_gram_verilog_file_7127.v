// Seed: 1584651197
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    input uwire id_5,
    output logic id_6,
    input tri0 id_7,
    input wire id_8,
    input tri1 id_9,
    output uwire id_10,
    input tri1 id_11,
    input supply0 id_12,
    output wire id_13,
    output wor id_14
);
  assign module_1.id_5 = 0;
  always @(id_1) begin : LABEL_0
    id_6 <= -1;
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input wire id_2,
    input tri0 id_3,
    output wand id_4,
    input wor id_5,
    output logic id_6,
    input supply1 id_7,
    output tri1 id_8
    , id_11,
    output logic id_9
);
  always_latch @(id_2 or -1) begin : LABEL_0
    case (id_7)
      id_1: {id_0} -= -1;
      -1'b0: begin : LABEL_1
        id_11 <= id_5;
      end
      1: id_9 = id_1;
      id_5: id_6 = id_3;
    endcase
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_4,
      id_7,
      id_8,
      id_1,
      id_6,
      id_0,
      id_3,
      id_0,
      id_4,
      id_5,
      id_0,
      id_4,
      id_4
  );
  assign id_6 = -1'b0;
  initial begin : LABEL_2
    id_9 <= id_9++;
  end
  logic id_12;
  ;
endmodule
