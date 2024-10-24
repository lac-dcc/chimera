// Seed: 1517984968
module module_0 (
    input  id_0,
    input  id_1,
    output id_2,
    output id_3,
    output id_4
);
  always @(posedge 1) begin
    #1;
    #1
    if (id_0) id_2 <= 1;
    else id_3 <= 1;
    id_4 = id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input id_9;
  inout id_8;
  output id_7;
  inout id_6;
  output id_5;
  inout id_4;
  input id_3;
  input id_2;
  input id_1;
  logic id_10 = id_3;
  assign id_4 = id_10 ? id_8 : id_0;
  assign (weak1, supply0) id_5 = id_9[1 : 1'b0];
  type_0 id_11 (
      1,
      1,
      1
  );
  assign id_6 = 1;
endmodule
