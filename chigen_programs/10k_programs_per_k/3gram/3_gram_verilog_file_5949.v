// Seed: 2172349586
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  reg  id_4;
  task id_5;
    id_5 = #id_6 id_4;
  endtask
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_3
  );
  assign id_3 = id_5;
  wire id_6;
endmodule
module module_2 (
    input uwire id_0,
    input uwire id_1,
    input wire  id_2
    , id_5,
    input logic id_3
);
  wire id_6;
  final begin : LABEL_0
    id_5 <= id_3;
  end
  wire id_7;
  id_8(
      .id_0(id_6), .id_1(1), .id_2(1)
  );
  wire id_9;
  module_0 modCall_1 (
      id_6,
      id_9
  );
endmodule
