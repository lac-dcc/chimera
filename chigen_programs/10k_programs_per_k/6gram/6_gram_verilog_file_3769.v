// Seed: 590509302
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_5, 1) id_6 = #1 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    wait (1);
    if (1) begin : LABEL_0
      id_6[1'h0] <= id_7;
    end
  end
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_1,
      id_1,
      id_7,
      id_2,
      id_3,
      id_8
  );
endmodule
