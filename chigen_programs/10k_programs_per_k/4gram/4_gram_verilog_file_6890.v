// Seed: 2946679465
module module_0 (
    input  wor   id_0,
    input  wand  id_1,
    output uwire id_2,
    input  uwire id_3,
    input  tri   id_4
);
  assign id_2 = id_0;
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input tri1 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    output wire id_7,
    output tri0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_7,
      id_1,
      id_4
  );
endmodule
module module_2 (
    input tri1 id_0,
    output tri0 id_1,
    output logic id_2
    , id_11,
    output logic id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wand id_6,
    input logic id_7,
    output tri1 id_8,
    input logic id_9
);
  generate
    always @(1 or posedge (id_7))
      for (id_3 = 1'b0; 1; id_3 = ^id_9) begin : LABEL_0
        if (id_7) id_2 <= id_7;
        else begin : LABEL_0
          id_11 <= id_9;
          id_3  <= 1;
        end
      end
    wire id_12;
  endgenerate
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
