// Seed: 2366298063
module module_0 (
    input wire id_0,
    output supply0 id_1,
    input tri1 id_2
    , id_5,
    output wor id_3
);
  wire id_6;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    output supply1 id_2,
    output supply1 id_3
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input tri id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input wire id_5,
    output logic id_6
);
  initial begin : LABEL_0
    if (id_1 != ~id_2) begin : LABEL_0
      id_6 <= 1'h0;
      id_3 = id_0;
    end
    $display;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
