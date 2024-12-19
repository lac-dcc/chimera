// Seed: 323981873
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
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  initial $display(id_6);
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
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_8;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_5,
      id_1,
      id_1,
      id_5,
      id_6,
      id_7,
      id_7,
      id_1,
      id_1,
      id_1,
      id_6
  );
  always @(posedge id_3) begin : LABEL_0
    id_1 = 1 - 1'b0;
    #id_9 begin : LABEL_0
      id_4 <= 1'b0;
      if (id_1) begin : LABEL_0
        id_8 = #1 1 == "";
      end
    end
  end
endmodule
