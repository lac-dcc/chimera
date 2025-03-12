// Seed: 2010119085
module module_0 (
    input  uwire   id_0,
    output uwire   id_1,
    output supply0 id_2,
    output uwire   id_3
);
  assign id_1 = -1;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output wand  id_4,
    output logic id_5,
    output logic id_6
);
  assign id_5 = ~id_3 - id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.id_0 = 0;
  always @(id_0 == id_3) id_5 = #1 -1;
  initial begin : LABEL_0
    id_6 = id_2;
    if (-1'b0 && 1'b0) begin : LABEL_1
      id_6 <= 1;
    end else begin : LABEL_2
      $signed(70);
      ;
      id_6 <= 1;
    end
  end
endmodule
