// Seed: 2060938668
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_8;
  assign module_1.type_4 = 0;
  assign id_3 = id_5;
  logic [7:0] id_9 = id_8;
  wire id_10;
  assign id_8[1'b0] = 1 + id_6;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1'b0 | id_2;
  wor id_3;
  always @(posedge 1) begin : LABEL_0
    wait (id_2);
    id_2 <= 1;
    #(1'b0);
    id_2 <= id_2 - id_3;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3
  );
endmodule
