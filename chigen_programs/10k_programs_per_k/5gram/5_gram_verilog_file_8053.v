// Seed: 2914968943
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1) begin : LABEL_0
    id_4 = 1'b0;
  end
  always @(posedge {id_1, id_2} - id_1 or posedge 1) begin : LABEL_0
    assume #1  (id_6)
    else $display(1);
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_4,
      id_6,
      id_1,
      id_2,
      id_2,
      id_2,
      id_6
  );
endmodule
