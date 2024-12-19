// Seed: 2066304223
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_2) begin : LABEL_0
    id_3 <= id_2 & 1'b0;
  end
  not primCall (id_1, id_3);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    output wire  id_0,
    output uwire id_1,
    output tri0  id_2
    , id_4
);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
  wand id_6;
  assign id_6 = 1;
endmodule
