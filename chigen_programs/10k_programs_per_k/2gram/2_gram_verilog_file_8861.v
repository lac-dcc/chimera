// Seed: 825584537
module module_0;
  wire id_2;
  assign module_1.id_10 = 0;
  assign id_1[1] = 'h0;
  id_3(
      .id_0(1'b0)
  );
  wire id_4;
  wire id_5;
endmodule
module module_1 (
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    while (id_3) begin : LABEL_0
      if (id_2) begin : LABEL_0
        fork
        join_none
        id_8  <= 1;
        id_11 <= id_8;
        id_12 <= id_2;
        id_5  <= id_3 ^ ~id_10;
      end
      id_3 <= id_9;
    end
  module_0 modCall_1 ();
endmodule
