// Seed: 1818424599
module module_0 (
    input  tri   id_0,
    output logic id_1
);
  initial id_1 <= {1};
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    output logic id_1,
    input  logic id_2
);
  always
  fork
    #1;
    begin : LABEL_0
      id_1 <= id_2;
    end
  join
  module_0 modCall_1 (
      id_0,
      id_1
  );
  id_4(
      .id_0(1), .id_1(1 == id_0), .id_2(1 == id_1 / 1'b0)
  );
  bufif1 primCall (id_1, id_2, id_0);
  wor  id_5 = 1'b0;
  wire id_6;
  id_7(
      .id_0(1), .id_1(1 < 1)
  );
endmodule
