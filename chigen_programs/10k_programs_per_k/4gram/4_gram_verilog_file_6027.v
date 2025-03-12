// Seed: 2697947666
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    output uwire id_5,
    input tri id_6
);
  assign id_1 = -1'b0;
  logic id_8;
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    output logic id_2,
    input supply1 id_3,
    input wire id_4,
    input wire id_5,
    input tri id_6,
    output supply0 id_7
    , id_10,
    input uwire id_8
);
  always @(negedge id_4) begin : LABEL_0
    id_10 <= id_6;
    if (1) begin : LABEL_1
      id_1 <= 1;
    end else
      @(posedge "" or posedge id_3) begin : LABEL_2
        id_2 = 1'b0;
      end
  end
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_8,
      id_4,
      id_7,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
