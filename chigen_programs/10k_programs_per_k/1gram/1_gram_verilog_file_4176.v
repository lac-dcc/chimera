// Seed: 2294752318
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wire id_7,
    output supply0 id_8,
    output tri1 id_9,
    input uwire id_10
);
endmodule
module module_1 (
    input logic id_0,
    output tri1 id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    input uwire id_5,
    output uwire id_6,
    output supply1 id_7,
    input wand id_8,
    output logic id_9
    , id_14,
    input wor id_10,
    input supply0 id_11,
    input wand id_12
);
  task id_15(input id_16);
    id_14 = id_11;
    input id_17;
  endtask
  initial
    #1 begin : LABEL_0
      id_15 <= id_15;
      #id_18
      @(posedge (1 - 1)) begin : LABEL_0
        id_14 = ~1;
        if (id_2) @(negedge 1) id_9 <= 1;
      end
    end
  assign id_15 = id_0;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_14,
      id_4,
      id_10,
      id_6,
      id_14,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
