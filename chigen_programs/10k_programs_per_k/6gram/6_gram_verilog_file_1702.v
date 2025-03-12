// Seed: 3770195847
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout reg id_1;
  wire id_3;
  bit  id_4;
  assign id_1 = 1;
  wire [-1 'b0 : -1] id_5;
  always @(posedge -1) begin : LABEL_0
    id_1 = id_4;
    begin : LABEL_1
    end
    id_4#(
        .id_1(1),
        .id_5(1'h0)
    ) = #id_6 id_3;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd70,
    parameter id_1 = 32'd13,
    parameter id_4 = 32'd26
) (
    input uwire _id_0,
    input uwire _id_1,
    input wire id_2,
    input tri id_3,
    input supply1 _id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output wor id_8
);
  wire id_10;
  logic [{  1  , $realtime >>  id_0  -  1 'h0 ,  1  } : id_1] id_11;
  wire [id_4 : 1 'b0] id_12;
  always @(posedge -1) @(id_0);
  wire id_13;
  ;
  wire id_14;
  not primCall (id_6, id_7);
  logic [1 : 1  ^  1] id_15;
  ;
  initial
    repeat (id_10)
      @(posedge -1'h0) begin : LABEL_0
        id_11 <= id_11;
      end
  module_0 modCall_1 (
      id_11,
      id_12
  );
  assign modCall_1.id_1 = 0;
endmodule
