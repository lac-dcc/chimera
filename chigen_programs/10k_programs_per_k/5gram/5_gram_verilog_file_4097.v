// Seed: 2206257669
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input wor id_3,
    output wor id_4,
    output wire id_5,
    input tri1 id_6,
    input supply0 id_7,
    input uwire id_8
    , id_11,
    input supply1 id_9
);
  assign id_5 = 1;
  task id_12();
    begin : LABEL_0
      assert (1);
    end
  endtask
  wire id_13;
  assign id_5 = id_8;
endmodule
module module_1 (
    output wor   id_0,
    input  wor   id_1,
    output logic id_2
);
  wand id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.type_15 = 0;
  always @(posedge 1) begin : LABEL_0
    #1;
    id_2 <= 1 < 1;
    id_4 = ~id_4;
  end
endmodule
