// Seed: 961076349
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wor  id_11;
  wire id_12;
  wire id_13 = 1 ? (id_13) : id_8;
  assign id_11 = 1;
  wire id_14;
  assign id_14 = id_10;
  wire id_15, id_16;
  wire id_17, id_18;
  assign id_1 = 1;
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
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_15;
  assign id_1 = id_12;
  always @(1 or posedge {id_15,
    id_13
  })
  begin : LABEL_0
    id_5 = new[id_8];
  end
  genvar id_16;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_15,
      id_1,
      id_1,
      id_7,
      id_12,
      id_13,
      id_15,
      id_16
  );
  id_17(
      .id_0(1), .id_1(id_12 / 1'd0), .id_2(id_6), .id_3(1'h0)
  );
  wire id_18;
  initial id_15 = id_6;
  wire id_19;
  wire id_20;
  id_21(
      .id_0(1), .id_1(1'h0), .id_2(1), .id_3(id_3[1]), .id_4(id_10[1]), .id_5(id_13)
  );
  wire id_22 = id_11;
  xnor primCall (id_3, id_8, id_13, id_2, id_9, id_10, id_7, id_6, id_5, id_11, id_14);
endmodule
