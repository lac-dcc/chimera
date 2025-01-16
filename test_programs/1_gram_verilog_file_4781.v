// Seed: 2890969996
module module_0;
  tri1 id_1;
  assign module_2.type_0 = 0;
  id_2(
      -1 ? 1 : {id_1, id_1, 1, id_1}
  );
  assign id_1 = 1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = -1;
  module_0 modCall_1 ();
  assign modCall_1.type_6 = 0;
endmodule
module module_2 (
    input logic id_0
);
  assign id_2 = 1;
  always
  fork
    begin : LABEL_0
      id_3 = id_2;
      begin : LABEL_0
        id_2 = id_3;
        @(posedge id_0) id_2 <= id_0;
      end
    end
  join
  module_0 modCall_1 ();
  assign id_2 = -1;
endmodule
