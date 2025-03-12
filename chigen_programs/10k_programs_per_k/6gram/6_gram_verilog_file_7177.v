// Seed: 1007637160
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wire id_3,
    input supply1 id_4,
    output supply0 id_5
);
  wire id_7;
  assign module_1.id_0 = 0;
  reg id_8;
  bit id_9 = 1;
  assign id_5 = id_7;
  initial begin : LABEL_0
    id_9 <= id_4;
    id_8 <= id_7;
    if (-1) begin : LABEL_1
      if (1) begin : LABEL_2
        $clog2(10);
        ;
        id_8 <= id_2;
      end
    end
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd91,
    parameter id_7 = 32'd88
) (
    input  wire id_0,
    input  tri1 id_1,
    output tri1 _id_2,
    output tri0 id_3
);
  logic id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3
  );
  logic [id_2 : 1 'h0] _id_7;
  assign id_6 = id_7 == $clog2(10);
  ;
  wire [id_7 : 1] id_8;
  always @(-1 == 1) begin : LABEL_0
    cover (1 || -1 + -1);
  end
endmodule
