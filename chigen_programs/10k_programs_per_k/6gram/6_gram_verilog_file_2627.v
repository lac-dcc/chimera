// Seed: 1083721730
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_18 = -1;
  wire id_19;
  ;
  assign id_6 = id_10;
endmodule
module module_1 #(
    parameter id_5 = 32'd24,
    parameter id_7 = 32'd0
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout logic [7:0] id_2;
  output reg id_1;
  always @(*) begin : LABEL_0
    if (1)
      assert (id_2 || id_3);
      else begin : LABEL_1
        id_1#(
            .id_3(1),
            .id_3(-1),
            .id_3(1),
            .id_2(-1),
            .id_2(1)
        ) <= id_3;
        id_1 <= -1;
        id_1 <= id_2;
      end
  end
  logic id_4;
  ;
  wire _id_5 = !id_2[-1];
  parameter id_6 = 1;
  nor primCall (id_1, id_3, id_6, id_9, id_8, id_10, id_2, id_4);
  uwire _id_7 = id_7 - -1 & 1 && 1 == id_3 && 1;
  assign id_1 = id_2[id_7];
  struct packed {
    logic [-1  !=  -1 : {  id_5  {  1  - "" }  }] id_8;
    logic [id_5 : -1] id_9;
  } [-1 : ""] id_10;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_6,
      id_10,
      id_8,
      id_4,
      id_6,
      id_8,
      id_3,
      id_3,
      id_4,
      id_9,
      id_6,
      id_9,
      id_3,
      id_6,
      id_6
  );
  always @(*) begin : LABEL_2
    id_1 = 1;
  end
endmodule
