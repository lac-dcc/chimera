// Seed: 174466128
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply0 id_3
    , id_5
);
  initial begin : LABEL_0
    id_5 = id_1;
  end
  wire id_6;
  assign id_5 = 1;
  always @(posedge id_6);
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1
);
  assign id_3 = 1;
  always_latch
    case (1 ^ id_0)
      id_3: begin : LABEL_0
        id_3 = id_0;
      end
      id_0 + id_1: begin : LABEL_0
        id_3 = id_1;
      end
      1'b0: id_3 = 1;
    endcase
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0
  );
  wire id_4 = !id_0;
endmodule
