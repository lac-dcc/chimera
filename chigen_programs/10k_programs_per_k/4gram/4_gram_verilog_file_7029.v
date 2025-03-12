// Seed: 3446645182
module module_0 (
    output wor id_0,
    output supply1 id_1,
    input tri0 id_2
);
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1
  );
  wire id_4;
endmodule
module module_2 (
    input  wand  id_0,
    output tri1  id_1,
    output logic id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  wor   id_5,
    output logic id_6,
    input  tri0  id_7
);
  always @(posedge id_3 or posedge -1)
    if (1) begin : LABEL_0
      if (1) id_6 = id_5;
      else begin : LABEL_1
        if (-1'b0) begin : LABEL_2
          cover (id_5);
        end else id_2 = -1'b0;
      end
    end
  generate
    always @(1) assign id_2 = id_4;
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
