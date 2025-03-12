// Seed: 1820845184
module module_0 (
    input  supply0 id_0,
    input  supply1 id_1,
    input  supply1 id_2,
    output supply1 id_3
);
  assign id_3 = -1 ? id_0 : 1 ? -1 : {-1'd0{-1}};
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    input supply0 id_2,
    output logic id_3,
    output supply0 id_4
);
  always @(-1'd0 != id_1) begin : LABEL_0
    $clog2(61);
    ;
    id_3 = -1;
  end
  reg   id_6;
  logic id_7;
  ;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0
  );
  always @(id_6 or posedge id_7) begin : LABEL_1
    id_6 = id_7;
  end
endmodule
