// Seed: 84110009
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
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_11 = 32'd50,
    parameter id_5  = 32'd30,
    parameter id_8  = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    _id_11
);
  inout wire _id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  inout wire _id_8;
  inout wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_7,
      id_1,
      id_7,
      id_7,
      id_9,
      id_7,
      id_7,
      id_1
  );
  inout wire _id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [1 'b0 : -1  == 'b0 -  id_5] id_12;
  ;
  always @((id_11 - "") or id_2) begin : LABEL_0
    if (1) id_12[-1] <= 1;
    else begin : LABEL_1
      if (1 - 1) begin : LABEL_2
        fork
          id_4["" : id_8] = -1;
          id_13(id_10, id_10[id_11+:1], id_11);
        join
      end else begin : LABEL_3
        $signed(62);
        ;
        if (1 != 1 && 1 || 1) begin : LABEL_4
          SystemTFIdentifier(-1);
        end
      end
    end
  end
  wire id_14;
endmodule
