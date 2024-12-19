// Seed: 667911428
module module_0 ();
  assign id_1 = 1;
  wire id_2;
  wire  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ;
  wire id_28;
  generate
    wire id_29 = id_10;
  endgenerate
  wire id_30;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output logic id_0,
    output logic id_1,
    input  wand  id_2,
    input  wire  id_3,
    output logic id_4,
    input  wor   id_5
);
  always @(1'b0)
    @(id_5) begin : LABEL_0
      if (1)
        if (id_2) begin : LABEL_0
          if (id_2) id_4 <= 1;
          else if (1) begin : LABEL_0
            id_4 <= 1;
          end else
            fork
              id_1 <= 1;
              id_1 = 1'b0;
            join_any
          $display(1, id_5);
        end else id_0 <= 1;
    end
  module_0 modCall_1 ();
endmodule
