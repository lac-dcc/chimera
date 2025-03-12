// Seed: 3640659164
module module_0;
  logic id_1;
  ;
  wire id_2;
  assign module_1.id_2 = 0;
  wire id_3;
endmodule
module module_1 #(
    parameter id_8 = 32'd93
) (
    output uwire id_0,
    input uwire id_1,
    input wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wand id_5,
    input wire id_6,
    output uwire id_7,
    input tri0 _id_8
);
  logic [7:0] id_10;
  reg id_11;
  module_0 modCall_1 ();
  always @(id_4 or posedge -1) begin : LABEL_0
    if (1'b0) begin : LABEL_1
      id_10[1 : id_8] <= id_6;
    end else begin : LABEL_2
      id_11 <= id_10 >= id_5#(.id_4(1));
    end
  end
endmodule
