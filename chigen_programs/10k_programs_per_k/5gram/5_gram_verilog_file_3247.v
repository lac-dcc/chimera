// Seed: 1166542856
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    output wor   id_2,
    output uwire id_3
);
  assign id_3 = -1 ? -1 : id_1;
  assign module_1.id_4 = 0;
  assign id_2 = -1 ? id_1 : id_1;
  assign id_3 = id_1;
  reg id_5;
  assign {id_5, 1, id_1} = 1'b0;
  always @(posedge id_0 or negedge "") begin : LABEL_0
    $clog2(50);
    ;
    id_5 <= id_0;
  end
  assign id_2 = id_0;
  assign id_2 = id_1;
endmodule
module module_1 (
    inout supply0 id_0,
    output wor id_1,
    output tri id_2,
    output uwire id_3,
    input supply0 id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1
  );
endmodule
