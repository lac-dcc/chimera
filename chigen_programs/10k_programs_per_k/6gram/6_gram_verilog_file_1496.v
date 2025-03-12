// Seed: 203960298
module module_0 (
    input wire id_0,
    output supply1 id_1
);
  assign id_1 = ~id_0;
  assign module_2.id_3 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  wire id_0,
    output tri0 id_1,
    output wor  id_2
);
  always @(1) begin : LABEL_0
    disable id_4;
    $unsigned(3);
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_1
  );
endmodule
module module_2 (
    input  tri   id_0,
    input  wand  id_1,
    output logic id_2,
    output wand  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_3
  );
  initial
    if (1)
      @(negedge id_1) begin : LABEL_0
        if (1) begin : LABEL_1
          id_2 <= id_5;
        end
      end
endmodule
