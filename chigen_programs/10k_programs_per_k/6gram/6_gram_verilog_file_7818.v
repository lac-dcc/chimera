// Seed: 1237916515
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input wire id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    output supply1 id_6,
    input tri1 id_7,
    output wand id_8,
    output tri1 id_9,
    output supply0 id_10
);
endmodule
module module_1 (
    input  tri1  id_0,
    input  uwire id_1,
    input  logic id_2,
    output logic id_3,
    output wand  id_4,
    output logic id_5
);
  initial begin : LABEL_0
    id_5 <= (id_2);
    id_3 <= 1;
    begin : LABEL_0
      disable id_7;
      $display;
    end
    begin : LABEL_0
      id_5 <= 1;
      if (1) begin : LABEL_0$display
        ;
      end
    end
  end
  xor primCall (id_3, id_0, id_2, id_1, id_7);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_9 = 0;
endmodule
