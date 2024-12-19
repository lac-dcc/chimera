// Seed: 1842775821
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always_latch @(posedge 1) begin : LABEL_0
    #1 id_6 <= 1;
    if ("") begin : LABEL_0
      id_2 <= 1;
      id_3 <= id_2;
    end
  end
  assign id_5 = id_7;
  string id_8;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  wire id_9;
  assign id_8 = "";
  assign id_2 = 1;
  assign id_3 = 1;
  wire  id_10;
  uwire id_11 = id_5 < id_2;
endmodule
