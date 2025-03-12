// Seed: 3990073833
module module_0 (
    input  tri1  id_0,
    output logic id_1
);
  assign id_1 = 1;
  assign module_1.id_2 = 0;
  always_latch begin : LABEL_0
    id_1 <= id_0;
  end
  parameter id_3 = 1;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    input wor id_2,
    output logic id_3,
    input supply1 id_4,
    output logic id_5,
    output wand id_6,
    input wire id_7
);
  initial
    @(posedge id_7.id_4 or posedge (1)) begin : LABEL_0
      if (1) begin : LABEL_1
        id_5 = id_4;
      end else begin : LABEL_2
        begin : LABEL_3
          $signed(43);
          ;
        end
        id_3 <= id_0;
      end
    end
  module_0 modCall_1 (
      id_2,
      id_5
  );
endmodule
