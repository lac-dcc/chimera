// Seed: 395291478
module module_0 #(
    parameter id_1 = 32'd25
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout logic [7:0] id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire _id_1;
  assign id_5[id_1] = id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd14,
    parameter id_9 = 32'd73
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire _id_1;
  supply0 id_6;
  assign id_6 = (1);
  bit id_7, id_8;
  localparam id_9 = -1'b0 == 1;
  supply0 id_10;
  ;
  logic [7:0] id_11;
  localparam id_12 = 1;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_10,
      id_10,
      id_11
  );
  logic id_13;
  assign id_10#(id_12) = -1;
  initial begin : LABEL_0
    begin : LABEL_1
      id_8 <= id_10;
      if (id_9) {id_2, 1 - id_13[id_1==?-1], -1 == id_11 < id_11[id_9 : 1]} <= id_9;
      else begin : LABEL_2
        assume #1  (id_11) $clog2(id_9);
        ;
        assume ((-1'b0 == id_11) + -1);
      end
    end
    cover (!id_13);
  end
endmodule
