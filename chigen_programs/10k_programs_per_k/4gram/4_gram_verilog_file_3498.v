// Seed: 3363712506
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output supply0 id_3,
    input tri0 id_4,
    output wire id_5,
    output wor id_6,
    input wire id_7,
    output tri id_8,
    input tri1 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input wand id_12
);
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    output logic id_2,
    input logic id_3,
    output tri1 id_4,
    input logic id_5,
    input logic id_6,
    input logic id_7,
    input supply0 id_8,
    output logic id_9,
    output wor id_10
);
  reg id_12;
  initial begin : LABEL_0
    id_9 <= id_5;
    #1 begin : LABEL_0
      #1;
      ;
      id_2  <= id_6;
      id_12 <= 1;
      id_12 <= 1;
      id_1 = 1'b0;
      id_12 <= id_3;
      assert (id_5);
      id_9 <= id_7;
      id_2 = id_6;
    end
    id_9 = 1;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_1,
      id_0,
      id_4,
      id_4,
      id_8,
      id_1,
      id_0,
      id_10,
      id_0,
      id_8
  );
  assign modCall_1.type_2 = 0;
  xnor primCall (id_1, id_3, id_12, id_6, id_8, id_7, id_0);
endmodule
