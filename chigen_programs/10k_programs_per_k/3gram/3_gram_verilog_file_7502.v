// Seed: 1527709994
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
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_2 ? id_9 : 1) begin : LABEL_0
    if (id_10) begin : LABEL_0
      id_8 = 1'b0 == id_4;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  always @(negedge id_4 && 1) id_1 <= id_2;
  wire id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_3,
      id_6,
      id_5,
      id_5,
      id_3,
      id_6
  );
endmodule
