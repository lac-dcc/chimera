// Seed: 2916801489
module module_0 (
    input  tri1  id_0,
    input  tri   id_1,
    output logic id_2,
    input  uwire id_3
);
  reg id_5;
  assign id_2 = 1;
  reg id_6, id_7;
  always @(id_3 & 1 or posedge id_3 == id_1) begin : LABEL_0
    fork
      id_2 <= 1 ? id_3 == 1 : id_7 == id_6;
      begin : LABEL_0
        #1;
        disable id_8;
        id_5 <= id_6;
        #(1);
      end
    join
  end
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    output logic id_2,
    input  uwire id_3,
    input  logic id_4,
    input  tri1  id_5
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_1
  );
  assign modCall_1.type_0 = 0;
  always_latch @(*) begin : LABEL_0
    if (id_4) id_2 <= id_4;
    else id_0 <= 1;
  end
endmodule
