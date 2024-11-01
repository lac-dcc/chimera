// Seed: 1134328006
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = {id_1, 1, 1'h0};
  tri0 id_7;
  assign id_3 = 1;
  wor id_8 = $display(1, 1);
  tri1 id_9, id_10;
  assign id_1 = 1 ? id_7 : id_8;
  function id_11;
    int id_12;
    input id_13, id_14, id_15;
    input id_16;
    begin
      if (id_14) begin
        fork
          if (id_1) begin
            #0;
          end
        join_none
      end
    end
  endfunction
  wire id_17;
  assign id_9 = id_13;
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
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_11(
      1, id_8
  );
  supply1 id_12 = 1'b0;
  module_0(
      id_8, id_4, id_8, id_5, id_6, id_12
  );
endmodule
