// Seed: 1768425025
module module_0;
  initial id_1 <= id_1;
  id_2(
      1, id_1
  );
endmodule
module module_1 ();
  wire id_2;
  assign id_2 = id_1 == 1;
  assign id_2 = id_2(1);
  id_4(
      id_1
  ); module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  module_0();
  wire id_3 = id_2;
endmodule
module module_3 (
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
    id_16
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_17 :
  assert property (@(posedge !1 or posedge 1) id_14)
    #1
      @(id_3) begin
        id_10 <= 1;
        begin
          id_8 = id_13;
        end
        id_10 = id_11;
      end
  nor (id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_2, id_3, id_5, id_7);
  module_0();
endmodule
