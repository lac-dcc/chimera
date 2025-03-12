// Seed: 3161159703
module module_0 (
    input  wor  id_0,
    output tri0 id_1,
    input  tri1 id_2
);
  always @(*) begin : LABEL_0
    $unsigned(18);
    ;
  end
  wire  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd19,
    parameter id_3 = 32'd84,
    parameter id_8 = 32'd37,
    parameter id_9 = 32'd98
) (
    input uwire id_0,
    input tri id_1,
    input tri _id_2,
    input tri0 _id_3,
    input uwire id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    output supply0 _id_8,
    input supply0 _id_9,
    input wor id_10,
    input wire id_11,
    input supply1 id_12,
    output wor id_13,
    input tri1 id_14,
    output tri0 id_15
);
  wire [1 : -1] id_17;
  struct packed {
    logic [1 : id_9] id_18;
    logic id_19;
  }
      id_20 = 1, id_21;
  reg [-1 : -1] id_22;
  assign id_20.id_19[id_3] = -1;
  module_0 modCall_1 (
      id_0,
      id_13,
      id_4
  );
  localparam [id_2 : 1] id_23 = 1;
  logic [id_8 : 1 'b0] id_24;
  ;
  always @(id_4 or posedge 1) begin : LABEL_0
    id_20 = 1'b0;
    if (-1) id_22 <= -1'h0;
  end
endmodule
