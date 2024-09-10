// Seed: 2826049372
module module_0 #(
    parameter id_1  = 32'd25,
    parameter id_10 = 32'd84,
    parameter id_12 = 32'd27
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10
);
  input _id_10;
  input id_9;
  output id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input _id_1;
  reg id_11;
  type_0 _id_12 (
      .id_0 (id_10[1!==1'b0 : 1] - 1),
      .id_1 (1'b0),
      .id_2 (id_5),
      .id_3 (1 - id_10),
      .id_4 (1),
      .id_5 (1),
      .id_6 (1'b0 - 1),
      .id_7 (id_5[1'b0/1 : id_1]),
      .id_8 (id_2),
      .id_9 (1'b0),
      .id_10(id_6),
      .id_11(id_8)
  );
  logic id_13;
  assign id_2 = id_6(id_5);
  always @(posedge id_10 or posedge id_10) begin
    id_10 <= id_8;
  end
  assign id_11[id_10] = 1 ? id_3 : id_9;
  reg id_14;
  assign id_2 = id_11;
  assign id_5[1] = 1;
  type_20(
      id_13, id_5[id_12], id_13
  ); type_21(
      id_3, 1'b0, !(id_9)
  );
  function integer id_15;
    input id_16;
    begin
      if (id_7 >= id_2) begin
        id_12 <= id_5 ? 1 : ("");
        id_14[1!==1] = 1;
        id_3 <= #1 id_10;
      end else id_5 = 1 >= id_12;
    end
  endfunction
  assign id_12 = id_15[1];
  assign id_2  = id_14;
  assign id_12 = id_15 & {id_15[1 : 1'h0], 1};
endmodule
