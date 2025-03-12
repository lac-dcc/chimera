// Seed: 3387452784
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri id_4
);
  wire id_6;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    input supply0 id_2,
    output logic id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    output tri0 id_7,
    input tri0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_1,
      id_8
  );
  assign modCall_1.id_1 = 0;
  always_comb @(posedge !id_5) begin : LABEL_0
    id_3 <= -1'b0 - id_2;
    assign id_4 = id_5;
  end
endmodule
