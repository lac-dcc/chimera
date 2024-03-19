module strobe_gen
#( parameter div=24 )
(
 input  clk,
 input  rst_n,
 output strobe
);
  
  reg [div-1:0] cnt;
  
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      cnt <= {div{1'b0}};
    else
      cnt <= cnt + {{(div-1){1'b0}},1'b1};

    assign strobe = (cnt[div-1:0] == {div{1'b1}});
    
endmodule // strobe_gen
