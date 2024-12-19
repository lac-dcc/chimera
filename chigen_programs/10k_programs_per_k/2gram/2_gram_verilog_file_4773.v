// Seed: 2978049580
module module_0 (
    input uwire id_0,
    input wor id_1,
    output uwire id_2,
    output tri id_3,
    output tri id_4,
    output supply0 id_5,
    output uwire id_6,
    output wor id_7,
    input uwire id_8,
    input tri id_9,
    input supply1 id_10,
    input tri id_11,
    output tri1 id_12,
    output tri id_13
);
  wire id_15;
  always begin : LABEL_0
    id_2 = id_9;
    $display(1, id_9);
  end
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    input  wire  id_1,
    input  logic id_2,
    input  tri0  id_3,
    input  wire  id_4,
    input  tri   id_5
);
  reg id_7;
  assign id_0 = 1;
  assign id_7 = 1;
  always id_7 <= id_2;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_5,
      id_5,
      id_3,
      id_4,
      id_0,
      id_0
  );
  final
    @(id_7 or !id_1) begin : LABEL_0
      id_7 = 1 | id_4;
    end
endmodule
