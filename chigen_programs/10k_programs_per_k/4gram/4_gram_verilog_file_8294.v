// Seed: 4072422997
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_5 = {id_3, 1, 1, id_2 && 1};
  assign id_1 = 1;
  supply1 id_6 = 1;
  wire id_7;
  always_comb @(posedge id_5) begin : LABEL_0
    id_3 <= 1;
  end
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final begin : LABEL_0
    id_1 = (id_3);
  end
  wire id_7;
  always id_6 = #id_8 id_8;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_6,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
