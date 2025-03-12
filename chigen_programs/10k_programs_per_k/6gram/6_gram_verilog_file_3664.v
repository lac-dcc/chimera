// Seed: 1488552226
module module_0 (
    output logic id_0,
    input supply0 id_1,
    input tri id_2,
    output logic id_3,
    input wor id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    output logic id_8
);
  assign id_0 = -1 || -1 ? id_2 : -1;
  always @(posedge -1 or "") begin : LABEL_0
    if (-1) begin : LABEL_1
      id_3 <= 1;
    end else begin : LABEL_2
      id_0 <= (-1);
      repeat (id_2) begin : LABEL_3
        id_8 = #id_10 id_1;
      end
    end
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd40,
    parameter id_7 = 32'd41
) (
    input supply0 id_0,
    input tri0 id_1,
    input tri id_2,
    input tri1 _id_3,
    input tri1 id_4,
    output logic id_5
);
  wire _id_7;
  logic [7:0][id_3 : id_7  *  -1  -  -1] id_8;
  initial begin : LABEL_0
    id_5 <= id_8[-1];
  end
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5,
      id_0,
      id_4,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_10 = 0;
  logic [-1 : ""] id_9;
  ;
  assign id_9 = 1'h0;
endmodule
