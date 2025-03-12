// Seed: 1532578287
module module_0 (
    output tri id_0,
    input  tri id_1
);
  tri id_3 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  supply0 id_0,
    output uwire   id_1
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign id_1 = 1;
endmodule
module module_2 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wor id_3,
    input supply1 id_4,
    output logic id_5,
    input tri1 id_6
);
  always_ff @(-1) begin : LABEL_0
    begin : LABEL_1
      id_5 = new;
      id_5 <= -1 < 1;
    end
  end
  initial begin : LABEL_2
    if (1) begin : LABEL_3
      id_5 = 'b0;
    end
  end
  wire id_8;
endmodule
module module_3 #(
    parameter id_0 = 32'd16
) (
    input supply0 _id_0,
    output logic id_1,
    input wire id_2
);
  always @(posedge -1 or posedge id_0) id_1 = id_0;
  localparam id_4 = 1'h0;
  wire id_5;
  logic [-1 : id_0] id_6;
  module_2 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  assign id_6#(.id_4(id_4)) = 1;
  parameter id_7 = 1;
  assign id_6 = -1 == id_4 < id_7;
endmodule
