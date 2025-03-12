// Seed: 2394017553
module module_0 (
    output supply0 id_0,
    input wire id_1,
    output uwire id_2,
    output supply0 id_3,
    input wor id_4,
    input tri id_5,
    input tri id_6,
    output logic id_7
    , id_15,
    input tri id_8,
    input wor id_9,
    input supply0 id_10,
    input wor id_11,
    input uwire id_12,
    output logic id_13
);
  initial begin : LABEL_0
    id_7 = id_12;
    $unsigned(67);
    ;
    id_13 <= id_6 | -1;
    id_7  <= -1;
    deassign id_0;
  end
endmodule
module module_1 #(
    parameter id_7 = 32'd73
) (
    input uwire id_0,
    input supply0 id_1,
    output wire id_2,
    output uwire id_3,
    output wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    input tri0 _id_7,
    input wor id_8,
    output supply1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output logic id_12
);
  reg [1 : 1  ==  id_7] id_14;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_4,
      id_4,
      id_11,
      id_8,
      id_6,
      id_12,
      id_10,
      id_8,
      id_1,
      id_0,
      id_5,
      id_12
  );
  assign modCall_1.id_3 = 0;
  always @(posedge id_0) begin : LABEL_0
    id_14 <= id_1;
    repeat (id_11) begin : LABEL_1
      disable id_15;
    end
  end
  wire id_16;
  initial if (1) id_12 <= -1'b0;
endmodule
