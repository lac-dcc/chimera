// Seed: 2283581987
module module_0 (
    input  tri   id_0,
    output tri0  id_1,
    output logic id_2
);
  always @(negedge id_0)
    #1 begin : LABEL_0
      id_2 <= -1;
      if (1) begin : LABEL_1
        id_2 <= 1;
      end
    end
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd74
) (
    input supply1 id_0,
    input wor id_1,
    input tri id_2,
    output supply1 id_3,
    output logic id_4,
    output tri0 id_5,
    input tri id_6,
    input tri _id_7,
    input supply0 id_8,
    input uwire id_9
    , id_13,
    output logic id_10,
    output logic id_11
);
  tri id_14 = -1;
  bit [id_7 : 1] id_15 = id_2;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_4
  );
  initial begin : LABEL_0
    id_13 <= id_14;
    begin : LABEL_1
      id_11 = id_13;
      if (1) begin : LABEL_2
        id_15 <= id_9;
        id_10 = #id_16 1;
      end
    end
    @(posedge 1) id_4 = -1;
    $unsigned(22);
    ;
    SystemTFIdentifier;
  end
endmodule
