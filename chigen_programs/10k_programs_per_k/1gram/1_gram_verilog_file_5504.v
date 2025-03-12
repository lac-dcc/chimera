// Seed: 253059414
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    output tri0 id_3
);
  struct packed {
    logic id_5;
    logic id_6  = 1;
  } id_7;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    output uwire id_2,
    output uwire id_3,
    input  logic id_4
);
  assign id_1.id_4 = id_0;
  parameter id_6 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_3
  );
  reg id_7;
  initial begin : LABEL_0
    begin : LABEL_1
      id_1 <= id_0;
      begin : LABEL_2
        id_7 <= id_4;
      end
    end
  end
  assign id_2 = id_6;
  always
  `define pp_8 0
endmodule
