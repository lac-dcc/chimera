// Seed: 3197952846
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
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout reg id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge -1 or negedge id_5) begin : LABEL_0
    id_3 = id_6;
  end
endmodule
module module_1 #(
    parameter id_16 = 32'd34,
    parameter id_7  = 32'd64
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire _id_16;
  inout reg id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output reg id_10;
  input wire id_9;
  inout wire id_8;
  input wire _id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  task id_20([id_7 : (  -1  )] id_21, input [id_16 : -1] id_22, input int id_23);
    begin : LABEL_0
      if (1)
        if (1 == 1)
          if (1) id_15 = id_16 == id_6;
          else begin : LABEL_1
            id_22 <= 1;
          end
      id_10#(.id_16((1))) <= id_23;
    end
  endtask
  module_0 modCall_1 (
      id_1,
      id_17,
      id_15,
      id_8,
      id_23,
      id_23,
      id_18,
      id_6,
      id_23,
      id_18
  );
endmodule
