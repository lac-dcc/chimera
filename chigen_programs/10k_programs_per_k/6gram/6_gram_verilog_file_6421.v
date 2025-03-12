// Seed: 2180049337
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input wor id_4,
    output wand id_5,
    output supply0 id_6,
    input wire module_0,
    input tri id_8
    , id_13,
    input wor id_9,
    output supply0 id_10,
    output wand id_11
);
  initial begin : LABEL_0
    fork
      begin : LABEL_1
        disable id_14;
        $unsigned(53);
        ;
      end
      id_15(-1);
    join_none
    id_13["" : 1] = -1;
  end
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output supply1 id_2,
    output logic id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wire id_6,
    input tri id_7,
    output logic id_8,
    input wire id_9,
    input wand id_10,
    input tri0 id_11,
    output wor id_12
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_12,
      id_11,
      id_12,
      id_12,
      id_10,
      id_10,
      id_5,
      id_2,
      id_2
  );
  logic [-1 'b0 : 1] id_14 = id_1;
  initial begin : LABEL_0
    for (id_8 = id_9; {-1'd0{-1}}; id_3 = 1 ** id_6) begin : LABEL_1
      id_8 <= id_9;
    end
    assign id_2 = id_10;
  end
endmodule
