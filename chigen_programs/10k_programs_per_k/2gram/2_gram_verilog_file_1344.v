// Seed: 148594665
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wire id_3
);
  module_2 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1
  );
endmodule
module module_1 (
    input wand id_0,
    input logic id_1,
    output logic id_2,
    output logic id_3,
    output supply0 id_4
);
  always begin : LABEL_0
    id_2 <= id_1;
    if (1'b0) begin : LABEL_0
      id_3 <= 1;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_4
  );
endmodule
module module_2 (
    output tri0  id_0
    , id_5,
    input  tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3
);
  assign id_0 = id_2;
  assign module_0.id_1 = 0;
endmodule
