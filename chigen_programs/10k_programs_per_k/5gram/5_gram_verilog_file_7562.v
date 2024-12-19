// Seed: 2086586315
module module_0 (
    output supply1 id_0
    , id_7,
    input wire id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wor id_4,
    output tri id_5
);
  wire id_8, id_9;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    output logic id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply0 id_5
);
  always @(*) begin : LABEL_0
    begin : LABEL_0
      wait (id_5);
    end
    if (id_0) begin : LABEL_0
      id_1 <= id_0;
    end else id_2 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3
  );
  tri id_7;
  assign id_7 = id_5;
  wire id_8;
endmodule
