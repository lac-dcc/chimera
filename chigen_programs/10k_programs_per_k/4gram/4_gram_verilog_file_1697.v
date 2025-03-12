// Seed: 2774308838
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wand id_3;
  output wire id_2;
  input wire id_1;
  wire [1 'b0 : -1] id_7;
  wire id_8;
  assign id_3 = -1'd0;
  wire id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd23
) (
    input tri id_0,
    output tri id_1,
    output supply1 _id_2,
    inout logic id_3
);
  parameter id_5 = 1;
  wire id_6 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_3 = 0;
  localparam id_7 = id_5;
  reg id_8;
  struct packed {
    logic [1 : 1] id_9;
    logic id_10;
  } id_11;
  logic id_12, id_13;
  wire id_14;
  assign id_3 = id_11.id_10 ? -1'b0 : 1;
  always @(negedge 1'h0 or posedge id_11.id_10) begin : LABEL_0
    begin : LABEL_1
      forever id_3 <= id_6 ? "" : -1 ? id_11 : 1;
      if (id_5[-1]) id_11.id_10 <= 1;
    end
    id_8 <= id_12;
  end
endmodule
