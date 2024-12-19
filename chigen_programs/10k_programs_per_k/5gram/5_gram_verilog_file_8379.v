// Seed: 671377139
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge id_5) begin : LABEL_0
    if (1'h0) id_4 = 1;
    fork
      id_7();
    join
    id_7 = id_5;
  end
  assign module_2.type_2 = 0;
endmodule
module module_1 (
    input wire id_0
);
  wire id_2, id_3, id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2 (
    output uwire id_0,
    input  tri1  id_1,
    input  wire  id_2
    , id_7,
    output tri0  id_3,
    input  tri1  id_4,
    inout  tri0  id_5
);
  wire id_8, id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9
  );
endmodule
