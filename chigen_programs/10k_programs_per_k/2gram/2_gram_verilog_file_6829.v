// Seed: 2000913507
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_5;
  assign module_1.id_6 = 0;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = 1'b0;
  always #1
    @(*) begin : LABEL_0
      id_5 = #1 1;
      id_5 <= 1;
      disable id_7;
      id_3 <= id_3;
    end
  assign id_4 = 1;
  wor  id_8;
  wire id_9 = id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_9
  );
endmodule
