// Seed: 660542205
module module_0 (
    input  supply1 id_0
    , id_4,
    output supply1 id_1,
    output logic   id_2
);
  final begin : LABEL_0
    id_4 <= "";
    $signed(77);
    ;
    id_2 = -1;
    if (1)
      if (1) begin : LABEL_1
        if (1) begin : LABEL_2
          id_2 = id_0;
          id_4 <= id_0;
        end
      end
  end
endmodule
module module_1 (
    inout  supply0 id_0,
    output logic   id_1
);
  assign id_0 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
  always @(posedge 1) id_1 = #1 id_0 == 1;
endmodule
