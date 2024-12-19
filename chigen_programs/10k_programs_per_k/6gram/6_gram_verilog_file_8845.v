// Seed: 3280947592
module module_0;
  wor id_1;
  always @(posedge id_2) begin : LABEL_0
    id_2 <= #id_2 id_2;
    #id_3 id_1 = 1;
  end
  wire id_5;
endmodule
module module_1 (
    output tri   id_0,
    output logic id_1,
    input  logic id_2,
    input  wor   id_3,
    input  tri1  id_4
    , id_7,
    output tri   id_5
);
  always @(posedge 1) begin : LABEL_0
    wait (id_4);
    #1;
    begin : LABEL_0
      id_1 <= id_2;
      id_5 = 1;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_0 = id_4;
endmodule
