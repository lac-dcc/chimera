// Seed: 1132054295
module module_0 (
    input uwire id_0,
    input wand  id_1
    , id_3
);
  assign id_3 = (-1'b0);
  initial begin : LABEL_0
    id_3 <= id_0;
    id_3 = 1;
    id_3 <= -1'b0;
    id_3 <= id_3 + id_0;
    id_3 = !id_1;
  end
  assign id_3 = id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd26,
    parameter id_1 = 32'd40,
    parameter id_8 = 32'd26
) (
    input uwire _id_0,
    input wor _id_1,
    input uwire id_2,
    input tri id_3,
    output wor id_4,
    input wand id_5,
    output uwire id_6,
    output uwire id_7,
    input uwire _id_8,
    output supply0 id_9
);
  logic [7:0][(  id_1  ) : 1] id_11;
  wire  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  module_0 modCall_1 (
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
  wire id_26, id_27;
  wire [1 : id_0] id_28;
  wire id_29, id_30;
  always @(posedge (id_27) or -1'd0) begin : LABEL_0
    wait (id_30);
    id_11[id_8==-1] <= 1;
  end
endmodule
