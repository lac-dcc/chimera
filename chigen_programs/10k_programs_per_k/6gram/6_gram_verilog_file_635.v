// Seed: 555560169
module module_0 (
    input  tri  id_0,
    input  wand id_1,
    output tri0 id_2
);
  wire id_4, id_5, id_6, id_7, id_8, id_9;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    output tri0  id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2
  );
  wire id_4, id_5;
endmodule
module module_2 (
    output wire  id_0,
    input  wire  id_1,
    output logic id_2,
    input  tri0  id_3
);
  always @(id_1, posedge !id_1) begin : LABEL_0
    id_2 = id_1;
  end
  logic id_5;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
  assign id_2#(
          .id_3(1),
          .id_5(~1 >= 1),
          .id_5(1 - 1),
          .id_5(1)
      ) = {
        1'b0, 1
      };
endmodule
