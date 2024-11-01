// Seed: 1741000870
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_4(
      .id_0(id_1), .id_1(id_3), .id_2(1), .id_3(!id_2), .min()
  );
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
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg  id_10;
  wire id_11;
  wire id_12 = id_11;
  assign id_12 = id_7++;
  module_0(
      id_11, id_11, id_8
  );
  always @(posedge "") id_4 <= id_10;
  wire id_13;
  always_latch @(~id_1)
    case (id_1)
      1: id_5 = id_6 == 1 ? id_10 : 1;
      ~id_1: id_7 = 1;
    endcase
endmodule
