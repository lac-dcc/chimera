// Seed: 1735316517
module module_0;
  logic id_1, id_2;
  assign id_1 = -id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd16
) (
    _id_1
);
  input wire _id_1;
  module_0 modCall_1 ();
  struct packed {
    logic [-1 'b0 : 1 'h0] id_2;
    union packed {
      logic id_3;
      logic [1 'b0 : -1] id_4;
      logic id_5;
      logic id_6;
      int id_7;
      logic id_8;
      id_9 id_10;
      logic id_11;
      logic id_12;
      id_13 id_14;
      logic id_15[id_1 : id_1];
    } id_16;
  } id_17 = id_17.id_6;
  assign id_17.id_12 = -1;
  assign id_17.id_3  = id_17.id_13 - 1;
  always_ff begin : LABEL_0
    @(posedge 1) id_17.id_15[1] = id_17.id_14;
    id_17.id_10 <= id_17.id_14.id_17.id_5[-1'b0 :-1'b0][1];
    @(posedge 'b0);
  end
  wire id_18;
  parameter id_19 = -1;
endmodule
