// Seed: 3384140252
module module_0 (
    input wire id_0,
    output supply0 id_1,
    output uwire id_2,
    output logic id_3,
    output wand id_4,
    input supply0 id_5,
    output tri0 id_6
);
  wire id_8;
  initial id_3 = #id_9 id_5 ? 1 : 1;
endmodule
macromodule module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output logic id_2,
    input  wand  id_3,
    input  tri0  id_4,
    output tri   id_5
);
  always @(id_1) begin : LABEL_0
    #(1) begin : LABEL_0
      id_2 <= 1'd0;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_5
  );
  assign modCall_1.type_5 = 0;
  id_7(
      .id_0(1), .id_1(id_5)
  );
  wire id_8;
endmodule
