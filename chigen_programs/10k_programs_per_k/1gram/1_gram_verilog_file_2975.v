// Seed: 2021977382
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6 = id_4, id_7 = id_6;
  assign module_1.id_2 = 0;
  assign id_1 = (1'h0);
  wire id_8;
  assign #1 id_3 = 1;
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = $display(id_5, (1)) * 1'b0;
  always @(posedge 1) #1 id_6 <= id_4;
  logic [7:0] id_12;
  id_13 :
  assert property (@(posedge id_6) id_12[1]) id_2 <= #1 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_8,
      id_5,
      id_11
  );
endmodule
