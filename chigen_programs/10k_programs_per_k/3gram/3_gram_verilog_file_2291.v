// Seed: 695456578
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = 1'b0;
  module_2 modCall_1 (
      id_1,
      id_4,
      id_5
  );
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4 = id_4;
  wand id_5 = id_3;
  assign id_4 = ~id_5;
  always_latch @(posedge id_3) id_5 = 1'd0;
  wire id_6;
endmodule
