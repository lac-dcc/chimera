// Seed: 3389813856
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input tri id_2,
    input tri id_3
    , id_7,
    input tri id_4,
    input wand id_5
    , id_8
);
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    output tri1 id_2,
    input tri1 id_3,
    input logic id_4,
    output supply1 id_5,
    output uwire id_6,
    input tri id_7,
    input logic id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_3,
      id_3,
      id_7
  );
  assign modCall_1.type_9 = 0;
  assign id_2 = 1;
  always begin : LABEL_0
    if (id_3) begin : LABEL_0
      id_0 <= 1;
    end else
      @(posedge id_8.id_4 or 1) begin : LABEL_0
        id_1 <= id_8;
      end
  end
endmodule
