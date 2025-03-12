// Seed: 1455575979
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5
);
endmodule
module module_1 #(
    parameter id_4 = 32'd8
) (
    input supply0 id_0,
    input supply0 id_1,
    output logic id_2,
    input wand id_3,
    input supply0 _id_4,
    output logic id_5,
    input tri0 id_6
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_3 = 0;
  always_latch @(posedge id_3 or posedge $realtime == 1) begin : LABEL_0
    id_2 <= (-1);
  end
  always @(posedge id_1 | id_0) begin : LABEL_1
    if ("") begin : LABEL_2
      #1;
      disable id_8;
    end else id_5 <= (-1);
  end
  wire [1 : id_4] id_9;
endmodule
