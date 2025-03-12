// Seed: 625599956
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input supply1 id_2
    , id_8,
    input wire id_3
    , id_9,
    input tri id_4,
    output tri1 id_5,
    input uwire id_6
);
  always @(posedge 1'b0) begin : LABEL_0
    $signed(44);
    ;
  end
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    input wire id_3,
    input wire id_4,
    output logic id_5
);
  always @* id_5 <= -1 & id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_1,
      id_1,
      id_2,
      id_4
  );
endmodule
