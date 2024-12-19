// Seed: 882564578
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
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1
);
  id_3 :
  assert property (@(posedge id_1) id_1)
  else $display(1'h0);
  assign id_0 = 1;
  id_4(
      .id_0(id_1), .id_1(id_3)
  );
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  wire id_7;
  wire id_8;
endmodule
