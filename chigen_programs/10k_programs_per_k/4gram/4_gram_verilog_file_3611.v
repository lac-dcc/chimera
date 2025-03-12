// Seed: 3432166059
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_2 modCall_1 ();
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  tri1  id_1,
    output logic id_2
);
  parameter id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  always #1 begin : LABEL_0
    $unsigned(10);
    ;
    id_2 <= -1;
    id_2 = id_4;
  end
endmodule
module module_2 ();
  always @(*) begin : LABEL_0
    #1;
    #id_1;
    assume (id_1);
  end
  wire id_2;
endmodule
